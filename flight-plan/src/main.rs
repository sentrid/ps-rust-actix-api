mod schema;
mod database;
mod endpoints;

use crate::endpoints::{get_all_flight_plans, get_flight_plan_by_id, 
                       delete_flight_plan_by_id, file_flight_plan, 
                       update_flight_plan, new_user};

use env_logger::Env;
use actix_web::middleware::Logger;
use config::Config;
use actix_web_httpauth::extractors::bearer::{BearerAuth, self};
use actix_web_httpauth::extractors::AuthenticationError;
use actix_web_httpauth::middleware::HttpAuthentication;
use actix_web::{App, HttpServer, Error, dev::ServiceRequest};
use openssl::ssl::{SslAcceptor, SslFiletype, SslMethod};
use actix_cors::Cors;

async fn validator(
    req: ServiceRequest,
    credentials: BearerAuth
) -> Result<ServiceRequest, (Error, ServiceRequest)> {
    let config = req.app_data::<bearer::Config>()
            .cloned()
            .unwrap_or_default()
            .scope("urn:flight-plans");

    match database::get_user(String::from(credentials.token())) {
        Ok(user) => {
            match user {
                Some(_) => {
                    return Ok(req);
                },
                None => {
                    Err((AuthenticationError::from(config).into(), req))
                },
            }
            
        },
        Err(_) => {
            Err((AuthenticationError::from(config).into(), req))
        }
    }
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    
    let settings = Config::builder()
        .add_source(config::File::with_name("config"))
        .build()
        .unwrap();

    let certificate_key = settings.get_string("CERTIFICATE_KEY").unwrap();
    let certificate = settings.get_string("CERTIFICATE").unwrap();

    let mut builder = SslAcceptor::mozilla_intermediate(SslMethod::tls()).unwrap();
    builder.set_private_key_file(certificate_key, SslFiletype::PEM).unwrap();
    builder.set_certificate_chain_file(certificate).unwrap();

    env_logger::init_from_env(Env::default().default_filter_or("info"));    
    HttpServer::new(move || {
        let middleware = HttpAuthentication::bearer(validator);
        App::new()
            .service(get_flight_plan_by_id)
            .service(get_all_flight_plans)
            .service(delete_flight_plan_by_id)
            .service(file_flight_plan)
            .service(update_flight_plan)
            .service(new_user)
            .wrap(middleware)
            .wrap(Logger::default())
            .wrap(Logger::new("%a %{User-Agent}i"))
            .wrap(
                Cors::default()
                    .allow_any_method()
                    .allow_any_origin()
                    .allow_any_header()
                    .supports_credentials()
                    .max_age(3600),
            )
    })
        .bind(("0.0.0.0", 3000))?
        .bind_openssl("0.0.0.0:3001", builder)?
        .workers(2)
        .run()
        .await
}