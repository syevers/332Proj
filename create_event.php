<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $event_name = $_POST["event_name"];
    $description = $_POST["description"];
    $start_datetime = $_POST["start_datetime"];
    $end_datetime = $_POST["end_datetime"];
    $max_capacity = $_POST["max_capacity"];
    $presenter_deadline = $_POST["presenter_deadline"];
    $venue = $_POST["venue"];
    $university_id = $_POST["university_id"];
    $is_published = isset($_POST["is_published"]) ? 1 : 0;
    $publish_datetime = $_POST["publish_datetime"];

    // Insert event into the database
    $sql = "INSERT INTO `Event` (Event_Name, Description, Start_Date_Time, End_Date_Time, Max_Capacity, Presenter_Deadline, U_ID, Is_Published, F_Date_Time, Created_At)
        VALUES ('$event_name', '$description', '$start_datetime', '$end_datetime', $max_capacity, '$presenter_deadline', $university_id, $is_published, '$publish_datetime', NOW())";
    if ($conn->query($sql) === TRUE) {
        $success = "Event created successfully.";
    } else {
        $error = "Error: " . $sql . "<br>" . $conn->error;
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
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="create_event.php">Create Event</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Create Event</h2>
        <?php if (isset($error)) { ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php } ?>
        <?php if (isset($success)) { ?>
            <p style="color: green;"><?php echo $success; ?></p>
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

            <label for="presenter_deadline">Presenter's Submission Deadline:</label>
            <input type="datetime-local" id="presenter_deadline" name="presenter_deadline" required>

            <label for="venue">Venue:</label>
            <input type="text" id="venue" name="venue" required>

            <label for="university_id">University:</label>
            <select id="university_id" name="university_id" required>
                <!-- Populate university options from the database -->
                <?php
                $sql = "SELECT U_ID, U_Name FROM U";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<option value='" . $row["U_ID"] . "'>" . $row["U_Name"] . "</option>";
                    }
                }
                ?>
            </select>

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
