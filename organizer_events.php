<?php
require_once 'db_connection.php';

session_start();

// Check if the user is logged in and has the organizer role
if (!isset($_SESSION["user_id"]) || $_SESSION["role"] !== 'Organizer') {
    header("Location: login.php");
    exit();
}

$organizer_id = $_SESSION["user_id"];

// Handle form submission for publishing/unpublishing events
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["publish"])) {
        $event_id = $_POST["event_id"];
        $publish_status = $_POST["publish_status"];

        // Update the event's publish status
        $update_sql = "UPDATE `Event` SET Is_Published = $publish_status WHERE Event_ID = $event_id AND U_ID = $organizer_id";
        if ($conn->query($update_sql) === TRUE) {
            // Redirect to the organizer events page to reflect the changes
            header("Location: organizer_events.php");
            exit();
        } else {
            echo "Error updating event: " . $conn->error;
        }
    }
}

// Retrieve all events created by the organizer
$sql = "SELECT * FROM `Event` WHERE U_ID = $organizer_id";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Organizer Events - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
            <nav class="navbar">
                <ul class="navbar-left">
                    <li><a href="dashboard.php">Dashboard</a></li>
                    <li><a href="events.php">View All Events</a></li>
                    <li><a href="create_event.php">Create Event</a></li>
                    <li><a href="organizer_events.php">My Created Events</a></li>
                </ul>

                <ul class="navbar-right">
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </nav>

    </header>

    <main>
        <h2>Organizer Events</h2>

        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $event_id = $row["Event_ID"];
                $event_name = $row["Event_Name"];
                $is_published = $row["Is_Published"];

                echo "<div class='event'>";
                echo "<h4>$event_name</h4>";
                echo "<p><strong>Published:</strong> " . ($is_published ? "Yes" : "No") . "</p>";

                echo "<form action='organizer_events.php' method='POST'>";
                echo "<input type='hidden' name='event_id' value='$event_id'>";
                echo "<input type='hidden' name='publish_status' value='" . ($is_published ? '0' : '1') . "'>";
                echo "<button type='submit' name='publish'>" . ($is_published ? 'Unpublish' : 'Publish') . "</button>";
                echo "</form>";

                echo "<p><a href='edit_event.php?event_id=$event_id'>Edit Event</a></p>";

                echo "</div>";
            }
        } else {
            echo "<p>No events found.</p>";
        }
        ?>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
