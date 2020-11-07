// type table:

// zip table:
CREATE TABLE zip(
    zip_code int NOT NULL,
    zip_city VARCHAR(55) NOT NULL,
    PRIMARY KEY(zip_code)
    );

// truck table:

//package_type table:

// address table:
CREATE TABLE address(
    address_ID int NOT NULL,
    address_street_name VARCHAR(55) NOT NULL,
    address_house_number int NOT NULL,
    address_country VARCHAR(55) NOT NULL,
    fk_zip_code int,
    PRIMARY KEY (address_ID),
    FOREIGN KEY (fk_zip_code) REFERENCES zip(zip_code)
    );

// sender table:
CREATE TABLE sender(
    sender_ID int NOT NULL,
    sender_first_name VARCHAR(55) NOT NULL,
    sender_last_name VARCHAR(55) NOT NULL,
    fk_type_ID int,
    fk_address_ID int,
    PRIMARY KEY (sender_ID),
    FOREIGN KEY (fk_type_ID) REFERENCES type(type_ID),
    FOREIGN KEY (fk_address_ID) REFERENCES address(address_ID)
    );

// office table:
CREATE TABLE office(
    office_ID int NOT NULL,
    office_name VARCHAR(55),
    fk_address_ID int,
    PRIMARY KEY (office_ID),
    FOREIGN KEY (fk_address_ID) REFERENCES address(address_ID)
    );

// recipient table:
CREATE TABLE recipient(
    recipient_ID int NOT NULL,
    recipient_first_name VARCHAR(55),
    recipient_last_name VARCHAR(55),
    fk_address_ID int,
    PRIMARY KEY (recipient_ID),
    FOREIGN KEY (fk_address_ID) REFERENCES address(address_ID)
    );

//office table:
CREATE TABLE employee(
    employee_ID int NOT NULL,
    employee_first_name VARCHAR(55),
    employee_last_name VARCHAR(55),
    employee_department VARCHAR(55),
    fk_office_ID int,
    PRIMARY KEY (employee_ID),
    FOREIGN KEY (fk_office_ID) REFERENCES office(office_ID)
    );

// package table:
CREATE TABLE package(
	package_ID int NOT NULL,
    package_date_deposited date,
    fk_package_type_ID int,
    fk_sender_ID int,
    fk_recipient_ID int,
    fk_office_ID int,
    PRIMARY KEY (package_ID),
    FOREIGN KEY (fk_package_type_ID) REFERENCES package_type(package_type_ID),
    FOREIGN KEY (fk_sender_ID) REFERENCES sender(sender_ID),
    FOREIGN KEY (fk_recipient_ID) REFERENCES recipient(recipient_ID),
    FOREIGN KEY (fk_office_ID) REFERENCES office(office_ID)
);

// delivery table:
CREATE TABLE delivery(
    delivery_ID int NOT NULL,
    delivery_date date,
    delivery_time time,
    fk_truck_ID int,
    fk_employee_ID int,
    fk_package_ID int,
    PRIMARY KEY (delivery_ID),
    FOREIGN KEY (fk_truck_ID) REFERENCES truck(truck_ID),
    FOREIGN KEY (fk_employee_ID) REFERENCES employee(employee_ID),
    FOREIGN KEY (fk_package_ID) REFERENCES package(package_ID)
    );




