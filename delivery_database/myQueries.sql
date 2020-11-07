// --1. Count the 'MAN'-Trucks in truck tabel:

	SELECT COUNT(truck_manufacturer) FROM truck WHERE truck.truck_manufacturer = "MAN" ;



// --2. Select all entries from delivery before 1st January 2010 that happend after 12 o'clock:

	Select *
	From delivery
	WHERE delivery_date < '2010-01-01'
	AND delivery_time > '12:00:00';



// --3. JOIN employee_first_name and employee_last_name with office_name:

	SELECT employee_first_name, employee_last_name, office_name
	FROM office
	INNER JOIN employee on fk_office_ID = office_ID;