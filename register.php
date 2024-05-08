<?php
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $email = $_POST["email"];
    $password = $_POST["password"];
    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $phone_number = $_POST["phone_number"];
    $role = $_POST["role"];

    // Check if the email already exists in the database
    $check_email_sql = "SELECT * FROM User WHERE Email = '$email'";
    $check_email_result = $conn->query($check_email_sql);

    if ($check_email_result->num_rows > 0) {
        $error = "Email already exists. Please use a different email.";
    } else {
        // Insert user into the database
        $sql = "INSERT INTO User (Email, Password, F_Name, LName, Phone_Number, Role, Created_At)
                VALUES ('$email', '$password', '$first_name', '$last_name', '$phone_number', '$role', NOW())";

        if ($conn->query($sql) === TRUE) {
            $success = "User registered successfully.";
        } else {
            $error = "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Register - AEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Academic Event Management</h1>
          <nav class="navbar">
            <ul class="navbar-left">
                <li><a href="index.php">Home</a></li>
                <li><a href="events.php">Events</a></li>
            </ul>

            <ul class="navbar-right">
                <li><a href="login.php">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <h2>Register</h2>
        <?php if (isset($error)) { ?>
            <p style="color: red;"><?php echo $error; ?></p>
        <?php } ?>
        <?php if (isset($success)) { ?>
            <p style="color: green;"><?php echo $success; ?></p>
        <?php } ?>
        <form action="register.php" method="POST">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="first_name">First Name:</label>
            <input type="text" id="first_name" name="first_name" required>

            <label for="last_name">Last Name:</label>
            <input type="text" id="last_name" name="last_name" required>

            <label for="phone_number">Phone Number:</label>
            <input type="tel" id="phone_number" name="phone_number" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Organizer">Organizer</option>
                <option value="Attendee">Attendee</option>
            </select>

            <button type="submit">Register</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Academic Event Management. All rights reserved.</p>
    </footer>
</body>
</html>
