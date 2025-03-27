<!-- filepath: /workspaces/SS7_IT3-BMH_Carwash_food-drinks-system/htdocs/cwms/login.php -->
<?php
session_start();
include('includes/config.php');

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if the user is an admin
    $sqlAdmin = "SELECT * FROM admin WHERE email = :email";
    $queryAdmin = $dbh->prepare($sqlAdmin);
    $queryAdmin->bindParam(':email', $email, PDO::PARAM_STR);
    $queryAdmin->execute();
    $resultAdmin = $queryAdmin->fetch(PDO::FETCH_OBJ);

    if ($resultAdmin && password_verify($password, $resultAdmin->password)) {
        // Admin login successful
        $_SESSION['admin_login'] = $resultAdmin->email;
        echo "<script>alert('Admin login successful!');</script>";
        echo "<script>window.location.href = 'admin/dashboard.php';</script>";
        exit;
    }

    // Check if the user is a customer
    $sqlCustomer = "SELECT * FROM customer_acc WHERE gmail = :email";
    $queryCustomer = $dbh->prepare($sqlCustomer);
    $queryCustomer->bindParam(':email', $email, PDO::PARAM_STR);
    $queryCustomer->execute();
    $resultCustomer = $queryCustomer->fetch(PDO::FETCH_OBJ);

    if ($resultCustomer && password_verify($password, $resultCustomer->password)) {
        // Customer login successful
        $_SESSION['customer_login'] = $resultCustomer->gmail;
        echo "<script>alert('Customer login successful!');</script>";
        echo "<script>window.location.href = 'home.php';</script>";
        exit;
    }

    // If login fails
    echo "<script>alert('Invalid email or password. Please try again.');</script>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css"> <!-- Include your custom style -->
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2 class="text-center">Login</h2>
            <form method="post" class="mt-4">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <button type="submit" name="login" class="btn btn-primary btn-block">Login</button>
            </form>
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="customer-signup.php">Sign Up</a></p>
                <p>Are you an admin? <a href="admin" class="nav-item nav-link">Admin</a></p>
            </div>
        </div>
    </div>
</body>
</html>