<?php
require_once 'db_connection.php';

session_start();

// Check if the user is logged in
if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit();
}

// Get the user's role
$role = $_SESSION["role"];
$name = $_SESSION["f_name"]
?>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
          <nav class="navbar">
            <ul class="navbar-left">
                <li><a href="dashboard.php">Dashboard</a></li>
                <li><a href="events.php">Events</a></li>
                <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'Organizer') { ?>
                    <li><a href="create_event.php">Create Event</a></li>
                    <li><a href="organizer_events.php">My Created Events</a></li>
                <?php } ?>
            </ul>

            <ul class="navbar-right">
                <li><a href="logout.php">Logout</a></li>
            </ul>
</nav>
    </header>

    <main>
        <h2>Dashboard</h2>
        <!--<p>Welcome, <?php echo $_SESSION["user_id"]; ?>!</p>-->
        <p>Welcome, <?php echo $name; ?>!</p>
        <p>Your role is: <?php echo $role; ?></p>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
