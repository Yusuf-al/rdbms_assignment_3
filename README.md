# Football Match Ticket Booking Database System

## Project Overview

The Football Match Ticket Booking Database System is a relational database project designed to manage football match ticket sales, user registrations, and booking records efficiently. The system demonstrates the implementation of core Database Management System (DBMS) concepts including entity relationships, primary and foreign keys, joins, aggregate functions, subqueries, and data integrity constraints.

This project simulates a real-world football ticketing platform where fans can register, browse matches, and purchase tickets for upcoming fixtures.

---

## Objectives

* Design a normalized relational database schema.
* Maintain data integrity using Primary Keys and Foreign Keys.
* Manage football matches and ticket bookings efficiently.
* Perform complex SQL queries for reporting and analytics.
* Demonstrate practical usage of SQL joins, subqueries, aggregate functions, and constraints.

---

## Database Schema

## Draw.io Link
https://drive.google.com/file/d/1wCleQwL0mPXS0s715zQMSMWwMl3kHxCp/view?usp=sharing

### Users Table

Stores registered football fans.

| Column            | Data Type | Description            |
| ----------------- | --------- | ---------------------- |
| user_id           | INT (PK)  | Unique user identifier |
| full_name         | VARCHAR   | User full name         |
| email             | VARCHAR   | User email address     |
| phone             | VARCHAR   | Contact number         |
| registration_date | DATE      | Registration date      |

---

### Matches Table

Stores football match information.

| Column            | Data Type | Description                      |
| ----------------- | --------- | -------------------------------- |
| match_id          | INT (PK)  | Unique match identifier          |
| fixture           | VARCHAR   | Match fixture (Team A vs Team B) |
| venue             | VARCHAR   | Match venue                      |
| match_date        | DATE      | Scheduled match date             |
| base_ticket_price | DECIMAL   | Base ticket price                |

---

### Bookings Table

Stores ticket booking records.

| Column          | Data Type | Description               |
| --------------- | --------- | ------------------------- |
| booking_id      | INT (PK)  | Unique booking identifier |
| user_id         | INT (FK)  | References Users table    |
| match_id        | INT (FK)  | References Matches table  |
| booking_date    | DATE      | Date of booking           |
| ticket_quantity | INT       | Number of tickets         |
| total_cost      | DECIMAL   | Total booking cost        |
| payment_status  | VARCHAR   | Payment status            |

---

## Entity Relationships

### One-to-Many Relationships

#### Users → Bookings

One user can make multiple bookings.

```text
Users (1) -----------< Bookings (Many)
```

#### Matches → Bookings

One match can have multiple ticket bookings.

```text
Matches (1) -----------< Bookings (Many)
```

---

## Database Constraints

### Primary Keys

* user_id
* match_id
* booking_id

### Foreign Keys

```sql
FOREIGN KEY (user_id)
REFERENCES Users(user_id);

FOREIGN KEY (match_id)
REFERENCES Matches(match_id);
```

These constraints ensure referential integrity and prevent invalid bookings.

---

## Technologies Used

* SQL
* PostgreSQL / MySQL
* DBMS Concepts
* ERD (Crow's Foot Modeling)

---

## How to Run

1. Create the database.

```sql
CREATE DATABASE football_booking_system;
```

2. Create all tables.

3. Insert sample data.

4. Execute SQL queries from the project.

5. Verify outputs and relationships.

---

##  Academic Topics Covered

* Primary Key
* Foreign Key
* Entity Relationship Diagram (ERD)
* Normalization
* Joins
* Aggregate Functions
* Subqueries
* HAVING Clause
* Data Integrity Constraints

---

##  Author

Yusuf Al Naiem


