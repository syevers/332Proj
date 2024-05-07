<?php
require_once 'db_connection.php';
require_once 'event_management.php';
require_once 'views.php';

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $search_name = $_POST["search_name"];
    $event_type = $_POST["event_type"];
    $university = $_POST["university"];
    $start_date = $_POST["start_date"];
    $view_filter = $_POST["view_filter"];
} else {
    $search_name = "";
    $event_type = "";
    $university = "";
    $start_date = "";
    $view_filter = "";
}
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
        <div class="wrapper">
        <form action="events.php" method="POST">
            <input type="text" name="search_name" placeholder="Search events by name" value="<?php echo $search_name; ?>">
            <select name="event_type">
                <option value="">All Event Types</option>
                <?php
                $event_types = getEventTypes($conn);
                while ($type = $event_types->fetch_assoc()) {
                    $selected = ($event_type == $type['Event_Type_ID']) ? 'selected' : '';
                    echo "<option value='" . $type['Event_Type_ID'] . "' $selected>" . $type['Type_Name'] . "</option>";
                }
                ?>
            </select>
            <select name="university">
                <option value="">All Universities</option>
                <?php
                $universities = getUniversities($conn);
                while ($uni = $universities->fetch_assoc()) {
                    $selected = ($university == $uni['U_ID']) ? 'selected' : '';
                    echo "<option value='" . $uni['U_ID'] . "' $selected>" . $uni['U_Name'] . "</option>";
                }
                ?>
            </select>
            <select name="view_filter">
                <option value="">Additional Filters</option>
                <option value="users_with_10_plus_events" <?php if ($view_filter == 'users_with_10_plus_events') echo 'selected'; ?>>Users who create 10+ Events</option>
                <option value="events_with_100_plus_attendees" <?php if ($view_filter == 'events_with_100_plus_attendees') echo 'selected'; ?>>Events with 100+ Attendees</option>
                <option value="closed_or_canceled_events" <?php if ($view_filter == 'closed_or_canceled_events') echo 'selected'; ?>>Closed or Canceled Events</option>
            </select>
            <p>Search by Date</p>
            <input type="date" name="start_date" value="<?php echo $start_date; ?>">
            <p><br><button type="submit">Search</button></br></p>
        </form>

        <?php
        if ($view_filter == 'users_with_10_plus_events') {
            $search_result = getUsersWith10PlusEvents($conn);
            if ($search_result->num_rows > 0) {
                echo "<h3>Users who create 10+ Events</h3>";
                echo "<table>";
                echo "<tr><th>First Name</th><th>Last Name</th><th>Email</th><th>Phone Number</th></tr>";
                while ($row = $search_result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row['F_Name'] . "</td>";
                    echo "<td>" . $row['LName'] . "</td>";
                    echo "<td>" . $row['Email'] . "</td>";
                    echo "<td>" . $row['Phone_Number'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
            } else {
                echo "<p>No users found who create 10+ events.</p>";
            }
        } elseif ($view_filter == 'events_with_100_plus_attendees') {
                $search_result = getEventsWith100PlusAttendees($conn);
                if ($search_result->num_rows > 0) {
                    echo "<h3>Events with 100+ Attendees</h3>";
                    while ($event = $search_result->fetch_assoc()) {                    
                        echo "<div class='event'>";
                        echo "<h4>" . $event['Event_Name'] . "</h4>";
                        echo "<p><strong>Event Type:</strong> " . getEventTypeName($conn, $event['Event_Type_ID']) . "</p>";
                        echo "<p><strong>Description:</strong> " . $event['Description'] . "</p>";
                        echo "<p><strong>Start Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['Start_Date_Time'])) . "</p>";
                        echo "<p><strong>End Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['End_Date_Time'])) . "</p>";
                        echo "<p><strong>Maximum Capacity:</strong> " . $event['Max_Capacity'] . "</p>";
                        echo "<p><strong>Presenter's Abstract Submission Deadline:</strong> " . date('m/d/Y h:i A', strtotime($event['Presenter_Deadline'])) . "</p>";
                        echo "<p><strong>Venue:</strong> " . $event['Venue'] . "</p>";
                        echo "<p><strong>University:</strong> " . $event['U_Name'] . "</p>";
                        echo "<p><strong>Physical Address:</strong> " . $event['Street_Address'] . ", " . $event['City'] . ", " . $event['State'] . " " . $event['Zip_Code'] . "</p>";

                        echo "<p><strong>Presenters:</strong></p>";
                        echo "<ul>";
                        $presenters = getEventPresenters($conn, $event['Event_ID']);
                        while ($presenter = $presenters->fetch_assoc()) {
                            echo "<li>" . $presenter['Presenter_Name'] . "</li>";
                        }
                        echo "</ul>";

                        echo "<p><strong>Keynote Speakers:</strong></p>";
                        echo "<ul>";
                        $speakers = getEventSpeakers($conn, $event['Event_ID']);
                        while ($speaker = $speakers->fetch_assoc()) {
                            echo "<li>" . $speaker['Speaker_Name'] . "</li>";
                        }
                        echo "</ul>";

                        echo "<p><strong>Sponsors:</strong></p>";
                        echo "<ul>";
                        $sponsors = getEventSponsors($conn, $event['Event_ID']);
                        while ($sponsor = $sponsors->fetch_assoc()) {
                            echo "<li>" . $sponsor['Sponsor_Name'] . "</li>";
                        }
                        echo "</ul>";

                        echo "<p><strong>Attendee Count:</strong> " . $event['Attendee_Count'] . "</p>";
                        echo "<p><strong>Status:</strong> " . $event['Status'] . "</p>";

                        if ($event['Status'] == 'Cancelled') {
                            echo "<p style='color: red;'><strong>This event is cancelled. Enrollment is not available.</strong></p>";
                        } elseif ($event['Status'] == 'Full') {
                            echo "<p style='color: red;'><strong>This event is full. Enrollment is not available.</strong></p>";
                        } elseif ($event['Status'] == 'Closed') {
                            echo "<p style='color: red;'><strong>This event is closed. Enrollment is not available.</strong></p>";
                        }

                        echo "</div>";
                    }

            } else {
                echo "<p>No events found with 100+ attendees.</p>";
            }

        } elseif ($view_filter == 'closed_or_canceled_events') {
            $search_result = getClosedOrCanceledEvents($conn);
            if ($search_result->num_rows > 0) {
                echo "<h3>Closed or Canceled Events</h3>";
                while ($event = $search_result->fetch_assoc()) {
                    echo "<div class='event'>";
                    echo "<h4>" . $event['Event_Name'] . "</h4>";
                    echo "<p><strong>Event Type:</strong> " . getEventTypeName($conn, $event['Event_Type_ID']) . "</p>";
                    echo "<p><strong>Description:</strong> " . $event['Description'] . "</p>";
                    echo "<p><strong>Start Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['Start_Date_Time'])) . "</p>";
                    echo "<p><strong>End Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['End_Date_Time'])) . "</p>";
                    echo "<p><strong>Maximum Capacity:</strong> " . $event['Max_Capacity'] . "</p>";
                    echo "<p><strong>Presenter's Abstract Submission Deadline:</strong> " . date('m/d/Y h:i A', strtotime($event['Presenter_Deadline'])) . "</p>";
                    echo "<p><strong>Venue:</strong> " . $event['Venue'] . "</p>";
                    echo "<p><strong>University:</strong> " . $event['U_Name'] . "</p>";
                    echo "<p><strong>Physical Address:</strong> " . $event['Street_Address'] . ", " . $event['City'] . ", " . $event['State'] . " " . $event['Zip_Code'] . "</p>";

                    echo "<p><strong>Presenters:</strong></p>";
                    echo "<ul>";
                    $presenters = getEventPresenters($conn, $event['Event_ID']);
                    while ($presenter = $presenters->fetch_assoc()) {
                        echo "<li>" . $presenter['Presenter_Name'] . "</li>";
                    }
                    echo "</ul>";

                    echo "<p><strong>Keynote Speakers:</strong></p>";
                    echo "<ul>";
                    $speakers = getEventSpeakers($conn, $event['Event_ID']);
                    while ($speaker = $speakers->fetch_assoc()) {
                        echo "<li>" . $speaker['Speaker_Name'] . "</li>";
                    }
                    echo "</ul>";

                    echo "<p><strong>Sponsors:</strong></p>";
                    echo "<ul>";
                    $sponsors = getEventSponsors($conn, $event['Event_ID']);
                    while ($sponsor = $sponsors->fetch_assoc()) {
                        echo "<li>" . $sponsor['Sponsor_Name'] . "</li>";
                    }
                    echo "</ul>";

                    echo "<p><strong>Attendee Count:</strong> " . $event['Attendee_Count'] . "</p>";
                    echo "<p><strong>Status:</strong> " . $event['Status'] . "</p>";

                    if ($event['Status'] == 'Cancelled') {
                        echo "<p style='color: red;'><strong>This event is cancelled. Enrollment is not available.</strong></p>";
                    } elseif ($event['Status'] == 'Full') {
                        echo "<p style='color: red;'><strong>This event is full. Enrollment is not available.</strong></p>";
                    } elseif ($event['Status'] == 'Closed') {
                        echo "<p style='color: red;'><strong>This event is closed. Enrollment is not available.</strong></p>";
                    }

                    echo "</div>";
                }










            } else {
                echo "<p>No closed or canceled events found.</p>";
            }
        } else {
            $search_result = searchEvents($conn, $search_name, $event_type, $university, $start_date);
            if ($search_result->num_rows > 0) {
                while ($event = $search_result->fetch_assoc()) {

                    echo "<div class='event'>";
                    echo "<h4>" . $event['Event_Name'] . "</h4>";
                    echo "<p><strong>Event Type:</strong> " . getEventTypeName($conn, $event['Event_Type_ID']) . "</p>";
                    echo "<p><strong>Description:</strong> " . $event['Description'] . "</p>";
                    echo "<p><strong>Start Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['Start_Date_Time'])) . "</p>";
                    echo "<p><strong>End Date & Time:</strong> " . date('m/d/Y h:i A', strtotime($event['End_Date_Time'])) . "</p>";
                    echo "<p><strong>Maximum Capacity:</strong> " . $event['Max_Capacity'] . "</p>";
                    echo "<p><strong>Presenter's Abstract Submission Deadline:</strong> " . date('m/d/Y h:i A', strtotime($event['Presenter_Deadline'])) . "</p>";
                    echo "<p><strong>Venue:</strong> " . $event['Venue'] . "</p>";
                    echo "<p><strong>University:</strong> " . $event['U_Name'] . "</p>";
                    echo "<p><strong>Physical Address:</strong> " . $event['Street_Address'] . ", " . $event['City'] . ", " . $event['State'] . " " . $event['Zip_Code'] . "</p>";

                    // Display the list of Presenters
                    echo "<p><strong>Presenters:</strong></p>";
                    echo "<ul>";
                    $presenters = getEventPresenters($conn, $event['Event_ID']);
                    while ($presenter = $presenters->fetch_assoc()) {
                        echo "<li>" . $presenter['Presenter_Name'] . "</li>";
                    }
                    echo "</ul>";

                    // Display the list of Keynote Speakers
                    echo "<p><strong>Keynote Speakers:</strong></p>";
                    echo "<ul>";
                    $speakers = getEventSpeakers($conn, $event['Event_ID']);
                    while ($speaker = $speakers->fetch_assoc()) {
                        echo "<li>" . $speaker['Speaker_Name'] . "</li>";
                    }
                    echo "</ul>";

                    // Display the list of Sponsors
                    echo "<p><strong>Sponsors:</strong></p>";
                    echo "<ul>";
                    $sponsors = getEventSponsors($conn, $event['Event_ID']);
                    while ($sponsor = $sponsors->fetch_assoc()) {
                        echo "<li>" . $sponsor['Sponsor_Name'] . "</li>";
                    }
                    echo "</ul>";



                    if (isset($_SESSION["user_id"])) {
                        $user_id = $_SESSION["user_id"];
                        $event_id = $event['Event_ID'];
                        $attendee_count = getAttendeeCount($conn, $event_id);
                        $is_enrolled = isUserEnrolled($conn, $user_id, $event_id);

                        echo "<p><strong>Attendee Count:</strong> " . $attendee_count . "</p>";

                        echo "<p><strong>Status:</strong> " . $event['Status'] . "</p>";
                        if ($event['Status'] == 'Cancelled') {
                             echo "<p style='color: red;'><strong>This event is cancelled. Enrollment is not available.</strong></p>";
                           } elseif ($event['Status'] == 'Full') {
                               echo "<p style='color: red;'><strong>This event is full. Enrollment is not available.</strong></p>";
                           } elseif ($event['Status'] == 'Closed') {
                               echo "<p style='color: red;'><strong>This event is closed. Enrollment is not available.</strong></p>";
                           } else {

                               echo "<form action='enroll_event.php' method='POST'>";
                               echo "<input type='hidden' name='event_id' value='$event_id'>";
                               echo "<button type='submit' name='enroll_unenroll'>" . ($is_enrolled ? 'Unenroll' : 'Enroll') . "</button>";
                               echo "</form>";
                           } 

                    } else {
                        echo "<p><strong>Attendee Count:</strong> " . $event['Attendee_Count'] . "</p>";
                    }

                    echo "</div>";
                }
            } else {
                echo "<p>No events found.</p>";
            }
        }
        ?>
    </main> 
</div>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
