<?php

// Database configuration
define('DB_HOST', '127.0.0.1');
define('DB_USERNAME', 'localhost');
define('DB_PASSWORD', '');
define('DB_NAME', 'aem');

// Establish database connection
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create the database if it doesn't exist
$sql = "CREATE DATABASE IF NOT EXISTS " . DB_NAME;
if ($conn->query($sql) === TRUE) {
    echo "Database created successfully";
} else {
    echo "Error creating database: " . $conn->error;
}

// Select the database
$conn->select_db(DB_NAME);
?>
