<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";
$roll = $_POST["roll"];
$name = $_POST['name'];
$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  
  $q = mysqli_query($conn,"insert into Student(reg_no, fname,roll_no,dep_no,semester) values ($reg_no,'$name',$roll_no,$dept,$semester);
  ");
  $s = mysqli_query($conn,"SELECT * from student ");
  
  $return_arr = array();
  
  while ($row = mysqli_fetch_array($s)) {
      $row_array['roll'] = $row['roll'];
      $row_array['name'] = $row['name'];
  
      array_push($return_arr,$row_array);
  }
  
  echo json_encode($return_arr);
?>

