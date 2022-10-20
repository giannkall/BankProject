<?php
    session_start();

    $name=$_SESSION['alias_name'];
	
		
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
  <a href="http://localhost/teliki_ergasia/payment_CreditCard.php">Payment with Credit Card</a></br>
   <p><a href="http://localhost/teliki_ergasia/payment_BankAccount.php">Payment with Bank Account</a></p>
      <p><a href="http://localhost/teliki_ergasia/payment_BankAccount_CreditCard.php">Pay Credit Card with Bank Account</a></p>
</center>

   
</body>
</html>

