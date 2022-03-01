<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";


$usr =  $_POST['reg_no'];
$ps = $_POST['pass'];

$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
$result = mysqli_query($conn,"SELECT pass from auth_db where reg_no = $usr");
$row = mysqli_fetch_row($result);

if ($row[0] == $ps)
  $row_array['status'] = "Auth_success";  

else
  $row_array['status'] = "Wrong password";  
  echo json_encode($row_array);
?>