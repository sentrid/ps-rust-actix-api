CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    full_name TEXT,
    username TEXT UNIQUE, 
    password TEXT,
    api_key TEXT
);

CREATE TABLE IF NOT EXISTS flight_plan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_plan_id TEXT UNIQUE,
    altitude INTEGER,
    airspeed INTEGER,
    aircraft_identification TEXT,
    aircraft_type TEXT,
    arrival_airport TEXT,
    departing_airport TEXT,
    flight_type TEXT,
    departure_time TEXT,
    estimated_arrival_time TEXT,
    route TEXT,
    remarks TEXT,
    fuel_hours INTEGER,
    fuel_minutes INTEGER,
    number_onboard INTEGER
);

INSERT INTO users (full_name, api_key) VALUES ('John Smith', 'f90ed373612749eda337c9a4d537c247');

INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('326562291a4d482a8e897ddd03e630b9', 11000, 113, 'N332VD', 'L1P Commander 112', 'KWDR', 'KDEH', 'VFR', '2022-03-07T19:35:06Z', '2022-03-07T22:16:06Z', 'KDEH MMM T230 CFIDJ T230 KWDR', '', 3, 55, 2);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('ade7356f184f4317adbcf9cc2d1f3728', 10000, 152, 'N20SOP', 'S22T Cirrus SR22 Turbo', 'KVLD', 'KVNW', 'VFR', '2021-07-25T16:13:16Z', '2021-07-25T20:07:16Z', 'KVNW CEC Q124 ICAVE Q124 KVLD', '', 2, 56, 2);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('fb6d4da6ed9f41c0998a794efbc0f721', 5000, 143, 'N11QGZ', 'L1P Commander 112', 'KOZS', 'KMGW', 'IFR', '2021-12-02T03:55:38Z', '2021-12-02T06:20:38Z', 'KMGW BGR V327 ATOPY V327 KOZS', '', 1, 35, 2);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('c20a768f3f464844a2cf8f4379247ff1', 8000, 144, 'N430QB', 'SR20 Cirrus SR-20', 'KCOE', 'KNFJ', 'IFR', '2021-11-08T04:45:57Z', '2021-11-08T07:06:57Z', 'KNFJ OFF V107 EZEJI V107 KCOE', '', 4, 13, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('5eca29089cd847c8896d49b00c6787cc', 11000, 172, 'N800RX', 'C182 Cessna Skylane', 'KMKA', 'KAFW', 'VFR', '2022-06-20T14:02:39Z', '2022-06-20T18:50:39Z', 'KAFW FLW J32 MAJLU J32 KMKA', '', 1, 47, 2);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('0e3ed1077cb64da7b3cfbb9fb76641d9', 9000, 155, 'N76NVQ', 'LNP4 Lancair PropJet 4', 'KRIC', 'KMAN', 'VFR', '2021-10-29T15:40:37Z', '2021-10-29T20:14:37Z', 'KMAN TOL V558 ATOPY V558 KRIC', '', 1, 46, 5);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('57fa3f0a74704765bd4a9c28a6e2a308', 8000, 162, 'N68QIN', 'PA-28 Piper Cherokee', 'KGLS', 'KPWG', 'IFR', '2022-01-07T20:48:17Z', '2022-01-08T01:09:17Z', 'KPWG OZB J7 MACAJ J7 KGLS', '', 2, 24, 4);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('7a4c12e12fd94fafb038b7e901796077', 6000, 112, 'N90XLY', 'PA-31 Piper Navajo', 'KMML', 'KETH', 'VFR', '2022-02-01T22:18:42Z', '2022-02-01T23:53:42Z', 'KETH ACY V6 MACOP V6 KMML', '', 4, 54, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('03c4e4ac1a2e476b841689c3d96feb24', 11000, 172, 'N45XPU', 'S22T Cirrus SR22 Turbo', 'KATS', 'KPEZ', 'VFR', '2021-11-05T12:07:26Z', '2021-11-05T15:01:26Z', 'KPEZ BBD T200 DICKE T200 KATS', '', 2, 35, 5);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('05a8e2050354458394508d0775303aa0', 12000, 137, 'N31UIS', 'PA-34 Piper Seneca', 'KMDF', 'KNFD', 'IFR', '2021-11-07T17:02:18Z', '2021-11-07T20:36:18Z', 'KNFD SGF Q78 DMBOH Q78 KMDF', '', 1, 42, 2);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('765ff9e288f04d81ad968b47e1d159a7', 12000, 113, 'N71VZO', 'LNP4 Lancair PropJet 4', 'KCFT', 'KOBE', 'VFR', '2021-10-26T05:53:34Z', '2021-10-26T09:44:34Z', 'KOBE GN V193 AXUKY V193 KCFT', '', 3, 21, 5);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('c0ee5792b2904aa9afc95d94b2cfa354', 7000, 173, 'N43HHH', 'LNC4 Lancair 4', 'KRJD', 'KTOR', 'VFR', '2021-07-20T05:25:14Z', '2021-07-20T07:13:14Z', 'KTOR JDN V475 CATTA V475 KRJD', '', 4, 55, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('a788a5988fd5451b845b43ab74ec4f1f', 6000, 172, 'N25JKB', 'LNC4 Lancair 4', 'KHYR', 'KSPK', 'IFR', '2022-04-03T20:54:25Z', '2022-04-03T23:16:25Z', 'KSPK BR T356 CFLGH T356 KHYR', '', 2, 4, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('b7ea9e832dba4373a9ca97b77eccc116', 8000, 179, 'N49XXN', 'PA-31 Piper Navajo', 'KHOB', 'KPMZ', 'VFR', '2021-08-19T05:57:21Z', '2021-08-19T08:12:21Z', 'KPMZ CTB Q168 CAMOY Q168 KHOB', '', 1, 15, 1);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('e22abfaed2764190b7238dda017446a5', 7000, 175, 'N31QTJ', 'L1P Commander 112', 'KOLZ', 'KCQJ', 'VFR', '2021-10-17T18:50:37Z', '2021-10-17T22:03:37Z', 'KCQJ OKC V228 UMBER V228 KOLZ', '', 1, 42, 5);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('b3035c25ac8d4987886ca27aff8b0bf4', 7000, 139, 'N75TWF', 'LNP4 Lancair PropJet 4', 'KGYI', 'KMOB', 'VFR', '2021-10-29T21:49:05Z', '2021-10-30T01:21:05Z', 'KMOB PNH V57 NIKWA V57 KGYI', '', 1, 33, 4);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('197dafd2ba744bc1a235ecd60936d2b8', 5000, 129, 'N52VGG', 'PA-34 Piper Seneca', 'KPUJ', 'KSIF', 'VFR', '2022-05-19T14:31:50Z', '2022-05-19T17:54:50Z', 'KSIF BRO Q148 GRAHM Q148 KPUJ', '', 2, 45, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('cb8ef0a9d371410db4fab7b46a2fbb04', 12000, 132, 'N39MNN', 'C182 Cessna Skylane', 'KCNU', 'KUKI', 'VFR', '2022-04-14T09:23:34Z', '2022-04-14T10:55:34Z', 'KUKI MFE Q162 CFLGH Q162 KCNU', '', 1, 32, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('09798c10a7ca4a1b919aa1287efae508', 8000, 163, 'N845EV', 'PA-34 Piper Seneca', 'KGQQ', 'KGRK', 'IFR', '2022-02-21T06:03:30Z', '2022-02-21T10:33:30Z', 'KGRK PFN V74 MAHOG V74 KGQQ', '', 4, 42, 4);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('96acaa7a2b9b4761a9a494fec9bea930', 7000, 140, 'N845ZY', 'S22T Cirrus SR22 Turbo', 'KLMO', 'KYNG', 'VFR', '2021-12-02T04:26:26Z', '2021-12-02T09:09:26Z', 'KYNG DNV Q75 UXPIG Q75 KLMO', '', 4, 20, 4);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('80978a8aee194ba0bf854c6cfd87a49e', 11000, 135, 'N76QXV', 'C182 Cessna Skylane', 'KCBM', 'KFCM', 'VFR', '2021-12-26T20:18:20Z', '2021-12-26T21:56:20Z', 'KFCM LGD V255 CFLIW V255 KCBM', '', 1, 22, 3);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('9f761ed03c21462ba4a5e7789f413a0c', 6000, 141, 'N79RKF', 'C182 Cessna Skylane', 'KHYX', 'KBLI', 'VFR', '2022-04-05T03:25:46Z', '2022-04-05T07:01:46Z', 'KBLI EI Q937 MADPE Q937 KHYX', '', 4, 11, 1);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('e99a6d6538c14f3d8b6601888e16a180', 6000, 167, 'N11ENS', 'SR20 Cirrus SR-20', 'KSLI', 'KMCO', 'VFR', '2022-06-25T18:50:44Z', '2022-06-25T23:17:44Z', 'KMCO YQL T359 BURFA T359 KSLI', '', 2, 15, 4);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('6f1fc96650704474907f39ab18ee19d9', 8000, 144, 'N56KNH', 'S22T Cirrus SR22 Turbo', 'KAOH', 'KEWR', 'IFR', '2021-07-13T21:33:50Z', '2021-07-14T00:55:50Z', 'KEWR BVY J28 TOMYE J28 KAOH', '', 1, 38, 1);
INSERT INTO flight_plan (flight_plan_id, altitude, airspeed, aircraft_identification, aircraft_type, arrival_airport, departing_airport, flight_type, departure_time, estimated_arrival_time, route, remarks, fuel_hours, fuel_minutes, number_onboard) VALUES ('03481ac21fb84f55859b89e39fbaf6fc', 11000, 127, 'N27BBH', 'PA-31 Piper Navajo', 'KRPX', 'KMNF', 'IFR', '2021-09-08T15:36:29Z', '2021-09-08T18:47:29Z', 'KMNF FPN Q947 EPVOH Q947 KRPX', '', 1, 52, 5);
