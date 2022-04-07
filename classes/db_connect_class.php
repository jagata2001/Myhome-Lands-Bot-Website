<?php

class Db_connect{
    protected $conn;

    function __construct($username,$password,$database,$host="localhost"){
          $conn = new mysqli($host, $username, $password,$database);
          if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
          }
          $conn->set_charset("utf8");
          $this->conn = $conn;
      }
    protected function escape_string($text){
      return $this->conn->real_escape_string($text);
    }

    function __destruct(){
      mysqli_close($this->conn);
    }


}




?>
