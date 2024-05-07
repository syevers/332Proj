<?php
require_once 'db_connection.php';

function getUsersWith10PlusEvents($conn) {
    $sql = "SELECT * FROM UsersWith10PlusEvents";
    $result = $conn->query($sql);
    return $result;
}

function getEventsWith100PlusAttendees($conn) {
    $sql = "SELECT * FROM EventsWith100PlusAttendees";
    $result = $conn->query($sql);
    return $result;
}

function getClosedOrCanceledEvents($conn) {
    $sql = "SELECT * FROM ClosedOrCanceledEvents";
    $result = $conn->query($sql);
    return $result;
}
?>
