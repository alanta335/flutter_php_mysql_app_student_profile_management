<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";


$reg_no =$_POST['reg_no'];
$sem1 =$_POST['s1'];
$sem2 =$_POST['s2'];
$sem3 =$_POST['s3'];
$sem4 =$_POST['s4'];
$sem5 =$_POST['s5'];
$sem6 =$_POST['s6'];
$sem7 =$_POST['s7'];
$sem8 =$_POST['s8'];



$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  $qu = "INSERT INTO result VALUES ($reg_no,$sem1,$sem2,$sem3,$sem4,$sem5,$sem6,$sem7,$sem8)";  
  echo $qu;
  $q1 = mysqli_query($conn,$qu);
  echo "successful";
?>

