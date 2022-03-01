<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";
$reg = $_POST["reg_no"];
$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  
  $s = mysqli_query($conn,"select * from attendance where reg_no = $reg");
  
  $return_arr = array();
  
  while ($row = mysqli_fetch_array($s)) {
      $row_array['pre'] = $row['percentage'];
      array_push($return_arr,$row_array);
  }
  
  echo json_encode($return_arr);
?>

