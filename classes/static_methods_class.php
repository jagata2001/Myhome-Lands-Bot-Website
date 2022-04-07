<?php
class Static_methods{
  public static function validate(){
      session_start();
      if(isset($_SESSION["id"]) && isset($_SESSION["username"]) &&  isset($_SESSION["status"])){
        if($_SESSION["status"] !== true){
          header("location: ../index.php");
          exit();
        }
      }else{
          header("location: ../index.php");
          exit();
      }
  }
}

?>
