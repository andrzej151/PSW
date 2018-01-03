<?php
	session_start();
$t = time()+2*60;
if(!isset($_COOKIE['licznik']))
{
    setcookie("licznik", 0 , $t);
}
if(isset($_POST['nazwa']))
{
    $licz = $_COOKIE['licznik'];
    setcookie("cookie[$licz]", $_POST['nazwa'], $t);
    $licz+=1;
    setcookie("licznik", $licz, $t);
}
	


?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Ciasteczka</title>
    <style>
       
        
<?php
        
        
if (isset($_POST['kolor']))
	{
    setcookie("kolor", $_POST['kolor'], $t);
    echo( " body{
            background:".$_COOKIE['kolor']." 
        }");
}else
{
    if (isset($_COOKIE['kolor']))
	{
		echo( " body{
            background:". $_COOKIE['kolor']." 
        }"
        );
	}
}
	
	
	
?>
    
    </style>
  
    
</head>
<body>
     <?php
    if (isset($_COOKIE['cookie'])) {
    foreach ($_COOKIE['cookie'] as $name => $value) {
        $name = htmlspecialchars($name);
        $value = htmlspecialchars($value);
        echo "$name : $value <br />\n";
    }
}
      
          ?>
          
          <form action="" method="post">
              Nazwa: <input type="text" name="nazwa">
              <input type="submit" value="Dodaj" >
          </form>
</body>
</html>