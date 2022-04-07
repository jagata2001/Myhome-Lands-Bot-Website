<?php
include_once('db_connect_class.php');

class Main_database extends Db_connect{
  function __construct($username,$password,$database){
    parent::__construct($username,$password,$database);
  }

  public function find_land($data){
    $data = $this->escape_string($data);
    $sql_command = "SELECT p.post_id,p.link_id,p.user,p.name,p.phone,p.post_date,l.link FROM
                      posts as p JOIN links as l ON p.link_id=l.link_id
                      WHERE (p.post_id='$data' OR p.user='$data' OR p.name like '%$data%' OR
                             p.phone = '$data' OR p.link_id='$data') AND p.post_status='success' ORDER BY p.post_date DESC LIMIT 2000; ";

    $query = $this->conn->query($sql_command);
    if($query){
        if($query->num_rows>0){
          $data = $query->fetch_all();
          $query->free_result();
          return array("status"=>true,"data"=>$data,"message"=>null);
        }
        return array("status"=>false,"data"=>null,"message"=>"There is no any record in database");
    }
    return array("status"=>false,"data"=>null,"message"=>"Something went wrong");
  }

  public function amount_to_be_paid(){
    $sql_command = "SELECT CAST(COALESCE((SELECT SUM(amount) from payments),0)-(COUNT(*)*0.15) AS DECIMAL(7,2)) as amount from posts where post_status='success';";
    $query = $this->conn->query($sql_command);
    if($query){
        if($query->num_rows>0){
          $data = $query->fetch_assoc();
          return $data["amount"];
        }
    }

  }

}


?>
