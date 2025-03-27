<!-- filepath: /workspaces/SS7_IT3-BMH_Carwash_food-drinks-system/htdocs/cwms/customer-signup.php -->
<?php
session_start();
include('includes/config.php');

if (isset($_POST['signup'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Check if the email already exists
    $sql = "SELECT * FROM customer_acc WHERE gmail = :email";
    $query = $dbh->prepare($sql);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->execute();

    if ($query->rowCount() > 0) {
        echo "<script>alert('Email already exists. Please try another email.');</script>";
    } else {
        // Insert the new customer into the database
        $sql = "INSERT INTO customer_acc (gmail, password) VALUES (:email, :password)";
        $query = $dbh->prepare($sql);
        $query->bindParam(':email', $email, PDO::PARAM_STR);
        $query->bindParam(':password', $password, PDO::PARAM_STR);

        if ($query->execute()) {
            echo "<script>alert('Sign-up successful! You can now log in.');</script>";
            echo "<script>window.location.href = 'customer-login.php';</script>";
        } else {
            echo "<script>alert('Something went wrong. Please try again.');</script>";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Sign-Up</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="text-center mt-5">Customer Sign-Up</h2>
        <form method="post" class="mt-4">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" name="email" id="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <button type="submit" name="signup" class="btn btn-primary btn-block">Sign Up</button>
        </form>
        <div class="text-center mt-3">
            <p>Already have an account? <a href="customer-login.php">Log In</a></p>
        </div>
    </div>
</body>
</html>