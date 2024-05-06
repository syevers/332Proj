<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $event_id = $_POST["event_id"];
    $event_name = $_POST["event_name"];
    $description = $_POST["description"];
    $start_datetime = $_POST["start_datetime"];
    $end_datetime = $_POST["end_datetime"];
    $max_capacity = $_POST["max_capacity"];
    $presenter_deadline = $_POST["presenter_deadline"];
    $venue = $_POST["venue"];
    $is_published = isset($_POST["is_published"]) ? 1 : 0;
    $publish_datetime = $_POST["publish_datetime"];

    // Update event in the database
    $sql = "UPDATE `Event`
            SET Event_Name = '$event_name',
                Description = '$description',
                Start_Date_Time = '$start_datetime',
                End_Date_Time = '$end_datetime',
                Max_Capacity = $max_capacity,
                Presenter_Deadline = '$presenter_deadline',
                Venue = '$venue',
                Is_Published = $is_published,
                F_Date_Time = '$publish_datetime'
            WHERE Event_ID = $event_id";

    if ($conn->query($sql) === TRUE) {
        $success = "Event updated successfully.";
    } else {
        $error = "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Retrieve event details from the database
if (isset($_GET["event_id"])) {
    $event_id = $_GET["event_id"];

    $sql = "SELECT * FROM `Event` WHERE Event_ID = $event_id";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $event_name = $row["Event_Name"];
        $description = $row["Description"];
        $start_datetime = $row["Start_Date_Time"];
        $end_datetime = $row["End_Date_Time"];
        $max_capacity = $row["Max_Capacity"];
        $presenter_deadline = $row["Presenter_Deadline"];
        $venue = $row["Venue"];
        $is_published = $row["Is_Published"];
        $publish_datetime = $row["F_Date_Time"];
    } else {
        $error = "Event not found.";
    }
} else {
    $error = "Event ID not provided.";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Event - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
            <nav class="navbar">
                <ul class="navbar-left">
                    <li><a href="dashboard.php">Dashboard</a></li>
                    <li><a href="create_event.php">Create Event</a></li>
                </ul>

                <ul class="navbar-right">
                    <li><a href="logout.php">Logout</a></li>
                </ul>
            </nav>
    </header>

    <main>
        <h2>Update Event</h2>
        <?php if (isset($error)) { ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php } ?>
        <?php if (isset($success)) { ?>
            <p style="color: green;"><?php echo $success; ?></p>
        <?php } ?>
        <?php if (isset($event_id)) { ?>
            <form action="event_update.php" method="POST">
                <input type="hidden" name="event_id" value="<?php echo $event_id; ?>">

                <label for="event_name">Event Name:</label>
                <input type="text" id="event_name" name="event_name" value="<?php echo $event_name; ?>" required>

                <label for="description">Description:</label>
                <textarea id="description" name="description" required><?php echo $description; ?></textarea>

                <label for="start_datetime">Start Date & Time:</label>
                <input type="datetime-local" id="start_datetime" name="start_datetime" value="<?php echo $start_datetime; ?>" required>

                <label for="end_datetime">End Date & Time:</label>
                <input type="datetime-local" id="end_datetime" name="end_datetime" value="<?php echo $end_datetime; ?>" required>

                <label for="max_capacity">Maximum Capacity:</label>
                <input type="number" id="max_capacity" name="max_capacity" value="<?php echo $max_capacity; ?>" required>

                <label for="presenter_deadline">Presenter's Abstract Submission Deadline:</label>
                <input type="datetime-local" id="presenter_deadline" name="presenter_deadline" value="<?php echo $presenter_deadline; ?>" required>

                <label for="venue">Venue:</label>
                <input type="text" id="venue" name="venue" value="<?php echo $venue; ?>" required>

                <label for="is_published">Publish Event:</label>
                <input type="checkbox" id="is_published" name="is_published" <?php if ($is_published) echo "checked"; ?>>

                <label for="publish_datetime">Publish Date & Time:</label>
                <input type="datetime-local" id="publish_datetime" name="publish_datetime" value="<?php echo $publish_datetime; ?>">

                <button type="submit">Update Event</button>
            </form>
        <?php } ?>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
