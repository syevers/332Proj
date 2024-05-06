<?php

// Database configuration
define('DB_HOST', '127.0.0.1');
define('DB_USERNAME', 'dcbos');
define('DB_PASSWORD', '');
define('DB_NAME', 'aem');

// Establish database connection
$conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
