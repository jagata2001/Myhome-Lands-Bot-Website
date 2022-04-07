<?php
session_start();
if(isset($_SESSION["id"]) && isset($_SESSION["username"]) &&  isset($_SESSION["status"])){
  if($_SESSION["status"] === true){
    if($_SERVER["REQUEST_METHOD"] == "POST"){
      if(isset($_POST["logout"])){
          include_once('./classes/login_class.php');
          Login::logout();
          header("location: index.php");
      }
    }
    include('./templates/lands_page.php');
  }
}else{
  include('./templates/login_page.php');
}


 ?>
