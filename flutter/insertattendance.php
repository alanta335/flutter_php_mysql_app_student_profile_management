<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";
$roll = $_POST["roll"];
//$name = $_POST['name'];
$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  
  // $q = mysqli_query($conn,"INSERT INTO student (roll,name) VALUES($roll,'$name')");
  $s = mysqli_query($conn,"SELECT * from student where roll = $roll");
  
  $return_arr = array();
  
  while ($row = mysqli_fetch_array($s)) {
      $row_array['roll'] = $row['roll'];
      $row_array['name'] = $row['name'];
  
      array_push($return_arr,$row_array);
  }
  
  echo json_encode($return_arr);
?>

