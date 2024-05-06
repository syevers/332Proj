<?php
require_once 'db_connection.php';

session_start();

// Check if the user is logged in and has the organizer role
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'Organizer') {
    header("Location: index.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $event_name = $_POST["event_name"];
    $description = $_POST["description"];
    $start_datetime = $_POST["start_datetime"];
    $end_datetime = $_POST["end_datetime"];
    $max_capacity = $_POST["max_capacity"];
    $presenter_deadline = $_POST["presenter_deadline"];
    $event_type = $_POST["event_type"];
    $university_id = $_POST["university_id"];
    $is_published = isset($_POST["is_published"]) ? 1 : 0;
    $publish_datetime = $_POST["publish_datetime"];
    
    // Retrieve location details
    $venue = $_POST["venue"];
    $street_address = $_POST["street_address"];
    $city = $_POST["city"];
    $state = $_POST["state"];
    $zip_code = $_POST["zip_code"];

    // Insert location into the database
    $location_sql = "INSERT INTO Location (Venue, Street_Address, City, State, Zip_Code)
                     VALUES ('$venue', '$street_address', '$city', '$state', '$zip_code')";
    if ($conn->query($location_sql) === TRUE) {
        $location_id = $conn->insert_id;
        
        // Insert event into the database
        $event_sql = "INSERT INTO `Event` (Event_Name, Description, Start_Date_Time, End_Date_Time, Max_Capacity, Presenter_Deadline, Event_Type_ID, U_ID, Is_Published, F_Date_Time, Created_At, Location_ID)
                      VALUES ('$event_name', '$description', '$start_datetime', '$end_datetime', $max_capacity, '$presenter_deadline', $event_type, $university_id, $is_published, '$publish_datetime', NOW(), $location_id)";

        if ($conn->query($event_sql) === TRUE) {
            $_SESSION['success'] = "Event created successfully.";
            header("Location: events.php");
            exit();
        } else {
            $error = "Error: " . $event_sql . "<br>" . $conn->error;
        }
    } else {
        $error = "Error: " . $location_sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Create Event - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
            <nav class="navbar">
                <ul class="navbar-left">
                    <li><a href="dashboard.php">Dashboard</a></li>
                    <li><a href="events.php">Events</a></li>
                    <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'Organizer') { ?>
                        <li><a href="create_event.php">Create Event</a></li>
                        <li><a href="organizer_events.php">My Created Events</a></li>
                    <?php } ?>
                </ul>
                <ul class="navbar-right">
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </nav>
    </header>

    <main>
        <h2>Create Event</h2>
        <?php if (isset($error)) { ?>
            <p class="error"><?php echo $error; ?></p>
        <?php } ?>
        <form action="create_event.php" method="POST">
            <label for="event_name">Event Name:</label>
            <input type="text" id="event_name" name="event_name" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>

            <label for="start_datetime">Start Date & Time:</label>
            <input type="datetime-local" id="start_datetime" name="start_datetime" required>

            <label for="end_datetime">End Date & Time:</label>
            <input type="datetime-local" id="end_datetime" name="end_datetime" required>

            <label for="max_capacity">Maximum Capacity:</label>
            <input type="number" id="max_capacity" name="max_capacity" required>

            <label for="presenter_deadline">Presenter's Abstract Submission Deadline:</label>
            <input type="datetime-local" id="presenter_deadline" name="presenter_deadline" required>

            <label for="event_type">Event Type:</label>
            <select id="event_type" name="event_type" required>
                <option value="">-- Select Event Type --</option>
                <?php
                // Retrieve event types from the database
                $event_type_sql = "SELECT Event_Type_ID, Type_Name FROM Event_Type";
                $event_type_result = $conn->query($event_type_sql);

                if ($event_type_result->num_rows > 0) {
                    while ($event_type_row = $event_type_result->fetch_assoc()) {
                        echo "<option value='" . $event_type_row['Event_Type_ID'] . "'>" . $event_type_row['Type_Name'] . "</option>";
                    }
                }
                ?>
            </select>

            <label for="university_id">University:</label>
            <select id="university_id" name="university_id" required>
                <option value="">-- Select University --</option>
                <?php
                // Retrieve universities from the database
                $university_sql = "SELECT U_ID, U_Name FROM U";
                $university_result = $conn->query($university_sql);

                if ($university_result->num_rows > 0) {
                    while ($university_row = $university_result->fetch_assoc()) {
                        echo "<option value='" . $university_row['U_ID'] . "'>" . $university_row['U_Name'] . "</option>";
                    }
                }
                ?>
            </select>

            <label for="venue">Venue:</label>
            <input type="text" id="venue" name="venue" required>

            <label for="street_address">Street Address:</label>
            <input type="text" id="street_address" name="street_address" required>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required>

            <label for="zip_code">ZIP Code:</label>
            <input type="text" id="zip_code" name="zip_code" required>

            <label for="is_published">Publish Event:</label>
            <input type="checkbox" id="is_published" name="is_published">

            <label for="publish_datetime">Publish Date & Time:</label>
            <input type="datetime-local" id="publish_datetime" name="publish_datetime">

            <button type="submit">Create Event</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
