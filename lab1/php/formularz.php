<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Walidacja danych</title>
    </head>
    <body>
        <?php
        
      
        if(!preg_match('/[0-9]{3}-[0-9]{3}-[0-9]{3}/', $_POST['telefon']))
            {
                echo("<p>Niepoprawny numer telefonu</p><p>Wprowadź numer w formacie 123-123-123</p>");
                exit();
            }
     
        ?> 
    </body>
</html>