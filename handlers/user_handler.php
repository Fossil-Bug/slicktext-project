<?php
// Include database connection and User class
require_once '../db_conn/db_conn.php'; // File containing your PDO $pdo connection
require_once '../models/User.php';

$action = $_POST['action'] ?? '';
$response = [];

try {
    $user = new User($pdo);

    switch ($action) {
        case 'getAllUsers':
            $stmt = $pdo->query("SELECT id, CONCAT(last_name, ', ', first_name) AS name FROM users ORDER BY last_name");
            $response['data'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
            break;

        case 'getUserById':
            $id = intval($_POST['id']);
            if ($user->fetchById($id)) {
                $response['data'] = $user->getAllProperties();
            } else {
                $response['error'] = "User not found.";
            }
            break;

        case 'createUser':
            $user->setProperties($_POST);
            $validationResult = $user->validate();
            if ($validationResult === true) {
                if ($user->create()) {
                    $response['message'] = "User created successfully!";
                } else {
                    $response['error'] = "Failed to create user.";
                }
            } else {
                $response['error'] = $validationResult;
            }
            break;

        case 'updateUser':
            $user->setProperties($_POST);
            $validationResult = $user->validate();
            if ($validationResult === true) {
                if ($user->update()) {
                    $response['message'] = "User updated successfully!";
                } else {
                    $response['error'] = "Failed to update user.";
                }
            } else {
                $response['error'] = $validationResult;
            }
            break;

        case 'deleteUser':
            $id = intval($_POST['id']);
            $user->setProperty('id', $id);
            if ($user->delete()) {
                $response['message'] = "User deleted successfully!";
            } else {
                $response['error'] = "Failed to delete user.";
            }
            break;

        default:
            $response['error'] = "Invalid action: $action";
    }
} catch (Exception $e) {
    $response['error'] = $e->getMessage();
}

header('Content-Type: application/json');
echo json_encode($response);
?>
