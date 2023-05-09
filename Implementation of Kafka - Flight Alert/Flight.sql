use AdvanceDB;



CREATE TABLE flight(
id INT NOT NULL AUTO_INCREMENT,
flight_id VARCHAR(50) NOT NULL, 
airline VARCHAR(100),
origin VARCHAR(100), 
destination VARCHAR(100), 
departure_time DATETIME, 
arrival_time DATETIME, 
actual_price VARCHAR(50), 
discount_price VARCHAR(50),
delayed_time DATETIME,
message_type ENUM('flight_alert', 'flight_discount_alert', 'flight_delay_alert', 'flight_checkin_alert'),
PRIMARY KEY(id));


SELECT * FROM flight;

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435', 'flight_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435', '$950', 'flight_discount_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, delayed_time, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435', '2023-06-07 07:00:00','flight_delay_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435','flight_checkin_alert');



INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM532', 'Emirates', 'John F Kennedy International Airport UnitedStates', 'Delhi India', '2023-06-07 23:35:00', '2023-06-09 05:35:00', '$1790', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI657', 'AirIndia', 'Nashville UnitedStates', 'Vijayawada India', '2023-07-07 05:15:00', '2023-07-09 02:35:00', '$1790', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM876', 'Emirates', 'Oakland International Airport UnitedStates', 'Mumbai India', '2023-05-23 19:36:00', '2023-05-25 01:45:00', '$1980', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM778', 'Emirates', 'SanJose International Airport UnitedStates', 'Kolkata India', '2023-05-07 20:45:00', '2023-05-09 08:55:00', '$1200', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM845', 'Emirates', 'Dallas/Fort Worth International Airport UnitedStates', 'Hyderabad India', '2023-06-07 21:10:00', '2023-06-09 10:35:00', '$786', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI454', 'AirIndia', 'Denver International Airport UnitedStates', 'Delhi India', '2023-05-17 22:23:00', '2023-05-19 03:35:00', '$1345', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI667', 'AirIndia', 'O\'Hare International Airport UnitedStates', 'Chennai India', '2023-06-20 13:14:00', '2023-06-22 06:35:00', '$1245', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI798', 'AirIndia', 'San Deigo International Airport UnitedStates', 'Delhi India', '2023-06-07 14:30:00', '2023-06-09 02:35:00', '$1876', 'flight_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI887', 'AirIndia', 'Memphis International Airport UnitedStates', 'Hyderabad India', '2023-06-07 15:45:00', '2023-06-09 03:55:00', '$976', 'flight_alert');





INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('AI798', 'AirIndia', 'San Deigo International Airport UnitedStates', 'Delhi India', '2023-06-07 14:30:00', '2023-06-09 02:35:00', '$1876', '$1265', 'flight_discount_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('EM876', 'Emirates', 'Oakland International Airport UnitedStates', 'Mumbai India', '2023-05-23 19:36:00', '2023-05-25 01:45:00', '$1980', '$1350', 'flight_discount_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('AI667', 'AirIndia', 'O\'Hare International Airport UnitedStates', 'Chennai India', '2023-06-20 13:14:00', '2023-06-22 06:35:00', '$1245','$935', 'flight_discount_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('AI454', 'AirIndia', 'Denver International Airport UnitedStates', 'Delhi India', '2023-05-17 22:23:00', '2023-05-19 03:35:00', '$1345', '$768', 'flight_discount_alert');

INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, discount_price, message_type) 
VALUES('EM778', 'Emirates', 'SanJose International Airport UnitedStates', 'Kolkata India', '2023-05-07 20:45:00', '2023-05-09 08:55:00', '$1035', '$754','flight_discount_alert');






INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, delayed_time, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435', '2023-06-07 07:00:00','flight_delay_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, delayed_time, message_type) 
VALUES('EM532', 'Emirates', 'John F Kennedy International Airport UnitedStates', 'Delhi India', '2023-06-07 23:35:00', '2023-06-09 05:35:00', '$1790', '2023-06-09 08:15:00','flight_delay_alert');





INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI126', 'AirIndia', 'Chicago UnitedStates', 'Hyderabad India', '2023-06-05 17:00:00', '2023-06-07 03:35:00', '$1435','flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM532', 'Emirates', 'John F Kennedy International Airport UnitedStates', 'Delhi India', '2023-06-07 23:35:00', '2023-06-09 05:35:00', '$1790', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI657', 'AirIndia', 'Nashville UnitedStates', 'Vijayawada India', '2023-07-07 05:15:00', '2023-07-09 02:35:00', '$1790', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM876', 'Emirates', 'Oakland International Airport UnitedStates', 'Mumbai India', '2023-05-23 19:36:00', '2023-05-25 01:45:00', '$1980', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM778', 'Emirates', 'SanJose International Airport UnitedStates', 'Kolkata India', '2023-05-07 20:45:00', '2023-05-09 08:55:00', '$1200', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('EM845', 'Emirates', 'Dallas/Fort Worth International Airport UnitedStates', 'Hyderabad India', '2023-06-07 21:10:00', '2023-06-09 10:35:00', '$786', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI454', 'AirIndia', 'Denver International Airport UnitedStates', 'Delhi India', '2023-05-17 22:23:00', '2023-05-19 03:35:00', '$1345', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI667', 'AirIndia', 'O\'Hare International Airport UnitedStates', 'Chennai India', '2023-06-20 13:14:00', '2023-06-22 06:35:00', '$1245', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI798', 'AirIndia', 'San Deigo International Airport UnitedStates', 'Delhi India', '2023-06-07 14:30:00', '2023-06-09 02:35:00', '$1876', 'flight_checkin_alert');
INSERT INTO flight(flight_id, airline, origin, destination, departure_time, arrival_time, actual_price, message_type) 
VALUES('AI887', 'AirIndia', 'Memphis International Airport UnitedStates', 'Hyderabad India', '2023-06-07 15:45:00', '2023-06-09 03:55:00', '$976', 'flight_checkin_alert');



