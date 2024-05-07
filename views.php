<?php
require_once 'db_connection.php';

function getUsersWith10PlusEvents($conn) {
    $sql = "SELECT U.F_Name, U.LName, U.Email, U.Phone_Number
            FROM User U
            WHERE U.User_ID IN (
                SELECT E.U_ID
                FROM `Event` E
                GROUP BY E.U_ID
                HAVING COUNT(*) > 10
            )";
    $result = $conn->query($sql);
    return $result;
}

function getEventsWith100PlusAttendees($conn) {
    $sql = "SELECT E.*, ET.Type_Name, L.Venue, L.Street_Address, L.City, L.State, L.Zip_Code, U.U_Name, 
                (SELECT COUNT(*) FROM User_Event UE WHERE UE.Event_ID = E.Event_ID) AS Attendee_Count
            FROM `Event` E
            JOIN Event_Type ET ON E.Event_Type_ID = ET.Event_Type_ID
            JOIN Location L ON E.Location_ID = L.Location_ID
            JOIN U ON E.U_ID = U.U_ID
            WHERE E.Event_ID IN (
                SELECT UE.Event_ID
                FROM User_Event UE
                GROUP BY UE.Event_ID
                HAVING COUNT(*) > 100
            )";
    $result = $conn->query($sql);
    return $result;
}

function getClosedOrCanceledEvents($conn) {
    $sql = "SELECT E.*, ET.Type_Name, L.Venue, L.Street_Address, L.City, L.State, L.Zip_Code, U.U_Name, 
                (SELECT COUNT(*) FROM User_Event UE WHERE UE.Event_ID = E.Event_ID) AS Attendee_Count
            FROM `Event` E
            JOIN Event_Type ET ON E.Event_Type_ID = ET.Event_Type_ID
            JOIN Location L ON E.Location_ID = L.Location_ID
            JOIN U ON E.U_ID = U.U_ID
            WHERE E.Status = 'Cancelled' OR E.Status = 'Closed' OR E.Status = 'Full'";
    $result = $conn->query($sql);
    return $result;
}
