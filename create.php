<?php
    session_start();
    
    $error_message='';
    if(isset($_POST['submit']))
    {
        $username=trim($_POST['username']);
        $password=trim($_POST['password']);
		$First_Name=trim($_POST['First_Name']);
		$Last_Name=trim($_POST['Last_Name']);
		$Date_of_Birth=trim($_POST['Date_of_Birth']);
		$Telephone1=trim($_POST['Telephone1']);
		$Telephone2=trim($_POST['Telephone2']);
		$Email=trim($_POST['Email']);
		$Fathers_Name=trim($_POST['Fathers_Name']);
		$Mothers_Name=trim($_POST['Mothers_Name']);
		$Address=trim($_POST['Address']);
		$id_No=trim($_POST['id_No']);
		
		$idClient=trim($_POST['idClient']);
		$pin=trim($_POST['pin']);
		$Balance=trim($_POST['Balance']);
		
		$idCreditCard=trim($_POST['idCreditCard']);
		$pin2=trim($_POST['pin2']);
		$Valid_From=trim($_POST['Valid_From']);
		$Expriration_Date=trim($_POST['Expriration_Date']);
		$Debt=trim($_POST['Debt']);
		$Credit_limit=trim($_POST['Credit_limit']);
		
        @DEFINE("DB_USER","root");
        @DEFINE("DB_PASSWORD","");
        @DEFINE("DB_HOST","localhost");
        @DEFINE("DB_NAME","bank");

        $db=@mysql_connect(DB_HOST,DB_USER,"");
        $db_selected=@mysql_select_db(DB_NAME);
        @mysql_query (' set character set utf8 ');

        $query="select * from Users where Username='" . $username . "'";
        $res=mysql_query($query);
        $num_res=mysql_num_rows($res);
        if($num_res > 0)
        {
            $error_message.="Invalid Username";
        }
        else
        {
            if (!$username || !$password || !$First_Name || !$Last_Name || !$Date_of_Birth || !$Telephone1 || !$Fathers_Name || !$Mothers_Name || !$Address || !$id_No || !$idClient || !$idCreditCard )
			{

					$error_message.= "You have not entered all the required details.Please try again.";
				
			}
			else{
				if($idClient)
			{
				if(!$pin || !$Balance)
				{
					$error_message.= "You have not entered all the required details.Please try again.";
			
				}else{
				$query2= "insert into Bank_Account values
            ('".$idClient."', ".$pin.", ".$Balance.");";
    
			$result2=mysql_query($query2);
				}
				
			}
			if($idCreditCard)
			{
				if(!$pin || !$Valid_From || !$Expriration_Date || !$Debt || !$Credit_limit)
				{
					$error_message.= "You have not entered all the required details.Please try again.";
				
				}else{
				$query3= "insert into CreditCard values
            ('".$idCreditCard."', ".$pin2.", '".$Valid_From."', '".$Expriration_Date."', ".$Debt.", ".$Credit_limit.");";
    
			$result3=mysql_query($query3);

		
				}	
			}
			$query1= "insert into Users(Username,Password,First_Name,Last_Name, Date_of_Birth, Telephone1, Telephone2, Email, Fathers_Name, Mothers_Name, Address, id_No,Bank_Account_idClient, CreditCard_idCreditCard) values 
            ('".$username."', '".$password."', '".$First_Name."', '".$Last_Name."', '".$Date_of_Birth."', '".$Telephone1."', '".$Telephone2."','".$Email."', '".$Fathers_Name."', '".$Mothers_Name."', '".$Address."', '".$id_No."','".$idClient."','".$idCreditCard."');";
			$result1=mysql_query($query1);
			

	
			
			
				
			 header("Location: http://localhost/teliki_ergasia/login.php");
         	exit;
              
				
			}
		}
    }

?>
<html>
    <head>
        <title>Register</title>
    </head>
    <body style="background-color:lightblue;">
	<img src="bank.png" style="width:100px;height:50px;">
	</br></br>
	<center>
    <h1>Create Client</h1>
        <form name="login" action="" method="post">
            Username:  <input type="text" name="username" value="" /><br />
            Password:   <input type="password" name="password" value="" /><br />
			First Name:<input type="text" name="First_Name" value="" /><br />
			Last Name: <input type="text" name="Last_Name" value="" /><br />
			Date of Birth: <input type="text" name="Date_of_Birth" value="" /><br />
			Telephone1: <input type="text" name="Telephone1" value="" /><br />
			Telephone2: <input type="text" name="Telephone2" value="" /><br />
			Email: <input type="text" name="Email" value="" /><br />
			Father's Name:<input type="text" name="Fathers_Name" value="" /><br />
			Mother's Name:<input type="text" name="Mothers_Name" value="" /><br />
			Address: <input type="text" name="Address" value="" /><br />
			Id Number:<input type="text" name="id_No" value="" /><br />
			<br />
			<h3>Bank Account</h3>
			Id Card:<input type="text" name="idClient" value="" /><br />
			Pin: <input type="text" name="pin" value="" /><br />
			Balance: <input type="text" name="Balance" value="" /><br />
			<br />
			<h3>Credit Card</h3>
			Id Card: <input type="text" name="idCreditCard" value="" /><br />
			Pin: <input type="text" name="pin2" value="" /><br />
			Valid From: <input type="text" name="Valid_From" value="" /><br />
			Expriration Date: <input type="text" name="Expriration_Date" value="" /><br />
			Debt: <input type="text" name="Debt" value="" /><br />
			Limit: <input type="text" name="Credit_limit" value="" /><br />
            <input type="submit" name="submit" value="Submit" />
        </form>
		</br>
		<p><?php echo $error_message;?>
   </center>
</body>
</html>
