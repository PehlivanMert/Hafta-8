# Patika Tourism Agency System

This project aims to develop a hotel management system for Patika Tourism Agency to conduct its business digitally. The system provides a user-friendly interface for agency employees to manage hotel reservations, rooms, and fulfill customer requests.
## Features
- **User Management:** Admin can add, edit, delete, and view a list of agency employees.
- **Hotel Management:** Enables the addition, editing, and listing of hotels. Also, records pension types and facility features associated with hotels.
- **Season Management:** Hotel periods are added, and pricing is done based on these periods.
- **Room Management:** Allows addition, editing, and listing of rooms associated with hotels. Different room types and features are recorded.
- **Pricing:** Room prices are automatically calculated based on hotel periods, pension types, and the number of guests.
- **Room Search and Reservation Operations:** Agency employees can search for rooms and make reservations according to customer requests.

## Technical Requirements
- **Database:** PostgreSQL is used.
- **GUI:** A user-friendly interface is designed with Swing.

## Database Tables
- **user:** Stores admin and agency employee user information.
- **hotel:** Stores hotel information.
- **season:** Stores period records associated with hotels.
- **pension:** Stores pension types associated with hotels.
- **room:** Stores room records associated with hotels.
- **reservation:** Stores reservation records associated with rooms.

## Installation
1. Clone the project to your computer.
2. Use the `HotelManagementSystemDatabase.sql` file found in the folder for the database.
3. You can log in as an admin with the username `admin` and password `1234`.
4. You can log in as an employee with the username `employee` and password `1234`.
5. The overall operation can be found in the `EmployeeView` class.
6. You can run the program by executing the `Main` class.


## Contributions
Contributions are welcome! For major changes, please open an issue first to discuss what you would like to change.

Enjoy! 👋🏼 






