<?php
require_once 'db_connection.php';
function getActiveEvents($conn) {
    $sql = "SELECT * FROM `Event` WHERE Is_Published = TRUE";
    $result = $conn->query($sql);
    return $result;
}

function searchEventsByName($conn, $search_name) {
    $sql = "SELECT * FROM `Event` WHERE Event_Name LIKE '%$search_name%'";
    $result = $conn->query($sql);
    return $result;
}
?>
