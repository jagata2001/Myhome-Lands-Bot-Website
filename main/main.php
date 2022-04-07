<?php
include_once('../classes/static_methods_class.php');
Static_methods::validate();

if($_SERVER["REQUEST_METHOD"] == "POST"){
    if(isset($_POST["search"]) and !empty($_POST["search"])){
        include_once('../classes/main_database_class.php');
        $main_db = new Main_database("jagata","pwd","lands_bot");
        $search = $_POST["search"];
        $status = $main_db->find_land($search);
        echo json_encode($status);
    }

}



?>
