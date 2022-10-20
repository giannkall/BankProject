<?php
    session_start();
    
    if(isset($_SESSION['status']))
    {
        $_SESSION=array();
        session_destroy();
    }
    header("Location: http://localhost/teliki_ergasia/login.php");
    exit;
?>
