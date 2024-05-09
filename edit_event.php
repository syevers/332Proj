<?php
require_once 'db_connection.php';

session_start();

// Check if the user is logged in and has the organizer role
if (!isset($_SESSION["user_id"]) || $_SESSION["role"] !== 'Organizer') {
    header("Location: login.php");
    exit();
}

$organizer_id = $_SESSION["user_id"];
$event_id = $_GET["event_id"];

// Retrieve the event details
$sql = "SELECT * FROM `Event` WHERE Event_ID = $event_id AND U_ID = $organizer_id";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    $event = $result->fetch_assoc();
} else {
    header("Location: organizer_events.php");
    exit();
}

// Handle form submission for updating the event
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $event_name = $_POST["event_name"];
    $description = $_POST["description"];
    $start_datetime = $_POST["start_datetime"];
    $end_datetime = $_POST["end_datetime"];
    $max_capacity = $_POST["max_capacity"];
    $presenter_deadline = $_POST["presenter_deadline"];
    $event_type = $_POST["event_type"];
    $is_published = isset($_POST["is_published"]) ? 1 : 0;
    $publish_datetime = $_POST["publish_datetime"];
    $is_canceled = isset($_POST["is_canceled"]) ? 'Cancelled' : 'Open';
    
    // Retrieve location details
    $venue = $_POST["venue"];
    $street_address = $_POST["street_address"];
    $city = $_POST["city"];
    $state = $_POST["state"];
    $zip_code = $_POST["zip_code"];

    if (isset($_POST["delete_event"])) {
        // Delete associated records from user_event table
        $delete_user_event_sql = "DELETE FROM User_Event WHERE Event_ID = $event_id";
        if ($conn->query($delete_user_event_sql) === TRUE) {
            // Delete associated records from presenter_event table
            $delete_presenter_event_sql = "DELETE FROM Presenter_Event WHERE Event_ID = $event_id";
            if ($conn->query($delete_presenter_event_sql) === TRUE) {
                // Delete associated records from speaker_event table
                $delete_speaker_event_sql = "DELETE FROM Speaker_Event WHERE Event_ID = $event_id";
                if ($conn->query($delete_speaker_event_sql) === TRUE) {
                    // Delete associated records from sponsor_event table
                    $delete_sponsor_event_sql = "DELETE FROM Sponsor_Event WHERE Event_ID = $event_id";
                    if ($conn->query($delete_sponsor_event_sql) === TRUE) {
                        // Delete the event from the database
                        $delete_sql = "DELETE FROM `Event` WHERE Event_ID = $event_id AND U_ID = $organizer_id";
                        if ($conn->query($delete_sql) === TRUE) {
                            $_SESSION['success'] = "Event deleted successfully.";
                            header("Location: organizer_events.php");
                            exit();
                        } else {
                            $error = "Error deleting event: " . $conn->error;
                        }
                    } else {
                        $error = "Error deleting associated sponsor records: " . $conn->error;
                    }
                } else {
                    $error = "Error deleting associated speaker records: " . $conn->error;
                }
            } else {
                $error = "Error deleting associated presenter records: " . $conn->error;
            }
        } else {
            $error = "Error deleting associated user records: " . $conn->error;
        }
    }
    // Update the location in the database
    $location_sql = "UPDATE Location 
                     SET Venue = '$venue', Street_Address = '$street_address', City = '$city', State = '$state', Zip_Code = '$zip_code'
                     WHERE Location_ID = {$event['Location_ID']}";
    if ($conn->query($location_sql) === TRUE) {
        // Update the event in the database
        $update_sql = "UPDATE `Event`
                       SET Event_Name = '$event_name', Description = '$description', Start_Date_Time = '$start_datetime', End_Date_Time = '$end_datetime',
                           Max_Capacity = $max_capacity, Presenter_Deadline = '$presenter_deadline', Event_Type_ID = $event_type,
                           Is_Published = $is_published, F_Date_Time = '$publish_datetime', Status = '$is_canceled'
                       WHERE Event_ID = $event_id AND U_ID = $organizer_id";

        if ($conn->query($update_sql) === TRUE) {
            $_SESSION['success'] = "Event updated successfully.";
            header("Location: organizer_events.php");
            exit();
        } else {
            $error = "Error updating event: " . $conn->error;
        }
    } else {
        $error = "Error updating location: " . $conn->error;
    }
}



?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Event - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="events.php">Events</a></li>
                <li><a href="organizer_events.php">My Created Events</a></li>
                <li><a href="create_event.php">Create Event</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Edit Event</h2>
        <?php if (isset($error)) { ?>
            <p class="error"><?php echo $error; ?></p>
        <?php } ?>
        <form action="edit_event.php?event_id=<?php echo $event_id; ?>" method="POST">
            <label for="event_name">Event Name:</label>
            <input type="text" id="event_name" name="event_name" value="<?php echo $event['Event_Name']; ?>" required>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required><?php echo $event['Description']; ?></textarea>

            <label for="start_datetime">Start Date & Time:</label>
            <input type="datetime-local" id="start_datetime" name="start_datetime" value="<?php echo $event['Start_Date_Time']; ?>" required>

            <label for="end_datetime">End Date & Time:</label>
            <input type="datetime-local" id="end_datetime" name="end_datetime" value="<?php echo $event['End_Date_Time']; ?>" required>

            <label for="max_capacity">Maximum Capacity:</label>
            <input type="number" id="max_capacity" name="max_capacity" value="<?php echo $event['Max_Capacity']; ?>" required>

            <label for="presenter_deadline">Presenter's Abstract Submission Deadline:</label>
            <input type="datetime-local" id="presenter_deadline" name="presenter_deadline" value="<?php echo $event['Presenter_Deadline']; ?>" required>

            <label for="event_type">Event Type:</label>
            <select id="event_type" name="event_type" required>
                <option value="">-- Select Event Type --</option>
                <?php
                // Retrieve event types from the database
                $event_type_sql = "SELECT Event_Type_ID, Type_Name FROM Event_Type";
                $event_type_result = $conn->query($event_type_sql);

                if ($event_type_result->num_rows > 0) {
                    while ($event_type_row = $event_type_result->fetch_assoc()) {
                        $selected = ($event_type_row['Event_Type_ID'] == $event['Event_Type_ID']) ? 'selected' : '';
                        echo "<option value='" . $event_type_row['Event_Type_ID'] . "' $selected>" . $event_type_row['Type_Name'] . "</option>";
                    }
                }
                ?>
            </select>

            <?php
            // Retrieve location details
            $location_sql = "SELECT * FROM Location WHERE Location_ID = {$event['Location_ID']}";
            $location_result = $conn->query($location_sql);
            $location = $location_result->fetch_assoc();
            ?>

            <label for="venue">Venue:</label>
            <input type="text" id="venue" name="venue" value="<?php echo $location['Venue']; ?>" required>

            <label for="street_address">Street Address:</label>
            <input type="text" id="street_address" name="street_address" value="<?php echo $location['Street_Address']; ?>" required>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" value="<?php echo $location['City']; ?>" required>

            <label for="state">State:</label>
            <input type="text" id="state" name="state" value="<?php echo $location['State']; ?>" required>

            <label for="zip_code">ZIP Code:</label>
            <input type="text" id="zip_code" name="zip_code" value="<?php echo $location['Zip_Code']; ?>" required>

            <label for="is_published">Publish Event:
            <input type="checkbox" id="is_published" name="is_published" <?php if ($event['Is_Published']) echo 'checked'; ?>></label>

            <label for="publish_datetime">Publish Date & Time:</label>
            <input type="datetime-local" id="publish_datetime" name="publish_datetime" value="<?php echo $event['F_Date_Time']; ?>">

            <h4>
            <label for="is_canceled">Cancel Event:
            <input type="checkbox" id="is_canceled" name="is_canceled" <?php if ($event['Status'] == 'Cancelled') echo 'checked'; ?>></label></h4>

            <button type="submit">Update Event</button>

            <button id="button-delete" type="submit" name="delete_event">Delete Event</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
