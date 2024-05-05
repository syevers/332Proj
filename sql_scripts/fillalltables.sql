-- Insert sample data into U table
INSERT INTO U (U_ID, U_Name, Created_At)
VALUES
(1, 'University A', NOW()),
(2, 'University B', NOW()),
(3, 'University C', NOW()),
(4, 'University D', NOW()),
(5, 'University E', NOW()),
(6, 'University F', NOW()),
(7, 'University G', NOW()),
(8, 'University H', NOW()),
(9, 'University I', NOW()),
(10, 'University J', NOW());

-- Insert sample data into Location table
INSERT INTO Location (Location_ID, Venue, City, State, Zip_Code)
VALUES
(1, 'Convention Center', 'New York', 'NY', '10001'),
(2, 'Hotel Grand', 'Los Angeles', 'CA', '90001'),
(3, 'Conference Hall', 'Chicago', 'IL', '60601'),
(4, 'Exhibition Center', 'Houston', 'TX', '77001'),
(5, 'Event Arena', 'Phoenix', 'AZ', '85001'),
(6, 'Meeting Place', 'Philadelphia', 'PA', '19101'),
(7, 'Seminar Hall', 'San Antonio', 'TX', '78201'),
(8, 'Training Center', 'San Diego', 'CA', '92101'),
(9, 'Expo Venue', 'Dallas', 'TX', '75201'),
(10, 'Summit Hall', 'San Jose', 'CA', '95101');

-- Insert sample data into Event_Type table
INSERT INTO Event_Type (Event_Type_ID, Type_Name, Created_At)
VALUES
(1, 'Presentation', NOW()),
(2, 'Poster', NOW()),
(3, 'Online', NOW()),
(4, 'Online', NOW()),
(5, 'Presentation', NOW()),
(6, 'Poster', NOW()),
(7, 'Presentation', NOW()),
(8, 'Poster', NOW()),
(9, 'Online', NOW()),
(10, 'Presentation', NOW());

-- Insert sample data into Event table
INSERT INTO `Event` (Event_ID, Event_Type_ID, Location_ID, U_ID, Start_Date_Time, End_Date_Time, Max_Capacity, Presenter_Deadline, Event_Name, F_Date_Time, Created_At, Is_Published, Description, Venue)
VALUES
(1, 1, 1, 1, '2023-06-01 10:00:00', '2023-06-01 12:00:00', 100, '2023-05-15 00:00:00', 'Annual Tech Innovations Summit', '2023-06-01 09:30:00', NOW(), TRUE, 'A keynote conference bringing together leading technology innovators and industry experts.', 'Summit Station'),
(2, 2, 2, 2, '2023-07-15 14:00:00', '2023-07-15 16:00:00', 50, '2023-07-01 00:00:00', 'Summer Art Workshop', '2023-07-15 13:30:00', NOW(), TRUE, 'Hands-on art sessions exploring modern artistic techniques with guest artists.', 'Staples Center'),
(3, 3, 3, 3, '2023-08-10 09:00:00', '2023-08-10 11:00:00', 75, '2023-07-31 00:00:00', 'Local Food Fest', '2023-08-10 08:30:00', NOW(), TRUE, 'Celebrate local cuisine with food stalls, cooking demos, and taste testing from regional chefs.', 'CSUF Humanitarian Building'),
(4, 1, 4, 4, '2023-09-05 16:00:00', '2023-09-05 18:00:00', 120, '2023-08-20 00:00:00', 'Health and Wellness Expo', '2023-09-05 15:30:00', NOW(), TRUE, 'Explore wellness practices, fitness innovations, and healthy living seminars.', 'Stanford Kitchen'),
(5, 2, 5, 5, '2023-10-20 11:00:00', '2023-10-20 13:00:00', 80, '2023-10-10 00:00:00', 'Photography Masterclass', '2023-10-20 10:30:00', NOW(), TRUE, 'Masterclass by renowned photographer focusing on landscape and portrait photography.', 'LA Arboretum'),
(6, 3, 6, 6, '2024-01-12 13:00:00', '2024-01-12 15:00:00', 90, '2023-12-31 00:00:00', 'Jazz and Wine Festival', '2024-01-12 12:30:00', NOW(), TRUE, 'Enjoy an afternoon of live jazz performances paired with fine wines and gourmet bites.', 'Downtown Concert Hall'),
(7, 1, 7, 7, '2024-02-01 15:00:00', '2024-02-01 17:00:00', 60, '2024-01-15 00:00:00', 'Sustainable Living Forum', '2024-02-01 14:30:00', NOW(), TRUE, 'Discussions on sustainable practices, renewable energies, and eco-friendly innovations.', 'Green Tech Conference Center'),
(8, 2, 8, 8, '2024-03-10 10:00:00', '2024-03-10 12:00:00', 110, '2024-02-28 00:00:00', 'Digital Marketing Bootcamp', '2024-03-10 09:30:00', NOW(), TRUE, 'Intensive bootcamp covering SEO, social media strategies, and content creation.', 'Tech Education Hub'),
(9, 3, 9, 9, '2024-04-15 14:00:00', '2024-04-15 16:00:00', 70, '2024-04-01 00:00:00', 'Vintage Film Marathon', '2024-04-15 13:30:00', NOW(), TRUE, 'A day-long event showcasing classic films, with discussions and guest speakers.', 'Classic Cinema Theater'),
(10, 1, 10, 10, '2024-05-05 09:00:00', '2024-05-05 11:00:00', 95, '2024-04-20 00:00:00', 'Entrepreneurs Networking Day', '2024-05-05 08:30:00', NOW(), TRUE, 'A dedicated networking event for aspiring and experienced entrepreneurs to exchange ideas and collaborate.', 'Innovation Center');

-- Insert sample data into User table
INSERT INTO User (User_ID, Email, Password, F_Name, LName, Phone_Number, Role, Created_At)
VALUES
(1, 'john@example.com', 'password1', 'John', 'Doe', '123-456-7890', 'Organizer', NOW()),
(2, 'jane@example.com', 'password2', 'Jane', 'Smith', '987-654-3210', 'Attendee', NOW()),
(3, 'mike@example.com', 'password3', 'Mike', 'Johnson', '456-789-0123', 'Organizer', NOW()),
(4, 'sarah@example.com', 'password4', 'Sarah', 'Williams', '789-012-3456', 'Attendee', NOW()),
(5, 'david@example.com', 'password5', 'David', 'Brown', '321-654-9870', 'Organizer', NOW()),
(6, 'emily@example.com', 'password6', 'Emily', 'Davis', '654-987-0321', 'Attendee', NOW()),
(7, 'chris@example.com', 'password7', 'Chris', 'Miller', '987-321-6540', 'Organizer', NOW()),
(8, 'amanda@example.com', 'password8', 'Amanda', 'Wilson', '321-987-6540', 'Attendee', NOW()),
(9, 'daniel@example.com', 'password9', 'Daniel', 'Taylor', '654-321-9870', 'Organizer', NOW()),
(10, 'olivia@example.com', 'password10', 'Olivia', 'Anderson', '987-654-0321', 'Attendee', NOW()),
(11, 'attend@test.com', 'test123', 'Test', 'Test', '111-111-1111', 'Attendee', NOW()),
(12, 'organizer@test.com', 'test123', 'Test', 'Test', '222-222-2222', 'Organizer', NOW());

-- Insert sample data into Presenter table
INSERT INTO Presenter (Presenter_ID, Presenter_Name, Create_At)
VALUES
(1, 'John Smith', NOW()),
(2, 'Emily Johnson', NOW()),
(3, 'Michael Davis', NOW()),
(4, 'Sarah Wilson', NOW()),
(5, 'David Brown', NOW()),
(6, 'Jennifer Taylor', NOW()),
(7, 'Christopher Anderson', NOW()),
(8, 'Amanda Thompson', NOW()),
(9, 'Daniel Harris', NOW()),
(10, 'Olivia Martin', NOW());

-- Insert sample data into Sponsor table
INSERT INTO Sponsor (Sponsor_ID, Sponsor_Name, Create_At)
VALUES
(1, 'ABC Company', NOW()),
(2, 'XYZ Corporation', NOW()),
(3, 'Acme Inc.', NOW()),
(4, 'Global Enterprises', NOW()),
(5, 'Tech Solutions Ltd.', NOW()),
(6, 'Innovative Industries', NOW()),
(7, 'Digital Dynamics', NOW()),
(8, 'Future Tech', NOW()),
(9, 'Peak Performance', NOW()),
(10, 'Synergy Systems', NOW());

-- Insert sample data into Speaker table
INSERT INTO Speaker (Speaker_ID, Speaker_Name, Created_At)
VALUES
(1, 'Jessica Thompson', NOW()),
(2, 'Robert Wilson', NOW()),
(3, 'Sophia Davis', NOW()),
(4, 'William Johnson', NOW()),
(5, 'Ava Brown', NOW()),
(6, 'James Taylor', NOW()),
(7, 'Mia Anderson', NOW()),
(8, 'Benjamin Harris', NOW()),
(9, 'Charlotte Martin', NOW()),
(10, 'Henry Thompson', NOW());

-- Insert sample data into User_Event table
INSERT INTO User_Event (User_ID, Event_ID, Created_At)
VALUES
(1, 1, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(4, 2, NOW()),
(5, 3, NOW()),
(6, 3, NOW()),
(7, 4, NOW()),
(8, 4, NOW()),
(9, 5, NOW()),
(10, 5, NOW());

-- Insert sample data into Presenter_Event table
INSERT INTO Presenter_Event (Presenter_ID, Event_ID, Created_At)
VALUES
(1, 1, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(4, 2, NOW()),
(5, 3, NOW()),
(6, 3, NOW()),
(7, 4, NOW()),
(8, 4, NOW()),
(9, 5, NOW()),
(10, 5, NOW());

-- Insert sample data into Speaker_Event table
INSERT INTO Speaker_Event (Speaker_ID, Event_ID, Created_At)
VALUES
(1, 1, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(4, 2, NOW()),
(5, 3, NOW()),
(6, 3, NOW()),
(7, 4, NOW()),
(8, 4, NOW()),
(9, 5, NOW()),
(10, 5, NOW());

-- Insert sample data into Sponsor_Event table
INSERT INTO Sponsor_Event (Sponsor_ID, Event_ID, Created_At)
VALUES
(1, 1, NOW()),
(2, 1, NOW()),
(3, 2, NOW()),
(4, 2, NOW()),
(5, 3, NOW()),
(6, 3, NOW()),
(7, 4, NOW()),
(8, 4, NOW()),
(9, 5, NOW()),
(10, 5, NOW());
