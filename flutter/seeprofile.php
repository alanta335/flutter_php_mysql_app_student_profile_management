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
  
  $s = mysqli_query($conn,"SELECT * from student as s,college_details as cd , department as d WHERE s.reg_no = $reg AND cd.student_reg_no = $reg AND d.student_reg_no = $reg");
  
  $return_arr = array();
  
  while ($row = mysqli_fetch_array($s)) {
      $row_array['roll'] = $row['roll_no'];
      $row_array['fname'] = $row['fname'];
      $row_array['lname'] = $row['lname'];
      $row_array['sem'] = $row['semester'];
      $row_array['col_name'] = $row['college_name'];
      $row_array['district'] = $row['district'];
      $row_array['dep_name'] = $row['dep_name'];
      $row_array['hod'] = $row['hod'];
      array_push($return_arr,$row_array);
  }
  
  echo json_encode($return_arr);
?>

