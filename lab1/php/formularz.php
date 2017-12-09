<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Walidacja danych</title>
    </head>
    <body>
        <?php
            if(!preg_match("\d{3}[\-]\d{3}[\-]\d{3})", $_POST["telefon"]))
            {
                print("<p>Niepoprawny numer telefonu</p><p>Wprowadź numer w formacie 123-123-123</p></body></html>");
                die();
            }
        ?> 
    </body>
</html>