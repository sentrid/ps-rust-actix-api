use actix_web::{get, post, delete, put, HttpResponse, Responder, web};
use crate::database;
use crate::schema::{FlightPlan, User};
use web::{Path, Json};

#[post("/api/v1/admin/user")]
pub async fn new_user(user: web::Json<User>) -> impl Responder {
    match database::create_user(user.into_inner()) {
        Ok(api_key) => HttpResponse::Ok().body(api_key),
        Err(e) => HttpResponse::InternalServerError().body(e.to_string())
    }    
}

#[get("/api/v1/flightplan")]
pub async fn get_all_flight_plans() -> impl Responder {
    match database::get_all_flight_plans().unwrap() {
       Some(flight_plan_list) => {
            HttpResponse::Ok().content_type("application/json").json(flight_plan_list)
       },
       None => {
            HttpResponse::NoContent().body("There are no flight plans filed with this system")
       }
    }
}

#[get("/api/v1/flightplan/{flight_plan_id}")]
pub async fn get_flight_plan_by_id(id: Path<String>) -> impl Responder {
    let flight_plan_id = id.into_inner();
    
    match database::get_flight_plan_by_id(flight_plan_id.clone()).unwrap() {
        Some(flight_plan_from_db) => {
            HttpResponse::Ok().content_type("application/json").json(flight_plan_from_db)
        },
        None => {
            HttpResponse::NotFound().body(format!("There is not any flight plan with id {}", flight_plan_id))
        }
    }
}

#[delete("/api/v1/flightplan/{flight_plan_id}")]
pub async fn delete_flight_plan_by_id(id: Path<String>) -> impl Responder {
    let flight_plan_id = id.into_inner();
    match database::delete_flight_plan(flight_plan_id.clone()) {
        Ok(successful) => {
            if successful {
                HttpResponse::Ok().finish()
            } else {
                HttpResponse::NotFound().body(format!("There is not any flight plan with id {}", flight_plan_id))
            }            
        }
        Err(_) => {
            HttpResponse::InternalServerError().finish()
        }
    }
}

#[post("/api/v1/flightplan")]
pub async fn file_flight_plan(flight_plan: Json<FlightPlan>) -> impl Responder {
    match database::insert_flight_plan(flight_plan.into_inner()) {
        Ok(_) => {
            HttpResponse::Ok().finish()
        }
        Err(_) => {
            HttpResponse::InternalServerError().finish()
        }
    }
}

#[put("/api/v1/flightplan")]
pub async fn update_flight_plan(flight_plan: Json<FlightPlan>) -> impl Responder {
    let updated_flight_plan = flight_plan.into_inner();
    match database::update_flight_plan(updated_flight_plan.clone()) {
        Ok(succeeded) => {
            if succeeded {
                HttpResponse::Ok().finish()
            } else {
                HttpResponse::NotFound().body(format!("There is not any flight plan with id {}", updated_flight_plan.flight_plan_id))
            }
        }
        Err(_) => {
            HttpResponse::InternalServerError().finish()
        }
    }
}