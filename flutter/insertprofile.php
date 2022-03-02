<?php
$servername = "localhost";
$username = "root";
$password = "root";
$database = "flutter";

$roll =$_POST["roll"];
$fname =$_POST['fname'];
$lname =$_POST['lname'];
$reg_no =$_POST['regno'];
$dep_no =$_POST['depno'];
$sem =$_POST['semester'];
$atten = $_POST['attendance'];
$deptname =$_POST['deptname'];
$hod =$_POST['hod'];
$pass =$_POST["pass"];
$col_id =$_POST['collegeid'];
$col_name =$_POST['collegename'];
$dist =$_POST['district'];


$conn = mysqli_connect($servername, $username, $password,$database);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }
  $q1 = mysqli_query($conn,"insert into student(reg_no, fname,lname,roll_no,dep_no,semester) values
  ($reg_no,'$fname','$lname',$roll,$dep_no,$sem)");
  
  $q2 = mysqli_query($conn,"insert into college_details (college_id ,college_name,district,student_reg_no) values ($col_id,'$col_name','$dist',$reg_no)");

  
  
  $q3 = mysqli_query($conn,"insert into Department(dep_no,dep_name, student_reg_no,hod) 
  values($dep_no,'$deptname',$reg_no,'$hod')");

  
  $q4 = mysqli_query($conn,"INSERT INTO auth_db values ($reg_no,'$pass')");
  $q5 = mysqli_query($conn,"INSERT INTO attendance values($reg_no,$atten)");
  // $row_array['q1'] = "insert into student(reg_no, fname,lname,roll_no,dep_no,semester) values
  //                   ($reg_no,'$fname','$lname',$roll,$dep_no,$sem)";
  
  // $row_array['q2'] =" insert into college_details (college_id ,college_name,district,student_reg_no) values 
  //   ($col_id,'$col_name','$dist',$reg_no)";
  // $row_array['q3'] = "insert into Department(dep_no,dep_name, student_reg_no,hod) 
  // values($dep_no,'$deptname',$reg_no,'$hod')";

  // $row_array['q4'] = "INSERT INTO auth_db values ($reg_no,'$pass')";
  // return(json_encode($row_array));
  echo "successful";
?>

