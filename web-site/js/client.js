const api_base_url = "https://localhost:3001";
const api_path = "/api/v1/flightplan";

const api_key = "f90ed373612749eda337c9a4d537c247";

async function logout() {
   let api_response = await fetch(api_base_url + '/logout', {
        method: "POST"
    });

    document.location.href = "./index.html";
}

async function login () {
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let api_response = await fetch(api_base_url, {
        method: "POST",
        headers: {
            'Authorization': 'Basic ' + btoa(username + ":" + password)
        },
        credentials: 'include'
    });   

    document.location.href = "./flightplanlist.html";
}

async function get_all_flight_plans() {
    let api_response = await fetch(api_base_url + api_path, {
        method: "GET",
        headers: {
            'Authorization': 'Bearer ' + api_key
        }
    });

    if(api_response.status !== 200) {
        alert(api_response.status);
        return;
    }

    let api_data = await api_response.json();
    let html = '';
    api_data.forEach(flight_plan => {
        html += '<div class="card" style="margin: 12px;margin-bottom: 50px;"> \
                        <div class="card-body" style="margin-left: 54px;margin-right: 91px;"> \
                            <h4 class="card-title" style="padding: 6px;border-bottom-style: solid;border-bottom-color: rgba(33,37,41,0.28);">' + flight_plan.departing_airport + ' to ' + flight_plan.arrival_airport + '</h4> \
                            <div></div> \
                            <div class="row" style="margin-top: 25px;"> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Flight Type</h1> \
                                    <p>' + flight_plan.flight_type + '</p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Aircraft Identification</h1> \
                                    <p>' + flight_plan.aircraft_identification + '</p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Aircraft Type</h1> \
                                    <p>'+ flight_plan.aircraft_type +'</p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Fuel on Board<br></h1> \
                                    <p>'+ flight_plan.fuel_hours +' hour(s) ' + flight_plan.fuel_minutes + ' minutes' +'</p> \
                                </div> \
                            </div> \
                            <div class="row" style="margin-top: 9px;"> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Filed Altitude</h1> \
                                    <p>'+ flight_plan.altitude +'</p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Filed Airspeed</h1> \
                                    <p>'+ flight_plan.airspeed +'</p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Departure Time</h1> \
                                    <p>'+ flight_plan.departure_time +'<br></p> \
                                </div> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Estimated Arrival Time<br></h1> \
                                    <p>'+ flight_plan.estimated_arrival_time +'<br></p> \
                                </div> \
                            </div> \
                            <div class="row" style="margin-top: 8px;"> \
                                <div class="col"> \
                                    <h1 style="font-size: 16px;">Route</h1> \
                                    <p>'+ flight_plan.route +'<br></p> \
                                </div> \
                            </div> \
                            <div class="row"> \
                                <div class="col-xxl-12" style="margin-top: 7px;"> \
                                    <h1 style="font-size: 16px;">Remarks</h1> \
                                    <p>'+ flight_plan.remarks +'</p> \
                                </div> \
                            </div> \
                            <div class="row" style="border-top-style: solid;border-top-color: rgba(33,37,41,0.28);"> \
                                <div class="col" style="border-top-color: rgba(33,37,41,0.28);margin-top: 6px;"> \
                                    <h1 style="font-size: 14px;margin-top: 12px;">Flight Plan Id&nbsp; '+ flight_plan.flight_plan_id +'</h1> \
                                </div> \
                                <div class="col" style="text-align: right;margin-top: 6px;"><button class="btn btn-primary" type="button" style="text-align: right;font-size: 13px;background: var(--bs-red);" onclick="delete_flight_plan(\''+ flight_plan.flight_plan_id +'\')">Delete This Flight Plan</button></div> \
                            </div> \
                        </div> \
                    </div>';
    });
    
    document.getElementById('flight_plan_list').innerHTML = html;
}

async function load_flight_plan() {
    let flight_plan_id = document.getElementById("flightPlanId").value;
    let api_response = await fetch(api_base_url + api_path + '/' + flight_plan_id, {
        method: 'GET',
        headers: {
            'Authorization': 'Bearer ' + api_key
        }
    });

    if(api_response.status !== 200) {
        alert(api_response.status);
        return;
    }

    let api_data = await api_response.json();

    document.getElementById('tailNumber').value = api_data.aircraft_identification;
    document.getElementById('aircraftType').value = api_data.aircraft_type;
    document.getElementById('airspeed').value = api_data.airspeed;
    document.getElementById('altitude').value = api_data.altitude;
    document.getElementById('paxOnBoard').value = api_data.number_onboard;
    document.getElementById('departureTime').value = api_data.departure_time.substring(0, api_data.departure_time.length - 1);
    document.getElementById('arrivalTime').value = api_data.estimated_arrival_time.substring(0, api_data.estimated_arrival_time.length - 1);
    document.getElementById('departAirport').value = api_data.departing_airport;
    document.getElementById('arriveAirport').value = api_data.arrival_airport;
    document.getElementById('route').value = api_data.route;
    document.getElementById('remarks').value = api_data.remarks;
    document.getElementById('fuelHours').value = api_data.fuel_hours;
    document.getElementById('fuelMinutes').value = api_data.fuel_minutes;
    document.getElementById('flightType').value = api_data.flight_type;

    document.getElementById('isNew').value = "false"
    document.getElementById('saveButton').text = "Update Flight Plan";
}

async function delete_flight_plan(flight_plan_id) {
    let response = await fetch(api_base_url  + api_path + '/' + flight_plan_id, {
        method: 'DELETE',
        headers: {
            'Authorization': 'Bearer ' + api_key
        }
    });

    if(response.status !== 200) {
        alert(response.status);
    } else {
        get_all_flight_plans();
    }
}

async function save_flight_plan() {
    if (document.getElementById('isNew').value === "true") {
        file_flight_plan();
    } else {
        update_flight_plan();
    }
}

async function file_flight_plan() {
    let api_response = await fetch(api_base_url + api_path, {
        method: 'POST',
        headers: {
            'Authorization': 'Bearer ' + api_key,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            flight_plan_id: document.getElementById("flightPlanId").value,
            altitude: Number(document.getElementById('altitude').value),
            aircraft_identification: document.getElementById('tailNumber').value,
            aircraft_type: document.getElementById('aircraftType').value,
            airspeed: Number(document.getElementById('airspeed').value),
            arrival_airport: document.getElementById('arriveAirport').value,
            flight_type: document.getElementById('flightType').value,
            departing_airport: document.getElementById('departAirport').value,
            departure_time: new Date(document.getElementById('departureTime').value).toISOString(),
            estimated_arrival_time: new Date(document.getElementById('arrivalTime').value).toISOString(),
            route: document.getElementById('route').value,
            remarks: document.getElementById('remarks').value,
            fuel_hours: Number(document.getElementById('fuelHours').value),
            fuel_minutes: Number(document.getElementById('fuelMinutes').value),
            number_onboard: Number(document.getElementById('paxOnBoard').value)
        })
    });

    if(api_response.status !== 200) {
        alert(api_response.status);
    }
}

async function update_flight_plan() {
    let api_response = await fetch(api_base_url + api_path, {
        method: "PUT",
        headers: {
            'Authorization': 'Bearer ' + api_key,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            flight_plan_id: document.getElementById("flightPlanId").value,
            altitude: Number(document.getElementById('altitude').value),
            aircraft_identification: document.getElementById('tailNumber').value,
            aircraft_type: document.getElementById('aircraftType').value,
            airspeed: Number(document.getElementById('airspeed').value),
            arrival_airport: document.getElementById('arriveAirport').value,
            flight_type: document.getElementById('flightType').value,
            departing_airport: document.getElementById('departAirport').value,
            departure_time: new Date(document.getElementById('departureTime').value).toISOString(),
            estimated_arrival_time: new Date(document.getElementById('arrivalTime').value).toISOString(),
            route: document.getElementById('route').value,
            remarks: document.getElementById('remarks').value,
            fuel_hours: Number(document.getElementById('fuelHours').value),
            fuel_minutes: Number(document.getElementById('fuelMinutes').value),
            number_onboard: Number(document.getElementById('paxOnBoard').value)
        })
    });

    if(api_response.status !== 200) {
        alert(api_response.status);
    }
}