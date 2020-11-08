/* --1. Count the 'MAN'-Trucks in truck tabel: */

	SELECT COUNT(truck_manufacturer) 
	FROM truck 
	WHERE truck.truck_manufacturer = "MAN" ;



/* --2. Select all entries from delivery before 1st January 2010 that happend after 12 o'clock: */

	Select *
	From delivery
	WHERE delivery_date < '2010-01-01'
	AND delivery_time > '12:00:00';



/* --3. JOIN employee_ID, employee_first_name and employee_last_name with office_ID, office_name: */

	SELECT employee_ID, employee_first_name, employee_last_name,office_ID, office_name
	FROM office
	INNER JOIN employee on fk_office_ID = office_ID;



/* --4. Select ID, licence, manufacturer of trucks from Vienna (Licence starts with W-...): */

	SELECT truck_ID, truck_licence, truck_manufacturer
	FROM truck
	WHERE truck_licence LIKE 'W-%';


/* --5. Count the deliveries made between 7am and 1pm: */

	SELECT COUNT(*) FROM delivery
	WHERE delivery_time BETWEEN '07:00:00' AND '13:00:00';



/* --6. JOIN sender with 1.package, 2.office, 3.recipient and 4.package_type: */

	SELECT sender_ID, sender_first_name, sender_last_name, package_date_deposited, office_ID, office_name, recipient_last_name, package_type
	FROM sender
	INNER JOIN package ON package.fk_sender_ID  = sender.sender_ID 
	INNER JOIN office ON office.office_ID = package.package_ID
	INNER JOIN recipient ON recipient.recipient_ID = office.office_ID
	INNER JOIN package_type ON package_type.package_type_ID = package.package_ID 
	WHERE package.fk_office_ID = 2;


/* --7. Combined Query Nr.6 to output multiple sets using UNION: */

	SELECT sender_ID, sender_first_name, sender_last_name, package_date_deposited, office_ID, office_name, recipient_last_name, package_type
	FROM sender
	INNER JOIN package ON package.fk_sender_ID  = sender.sender_ID 
	INNER JOIN office ON office.office_ID = package.package_ID
	INNER JOIN recipient ON recipient.recipient_ID = office.office_ID
	INNER JOIN package_type ON package_type.package_type_ID = package.package_ID 
	WHERE package.fk_office_ID = 5
	UNION
	SELECT sender_ID, sender_first_name, sender_last_name, package_date_deposited, office_ID, office_name, recipient_last_name, package_type
	FROM sender
	INNER JOIN package ON package.fk_sender_ID  = sender.sender_ID 
	INNER JOIN office ON office.office_ID = package.package_ID
	INNER JOIN recipient ON recipient.recipient_ID = office.office_ID
	INNER JOIN package_type ON package_type.package_type_ID = package.package_ID 
	WHERE package.fk_office_ID = 3;



