<?php
    session_start();

    $name=$_SESSION['alias_name'];
	
	
       
		@DEFINE("DB_USER","root");
        @DEFINE("DB_PASSWORD","");
        @DEFINE("DB_HOST","localhost");
        @DEFINE("DB_NAME","bank");
		
		$db=@mysql_connect(DB_HOST,DB_USER,"");
        $db_selected=@mysql_select_db(DB_NAME);
        @mysql_query (' set character set utf8 ');
        $query="select * from Users where Username='" . $name. "'";
		$result = mysql_query($query);
		
?>
<html>
    <head>
        <title>Profil</title>
    </head>
    <body style="background-color:lightblue;">
	<img src="bank.png" style="width:100px;height:50px;"> <p style="text-align:right"><a href="http://localhost/teliki_ergasia/logout.php">Logout</a></p>
	<center>
    <h1><?php echo "User: "; echo $name?></h1>
 
   <p style="text-align:right"><a href="http://localhost/teliki_ergasia/info_bankaccount.php">My Bank Account</a></br><a href="http://localhost/teliki_ergasia/info_CreditCard.php">My Credit Card</a></p>
   <h3>Informations:</h3>
    <p style="text-align:right"><a href="http://localhost/teliki_ergasia/payment.php">Payments</a></br><a href="http://localhost/teliki_ergasia/transfer.php">Transfers</a></p>
   <?php while($row = mysql_fetch_assoc($result)){
			foreach($row as $cname => $cvalue){
				if($cname!="Password" && $cname!="attempts" && $cname!="Bank_Account_idClient" && $cname!="CreditCard_idCreditCard")
					print "$cname: $cvalue</br>";
			}
		print "\r\n";
}?>
  </center>
   
</body>
</html>

