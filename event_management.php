<?php
require_once 'db_connection.php';

function getEventTypes($conn) {
    $sql = "SELECT * FROM Event_Type";
    $result = $conn->query($sql);
    return $result;
}

function getUniversities($conn) {
    $sql = "SELECT * FROM U";
    $result = $conn->query($sql);
    return $result;
}

function searchEvents($conn, $search_name, $event_type, $university, $start_date) {
    $sql = "SELECT E.*, L.Venue, L.Street_Address, L.City, L.State, L.Zip_Code, U.U_Name, 
                (SELECT COUNT(*) FROM User_Event UE WHERE UE.Event_ID = E.Event_ID) AS Attendee_Count
            FROM `Event` E
            JOIN Location L ON E.Location_ID = L.Location_ID
            JOIN U ON E.U_ID = U.U_ID
            WHERE E.Is_Published = TRUE";

    if (!empty($search_name)) {
        $sql .= " AND E.Event_Name LIKE '%$search_name%'";
    }

    if (!empty($event_type)) {
        $sql .= " AND E.Event_Type_ID = $event_type";
    }

    if (!empty($university)) {
        $sql .= " AND E.U_ID = $university";
    }

    if (!empty($start_date)) {
        $sql .= " AND DATE(E.Start_Date_Time) = '$start_date'";
    }

    $result = $conn->query($sql);
    return $result;
}

function getEventTypeName($conn, $event_type_id) {
    $sql = "SELECT Type_Name FROM Event_Type WHERE Event_Type_ID = $event_type_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['Type_Name'];
    } else {
        return '';
    }
}

function isUserEnrolled($conn, $user_id, $event_id) {
    $sql = "SELECT * FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
    $result = $conn->query($sql);
    return $result->num_rows > 0;
}

function getAttendeeCount($conn, $event_id) {
    $sql = "SELECT COUNT(*) AS attendee_count FROM User_Event WHERE Event_ID = $event_id";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    return $row['attendee_count'];
}

function getEventPresenters($conn, $event_id) {
    $sql = "SELECT p.Presenter_Name
            FROM Presenter p
            JOIN Presenter_Event pe ON p.Presenter_ID = pe.Presenter_ID
            WHERE pe.Event_ID = $event_id";
    $result = $conn->query($sql);
    return $result;
}

function getEventSpeakers($conn, $event_id) {
    $sql = "SELECT s.Speaker_Name
            FROM Speaker s
            JOIN Speaker_Event se ON s.Speaker_ID = se.Speaker_ID
            WHERE se.Event_ID = $event_id";
    $result = $conn->query($sql);
    return $result;
}

function getEventSponsors($conn, $event_id) {
    $sql = "SELECT s.Sponsor_Name
            FROM Sponsor s
            JOIN Sponsor_Event se ON s.Sponsor_ID = se.Sponsor_ID
            WHERE se.Event_ID = $event_id";
    $result = $conn->query($sql);
    return $result;
}
?>
