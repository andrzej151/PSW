<?php

	session_start();
	
	if (!isset($_SESSION['zalogowany']))
	{
		header('Location: index.php');
		exit();
	}
	
?>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Sesja</title>
	<style>
       
        
<?php
        
        
if (isset($_POST['kolor']))
	{
    setcookie("kolor", $_POST['kolor'], time()+30);
    echo( " body{
            background:".$_COOKIE['kolor']." 
        }");
}else
{
    if (isset($_COOKIE['kolor']))
	{
		echo( " body{
            background:".$_COOKIE['kolor']." 
        }"
        );
	}
}
	
	
	
?>
    
    </style>
</head>

<body>
	
<?php

	echo "<p>Witaj ".$_SESSION['user'].'! [ <a href="logout.php">Wyloguj się!</a> ]</p>';
    
   echo '<form action="" method="post">
              kolor: <input type="text" name="kolor">
              <input type="submit" value="kolor" >
     </form>';
	echo "<p><b>Drewno</b>: ".$_SESSION['drewno'];
	echo " | <b>Kamień</b>: ".$_SESSION['kamien'];
	echo " | <b>Zboże</b>: ".$_SESSION['zboze']."</p>";
	
	echo "<p><b>E-mail</b>: ".$_SESSION['email'];
	echo '</br><a href="ciasteczka.php">Ciasteczka pamietnik</a>';
	
?>

</body>
</html>