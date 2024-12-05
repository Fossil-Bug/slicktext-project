<?php

//user object model

class User
{
    private $id;
    private $first_name;
    private $last_name;
    private $email;
    private $mobile_number;
    private $address;
    private $city;
    private $state;
    private $zip;
    private $created;
    private $last_updated;

    private $db;

    // Constructor: Initialize the database connection
    public function __construct($db)
    {
        $this->db = $db;
    }

    // Get all properties as an associative array
    public function getAllProperties()
    {
        return [
            'id' => $this->id,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'email' => $this->email,
            'mobile_number' => $this->mobile_number,
            'address' => $this->address,
            'city' => $this->city,
            'state' => $this->state,
            'zip' => $this->zip,
            'created' => $this->created,
            'last_updated' => $this->last_updated,
        ];
    }

    // Get a single property value
    public function getProperty($property)
    {
        return $this->$property ?? null;
    }

    // Set properties in bulk (array format)
    public function setProperties($properties)
    {
        foreach ($properties as $key => $value) {
            if (property_exists($this, $key)) {
                $this->$key = $value;
            }
        }
    }

    // Set a single property
    public function setProperty($property, $value)
    {
        if (property_exists($this, $property)) {
            $this->$property = $value;
        }
    }

    // Validate properties (e.g., email format, required fields)
    public function validate()
    {

        // Validate First and Last name
        if (empty($this->first_name) || empty($this->last_name)) {
            return "First and Last name are required.";
        }

        if (strlen($this->first_name) > 128 || strlen($this->last_name) > 128) {
            return "First and Last name must not exceed 128 characters.";
        }

        if (!preg_match("/^[a-zA-Z ]*$/", $this->first_name) || !preg_match("/^[a-zA-Z ]*$/", $this->last_name)) {
            return "First and Last name can only contain letters and spaces.";
        }

        // Validate Email
        if (empty($this->email) || strlen($this->email) > 128) {
            return "Email must not be empty and must not exceed 128 characters.";
        }

        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            return "Invalid email format.";
        }

        // Validate Phone Number (only digits allowed and length must be exactly 10 digits)
        if (empty($this->mobile_number)) {
            return "Mobile number is required.";
        }

        // Remove any non-numeric characters (for cleaning)
        $phoneNumber = preg_replace("/\D/", "", $this->mobile_number);
        if (strlen($phoneNumber) != 10) {
            return "Invalid phone number. It must contain exactly 10 digits.";
        }

        // Validate Address
        if (!empty($this->address) && strlen($this->address) > 128) {
            return "Address must not exceed 128 characters.";
        }

        // Validate City
        if (!empty($this->city) && strlen($this->city) > 128) {
            return "City must not exceed 128 characters.";
        }

        if (!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
            return "Invalid email format.";
        }

        // Validate phone number format (10 digits, may contain spaces, dashes, or parentheses)
        //not a robust validator for phone numbers but a basic validator checking for 10 numbers
        //ideally we would set up a 'send text with validation code', they would send validation 
        //back to verify working phone number
        if (!preg_match("/^[0-9]{10}$/", preg_replace("/[^0-9]/", "", $this->mobile_number))) {
            return "Invalid phone number. It must contain exactly 10 digits.";
        }

        // Validate Zip
        if (!empty($this->zip) && preg_match('/^[A-Z]{1,2}[0-9]{1,2}[A-Z]? [0-9][A-Z]{2}$/', $this->zip)) {
        //fixed basic check for integers from AI to include Canadian Postal codes
        //more is needed if we need more International codes 
        //we can set up a validation that checks against real zip codes 
        //and check against city they entered via API services through the postal code
            return "Invalid zip code. $this->zip";
        }

        //I would recommend that we validate the address against paid for databases
        //There are also APIs that can be used to provide valid postal addresses

        return true;
    }

    // Fetch a user by ID from the database and set the model's properties
    public function fetchById($id)
    {
        $query = "SELECT * FROM users WHERE id = :id LIMIT 1";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->setProperties($user);
            return true;
        }

        return false;
    }

    // Create a new user in the database
    public function create()
    {
        $query = "INSERT INTO users (first_name, last_name, email, mobile_number, address, city, state, zip, created) 
                  VALUES (:first_name, :last_name, :email, :mobile_number, :address, :city, :state, :zip, NOW())";
        $stmt = $this->db->prepare($query);

        $stmt->bindParam(':first_name', $this->first_name);
        $stmt->bindParam(':last_name', $this->last_name);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':mobile_number', $this->mobile_number);
        $stmt->bindParam(':address', $this->address);
        $stmt->bindParam(':city', $this->city);
        $stmt->bindParam(':state', $this->state);
        $stmt->bindParam(':zip', $this->zip);

        return $stmt->execute();
    }

    // Update an existing user in the database
    public function update()
    {
        if (empty($this->id)) {
            throw new Exception("ID is required for updating.");
        }

        $query = "UPDATE users 
                  SET first_name = :first_name, last_name = :last_name, email = :email, 
                      mobile_number = :mobile_number, address = :address, city = :city, 
                      state = :state, zip = :zip, last_updated = NOW() 
                  WHERE id = :id";

        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':first_name', $this->first_name);
        $stmt->bindParam(':last_name', $this->last_name);
        $stmt->bindParam(':email', $this->email);
        $stmt->bindParam(':mobile_number', $this->mobile_number);
        $stmt->bindParam(':address', $this->address);
        $stmt->bindParam(':city', $this->city);
        $stmt->bindParam(':state', $this->state);
        $stmt->bindParam(':zip', $this->zip);
        $stmt->bindParam(':id', $this->id, PDO::PARAM_INT);

        return $stmt->execute();
    }

    // Delete a user from the database by ID
    public function delete()
    {
        if (empty($this->id)) {
            throw new Exception("ID is required for deletion.");
        }

        $query = "DELETE FROM users WHERE id = :id";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(':id', $this->id, PDO::PARAM_INT);

        return $stmt->execute();
    }
}

// Example usage:
// Assuming $pdo is a valid PDO connection to your MySQL database

// try {
//     $user = new User($pdo);

//     // Fetch user with ID 1
//     if ($user->fetchById(1)) {
//         echo "User fetched successfully!";
//         print_r($user->getAllProperties());
//     }

//     // Create a new user
//     $user->setProperties([
//         'first_name' => 'John',
//         'last_name' => 'Doe',
//         'email' => 'john.doe@example.com',
//         'mobile_number' => '1234567890',
//         'address' => '123 Main St',
//         'city' => 'Anytown',
//         'state' => 'NY',
//         'zip' => 12345,
//     ]);

//     // Validate user
//     $validationResult = $user->validate();
//     if ($validationResult === true) {
//         $user->create();
//         echo "User created successfully!";
//     } else {
//         echo $validationResult;
//     }

//     // Update user
//     $user->setProperty('email', 'new.email@example.com');
//     $user->update();
//     echo "User updated successfully!";

//     // Delete user
//     $user->delete();
//     echo "User deleted successfully!";
// } catch (Exception $e) {
//     echo "Error: " . $e->getMessage();
// }

?>


