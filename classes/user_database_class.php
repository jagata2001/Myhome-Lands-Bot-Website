<?php
include_once('db_connect_class.php');

class Users_database extends Db_connect{
  function __construct($username,$password,$database){
    parent::__construct($username,$password,$database);
  }
  public function user_login_check($username,$password){

    $username = $this->escape_string($username);
    $password = hash("sha512",$password);
    $sql_command = "SELECT id,user FROM website_users WHERE user='$username' and password='$password';";
    $query = $this->conn->query($sql_command);

    if($query){

      if($query->num_rows == 1){

        $data = $query->fetch_assoc();

        return array("status"=>true,"data"=>array("id"=>$data["id"],"username"=>$data["user"]));
      }

      return array("status"=>false,"data"=>null);
    }

  }
}

?>
