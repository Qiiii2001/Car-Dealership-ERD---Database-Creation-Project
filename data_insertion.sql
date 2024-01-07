insert into services(service_name) 
values 
('buy car'),
('repair car'),
('maintenance');

insert into salespersons (first_name, last_name, phone_number) 
values ('John', 'Doe', '123-456-7890');
insert into salespersons (first_name, last_name, phone_number) 
values ('Emily', 'Clark', '456-789-0123');


insert into customers (first_name, last_name, phone_number, service_id) 
values ('Jane', 'Smith', '234-567-8901', 1);
insert into customers (first_name, last_name, phone_number, service_id) 
values ('Robert', 'Brown', '567-890-1234', 2);


insert into cars (customer_id, vin, make, model, make_year, color, mileage) 
values (1, '1HGCM82633A004352', 'Toyota', 'Corolla', 2020, 'Red', 15000.00);
insert into cars (customer_id, vin, make, model, make_year, color, mileage) 
values (2, '2T3YFREV5JW747812', 'Honda', 'Civic', 2021, 'Blue', 25000.00);


insert into invoice (car_id, vin, crew_id, customer_id, sold_date, amount) 
values (1, '1HGCM82633A004352', 1, 1, '2023-01-01', 20000.00);
insert into invoice (car_id, vin, crew_id, customer_id, sold_date, amount) 
values (2, '2T3YFREV5JW747812', 2, 2, '2023-02-01', 22000.00);


insert into service_record (vin, description, service_date) 
values ('1HGCM82633A004352', 'Oil change', '2023-01-15');
insert into service_record (vin, description, service_date) 
values ('2T3YFREV5JW747812', 'Annual Inspection', '2023-02-20');


insert into mechanics (first_name, last_name, phone_number) 
values ('Mike', 'Johnson', '345-678-9012');
insert into mechanics (first_name, last_name, phone_number) 
values ('Sarah', 'Davis', '678-901-2345');


insert into servicetickets (service_id, car_id, customer_id, mechanic_id, description, service_date) 
values (1, 1, 1, 1, 'Oil Change', '2023-01-15');
insert into servicetickets (service_id, car_id, customer_id, mechanic_id, description, service_date) 
values (2, 2, 2, 2, 'Tire Rotation and Brake Check', '2023-02-20');


insert into parts_needed (ticket_id, part_name, quantity) 
values (1, 'Oil Filter', 1);
insert into parts_needed (ticket_id, part_name, quantity) 
values (2, 'Brake Pads', 2);


--sorted function
CREATE OR REPLACE FUNCTION insert_service(service_name VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO services (service_name) VALUES (service_name);
END;
$$ LANGUAGE plpgsql;

-- applying function
select insert_service('Brake Replacement');
select insert_service('Battery Check');

select * from services



