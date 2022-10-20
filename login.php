<?php
    session_start();
    
    
    $username='';
    $password='';
    $error_message='';
    if(isset($_POST['submit']))
    {
        $username=trim($_POST['username']);
        $password=trim($_POST['password']);
        @DEFINE("DB_USER","root");
        @DEFINE("DB_PASSWORD","");
        @DEFINE("DB_HOST","localhost");
        @DEFINE("DB_NAME","bank");

        $db=@mysql_connect(DB_HOST,DB_USER,"");
        $db_selected=@mysql_select_db(DB_NAME);
        @mysql_query (' set character set utf8 ');
        $query="select * from Users where Username='" . $username . "' and Password='" . $password . "'";
        $res=mysql_query($query);
        $num_res=mysql_num_rows($res);
        if($num_res > 0)
        {
			$query2=mysql_query("Select attempts from Users where Username='".$username."'");
			$row = mysql_fetch_assoc($query2);
			foreach($row as $cvalue){
				 if($cvalue>3)
					 $error_message="You cannot enter in your Account";
				else{
					 $row=mysql_fetch_array($res);
            //--------------------------------------------------------------------
                //$value="ok";
                //setcookie("status",$value,time()+60, "/cookies/", "localhost");
                $_SESSION['status']="ok";
                
                //$value=$row['alias_name'];
                // setcookie("alias_name",$value,time()+60, "/cookies/", "localhost");
                $_SESSION['alias_name']=$username;
                header("Location: http://localhost/teliki_ergasia/profil.php");
                exit;
					
				}
					
			}
           
            //--------------------------------------------------------------------
        }
        else
        {
			
			
			$query1=mysql_query("UPDATE Users SET attempts=attempts+1 WHERE Username='".$username."'");
			$query2=mysql_query("Select attempts from Users where Username='".$username."'");
			$row = mysql_fetch_assoc($query2);
			
			
			$error_message.="Invalid username or password";
        }
    }

?>
<html>
    <head>
        <title>Login Client</title>
    </head>
    <body style="background-color:lightblue;">
	<img src="bank.png" style="width:100px;height:50px;">
	</br></br></br></br></br></br>
	<center>
    <h1>Login Client</h1>
        <form name="login" action="" method="post">
            Username:  <input type="text" name="username" value="" /><br />
            Password:   <input type="password" name="password" value="" /><br />
            <input type="submit" name="submit" value="Submit" />
        </form>
		</br>
		 <a href="http://localhost/teliki_ergasia/create.php">Sign Up!</a>
		<p><?php echo $error_message;?>
   </center>
</body>
</html>

