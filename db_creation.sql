create table services(
    service_id SERIAL primary key,
    service_name VARCHAR(200)
);

create table salespersons(
    crew_id SERIAL primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15)
);

create table customers(
    customer_id SERIAL primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15),
    service_id INTEGER not null,
    foreign key(service_id) references services(service_id)
);

create table cars(
    car_id SERIAL primary key,
    customer_id INTEGER,
    vin VARCHAR(17),
    make VARCHAR(100),
    model VARCHAR(100),
    make_year INTEGER,
    color VARCHAR(15),
    mileage NUMERIC(10,2),
    foreign key(customer_id) references customers(customer_id)
);
-- If foreign key references a non-primary key field, 
--that field must has a unique constraint
ALTER TABLE cars
ADD UNIQUE (vin);


create table invoice(
    invoice_id SERIAL primary key,
    car_id INTEGER,
    vin VARCHAR(17),
    crew_id INTEGER,
    customer_id INTEGER,
    sold_date DATE,
    amount NUMERIC(10,2),
    foreign key(car_id) references cars(car_id),
    foreign key(vin) references cars(vin),
    foreign key(crew_id) references salespersons(crew_id),
    foreign key(customer_id) references customers(customer_id)
);

create table service_record(
    record_id SERIAL primary key,
    vin VARCHAR(17),
    description text,
    service_date DATE,
    foreign key(vin) references cars(vin)
);

create table mechanics(
    mechanic_id SERIAL primary key,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(15)
);


create table servicetickets(
    ticket_id SERIAL primary key,
    service_id INTEGER references services(service_id),
    car_id INTEGER references cars(car_id),
    customer_id INTEGER references customers(customer_id),
    mechanic_id INTEGER references mechanics(mechanic_id),
    description text,
    service_date DATE
);

create table parts_needed(
    part_id SERIAL primary key,
    ticket_id INTEGER references servicetickets(ticket_id),
    part_name VARCHAR(150),
    quantity INTEGER
);






