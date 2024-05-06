<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    echo "<pre>";
    print_r($_POST);
    echo "</pre>";
}
require_once 'db_connection.php';
require_once 'event_management.php';

// Create the views
$views = array(
    "CREATE OR REPLACE VIEW UsersWith10PlusEvents AS
     SELECT U.F_Name, U.LName, U.Email, U.Phone_Number
     FROM User U
     WHERE U.User_ID IN (
         SELECT UE.User_ID
         FROM User_Event UE
         GROUP BY UE.User_ID
         HAVING COUNT(*) > 10
     )",
    "CREATE OR REPLACE VIEW EventsWith100PlusAttendees AS
     SELECT E.*
     FROM `Event` E
     WHERE E.Event_ID IN (
         SELECT UE.Event_ID
         FROM User_Event UE
         GROUP BY UE.Event_ID
         HAVING COUNT(*) > 100
     )",
    "CREATE OR REPLACE VIEW ClosedOrCanceledEvents AS
     SELECT *
     FROM `Event`
     WHERE Status IN ('Full', 'Cancelled')"
);

// Execute the views
foreach ($views as $view) {
    if ($conn->query($view) !== TRUE) {
        echo "Error creating view: " . $conn->error . "<br>";
    }
}

// Check if the user is logged in
session_start();
$loggedIn = isset($_SESSION['user_id']);



// Get the current date
$currentDate = date('Y-m-d');
?>

<!DOCTYPE html>
<html>
<head>
    <title>Events - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<header>
    <h1>Academic Event Management</h1>
        <nav class="navbar">
            <ul class="navbar-left">
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="events.php">Events</a></li>
                <?php if (isset($_SESSION['user_id']) && $_SESSION['role'] === 'Organizer') : ?>
                    <li><a href="create_event.php">Create Event</a></li>
                    <li><a href="organizer_events.php">My Created Events</a></li>
                <?php endif; ?>
            </ul>

            <ul class="navbar-right">
                <?php if (isset($_SESSION['user_id'])) : ?>
                    <li><a href="logout.php">Logout</a></li>
                <?php else : ?>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="register.php">Register</a></li>
                <?php endif; ?>
            </ul>
        </nav>
</header>
    <main>
        <h2>Events</h2>
        <form action="events.php" method="POST">
            <label for="search_name">Search by Event Name:</label>
            <input type="text" id="search_name" name="search_name">
            <label for="view_select">Filter:</label>
            <select id="view_select" name="view_select">
                <option value="">-- Select a Filter --</option>
                <option value="UsersWith10PlusEvents">Users with 10+ Events</option>
                <option value="EventsWith100PlusAttendees">Events with 100+ Attendees</option>
                <option value="ClosedOrCanceledEvents">Closed or Canceled Events</option>
            </select>
            <button type="submit">Search/Filter</button>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $search_name = $_POST["search_name"];
            $selectedView = $_POST["view_select"];

            if (!empty($search_name) && !empty($selectedView)) {
                // Search events by name within the selected view
                $sql = "SELECT * FROM $selectedView WHERE Event_Name LIKE '%$search_name%'";
            } elseif (!empty($search_name)) {
                // Search events by name
                $sql = "SELECT * FROM `Event` WHERE Event_Name LIKE '%$search_name%'";
            } elseif (!empty($selectedView)) {
                // Filter events based on the selected view
                $sql = "SELECT * FROM $selectedView";
            } else {
                // Display all active events
                $sql = "SELECT E.*, L.Venue, L.Street_Address, L.City, L.State, L.Zip_Code, U.U_Name,
                               (SELECT COUNT(*) FROM User_Event UE WHERE UE.Event_ID = E.Event_ID) AS Attendee_Count
                        FROM `Event` E
                        INNER JOIN Location L ON E.Location_ID = L.Location_ID
                        INNER JOIN U ON E.U_ID = U.U_ID
                        WHERE E.Is_Published = TRUE AND E.Start_Date_Time > '$currentDate'";
            }

            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<h3>Results</h3>";
                while ($row = $result->fetch_assoc()) {
                    echo "<div class='event'>";
                    echo "<h4>" . $row["Event_Name"] . "</h4>";
                    echo "<p><strong>Description:</strong> " . $row["Description"] . "</p>";
                    echo "<p><strong>Start Date & Time:</strong> " . $row["Start_Date_Time"] . "</p>";
                    echo "<p><strong>End Date & Time:</strong> " . $row["End_Date_Time"] . "</p>";
                    echo "<p><strong>Maximum Capacity:</strong> " . $row["Max_Capacity"] . "</p>";
                    echo "<p><strong>Presenter's Abstract Submission Deadline:</strong> " . $row["Presenter_Deadline"] . "</p>";

                    // Retrieve presenters
                    $event_id = $row["Event_ID"];
                    $presenter_sql = "SELECT P.Presenter_Name 
                                      FROM Presenter P
                                      INNER JOIN Presenter_Event PE ON P.Presenter_ID = PE.Presenter_ID
                                      WHERE PE.Event_ID = $event_id";
                    $presenter_result = $conn->query($presenter_sql);
                    echo "<p><strong>Presenters:</strong></p>";
                    echo "<ul>";
                    while ($presenter_row = $presenter_result->fetch_assoc()) {
                        echo "<li>" .  $presenter_row["Presenter_Name"] . "</li>";
                    }
                    echo "</ul>";

                    // Retrieve keynote speakers
                    $speaker_sql = "SELECT S.Speaker_Name
                                    FROM Speaker S
                                    INNER JOIN Speaker_Event SE ON S.Speaker_ID = SE.Speaker_ID
                                    WHERE SE.Event_ID = $event_id";
                    $speaker_result = $conn->query($speaker_sql);
                    echo "<p><strong>Keynote Speakers:</strong></p>";
                    echo "<ul>";
                    while ($speaker_row = $speaker_result->fetch_assoc()) {
                        echo "<li>" . $speaker_row["Speaker_Name"] . "</li>";
                    }
                    echo "</ul>";

                    // Retrieve sponsors
                    $sponsor_sql = "SELECT S.Sponsor_Name
                                    FROM Sponsor S
                                    INNER JOIN Sponsor_Event SE ON S.Sponsor_ID = SE.Sponsor_ID
                                    WHERE SE.Event_ID = $event_id";
                    $sponsor_result = $conn->query($sponsor_sql);
                    echo "<p><strong>Sponsors:</strong></p>";
                    echo "<ul>";
                    while ($sponsor_row = $sponsor_result->fetch_assoc()) {
                        echo "<li>" . $sponsor_row["Sponsor_Name"] . "</li>";
                    }
                    echo "</ul>";

                    echo "<p><strong>Venue:</strong> " . $row["Venue"] . "</p>";
                    echo "<p><strong>University:</strong> " . $row["U_Name"] . "</p>";
                    echo "<p><strong>Physical Address:</strong><br>";
                    echo $row["Street_Address"] . "<br>";
                    echo $row["City"] . ", " . $row["State"] . " " . $row["Zip_Code"] . "</p>";
                    echo "<p><strong>Status:</strong> " . $row["Status"] . "</p>";
                    echo "<p><strong>Attendee Count:</strong> " . $row["Attendee_Count"] . "</p>";

                    if ($loggedIn) {
                        // Check if the user is already enrolled in the event
                        $user_id = $_SESSION['user_id'];
                        $check_enrollment_sql = "SELECT COUNT(*) AS enrolled FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
                        $check_enrollment_result = $conn->query($check_enrollment_sql);
                        $check_enrollment_row = $check_enrollment_result->fetch_assoc();
                        $enrolled = $check_enrollment_row['enrolled'];

                        if ($enrolled) {
                            echo "<p>You are already enrolled in this event.</p>";
                        } else {
                            echo "<form action='enroll_event.php' method='POST'>";
                            echo "<input type='hidden' name='event_id' value='$event_id'>";
                            echo "<button type='submit'>Enroll</button>";
                            echo "</form>";
                        }
                    }

                    echo "</div>";
                }
            } else {
                echo "<p>No events found.</p>";
            }
        } else {
            // Display all active events by default
            $sql = "SELECT E.*, L.Venue, L.Street_Address, L.City, L.State, L.Zip_Code, U.U_Name,
                           (SELECT COUNT(*) FROM User_Event UE WHERE UE.Event_ID = E.Event_ID) AS Attendee_Count
                    FROM `Event` E
                    INNER JOIN Location L ON E.Location_ID = L.Location_ID
                    INNER JOIN U ON E.U_ID = U.U_ID
                    WHERE E.Is_Published = TRUE AND E.Start_Date_Time > '$currentDate'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo "<h3>Active Events</h3>";
                while ($row = $result->fetch_assoc()) {
                    echo "<div class='event'>";
                    echo "<h4>" . $row["Event_Name"] . "</h4>";
                    echo "<p><strong>Description:</strong> " . $row["Description"] . "</p>";
                    echo "<p><strong>Start Date & Time:</strong> " . $row["Start_Date_Time"] . "</p>";
                    echo "<p><strong>End Date & Time:</strong> " . $row["End_Date_Time"] . "</p>";
                    echo "<p><strong>Maximum Capacity:</strong> " . $row["Max_Capacity"] . "</p>";
                    echo "<p><strong>Presenter's Abstract Submission Deadline:</strong> " . $row["Presenter_Deadline"] . "</p>";

                    // Retrieve presenters
                    $event_id = $row["Event_ID"];
                    $presenter_sql = "SELECT P.Presenter_Name 
                                      FROM Presenter P
                                      INNER JOIN Presenter_Event PE ON P.Presenter_ID = PE.Presenter_ID
                                      WHERE PE.Event_ID = $event_id";
                    $presenter_result = $conn->query($presenter_sql);
                    echo "<p><strong>Presenters:</strong></p>";
                    echo "<ul>";
                    while ($presenter_row = $presenter_result->fetch_assoc()) {
                        echo "<li>" . $presenter_row["Presenter_Name"] . "</li>";
                    }
                    echo "</ul>";

                    // Retrieve keynote speakers
                    $speaker_sql = "SELECT S.Speaker_Name
                                    FROM Speaker S
                                    INNER JOIN Speaker_Event SE ON S.Speaker_ID = SE.Speaker_ID
                                    WHERE SE.Event_ID = $event_id";
                    $speaker_result = $conn->query($speaker_sql);
                    echo "<p><strong>Keynote Speakers:</strong></p>";
                    echo "<ul>";
                    while ($speaker_row = $speaker_result->fetch_assoc()) {
                        echo "<li>" . $speaker_row["Speaker_Name"] . "</li>";
                    }
                    echo "</ul>";

                    // Retrieve sponsors
                    $sponsor_sql = "SELECT S.Sponsor_Name
                                    FROM Sponsor S
                                    INNER JOIN Sponsor_Event SE ON S.Sponsor_ID = SE.Sponsor_ID
                                    WHERE SE.Event_ID = $event_id";
                    $sponsor_result = $conn->query($sponsor_sql);
                    echo "<p><strong>Sponsors:</strong></p>";
                    echo "<ul>";
                    while ($sponsor_row = $sponsor_result->fetch_assoc()) {
                        echo "<li>" . $sponsor_row["Sponsor_Name"] . "</li>";
                    }
                    echo "</ul>";

                    echo "<p><strong>Venue:</strong> " . $row["Venue"] . "</p>";
                    echo "<p><strong>University:</strong> " . $row["U_Name"] . "</p>";
                    echo "<p><strong>Physical Address:</strong><br>";
                    echo $row["Street_Address"] . "<br>";
                    echo $row["City"] . ", " . $row["State"] . " " . $row["Zip_Code"] . "</p>";
                    echo "<p><strong>Status:</strong> " . $row["Status"] . "</p>";
                    echo "<p><strong>Attendee Count:</strong> " . $row["Attendee_Count"] . "</p>";


            if ($loggedIn) {
                // Check if the user is already enrolled in the event
                $user_id = $_SESSION['user_id'];
                $check_enrollment_sql = "SELECT COUNT(*) AS enrolled FROM User_Event WHERE User_ID = $user_id AND Event_ID = $event_id";
                $check_enrollment_result = $conn->query($check_enrollment_sql);
                $check_enrollment_row = $check_enrollment_result->fetch_assoc();
                $enrolled = $check_enrollment_row['enrolled'];

                if ($enrolled) {
                    echo "<form action='enroll_event.php' method='POST'>";
                    echo "<input type='hidden' name='event_id' value='$event_id'>";
                    echo "<button type='submit' name='unenroll'>Unenroll</button>";
                    echo "</form>";
                } else {
                    echo "<form action='enroll_event.php' method='POST'>";
                    echo "<input type='hidden' name='event_id' value='$event_id'>";
                    echo "<button type='submit' name='enroll'>Enroll</button>";
                    echo "</form>";
                }
            }                    echo "</div>";
                }
            } else {
                echo "<p>No active events found.</p>";
            }
        }
        ?>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
