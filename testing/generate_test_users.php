<?php

include('../db_conn/db_conn.php');

// Function to generate a random phone number
function generatePhoneNumber()
{
    $phone = rand(100, 999) . rand(100, 999) . rand(1000, 9999);
    return "(" . substr($phone, 0, 3) . ") " . substr($phone, 3, 3) . "-" . substr($phone, 6, 4);
}

// Function to generate a random user
function generateRandomUser()
{
    $firstNames = ["John", "Jane", "Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah"];
    $lastNames = ["Doe", "Smith", "Johnson", "Brown", "Williams", "Jones", "Miller", "Davis", "Martinez", "Garcia"];
    $cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "Austin"];
    $states = ["NY", "CA", "TX", "FL", "PA", "IL", "OH", "GA", "NC", "MI"];
    $addresses = ["123 Main St", "456 Oak Ave", "789 Pine Dr", "101 Maple Ln", "202 Birch Rd", "303 Cedar Blvd", "404 Elm St", "505 Ash Cir", "606 Redwood Pl", "707 Willow Way"];

    // Generate random user data
    $firstName = $firstNames[array_rand($firstNames)];
    $lastName = $lastNames[array_rand($lastNames)];
    $email = strtolower($firstName . '.' . $lastName . '@example.com');
    $phone = generatePhoneNumber();
    $address = $addresses[array_rand($addresses)];
    $city = $cities[array_rand($cities)];
    $state = $states[array_rand($states)];
    $zip = rand(10000, 99999);

    return [
        'first_name' => $firstName,
        'last_name' => $lastName,
        'email' => $email,
        'mobile_number' => $phone,
        'address' => $address,
        'city' => $city,
        'state' => $state,
        'zip' => $zip,
        'created' => date('Y-m-d H:i:s'),
        'last_updated' => date('Y-m-d H:i:s')
    ];
}

// Assuming $pdo is a valid PDO connection to your MySQL database
try {
    // Generate 50 random users
    for ($i = 0; $i < 50; $i++) {
        $user = generateRandomUser();

        // Prepare the SQL query to insert the user
        $query = "INSERT INTO users (first_name, last_name, email, mobile_number, address, city, state, zip, created, last_updated) 
                  VALUES (:first_name, :last_name, :email, :mobile_number, :address, :city, :state, :zip, :created, :last_updated)";

        $stmt = $pdo->prepare($query);

        // Bind the user data to the query
        $stmt->bindParam(':first_name', $user['first_name']);
        $stmt->bindParam(':last_name', $user['last_name']);
        $stmt->bindParam(':email', $user['email']);
        $stmt->bindParam(':mobile_number', $user['mobile_number']);
        $stmt->bindParam(':address', $user['address']);
        $stmt->bindParam(':city', $user['city']);
        $stmt->bindParam(':state', $user['state']);
        $stmt->bindParam(':zip', $user['zip']);
        $stmt->bindParam(':created', $user['created']);
        $stmt->bindParam(':last_updated', $user['last_updated']);

        // Execute the query to insert the user
        $stmt->execute();
    }

    echo "50 test users inserted successfully.";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>
