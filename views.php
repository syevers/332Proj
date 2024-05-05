<?php
require_once 'db_connection.php';

// Create the views
$views = array(
    "CREATE OR REPLACE VIEW UsersWith10PlusEvents AS
     SELECT U.F_Name, U.LName, U.Email, U.Phone_Number
     FROM User U
     WHERE U.User_ID IN (
         SELECT E.U_ID
         FROM `Event` E
         GROUP BY E.U_ID
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
     WHERE Is_Published = 0"
);

// Execute the views
foreach ($views as $view) {
    if ($conn->query($view) !== TRUE) {
        echo "Error creating view: " . $conn->error . "<br>";
    }
}

// Function to get the result of a view
function getViewResult($conn, $viewName) {
    $sql = "SELECT * FROM $viewName";
    $result = $conn->query($sql);
    return $result;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Views - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
        <nav>
            <ul>
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="create_event.php">Create Event</a></li>
                <li><a href="logout.php">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Views</h2>
        <form action="views.php" method="POST">
            <label for="view_select">Select a View:</label>
            <select id="view_select" name="view_select">
                <option value="">-- Select a View --</option>
                <option value="UsersWith10PlusEvents">Users with 10+ Events</option>
                <option value="EventsWith100PlusAttendees">Events with 100+ Attendees</option>
                <option value="ClosedOrCanceledEvents">Closed or Canceled Events</option>
            </select>
            <button type="submit">View Results</button>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $selectedView = $_POST["view_select"];

            if (!empty($selectedView)) {
                $result = getViewResult($conn, $selectedView);

                if ($result->num_rows > 0) {
                    echo "<h3>$selectedView Results</h3>";
                    echo "<table>";
                    echo "<tr>";
                    while ($fieldInfo = $result->fetch_field()) {
                        echo "<th>" . $fieldInfo->name . "</th>";
                    }
                    echo "</tr>";
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        foreach ($row as $value) {
                            echo "<td>$value</td>";
                        }
                        echo "</tr>";
                    }
                    echo "</table>";
                } else {
                    echo "<p>No results found for $selectedView.</p>";
                }
            }
        }
        ?>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
