<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $event_id = $_POST["event_id"];
    $status = $_POST["status"];

    // Update the event status
    $sql = "UPDATE `Event` SET Status = '$status' WHERE Event_ID = $event_id";
    if ($conn->query($sql) === TRUE) {
        $success = "Event status updated successfully.";
    } else {
        $error = "Error updating event status: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Update Event Status - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="event_create.php">Create Event</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Update Event Status</h2>
        <?php if (isset($error)) { ?>
            <p class="error"><?php echo $error; ?></p>
        <?php } ?>
        <?php if (isset($success)) { ?>
            <p class="success"><?php echo $success; ?></p>
        <?php } ?>
        <form action="event_status_update.php" method="POST">
            <label for="event_id">Event ID:</label>
            <input type="number" id="event_id" name="event_id" required>

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Open">Open</option>
                <option value="Full">Full</option>
                <option value="Cancelled">Cancelled</option>
            </select>

            <button type="submit">Update Status</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2023 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
