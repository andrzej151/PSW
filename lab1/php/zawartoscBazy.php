<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>php2 - zawartosc bazy</title>
	
	<style type="text/css">
        body {font-family: sans-serif;
                background-color: lightyellow; }
        table { background-color: lightblue; 
                border-collapse: collapse;
                border: 1px solid gray; }
        td {padding: 5px;}
        tr:nth-child(odd) {
            background-color: white;
        }
	</style>
</head>
    <body>
        <?php
            if(!($database = mysqli_connect("localhost", "root","root","php2")))
                die("Nie można połączyć się z bazą </body></html>");
            if(!($result = mysqli_query($database, "SELECT * FROM uzytkownicy")))
                {
                print("<p>Nieudane wykonanie zapytania</p>");
                die(mysqli_error($database) . "</body></html>");
                }
            mysqli_close($database);
        ?>
        <table>
        <caption>Wyniki zapytania</caption>
            <?php
                while($row = mysqli_fetch_row($result))
                {
                    print("<tr>");
                    foreach($row as $key => $value)
                        print("<td>$value</td>");
                        print("</tr>");
                }
            ?>
        </table>
    </body>
</html>