<?php
include_once('../classes/login_class.php');

if($_SERVER['REQUEST_METHOD'] == "POST"){
  if (isset($_POST["username"]) && isset($_POST["password"])){
    $username = $_POST["username"];
    $password = $_POST["password"];

    $login = new Login($username,$password);
    $status = $login->login();
    if($status === true){
      echo "Successfully logged in";

    }else if($status === false){
      echo "Incorrect userame or password";
    }else{
      echo $status;
    }
    exit();
  }else{
    header("location: ../index.php");
  }
}else{
  header("location: ../index.php");
}

?>
