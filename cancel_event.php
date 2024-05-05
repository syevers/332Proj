<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $event_id = $_POST["event_id"];

    // Cancel the event by updating its status
    $sql = "UPDATE `Event` SET Is_Published = 0 WHERE Event_ID = $event_id";

    if ($conn->query($sql) === TRUE) {
        echo "Event canceled successfully.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
$conn->close();
?>
