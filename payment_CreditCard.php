<?php
    session_start();
	 $error_message='';
    $name=$_SESSION['alias_name'];
	if(isset($_POST['submit']))
	{
		$account=trim($_POST['number']);
		$money=trim($_POST['money']);
		@DEFINE("DB_USER","root");
        @DEFINE("DB_PASSWORD","");
        @DEFINE("DB_HOST","localhost");
        @DEFINE("DB_NAME","bank");

        $db=@mysql_connect(DB_HOST,DB_USER,"");
        $db_selected=@mysql_select_db(DB_NAME);
        @mysql_query (' set character set utf8 ');
        
		
		if(!$account || !$money)
		{
			$error_message= "You have not entered all the required details.Please try again.";
		}else{
			$query="Select * from CreditCard where idCreditCard=(Select CreditCard_idCreditCard from Users where Username='".$name."')";
		$res=mysql_query($query);
		$row=mysql_fetch_array($res);
		$result=$money+$row['Debt'];
		if($row['Credit_limit']>=$money && $row['Credit_limit']>=$result)
		{
			$query=mysql_query("UPDATE CreditCard SET debt=debt+".$money." WHERE idCreditCard=(Select CreditCard_idCreditCard from Users where Username='".$name."')");
			$res=mysql_query($query);
			header("Location: http://localhost/teliki_ergasia/info_CreditCard.php");
         	exit;
		}else 
		{
			$error_message= "The money you gave it's not right.";
		}
		
	}
	}
	
		
?>
<html>
    <head>
        <title>Profil</title>
    </head>
    <body style="background-color:lightblue;">
	<img src="bank.png" style="width:100px;height:50px;"> <p style="text-align:right"><a href="http://localhost/teliki_ergasia/logout.php">Logout</a></p>
	<center>
    <h1><?php echo "User: "; echo $name?></h1>
   </br></br>
  <form name="login" action="" method="post">
            Account No. <input type="text" name="number" value="" /><br />
            Money  <input type="text" name="money" value="" /><br />
            <input type="submit" name="submit" value="Submit" />
    </form>
	<p><?php echo $error_message;?>
</center>

   
</body>
</html>
