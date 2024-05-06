-- Insert sample data into U table
INSERT INTO U (U_Name, Created_At)
VALUES
('Harvard University', NOW()),
('Massachusetts Institute of Technology', NOW()),
('Stanford University', NOW()),
('University of California, Berkeley', NOW()),
('University of Oxford', NOW()),
('California Institute of Technology', NOW()),
('University of Cambridge', NOW()),
('University of Chicago', NOW()),
('Princeton University', NOW()),
('Yale University', NOW()),
('Columbia University', NOW()),
('University of California, Los Angeles', NOW()),
('University of Pennsylvania', NOW()),
('Cornell University', NOW()),
('University of Calif', NOW()),
('University of Washington', NOW()),
('University of Illinois at Urbana-Champaign', NOW()),
('University of Wisconsin-Madison', NOW()),
('University of Texas at Austin', NOW()),
('University of California, San Diego', NOW());

-- Insert sample data into Location table
INSERT INTO Location (Venue, Street_Address, City, State, Zip_Code)
VALUES
('Kresge Auditorium', '48 Massachusetts Ave', 'Cambridge', 'MA', '02139'),
('Hewlett Teaching Center', '370 Serra Mall', 'Stanford', 'CA', '94305'),
('Wheeler Hall', '11 Gayley Rd', 'Berkeley', 'CA', '94720'),
('Sheldonian Theatre', 'Broad St', 'Oxford', 'England', 'OX1 3AZ'),
('Beckman Auditorium', '332 S Michigan Ave', 'Pasadena', 'CA', '91125'),
('Lady Mitchell Hall', 'Sidgwick Ave', 'Cambridge', 'England', 'CB3 9DA'),
('Reynolds Club', '5706 S University Ave', 'Chicago', 'IL', '60637'),
('McCosh Hall', 'Washington Rd', 'Princeton', 'NJ', '08544'),
('Sheffield-Sterling-Strathcona Hall', '1 Prospect St', 'New Haven', 'CT', '06511'),
('Lerner Hall', '2920 Broadway', 'New York', 'NY', '10027'),
('Royce Hall', '10745 Dickson Ct', 'Los Angeles', 'CA', '90095'),
('Irvine Auditorium', '3401 Spruce St', 'Philadelphia', 'PA', '19104'),
('Bailey Hall', '2812 College Way', 'Ithaca', 'NY', '14850'),
('Rackham Auditorium', '915 E Washington St', 'Ann Arbor', 'MI', '48109'),
('Kane Hall', '4069 Spokane Ln', 'Seattle', 'WA', '98105'),
('Foellinger Auditorium', '709 S Mathews Ave', 'Urbana', 'IL', '61801'),
('Memorial Union', '800 Langdon St', 'Madison', 'WI', '53706'),
('Hogg Memorial Auditorium', '2300 Whitis Ave', 'Austin', 'TX', '78712'),
('Price Center Theater', '9500 Gilman Dr', 'La Jolla', 'CA', '92093'),
('Sanders Theatre', '45 Quincy St', 'Cambridge', 'MA', '02138');

-- Insert sample data into Event_Type table
INSERT INTO Event_Type (Type_Name, Created_At)
VALUES
('Oral Presentation', NOW()),
('Poster', NOW()),
('Online', NOW());

-- Insert sample data into Event table
INSERT INTO `Event` (Event_Type_ID, Location_ID, U_ID, Start_Date_Time, End_Date_Time, Max_Capacity, Presenter_Deadline, Event_Name, F_Date_Time, Created_At, Is_Published, Description, Status)
VALUES
(1, 1, 2, '2024-02-15 09:00:00', '2024-02-17 18:00:00', 500, '2024-01-31 23:59:59', 'Artificial Intelligence Conference', '2024-02-15 08:00:00', NOW(), 1, 'Explore the latest advancements in AI and machine learning.', 'Open'),
(2, 2, 3, '2024-03-10 10:00:00', '2024-03-10 16:00:00', 100, '2024-02-28 23:59:59', 'Data Science Workshop', '2024-03-10 09:30:00', NOW(), 1, 'Learn practical data science techniques and tools.', 'Open'),
(3, 3, 4, '2024-03-20 14:00:00', '2024-03-20 17:00:00', 200, '2024-03-10 23:59:59', 'Quantum Computing Seminar', '2024-03-20 13:30:00', NOW(), 1, 'Discover the potential of quantum computing.', 'Open'),
(1, 4, 5, '2024-04-05 11:00:00', '2024-04-07 18:00:00', 300, '2024-03-20 23:59:59', 'Neuroscience Symposium', '2024-04-05 10:00:00', NOW(), 1, 'Explore the latest findings in neuroscience research.', 'Open'),
(2, 5, 6, '2024-04-15 13:00:00', '2024-04-15 16:00:00', 150, '2024-04-05 23:59:59', 'Robotics Forum', '2024-04-15 12:30:00', NOW(), 1, 'Discuss the challenges and opportunities in robotics.', 'Open'),
(3, 6, 7, '2024-04-25 15:00:00', '2024-04-25 18:00:00', 120, '2024-04-15 23:59:59', 'Climate Change Panel Discussion', '2024-04-25 14:30:00', NOW(), 1, 'Explore strategies for combating climate change.', 'Open'),
(1, 7, 8, '2024-05-05 10:00:00', '2024-05-05 12:00:00', 80, '2024-04-25 23:59:59', 'Astrophysics Lecture', '2024-05-05 09:30:00', NOW(), 1, 'Learn about the latest discoveries in astrophysics.', 'Open'),
(2, 8, 9, '2024-05-15 09:00:00', '2024-05-17 17:00:00', 250, '2024-04-30 23:59:59', 'Cybersecurity Training', '2024-05-15 08:30:00', NOW(), 1, 'Gain practical skills in cybersecurity.', 'Open'),
(3, 9, 10, '2024-05-25 18:00:00', '2024-05-25 21:00:00', 100, '2024-05-15 23:59:59', 'Networking Event for Entrepreneurs', '2024-05-25 17:30:00', NOW(), 1, 'Connect with fellow entrepreneurs and investors.', 'Open'),
(1, 10, 11, '2024-06-05 10:00:00', '2024-06-07 18:00:00', 400, '2024-05-20 23:59:59', 'Biomedical Engineering Exhibition', '2024-06-05 09:00:00', NOW(), 1, 'Showcase the latest biomedical engineering technologies.', 'Open'),
(2, 11, 12, '2024-06-15 11:00:00', '2024-06-17 16:00:00', 200, '2024-05-31 23:59:59', 'Software Development Trade Show', '2024-06-15 10:00:00', NOW(), 1, 'Explore the latest tools and trends in software development.', 'Open'),
(3, 12, 13, '2024-06-25 14:00:00', '2024-06-25 16:00:00', 150, '2024-06-10 23:59:59', 'Electric Vehicle Product Launch', '2024-06-25 13:30:00', NOW(), 1, 'Witness the unveiling of a revolutionary electric vehicle.', 'Open'),
(1, 13, 14, '2024-07-05 09:00:00', '2024-07-07 18:00:00', 120, '2024-06-20 23:59:59', 'Sustainability Hackathon', '2024-07-05 08:00:00', NOW(), 1, 'Develop innovative solutions for sustainability challenges.', 'Open'),
(2, 14, 15, '2024-07-15 15:00:00', '2024-07-15 17:00:00', 500, '2024-07-05 23:59:59', 'Renewable Energy Webinar', '2024-07-15 14:30:00', NOW(), 1, 'Learn about the latest advancements in renewable energy.', 'Open'),
(3, 15, 16, '2024-07-25 13:00:00', '2024-07-27 18:00:00', 100, '2024-07-10 23:59:59', 'Data Visualization Masterclass', '2024-07-25 12:30:00', NOW(), 1, 'Master the art of creating compelling data visualizations.', 'Open'),
(1, 16, 17, '2024-08-05 11:00:00', '2024-08-05 13:00:00', 80, '2024-07-25 23:59:59', 'Education Technology Roundtable', '2024-08-05 10:30:00', NOW(), 1, 'Discuss the future of education technology.', 'Open'),
(2, 17, 18, '2024-08-15 09:00:00', '2024-08-17 17:00:00', 300, '2024-07-31 23:59:59', 'Biotechnology Summit', '2024-08-15 08:00:00', NOW(), 1, 'Explore the latest breakthroughs in biotechnology.', 'Open'),
(3, 18, 19, '2024-08-25 14:00:00', '2024-08-27 18:00:00', 200, '2024-08-10 23:59:59', 'Nanotechnology Convention', '2024-08-25 13:00:00', NOW(), 1, 'Discover the potential of nanotechnology across industries.', 'Open'),
(1, 19, 20, '2024-09-05 10:00:00', '2024-09-07 16:00:00', 150, '2024-08-20 23:59:59', 'Space Exploration Congress', '2024-09-05 09:00:00', NOW(), 1, 'Discuss the latest advances and challenges in space exploration.', 'Open'),
(2, 20, 1, '2024-09-15 09:00:00', '2024-09-17 18:00:00', 100, '2024-08-31 23:59:59', 'Health and Wellness Expo', '2024-09-15 08:00:00', NOW(), 1, 'Explore wellness practices, fitness innovations, and healthy living seminars.', 'Open');

-- Insert sample data into User table
INSERT INTO User (Email, Password, F_Name, LName, Phone_Number, Role, Created_At)
VALUES
('john.doe@example.com', 'password1', 'John', 'Doe', '123-456-7890', 'Organizer', NOW()),
('jane.smith@example.com', 'qwerty1', 'Jane', 'Smith', '987-654-3210', 'Attendee', NOW()),
('michael.johnson@example.com', 'abc123', 'Michael', 'Johnson', '555-555-5555', 'Organizer', NOW()),
('emily.davis@example.com', 'password2', 'Emily', 'Davis', '111-222-3333', 'Attendee', NOW()),
('david.wilson@example.com', '123456', 'David', 'Wilson', '999-888-7777', 'Organizer', NOW()),
('sarah.brown@example.com', 'pass123', 'Sarah', 'Brown', '444-555-6666', 'Attendee', NOW()),
('robert.taylor@example.com', 'qwerty2', 'Robert', 'Taylor', '222-333-4444', 'Organizer', NOW()),
('olivia.anderson@example.com', 'password3', 'Olivia', 'Anderson', '777-888-9999', 'Attendee', NOW()),
('william.thomas@example.com', 'abcdef', 'William', 'Thomas', '666-777-8888', 'Organizer', NOW()),
('sophia.jackson@example.com', '123abc', 'Sophia', 'Jackson', '333-444-5555', 'Attendee', NOW()),
('james.white@example.com', 'pass1234', 'James', 'White', '888-999-0000', 'Organizer', NOW()),
('ava.harris@example.com', 'qwertyui', 'Ava', 'Harris', '555-666-7777', 'Attendee', NOW()),
('benjamin.martin@example.com', 'password4', 'Benjamin', 'Martin', '222-333-4444', 'Organizer', NOW()),
('mia.thompson@example.com', 'abc123def', 'Mia', 'Thompson', '999-000-1111', 'Attendee', NOW()),
('henry.garcia@example.com', 'pass12345', 'Henry', 'Garcia', '777-888-9999', 'Organizer', NOW()),
('charlotte.martinez@example.com', 'qwerty3', 'Charlotte', 'Martinez', '444-555-6666', 'Attendee', NOW()),
('liam.robinson@example.com', 'password5', 'Liam', 'Robinson', '111-222-3333', 'Organizer', NOW()),
('amelia.clark@example.com', 'abcdefg', 'Amelia', 'Clark', '888-999-0000', 'Attendee', NOW()),
('ethan.rodriguez@example.com', '123456789', 'Ethan', 'Rodriguez', '555-666-7777', 'Organizer', NOW()),
('harper.lewis@example.com', 'pass123456', 'Harper', 'Lewis', '222-333-4444', 'Attendee', NOW());

-- Insert sample data into Presenter table
INSERT INTO Presenter (Presenter_Name, Create_At)
VALUES
('Dr. Alice Johnson', NOW()),
('Prof. Robert Smith', NOW()),
('Dr. Emily Davis', NOW()),
('Prof. Michael Brown', NOW()),
('Dr. Olivia Wilson', NOW()),
('Prof. James Taylor', NOW()),
('Dr. Sophia Anderson', NOW()),
('Prof. William Thomas', NOW()),
('Dr. Ava Jackson', NOW()),
('Prof. Benjamin White', NOW()),
('Dr. Mia Harris', NOW()),
('Prof. Henry Martin', NOW()),
('Dr. Charlotte Thompson', NOW()),
('Prof. Liam Garcia', NOW()),
('Dr. Amelia Martinez', NOW()),
('Prof. Ethan Robinson', NOW()),
('Dr. Harper Clark', NOW()),
('Prof. Alexander Lewis', NOW()),
('Dr. Scarlett Rodriguez', NOW()),
('Prof. Daniel Lee', NOW());

-- Insert sample data into Sponsor table
INSERT INTO Sponsor (Sponsor_Name, Create_At)
VALUES
('Acme Inc.', NOW()),
('XYZ Corporation', NOW()),
('Tech Solutions Ltd.', NOW()),
('Innovative Industries', NOW()),
('Global Enterprises', NOW()),
('ABC Company', NOW()),
('Future Tech Inc.', NOW()),
('Green Energy Solutions', NOW()),
('Quantum Computing Ltd.', NOW()),
('Robotics Innovators', NOW()),
('AI Research Institute', NOW()),
('Biomedical Breakthroughs', NOW()),
('Software Solutions Inc.', NOW()),
('Cybersecurity Experts', NOW()),
('Electric Vehicle Innovations', NOW()),
('Data Analytics Group', NOW()),
('Renewable Resources Ltd.', NOW()),
('Nanotech Researchers', NOW()),
('Space Exploration Ventures', NOW()),
('Health and Wellness Co.', NOW());

-- Insert sample data into Speaker table
INSERT INTO Speaker (Speaker_Name, Created_At)
VALUES
('Dr. Samantha Lee', NOW()),
('Prof. David Johnson', NOW()),
('Dr. Olivia Brown', NOW()),
('Prof. Daniel Wilson', NOW()),
('Dr. Emma Taylor', NOW()),
('Prof. Alexander Anderson', NOW()),
('Dr. Sophia Thomas', NOW()),
('Prof. James Jackson', NOW()),
('Dr. Ava White', NOW()),
('Prof. Benjamin Harris', NOW()),
('Dr. Mia Martin', NOW()),
('Prof. Henry Thompson', NOW()),
('Dr. Charlotte Garcia', NOW()),
('Prof. Liam Martinez', NOW()),
('Dr. Amelia Robinson', NOW()),
('Prof. Ethan Clark', NOW()),
('Dr. Harper Lewis', NOW()),
('Prof. Scarlett Rodriguez', NOW()),
('Dr. Daniel Lee', NOW()),
('Prof. Samantha Johnson', NOW());

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
(10, 5, NOW()),
(11, 6, NOW()),
(12, 6, NOW()),
(13, 7, NOW()),
(14, 7, NOW()),
(15, 8, NOW()),
(16, 8, NOW()),
(17, 9, NOW()),
(18, 9, NOW()),
(19, 10, NOW()),
(20, 10, NOW());

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
(10, 5, NOW()),
(11, 6, NOW()),
(12, 6, NOW()),
(13, 7, NOW()),
(14, 7, NOW()),
(15, 8, NOW()),
(16, 8, NOW()),
(17, 9, NOW()),
(18, 9, NOW()),
(19, 10, NOW()),
(20, 10, NOW());

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
(10, 5, NOW()),
(11, 6, NOW()),
(12, 6, NOW()),
(13, 7, NOW()),
(14, 7, NOW()),
(15, 8, NOW()),
(16, 8, NOW()),
(17, 9, NOW()),
(18, 9, NOW()),
(19, 10, NOW()),
(20, 10, NOW());
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
(10, 5, NOW()),
(11, 6, NOW()),
(12, 6, NOW()),
(13, 7, NOW()),
(14, 7, NOW()),
(15, 8, NOW()),
(16, 8, NOW()),
(17, 9, NOW()),
(18, 9, NOW()),
(19, 10, NOW()),
(20, 10, NOW());
