<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";


$reg_no = $_POST['reg_no'];
$sem = $_POST['sem'];
$mark = $_POST['mark'];



$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  $qu = "update result set $sem = $mark where student_reg_no = $reg_no";  
  echo $qu;
  $q1 = mysqli_query($conn,$qu);
  echo "successful";
?>

