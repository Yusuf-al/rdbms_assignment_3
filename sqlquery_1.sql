-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(200) not null,
    email varchar(50) unique not null,
    role varchar(20) check(role in ('Ticket Manager','Football Fan')) ,
    phone_number varchar(20)
);

CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(200) not null,
    tournament_category varchar(200) not null,
    base_ticket_price int not null,
    match_status varchar(100),

    constraint check_ticket_price
          check (base_ticket_price >= 0),
    constraint check_match_status check( match_status in ('Available','Selling Fast','Sold Out','Postponed'))

);

CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int references Users(user_id),
    match_id int references Matches(match_id),
    seat_number varchar(20),
    payment_status varchar(100),
    total_cost int check( total_cost >=0),

  constraint check_payment_status check ( payment_status in ('Pending','Confirmed','Cancelled','Refunded'))
 
);

INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL),
(5, 'Rakib Hasan', 'rakib@mail.com', 'Football Fan', '+8801744444444'),
(6, 'Nusrat Jahan', 'nusrat@mail.com', 'Football Fan', '+8801755555555'),
(7, 'Mahmudul Islam', 'mahmudul@mail.com', 'Ticket Manager', '+8801766666666'),
(8, 'Farhana Akter', 'farhana@mail.com', 'Football Fan', '+8801777777777'),
(9, 'Shakil Ahmed', 'shakil@mail.com', 'Football Fan', NULL),
(10, 'Tania Sultana', 'tania@mail.com', 'Ticket Manager', '+8801788888888'),
(11, 'Mehedi Hasan', 'mehedi@mail.com', 'Football Fan', '+8801799999999'),
(12, 'Sadia Rahman', 'sadia@mail.com', 'Football Fan', '+8801811111111'),
(13, 'Imran Hossain', 'imran@mail.com', 'Ticket Manager', '+8801822222222'),
(14, 'Mim Akter', 'mim@mail.com', 'Football Fan', '+8801833333333');


INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);

INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(506, 3, 103, 'D-10', 'Confirmed', 180.00),
(507, 4, 101, 'A-15', 'Cancelled', 150.00),
(508, 5, 104, 'B-08', 'Pending', 200.00),
(509, 6, 102, 'C-05', 'Refunded', 120.00),
(510, 7, 103, NULL, 'Pending', 180.00);
