<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";
$reg = 104;
$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  
  $s = mysqli_query($conn,"select * from Result 
  where student_reg_no = $reg");
  
  $return_arr = array();
  
  while ($row = mysqli_fetch_array($s)) {
      $row_array['s1'] = $row['s1_sgpa'];
      $row_array['s2'] = $row['s2_sgpa'];
      $row_array['s3'] = $row['s3_sgpa'];
      $row_array['s4'] = $row['s4_sgpa'];
      $row_array['s5'] = $row['s5_sgpa'];
      $row_array['s6'] = $row['s6_sgpa'];
      $row_array['s7'] = $row['s7_sgpa'];
      $row_array['s8'] = $row['s8_sgpa'];
      array_push($return_arr,$row_array);
  }
  
  echo json_encode($return_arr);
?>

