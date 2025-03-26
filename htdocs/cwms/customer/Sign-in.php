<?php
session_start();
include('../includes/config.php');

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = ($_POST['password']); // Assuming passwords are stored as MD5 hashes

    $sql = "SELECT * FROM customer_acc WHERE email = :email AND password = :password";
    $query = $dbh->prepare($sql);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->execute();
    $result = $query->fetch(PDO::FETCH_OBJ);

    if ($query->rowCount() > 0) {
        $_SESSION['customer_login'] = $result->id;
        echo "<script>alert('Login successful!');</script>";
        echo "<script>window.location.href = 'dashboard.php';</script>";
    } else {
        echo "<script>alert('Invalid email or password!');</script>";
    }
}
?>

<!DOCTYPE HTML>
<html>
<head>
    <title>Customer Sign-In</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.css" rel="stylesheet">
    <script src="../js/jquery-2.1.4.min.js"></script>
</head>
<body>
    <div class="login-page">
        <div class="form">
            <h2>Customer Sign-In</h2>
            <form method="post">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" name="login" class="btn btn-primary">Sign In</button>
            </form>
            <p class="mt-3">Don't have an account? <a href="Sign-up.php">Sign Up</a></p>
        </div>
    </div>
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>