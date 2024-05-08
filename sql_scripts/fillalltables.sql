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
('University of California, San Diego', NOW()),
('Duke University', NOW()),
('Northwestern University', NOW()),
('Johns Hopkins University', NOW()),
('University of Michigan', NOW()),
('New York University', NOW()),
('Carnegie Mellon University', NOW()),
('University of Southern California', NOW()),
('University of North Carolina at Chapel Hill', NOW()),
('University of Virginia', NOW()),
('Brown University', NOW()),
('Vanderbilt University', NOW());

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
('Sanders Theatre', '45 Quincy St', 'Cambridge', 'MA', '02138'),
('Lincoln Center', '10 Lincoln Center Plaza', 'New York', 'NY', '10023'),
('Sydney Opera House', 'Bennelong Point', 'Sydney', 'NSW', '2000'),
('Royal Albert Hall', 'Kensington Gore', 'London', 'England', 'SW7 2AP'),
('Teatro Colón', 'Cerrito 628', 'Buenos Aires', 'Buenos Aires', 'C1012AAO'),
('Konzerthaus Berlin', 'Gendarmenmarkt', 'Berlin', 'Berlin', '10117'),
('Esplanade Concert Hall', '1 Esplanade Dr', 'Singapore', 'Singapore', '038981'),
('Suntory Hall', '1-13-1 Akasaka', 'Minato', 'Tokyo', '107-8403'),
('Louise M. Davies Symphony Hall', '201 Van Ness Ave', 'San Francisco', 'CA', '94102'),
('Elbphilharmonie', 'Platz der Deutschen Einheit 1', 'Hamburg', 'Hamburg', '20457'),
('Concertgebouw', 'Concertgebouwplein 10', 'Amsterdam', 'North Holland', '1071 LN'),
('Musikverein', 'Musikvereinsplatz 1', 'Vienna', 'Vienna', '1010');

-- Insert sample data into Event_Type table
INSERT INTO Event_Type (Type_Name, Created_At)
VALUES
('Oral Presentation', NOW()),
('Poster', NOW()),
('Online', NOW());

-- Insert sample data into Event table

INSERT INTO `Event` (Event_Type_ID, Location_ID, U_ID, Start_Date_Time, End_Date_Time, Max_Capacity, Presenter_Deadline, Event_Name, F_Date_Time, Created_At, Is_Published, Description, Status)
VALUES
(1, 1, 1, '2024-02-15 09:00:00', '2024-02-17 18:00:00', 101, '2024-01-31 23:59:59', 'Artificial Intelligence Conference', '2024-02-15 08:00:00', NOW(), 1, 'Explore the latest advancements in AI and machine learning.', 'Full'),
(2, 2, 1, '2024-03-10 10:00:00', '2024-03-10 16:00:00', 100, '2024-02-28 23:59:59', 'Data Science Workshop', '2024-03-10 09:30:00', NOW(), 1, 'Learn practical data science techniques and tools.', 'Open'),
(3, 3, 1, '2024-03-20 14:00:00', '2024-03-20 17:00:00', 200, '2024-03-10 23:59:59', 'Quantum Computing Seminar', '2024-03-20 13:30:00', NOW(), 1, 'Discover the potential of quantum computing.', 'Open'),
(1, 4, 1, '2024-04-05 11:00:00', '2024-04-07 18:00:00', 300, '2024-03-20 23:59:59', 'Neuroscience Symposium', '2024-04-05 10:00:00', NOW(), 1, 'Explore the latest findings in neuroscience research.', 'Open'),
(2, 5, 1, '2024-04-15 13:00:00', '2024-04-15 16:00:00', 150, '2024-04-05 23:59:59', 'Robotics Forum', '2024-04-15 12:30:00', NOW(), 1, 'Discuss the challenges and opportunities in robotics.', 'Open'),
(3, 6, 1, '2024-04-25 15:00:00', '2024-04-25 18:00:00', 120, '2024-04-15 23:59:59', 'Climate Change Panel Discussion', '2024-04-25 14:30:00', NOW(), 1, 'Explore strategies for combating climate change.', 'Full'),
(1, 7, 1, '2024-05-05 10:00:00', '2024-05-05 12:00:00', 80, '2024-04-25 23:59:59', 'Astrophysics Lecture', '2024-05-05 09:30:00', NOW(), 1, 'Learn about the latest discoveries in astrophysics.', 'Open'),
(2, 8, 1, '2024-05-15 09:00:00', '2024-05-17 17:00:00', 250, '2024-04-30 23:59:59', 'Cybersecurity Training', '2024-05-15 08:30:00', NOW(), 1, 'Gain practical skills in cybersecurity.', 'Closed'),
(3, 9, 1, '2024-05-25 18:00:00', '2024-05-25 21:00:00', 100, '2024-05-15 23:59:59', 'Networking Event for Entrepreneurs', '2024-05-25 17:30:00', NOW(), 1, 'Connect with fellow entrepreneurs and investors.', 'Open'),
(1, 10, 1, '2024-06-05 10:00:00', '2024-06-07 18:00:00', 400, '2024-05-20 23:59:59', 'Biomedical Engineering Exhibition', '2024-06-05 09:00:00', NOW(), 1, 'Showcase the latest biomedical engineering technologies.', 'Open'),
(2, 11, 12, '2024-06-15 11:00:00', '2024-06-17 16:00:00', 200, '2024-05-31 23:59:59', 'Software Development Trade Show', '2024-06-15 10:00:00', NOW(), 1, 'Explore the latest tools and trends in software development.', 'Open'),
(3, 12, 13, '2024-06-25 14:00:00', '2024-06-25 16:00:00', 150, '2024-06-10 23:59:59', 'Electric Vehicle Product Launch', '2024-06-25 13:30:00', NOW(), 1, 'Witness the unveiling of a revolutionary electric vehicle.', 'Open'),
(1, 13, 14, '2024-07-05 09:00:00', '2024-07-07 18:00:00', 120, '2024-06-20 23:59:59', 'Sustainability Hackathon', '2024-07-05 08:00:00', NOW(), 1, 'Develop innovative solutions for sustainability challenges.', 'Cancelled'),
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
('john.doe@example.com', 'pass123', 'John', 'Doe', '123-456-7891', 'Organizer', NOW()),
('jane.smith1@example.com', 'qwerty1', 'Jane', 'Smith', '234-567-8902', 'Attendee', NOW()),
('michael.johnson1@example.com', 'abcde12', 'Michael', 'Johnson', '345-678-9013', 'Organizer', NOW()),
('emily.davis1@example.com', 'abcdef3', 'Emily', 'Davis', '456-789-0124', 'Attendee', NOW()),
('david.wilson1@example.com', 'pass456', 'David', 'Wilson', '567-890-1235', 'Organizer', NOW()),
('sarah.brown1@example.com', 'p4sswrd', 'Sarah', 'Brown', '678-901-2346', 'Attendee', NOW()),
('robert.taylor1@example.com', 'qwer123', 'Robert', 'Taylor', '789-012-3457', 'Organizer', NOW()),
('olivia.anderson1@example.com', 'pass234', 'Olivia', 'Anderson', '890-123-4568', 'Attendee', NOW()),
('william.thomas1@example.com', '1q2w3er', 'William', 'Thomas', '901-234-5679', 'Organizer', NOW()),
('sophia.jackson1@example.com', 'qwe1234', 'Sophia', 'Jackson', '012-345-6780', 'Attendee', NOW()),
('james.white1@example.com', 'pass567', 'James', 'White', '113-233-4455', 'Organizer', NOW()),
('ava.harris1@example.com', 'abcde56', 'Ava', 'Harris', '224-344-5566', 'Attendee', NOW()),
('benjamin.martin1@example.com', 'pass789', 'Benjamin', 'Martin', '335-455-6677', 'Organizer', NOW()),
('mia.thompson1@example.com', 'qwert56', 'Mia', 'Thompson', '446-566-7788', 'Attendee', NOW()),
('henry.garcia1@example.com', 'passd12', 'Henry', 'Garcia', '557-677-8899', 'Organizer', NOW()),
('charlotte.martinez1@example.com', 'ab12cd3', 'Charlotte', 'Martinez', '668-788-9900', 'Attendee', NOW()),
('liam.robinson1@example.com', 'pass789', 'Liam', 'Robinson', '779-899-0011', 'Organizer', NOW()),
('amelia.clark1@example.com', 'pass345', 'Amelia', 'Clark', '890-900-1122', 'Attendee', NOW()),
('ethan.rodriguez1@example.com', 'qw3rty2', 'Ethan', 'Rodriguez', '901-112-2233', 'Organizer', NOW()),
('harper.lewis1@example.com', 'abc1234', 'Harper', 'Lewis', '012-223-3344', 'Attendee', NOW()),
('noah.walker1@example.com', 'pass234', 'Noah', 'Walker', '123-334-4556', 'Organizer', NOW()),
('lucas.hall1@example.com', 'qwer123', 'Lucas', 'Hall', '234-445-5667', 'Attendee', NOW()),
('elizabeth.allen1@example.com', 'abcd567', 'Elizabeth', 'Allen', '345-556-6778', 'Organizer', NOW()),
('zoe.scott1@example.com', 'ab12cd3', 'Zoe', 'Scott', '456-667-7889', 'Attendee', NOW()),
('jackson.moore1@example.com', 'abcdef4', 'Jackson', 'Moore', '567-778-8990', 'Organizer', NOW()),
('grace.wright1@example.com', 'pass678', 'Grace', 'Wright', '678-889-9001', 'Attendee', NOW()),
('logan.young1@example.com', 'pw12345', 'Logan', 'Young', '789-990-0112', 'Organizer', NOW()),
('lily.king1@example.com', 'passw12', 'Lily', 'King', '900-001-1223', 'Attendee', NOW()),
('daniel.green1@example.com', 'qw123ty', 'Daniel', 'Green', '002-112-2334', 'Organizer', NOW()),
('oliver.clark1@example.com', 'qw12abc', 'Oliver', 'Clark', '113-223-3445', 'Attendee', NOW()),
('ava.adams1@example.com', 'ab123cd', 'Ava', 'Adams', '224-334-4556', 'Organizer', NOW()),
('joseph.harris1@example.com', 'psswrd1', 'Joseph', 'Harris', '335-445-5667', 'Attendee', NOW()),
('charlotte.baker1@example.com', 'pa3ssw4', 'Charlotte', 'Baker', '446-556-6778', 'Organizer', NOW()),
('emma.hill1@example.com', 'passwrd', 'Emma', 'Hill', '557-667-7889', 'Attendee', NOW()),
('joshua.mitchell1@example.com', 'pa11ss2', 'Joshua', 'Mitchell', '668-778-8990', 'Organizer', NOW()),
('madison.carter1@example.com', 'passw23', 'Madison', 'Carter', '779-889-9001', 'Attendee', NOW()),
('liam.roberts1@example.com', 'pass456', 'Liam', 'Roberts', '890-990-0112', 'Organizer', NOW()),
('sophia.wilson1@example.com', 'pa3ss45', 'Sophia', 'Wilson', '991-001-1223', 'Attendee', NOW()),
('isabella.morris1@example.com', 'pssword', 'Isabella', 'Morris', '113-223-3346', 'Organizer', NOW()),
('andrew.turner1@example.com', 'pass678', 'Andrew', 'Turner', '224-334-4557', 'Attendee', NOW()),
('lucy.phillips1@example.com', 'p1as234', 'Lucy', 'Phillips', '335-445-5668', 'Organizer', NOW()),
('nathan.taylor1@example.com', 'pssw123', 'Nathan', 'Taylor', '446-556-6779', 'Attendee', NOW()),
('olivia.evans1@example.com', '123paas', 'Olivia', 'Evans', '557-667-7880', 'Organizer', NOW()),
('david.reed1@example.com', 'qw123ty', 'David', 'Reed', '668-778-8991', 'Attendee', NOW()),
('chloe.parker1@example.com', 'abc234d', 'Chloe', 'Parker', '779-889-9002', 'Organizer', NOW()),
('charlotte.lewis1@example.com', 'ab1234c', 'Charlotte', 'Lewis', '890-990-0113', 'Attendee', NOW()),
('james.white2@example.com', 'pass678', 'James', 'White', '991-001-1224', 'Organizer', NOW()),
('amelia.lee1@example.com', 'qw34as5', 'Amelia', 'Lee', '002-112-2335', 'Attendee', NOW()),
('sophia.jackson2@example.com', 'qw3rty4', 'Sophia', 'Jackson', '224-334-4557', 'Organizer', NOW()),
('ava.harris2@example.com', 'pass234', 'Ava', 'Harris', '335-445-5668', 'Attendee', NOW()),
('liam.brown1@example.com', 'qw12ty3', 'Liam', 'Brown', '446-556-6779', 'Organizer', NOW()),
('elizabeth.king1@example.com', 'pas234d', 'Elizabeth', 'King', '557-667-7880', 'Attendee', NOW()),
('isabella.jones1@example.com', 'pass567', 'Isabella', 'Jones', '668-778-8991', 'Organizer', NOW()),
('daniel.roberts1@example.com', 'qw2ert4', 'Daniel', 'Roberts', '779-889-9002', 'Attendee', NOW()),
('noah.bell1@example.com', 'abcd567', 'Noah', 'Bell', '890-990-0113', 'Organizer', NOW()),
('michael.wright1@example.com', 'pass567', 'Michael', 'Wright', '991-001-1224', 'Attendee', NOW()),
('jackson.green1@example.com', 'qw234er', 'Jackson', 'Green', '002-112-2335', 'Organizer', NOW()),
('sophia.wright1@example.com', 'qw23as5', 'Sophia', 'Wright', '224-334-4557', 'Attendee', NOW()),
('lucas.murphy1@example.com', 'pass789', 'Lucas', 'Murphy', '335-456-6678', 'Organizer', NOW()),
('maria.diaz1@example.com', 'qwert78', 'Maria', 'Diaz', '446-567-7789', 'Attendee', NOW()),
('ethan.hernandez1@example.com', 'ab1cdef', 'Ethan', 'Hernandez', '557-678-8890', 'Organizer', NOW()),
('scarlett.wood1@example.com', 'pass901', 'Scarlett', 'Wood', '668-789-9901', 'Attendee', NOW()),
('samuel.clark1@example.com', 'p4ss567', 'Samuel', 'Clark', '779-900-0012', 'Organizer', NOW()),
('natalie.martin1@example.com', 'abcde34', 'Natalie', 'Martin', '890-901-1123', 'Attendee', NOW()),
('henry.wilson1@example.com', 'qwer456', 'Henry', 'Wilson', '991-002-2234', 'Organizer', NOW()),
('harper.evans1@example.com', 'pa1s567', 'Harper', 'Evans', '002-113-3345', 'Attendee', NOW()),
('liam.anderson1@example.com', 'abcd789', 'Liam', 'Anderson', '113-224-4456', 'Organizer', NOW()),
('lucy.ramirez1@example.com', 'qw123rt', 'Lucy', 'Ramirez', '224-335-5567', 'Attendee', NOW()),
('george.sanchez1@example.com', 'pas6789', 'George', 'Sanchez', '335-446-6678', 'Organizer', NOW()),
('amelia.king1@example.com', 'qwerty2', 'Amelia', 'King', '446-557-7789', 'Attendee', NOW()),
('jackson.white1@example.com', 'pass123', 'Jackson', 'White', '557-668-8890', 'Organizer', NOW()),
('violet.scott1@example.com', 'abcdef3', 'Violet', 'Scott', '668-789-9901', 'Attendee', NOW()),
('dylan.young1@example.com', 'pw12378', 'Dylan', 'Young', '779-900-0012', 'Organizer', NOW()),
('madison.miller1@example.com', 'pasw678', 'Madison', 'Miller', '890-901-1123', 'Attendee', NOW()),
('oliver.adams1@example.com', 'psw7890', 'Oliver', 'Adams', '991-002-2234', 'Organizer', NOW()),
('ella.torres1@example.com', 'pass678', 'Ella', 'Torres', '002-113-3345', 'Attendee', NOW()),
('elijah.walker1@example.com', 'qwe1234', 'Elijah', 'Walker', '113-224-4456', 'Organizer', NOW()),
('sophia.james1@example.com', 'qwert45', 'Sophia', 'James', '224-335-5567', 'Attendee', NOW()),
('oliver.brown1@example.com', 'pass456', 'Oliver', 'Brown', '335-446-6678', 'Organizer', NOW()),
('mia.williams1@example.com', 'pssw567', 'Mia', 'Williams', '446-557-7789', 'Attendee', NOW()),
('henry.mitchell1@example.com', 'qwert12', 'Henry', 'Mitchell', '557-668-8890', 'Organizer', NOW()),
('charlotte.carter1@example.com', 'pssw123', 'Charlotte', 'Carter', '668-789-9901', 'Attendee', NOW()),
('liam.johnson1@example.com', 'pass678', 'Liam', 'Johnson', '779-900-0012', 'Organizer', NOW()),
('lucy.robinson1@example.com', 'qw34ert', 'Lucy', 'Robinson', '890-901-1123', 'Attendee', NOW()),
('noah.clark1@example.com', 'pssw234', 'Noah', 'Clark', '991-002-2234', 'Organizer', NOW()),
('scarlett.garcia1@example.com', 'qwerty4', 'Scarlett', 'Garcia', '002-113-3345', 'Attendee', NOW()),
('george.martinez1@example.com', 'pass789', 'George', 'Martinez', '113-224-4456', 'Organizer', NOW()),
('amelia.wilson1@example.com', 'abcde45', 'Amelia', 'Wilson', '224-335-5567', 'Attendee', NOW()),
('dylan.murphy1@example.com', 'pw12345', 'Dylan', 'Murphy', '335-446-6678', 'Organizer', NOW()),
('violet.jackson1@example.com', 'qwe1234', 'Violet', 'Jackson', '446-557-7789', 'Attendee', NOW()),
('samuel.smith1@example.com', 'pass567', 'Samuel', 'Smith', '557-668-8890', 'Organizer', NOW()),
('sophia.davis1@example.com', 'qwert56', 'Sophia', 'Davis', '668-789-9901', 'Attendee', NOW()),
('jackson.brown1@example.com', 'qwert12', 'Jackson', 'Brown', '779-900-0012', 'Organizer', NOW()),
('henry.hernandez1@example.com', 'pass123', 'Henry', 'Hernandez', '890-901-1123', 'Attendee', NOW()),
('lucas.martin1@example.com', 'pass789', 'Lucas', 'Martin', '991-002-2234', 'Organizer', NOW()),
('charlotte.anderson1@example.com', 'qwerty2', 'Char', 'Anderson', '888-223-1938', 'Attendee', NOW()),
('noah.sanchez1@example.com', 'psw1234', 'Noah', 'Sanchez', '113-224-4456', 'Organizer', NOW()),
('amelia.garcia1@example.com', 'qwert23', 'Amelia', 'Garcia', '224-335-5567', 'Attendee', NOW()),
('george.king1@example.com', 'pass123', 'George', 'King', '335-446-6678', 'Organizer', NOW()),
('scarlett.evans1@example.com', 'qw12ert', 'Scarlett', 'Evans', '446-557-7789', 'Attendee', NOW()),
('elijah.adams1@example.com', 'pass789', 'Elijah', 'Adams', '557-668-8890', 'Organizer', NOW()),
('lucas.green1@example.com', 'pass234', 'Lucas', 'Green', '668-789-9901', 'Attendee', NOW()),
('charlotte.torres1@example.com', 'pw12345', 'Charlotte', 'Torres', '779-900-0012', 'Organizer', NOW()),
('noah.wilson1@example.com', 'psw1234', 'Noah', 'Wilson', '890-901-1123', 'Attendee', NOW()),
('amelia.james1@example.com', 'qwert23', 'Amelia', 'James', '991-002-2234', 'Organizer', NOW()),
('john.doe1@example.com', 'pass123', 'John', 'Doe', '123-456-7892', 'Organizer', NOW()),
('jane.smith2@example.com', 'qwerty1', 'Jane', 'Smith', '234-567-8903', 'Attendee', NOW()),
('michael.johnson2@example.com', 'abcde12', 'Michael', 'Johnson', '345-678-9014', 'Organizer', NOW()),
('emily.davis2@example.com', 'abcdef3', 'Emily', 'Davis', '456-789-0125', 'Attendee', NOW()),
('david.wilson2@example.com', 'pass456', 'David', 'Wilson', '567-890-1236', 'Organizer', NOW()),
('sarah.brown2@example.com', 'p4sswrd', 'Sarah', 'Brown', '678-901-2347', 'Attendee', NOW()),
('robert.taylor2@example.com', 'qwer123', 'Robert', 'Taylor', '789-012-3458', 'Organizer', NOW()),
('olivia.anderson2@example.com', 'pass234', 'Olivia', 'Anderson', '890-123-4569', 'Attendee', NOW()),
('william.thomas2@example.com', '1q2w3er', 'William', 'Thomas', '901-234-5670', 'Organizer', NOW()),
('sophia.jackson3@example.com', 'qwe1234', 'Sophia', 'Jackson', '012-345-6781', 'Attendee', NOW()),
('james.white3@example.com', 'pass567', 'James', 'White', '114-233-4455', 'Organizer', NOW()),
('ava.harris3@example.com', 'abcde56', 'Ava', 'Harris', '225-344-5566', 'Attendee', NOW()),
('benjamin.martin2@example.com', 'pass789', 'Benjamin', 'Martin', '336-455-6677', 'Organizer', NOW()),
('mia.thompson2@example.com', 'qwert56', 'Mia', 'Thompson', '447-566-7788', 'Attendee', NOW()),
('henry.garcia2@example.com', 'passd12', 'Henry', 'Garcia', '558-677-8899', 'Organizer', NOW()),
('charlotte.martinez2@example.com', 'ab12cd3', 'Charlotte', 'Martinez', '669-788-9900', 'Attendee', NOW()),
('liam.robinson2@example.com', 'pass789', 'Liam', 'Robinson', '770-899-0011', 'Organizer', NOW()),
('amelia.clark2@example.com', 'pass345', 'Amelia', 'Clark', '891-900-1122', 'Attendee', NOW()),
('ethan.rodriguez2@example.com', 'qw3rty2', 'Ethan', 'Rodriguez', '902-112-2233', 'Organizer', NOW()),
('harper.lewis2@example.com', 'abc1234', 'Harper', 'Lewis', '013-223-3344', 'Attendee', NOW()),
('noah.walker2@example.com', 'pass234', 'Noah', 'Walker', '124-334-4556', 'Organizer', NOW()),
('lucas.hall2@example.com', 'qwer123', 'Lucas', 'Hall', '235-445-5667', 'Attendee', NOW()),
('elizabeth.allen2@example.com', 'abcd567', 'Elizabeth', 'Allen', '346-556-6778', 'Organizer', NOW()),
('zoe.scott2@example.com', 'ab12cd3', 'Zoe', 'Scott', '457-667-7889', 'Attendee', NOW()),
('jackson.moore2@example.com', 'abcdef4', 'Jackson', 'Moore', '568-778-8990', 'Organizer', NOW()),
('grace.wright2@example.com', 'pass678', 'Grace', 'Wright', '679-889-9001', 'Attendee', NOW()),
('logan.young2@example.com', 'pw12345', 'Logan', 'Young', '780-990-0112', 'Organizer', NOW()),
('lily.king2@example.com', 'passw12', 'Lily', 'King', '901-001-1223', 'Attendee', NOW()),
('daniel.green2@example.com', 'qw123ty', 'Daniel', 'Green', '003-112-2334', 'Organizer', NOW()),
('oliver.clark2@example.com', 'qw12abc', 'Oliver', 'Clark', '114-223-3445', 'Attendee', NOW()),
('ava.adams2@example.com', 'ab123cd', 'Ava', 'Adams', '225-334-4556', 'Organizer', NOW()),
('joseph.harris2@example.com', 'psswrd1', 'Joseph', 'Harris', '336-445-5667', 'Attendee', NOW()),
('charlotte.baker2@example.com', 'pa3ssw4', 'Charlotte', 'Baker', '447-556-6778', 'Organizer', NOW()),
('emma.hill2@example.com', 'passwrd', 'Emma', 'Hill', '558-667-7889', 'Attendee', NOW()),
('joshua.mitchell2@example.com', 'pa11ss2', 'Joshua', 'Mitchell', '669-778-8990', 'Organizer', NOW()),
('madison.carter2@example.com', 'passw23', 'Madison', 'Carter', '770-889-9001', 'Attendee', NOW()),
('liam.roberts2@example.com', 'pass456', 'Liam', 'Roberts', '891-990-0112', 'Organizer', NOW()),
('sophia.wilson2@example.com', 'pa3ss45', 'Sophia', 'Wilson', '992-001-1223', 'Attendee', NOW()),
('isabella.morris2@example.com', 'pssword', 'Isabella', 'Morris', '114-223-3347', 'Organizer', NOW()),
('andrew.turner2@example.com', 'pass678', 'Andrew', 'Turner', '225-334-4558', 'Attendee', NOW()),
('lucy.phillips2@example.com', 'p1as234', 'Lucy', 'Phillips', '336-445-5669', 'Organizer', NOW()),
('nathan.taylor2@example.com', 'pssw123', 'Nathan', 'Taylor', '447-556-6770', 'Attendee', NOW()),
('olivia.evans2@example.com', '123paas', 'Olivia', 'Evans', '558-667-7881', 'Organizer', NOW()),
('david.reed2@example.com', 'qw123ty', 'David', 'Reed', '669-778-8992', 'Attendee', NOW()),
('chloe.parker2@example.com', 'abc234d', 'Chloe', 'Parker', '770-889-9003', 'Organizer', NOW()),
('charlotte.lewis2@example.com', 'ab1234c', 'Charlotte', 'Lewis', '891-990-0114', 'Attendee', NOW()),
('james.white4@example.com', 'pass678', 'James', 'White', '992-001-1225', 'Organizer', NOW()),
('amelia.lee2@example.com', 'qw34as5', 'Amelia', 'Lee', '003-112-2336', 'Attendee', NOW()),
('sophia.jackson4@example.com', 'qw3rty4', 'Sophia', 'Jackson', '225-334-4558', 'Organizer', NOW()),
('ava.harris4@example.com', 'pass234', 'Ava', 'Harris', '336-445-5669', 'Attendee', NOW()),
('liam.brown2@example.com', 'qw12ty3', 'Liam', 'Brown', '447-556-6770', 'Organizer', NOW()),
('elizabeth.king2@example.com', 'pas234d', 'Elizabeth', 'King', '558-667-7881', 'Attendee', NOW()),
('isabella.jones2@example.com', 'pass567', 'Isabella', 'Jones', '669-778-8992', 'Organizer', NOW()),
('daniel.roberts2@example.com', 'qw2ert4', 'Daniel', 'Roberts', '770-889-9003', 'Attendee', NOW()),
('noah.bell2@example.com', 'abcd567', 'Noah', 'Bell', '891-990-0114', 'Organizer', NOW()),
('michael.wright2@example.com', 'pass567', 'Michael', 'Wright', '992-001-1225', 'Attendee', NOW()),
('jackson.green2@example.com', 'qw234er', 'Jackson', 'Green', '003-112-2336', 'Organizer', NOW()),
('sophia.wright2@example.com', 'qw23as5', 'Sophia', 'Wright', '225-334-4558', 'Attendee', NOW()),
('lucas.murphy2@example.com', 'pass789', 'Lucas', 'Murphy', '336-457-6678', 'Organizer', NOW()),
('maria.diaz2@example.com', 'qwert78', 'Maria', 'Diaz', '447-568-7789', 'Attendee', NOW()),
('ethan.hernandez2@example.com', 'ab1cdef', 'Ethan', 'Hernandez', '558-679-8890', 'Organizer', NOW()),
('scarlett.wood2@example.com', 'pass901', 'Scarlett', 'Wood', '669-780-9901', 'Attendee', NOW()),
('samuel.clark2@example.com', 'p4ss567', 'Samuel', 'Clark', '770-901-0012', 'Organizer', NOW()),
('natalie.martin2@example.com', 'abcde34', 'Natalie', 'Martin', '891-902-1123', 'Attendee', NOW()),
('henry.wilson3@example.com', 'qwer456', 'Henry', 'Wilson', '992-003-2234', 'Organizer', NOW()),
('harper.evans2@example.com', 'pa1s567', 'Harper', 'Evans', '003-114-3345', 'Attendee', NOW()),
('liam.anderson3@example.com', 'abcd789', 'Liam', 'Anderson', '114-225-4456', 'Organizer', NOW()),
('lucy.ramirez2@example.com', 'qw123rt', 'Lucy', 'Ramirez', '225-336-5567', 'Attendee', NOW()),
('george.sanchez2@example.com', 'pas6789', 'George', 'Sanchez', '336-447-6678', 'Organizer', NOW()),
('amelia.king3@example.com', 'qwerty2', 'Amelia', 'King', '447-558-7789', 'Attendee', NOW()),
('jackson.white2@example.com', 'pass123', 'Jackson', 'White', '558-669-8890', 'Organizer', NOW()),
('violet.scott2@example.com', 'abcdef3', 'Violet', 'Scott', '669-780-9901', 'Attendee', NOW()),
('dylan.young2@example.com', 'pw12378', 'Dylan', 'Young', '770-901-0012', 'Organizer', NOW()),
('madison.miller2@example.com', 'pasw678', 'Madison', 'Miller', '891-902-1123', 'Attendee', NOW()),
('oliver.adams2@example.com', 'psw7890', 'Oliver', 'Adams', '992-003-2234', 'Organizer', NOW()),
('ella.torres2@example.com', 'pass678', 'Ella', 'Torres', '003-114-3345', 'Attendee', NOW()),
('elijah.walker2@example.com', 'qwe1234', 'Elijah', 'Walker', '114-225-4456', 'Organizer', NOW()),
('sophia.james2@example.com', 'qwert45', 'Sophia', 'James', '225-336-5567', 'Attendee', NOW()),
('oliver.brown3@example.com', 'pass456', 'Oliver', 'Brown', '336-447-6678', 'Organizer', NOW()),
('mia.williams2@example.com', 'pssw567', 'Mia', 'Williams', '447-558-7789', 'Attendee', NOW()),
('henry.mitchell2@example.com', 'qwert12', 'Henry', 'Mitchell', '558-669-8890', 'Organizer', NOW()),
('charlotte.carter3@example.com', 'pssw123', 'Charlotte', 'Carter', '669-780-9901', 'Attendee', NOW()),
('liam.johnson3@example.com', 'pass678', 'Liam', 'Johnson', '770-901-0012', 'Organizer', NOW()),
('lucy.robinson3@example.com', 'qw34ert', 'Lucy', 'Robinson', '891-902-1123', 'Attendee', NOW()),
('noah.clark3@example.com', 'pssw234', 'Noah', 'Clark', '992-003-2234', 'Organizer', NOW()),
('scarlett.garcia3@example.com', 'qwerty4', 'Scarlett', 'Garcia', '003-114-3345', 'Attendee', NOW()),
('george.martinez3@example.com', 'pass789', 'George', 'Martinez', '114-225-4456', 'Organizer', NOW());

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
('Prof. Jake Garcia', NOW()),
('Dr. Daniel Martinez', NOW()),
('Prof. Mark Robinson', NOW()),
('Dr. Jou Clark', NOW()),
('Prof. John Lewis', NOW()),
('Dr. Frank Rodriguez', NOW()),
('Prof. Daniel Dark', NOW()),
('Dr. Son Park', NOW()),
('Mark Zuckerberg', NOW()),
('Dr. Joe Baker', NOW()),
('Dr. Zull Stevenson', NOW()),
('Dr. Christian Mendoza', NOW());

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
('Health and Wellness Co.', NOW()),
('OpenAI Inc.', NOW()),
('Nordic Aerospace', NOW()),
('Electric Aviation', NOW()),
('Data Analysis Inc.', NOW()),
('Meta', NOW()),
('Nvidia', NOW()),
('Celsius Solutions', NOW()),
('Apollo Aviation', NOW()),
('Yamaha Engineering', NOW()),
('Steinberg Inc.', NOW()),
('ASUS', NOW());

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
('Prof. Samantha Johnson', NOW()),
('Steve Jobs', NOW()),
('Perry Prada', NOW()),
('Bill Gates', NOW()),
('Prince Charles', NOW()),
('Prof. Steven Mouch', NOW()),
('Dr. John Deer', NOW()),
('Jack Dorsey', NOW()),
('Elon Musk', NOW()),
('Prof. Daniel Johnston', NOW()),
('Prof. Dat Vo', NOW()),
('Dr. Sunhar Fisk', NOW());

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
(20, 10, NOW()),
(21, 1, NOW()),
(22, 1, NOW()),
(23, 1, NOW()),
(24, 1, NOW()),
(25, 1, NOW()),
(26, 1, NOW()),
(27, 1, NOW()),
(28, 1, NOW()),
(29, 1, NOW()),
(30, 1, NOW()),
(31, 1, NOW()),
(32, 1, NOW()),
(33, 1, NOW()),
(34, 1, NOW()),
(35, 1, NOW()),
(36, 1, NOW()),
(37, 1, NOW()),
(38, 1, NOW()),
(39, 1, NOW()),
(40, 1, NOW()),
(41, 1, NOW()),
(42, 1, NOW()),
(43, 1, NOW()),
(44, 1, NOW()),
(45, 1, NOW()),
(46, 1, NOW()),
(47, 1, NOW()),
(48, 1, NOW()),
(49, 1, NOW()),
(50, 1, NOW()),
(51, 1, NOW()),
(52, 1, NOW()),
(53, 1, NOW()),
(54, 1, NOW()),
(55, 1, NOW()),
(56, 1, NOW()),
(57, 1, NOW()),
(58, 1, NOW()),
(59, 1, NOW()),
(60, 1, NOW()),
(61, 1, NOW()),
(62, 1, NOW()),
(63, 1, NOW()),
(64, 1, NOW()),
(65, 1, NOW()),
(66, 1, NOW()),
(67, 1, NOW()),
(68, 1, NOW()),
(69, 1, NOW()),
(70, 1, NOW()),
(71, 1, NOW()),
(72, 1, NOW()),
(73, 1, NOW()),
(74, 1, NOW()),
(75, 1, NOW()),
(76, 1, NOW()),
(77, 1, NOW()),
(78, 1, NOW()),
(79, 1, NOW()),
(80, 1, NOW()),
(81, 1, NOW()),
(82, 1, NOW()),
(83, 1, NOW()),
(84, 1, NOW()),
(85, 1, NOW()),
(86, 1, NOW()),
(87, 1, NOW()),
(88, 1, NOW()),
(89, 1, NOW()),
(90, 1, NOW()),
(91, 1, NOW()),
(92, 1, NOW()),
(93, 1, NOW()),
(94, 1, NOW()),
(95, 1, NOW()),
(96, 1, NOW()),
(97, 1, NOW()),
(98, 1, NOW()),
(99, 1, NOW()),
(100, 1, NOW()),
(101, 1, NOW()),
(102, 1, NOW()),
(103, 1, NOW()),
(104, 1, NOW()),
(105, 1, NOW()),
(106, 1, NOW()),
(107, 1, NOW()),
(108, 1, NOW()),
(109, 1, NOW()),
(110, 1, NOW()),
(111, 1, NOW()),
(112, 1, NOW()),
(113, 1, NOW()),
(114, 1, NOW()),
(115, 1, NOW()),
(116, 1, NOW()),
(117, 1, NOW()),
(118, 1, NOW()),
(119, 1, NOW()),
(120, 1, NOW());

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
(20, 10, NOW()),
(21, 11, NOW()),
(22, 11, NOW()),
(23, 12, NOW()),
(24, 12, NOW()),
(25, 13, NOW()),
(26, 13, NOW()),
(27, 14, NOW()),
(28, 14, NOW()),
(29, 15, NOW()),
(30, 15, NOW()),
(31, 16, NOW());
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
(20, 10, NOW()),
(21, 11, NOW()),
(22, 11, NOW()),
(23, 12, NOW()),
(24, 12, NOW()),
(25, 13, NOW()),
(26, 13, NOW()),
(27, 14, NOW()),
(28, 14, NOW()),
(29, 15, NOW()),
(30, 15, NOW()),
(31, 16, NOW());
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
(20, 10, NOW()),
(21, 11, NOW()),
(22, 11, NOW()),
(23, 12, NOW()),
(24, 12, NOW()),
(25, 13, NOW()),
(26, 13, NOW()),
(27, 14, NOW()),
(28, 14, NOW()),
(29, 15, NOW()),
(30, 15, NOW()),
(31, 16, NOW());
