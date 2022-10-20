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
        $query="select * from CreditCard where idCreditCard=(Select CreditCard_idCreditCard from Users where Username='".$name."')";
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
 </br>
   <?php while($row = mysql_fetch_assoc($result)){
			foreach($row as $cname => $cvalue){
					print "$cname: $cvalue</br>";
			}

		print "\r\n";
}?>
</br> </br>
	<a href="http://localhost/teliki_ergasia/profil.php">Back</a></p>
	</center>

   
</body>
</html>

