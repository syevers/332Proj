<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $user_id = $_POST["user_id"];
    $event_id = $_POST["event_id"];

    // Check if the user is already enrolled in the event
    $sql = "SELECT * FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
    $result = $conn->query($sql);

    if ($result->num_rows == 0) {
        // Check if the event has reached maximum capacity
        $sql = "SELECT COUNT(*) AS attendee_count FROM User_Event WHERE Event_ID = $event_id";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $attendee_count = $row["attendee_count"];

        $sql = "SELECT Max_Capacity FROM `Event` WHERE Event_ID = $event_id";
        $result = $conn->query($sql);
        $row = $result->fetch_assoc();
        $max_capacity = $row["Max_Capacity"];

        if ($attendee_count < $max_capacity) {
            // Enroll the user in the event
            $sql = "INSERT INTO User_Event (User_ID, Event_ID, Created_At) VALUES ($user_id, $event_id, NOW())";
            if ($conn->query($sql) === TRUE) {
                echo "User enrolled in the event successfully.";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        } else {
            echo "Event has reached maximum capacity. Enrollment failed.";
        }
    } else {
        echo "User is already enrolled in the event.";
    }
}
$conn->close();
?>
