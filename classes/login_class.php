<?php
include_once('user_database_class.php');

class Login{
    public $username;
    public $password;

    function __construct($username,$password){
        $this->username = $username;
        $this->password = $password;
    }

    public function validate(){
      if(strlen($this->username) == 0){
        return "Enter username";
      }else if(strlen($this->username)<3){
        return "Too short username";
      }else if(strlen($this->password)==0){
        return "Enter password";
      }else if(strlen($this->password)<8){
        return "Too short password";
      }
      return true;
    }

    public function login(){
      $validate = $this->validate();
        if($validate === true){
            $db = new Users_database("jagata","pwd","lands_bot");
            $status = $db->user_login_check($this->username,$this->password);

            if($status["status"] == 1){
              $this->run_session($status["data"]);
              return true;
            }
            return false;
         }
         return $validate;
      }

    public function run_session($data){
      session_start();
      $_SESSION["id"] = $data["id"];
      $_SESSION["username"] = $data["username"];
      $_SESSION["status"] = true;

    }

    public static function logout(){
        session_destroy();

    }
}


?>
