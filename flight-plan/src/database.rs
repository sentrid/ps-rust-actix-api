use config::Config;
use std::error::Error;
use rusqlite::Connection;
use uuid::Uuid;
use crate::schema::{FlightPlan, User};

pub fn create_user(user: User) -> Result<String, Box<dyn Error>> {
    let api_key = Uuid::new_v4().as_simple().to_string();    
    let connection = get_database_connection()?;
    let mut statement = connection.prepare("INSERT INTO users (full_name, api_key) VALUES (?, ?)")?;
    let _ = statement.execute((user.name, api_key.clone()))?;
    Ok(api_key)
}

pub fn get_user(api_key: String) -> Result<Option<User>, Box<dyn Error>> {
    let connection = get_database_connection()?;
    let mut statement = connection.prepare("SELECT * FROM users WHERE api_key = ?")?;
    let query_result = statement.query_map([&api_key], |row| {
        Ok(User {
            name: row.get(1)?,
            api_key: row.get(4)?
        })
    })?;

    let mut user: Option<User> = None;
    for api_user in query_result {
        user = Some(api_user.unwrap());
    }

    Ok(user)
}

pub fn get_all_flight_plans() -> Result<Option<Vec<FlightPlan>>, Box<dyn Error>> {
    let mut flight_plan_list : Vec<FlightPlan> = Vec::new();

    let connection = get_database_connection()?;
    let mut statement = connection.prepare("SELECT * FROM flight_plan")?;
    let query_result = statement.query_map([], |row| {
        Ok(FlightPlan {
            flight_plan_id: row.get(1)?,
            altitude: row.get(2)?,
            airspeed: row.get(3)?,
            aircraft_identification: row.get(4)?,
            aircraft_type: row.get(5)?,
            arrival_airport: row.get(6)?,
            departing_airport: row.get(7)?,
            flight_type: row.get(8)?,
            departure_time: row.get(9)?,
            estimated_arrival_time: row.get(10)?,
            route: row.get(11)?,
            remarks: row.get(12)?,
            fuel_hours: row.get(13)?,
            fuel_minutes: row.get(14)?,
            number_onboard: row.get(15)?
        })
    })?;

    for plan in query_result {
        flight_plan_list.push(plan.unwrap());
    }

    match flight_plan_list.len() > 0 {
        true => {
            Ok(Some(flight_plan_list))
        }
        false => {
            Ok(None)
        }
    }
}

pub fn get_flight_plan_by_id(plan_id: String) -> Result<Option<FlightPlan>, Box<dyn Error>> {
   let connection = get_database_connection()?;
    let mut statement = connection.prepare("SELECT * FROM flight_plan WHERE flight_plan_id = ?1")?;
    let query_result = statement.query_map([&plan_id], |row| {
        Ok(FlightPlan {
            flight_plan_id: row.get(1)?,
            altitude: row.get(2)?,
            airspeed: row.get(3)?,
            aircraft_identification: row.get(4)?,
            aircraft_type: row.get(5)?,
            arrival_airport: row.get(6)?,
            departing_airport: row.get(7)?,
            flight_type: row.get(8)?,
            departure_time: row.get(9)?,
            estimated_arrival_time: row.get(10)?,
            route: row.get(11)?,
            remarks: row.get(12)?,
            fuel_hours: row.get(13)?,
            fuel_minutes: row.get(14)?,
            number_onboard: row.get(15)?
        })
    })?;

    let mut flight_plan: Option<FlightPlan> = None;

    for plan in query_result {
        flight_plan = Some(plan.unwrap());
        break;
    }

    Ok(flight_plan)

}

pub fn delete_flight_plan(plan_id: String) -> Result<bool, Box<dyn Error>> {
    let mut successful = false;
    let connection = get_database_connection()?;
    let mut statement = connection.prepare("DELETE FROM flight_plan WHERE flight_plan_id = ?1")?;
    let query_result = statement.execute([&plan_id])?;
    if query_result > 0 {
        successful = true;
    }
    Ok(successful)
}

pub fn insert_flight_plan(flight_plan: FlightPlan) -> Result<(), Box<dyn Error>> {
    let connection = get_database_connection()?;
    let new_flight_plan_id = Uuid::new_v4().simple().to_string();

    let mut statement = connection.prepare("INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, \
                                                         aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, \
                                                         estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) \
                                                         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")?;
    let _ = statement.execute((new_flight_plan_id, flight_plan.altitude, flight_plan.airspeed, flight_plan.aircraft_identification,
                                      flight_plan.aircraft_type, flight_plan.arrival_airport, flight_plan.departing_airport, flight_plan.flight_type,
                                      flight_plan.departure_time, flight_plan.estimated_arrival_time, flight_plan.route, flight_plan.remarks,
                                      flight_plan.fuel_hours, flight_plan.fuel_minutes, flight_plan.number_onboard))?;
    Ok(())
}

pub fn update_flight_plan(flight_plan: FlightPlan) -> Result<bool, Box<dyn Error>> {
    let connection = get_database_connection()?;
    let mut statement = connection.prepare("UPDATE flight_plan SET altitude = ?, airspeed = ?, aircraft_identification = ?, \
                                                     aircraft_type = ?, arrival_airport = ?, departing_airport = ?, flight_type = ?, \
                                                     departure_time = ?, estimated_arrival_time = ?, route = ?, remarks = ?, fuel_hours = ?, \
                                                     fuel_minutes = ?, number_onboard = ? WHERE flight_plan_id = ?")?;
    let result_count = statement.execute((flight_plan.altitude, flight_plan.airspeed, flight_plan.aircraft_identification,
                               flight_plan.aircraft_type, flight_plan.arrival_airport, flight_plan.departing_airport, flight_plan.flight_type,
                               flight_plan.departure_time, flight_plan.estimated_arrival_time, flight_plan.route, flight_plan.remarks,
                               flight_plan.fuel_hours, flight_plan.fuel_minutes, flight_plan.number_onboard, flight_plan.flight_plan_id))?;
    let mut succeeded =false;
    if result_count > 0 {
        succeeded = true;
    }
    
    Ok(succeeded)
}

fn get_database_connection() -> Result<Connection, Box<dyn Error>> {
    let settings = Config::builder()
        .add_source(config::File::with_name("config"))
        .build()
        .unwrap();
    let connection = Connection::open(settings.get_string("DATABASE_LOCATION").unwrap())?;
    Ok(connection)
}


#[cfg(test)]
mod test {
    /// NOTE: These tests are expecting the default database rows to be in place.
    /// If you change or remove any of the original 25 flight plans, one or more
    /// of these tests WILL Fail
    /// 
    /// These tests are also destructive to the original database. The database WILL
    /// need to be rebuilt after running these tests.
    
    use super::*;

    #[test]
    fn test_database_connection() {
        let connection = get_database_connection().is_ok();
        assert!(connection == true);
    }

    #[test]
    fn test_database_has_rows() {
        let row_count = get_all_flight_plans()
                              .unwrap()
                              .unwrap()
                              .len();        
        assert!(row_count == 25);
    }

    #[test]
    fn test_insert_flight_plan() {
        let flight_plan = FlightPlan {
            flight_plan_id: String::from(""),
            altitude: 1000,
            airspeed: 200,
            aircraft_identification: String::from("N7368F"),
            aircraft_type: String::from("Cessna 172/S"),
            arrival_airport: String::from("KBNA"),
            departing_airport: String::from("KIAD"),
            flight_type: String::from("IFR"),
            departure_time: String::from("2022-04-05T03:25:46Z"),
            estimated_arrival_time: String::from("2022-02-21T10:33:30Z"),
            route: String::from("KMCO YQL T359 BURFA T359 KSLI"),
            remarks: String::from("training"),
            fuel_hours: 4,
            fuel_minutes: 15,
            number_onboard: 2,
        };
        assert!(insert_flight_plan(flight_plan).is_ok());
    }

    #[test]
    fn test_get_flight_plan_by_id() {
        let mut flight_plan_id = String::from("");
        let connection = get_database_connection().unwrap();
        let mut statement = connection.prepare("SELECT flight_plan_id FROM flight_plan WHERE id = (SELECT max(id) from flight_plan)").unwrap();
        let mut query_result = statement.query_map([], |row| {
            Ok(flight_plan_id = row.get(0).unwrap())
        }).unwrap();

        query_result.next();
        assert!(!flight_plan_id.is_empty(), "cannot find a flight plan id");
        
        let last_flight_plan = get_flight_plan_by_id(flight_plan_id);
        assert!(last_flight_plan.is_ok());
    }    

}
