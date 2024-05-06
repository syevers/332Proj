<?php
require_once 'db_connection.php';

session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_SESSION['user_id'];
    $event_id = $_POST['event_id'];

    if (isset($_POST['enroll'])) {
        // Enroll the user in the event
        enrollUser($conn, $user_id, $event_id);
    } elseif (isset($_POST['unenroll'])) {
        // Unenroll the user from the event
        unenrollUser($conn, $user_id, $event_id);
    }

    header("Location: events.php");
    exit();
}

function enrollUser($conn, $user_id, $event_id) {
    // Check if the event exists
    $check_event_sql = "SELECT * FROM `Event` WHERE Event_ID = $event_id";
    $check_event_result = $conn->query($check_event_sql);

    if ($check_event_result->num_rows == 1) {
        $event_row = $check_event_result->fetch_assoc();
        $max_capacity = $event_row['Max_Capacity'];
        $status = $event_row['Status'];

        // Check if the event is not full or cancelled
        if ($status != 'Full' && $status != 'Cancelled') {
            // Check if the user is already enrolled in the event
            $check_enrollment_sql = "SELECT * FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
            $check_enrollment_result = $conn->query($check_enrollment_sql);

            if ($check_enrollment_result->num_rows == 0) {
                // Get the current number of attendees for the event
                $attendee_count_sql = "SELECT COUNT(*) AS attendee_count FROM User_Event WHERE Event_ID = $event_id";
                $attendee_count_result = $conn->query($attendee_count_sql);
                $attendee_count_row = $attendee_count_result->fetch_assoc();
                $attendee_count = $attendee_count_row['attendee_count'];

                // Check if the event has reached its maximum capacity
                if ($attendee_count < $max_capacity) {
                    // Enroll the user in the event
                    $enroll_sql = "INSERT INTO User_Event (User_ID, Event_ID, Created_At) VALUES ($user_id, $event_id, NOW())";

                    if ($conn->query($enroll_sql) === TRUE) {
                        // Update the event status if the maximum capacity is reached
                        if ($attendee_count + 1 == $max_capacity) {
                            $update_status_sql = "UPDATE `Event` SET Status = 'Full' WHERE Event_ID = $event_id";
                            $conn->query($update_status_sql);
                        }

                        $_SESSION['enroll_success'] = "You have successfully enrolled in the event.";
                    } else {
                        $_SESSION['enroll_error'] = "Error enrolling in the event: " . $conn->error;
                    }
                } else {
                    $_SESSION['enroll_error'] = "The event has reached its maximum capacity. Enrollment failed.";
                }
            } else {
                $_SESSION['enroll_error'] = "You are already enrolled in this event.";
            }
        } else {
            $_SESSION['enroll_error'] = "The event is full or cancelled. Enrollment failed.";
        }
    } else {
        $_SESSION['enroll_error'] = "The event does not exist.";
    }
}

function unenrollUser($conn, $user_id, $event_id) {
    // Check if the user is enrolled in the event
    $check_enrollment_sql = "SELECT * FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
    $check_enrollment_result = $conn->query($check_enrollment_sql);

    if ($check_enrollment_result->num_rows > 0) {
        // Unenroll the user from the event
        $unenroll_sql = "DELETE FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";

        if ($conn->query($unenroll_sql) === TRUE) {
            // Update the event status if the event was full
            $update_status_sql = "UPDATE `Event` SET Status = 'Open' WHERE Event_ID = $event_id AND Status = 'Full'";
            $conn->query($update_status_sql);

            $_SESSION['unenroll_success'] = "You have successfully unenrolled from the event.";
        } else {
            $_SESSION['unenroll_error'] = "Error unenrolling from the event: " . $conn->error;
        }
    } else {
        $_SESSION['unenroll_error'] = "You are not enrolled in this event.";
    }
}
?>
