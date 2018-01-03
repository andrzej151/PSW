<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>php2 - zawartosc bazy</title>
</head>
    <body>
        <?php
            if(!($database = mysqli_connect("localhost", "root","root","php2")))
                die("Nie można połączyć się z bazą </body></html>");
            if(!($result = mysqli_query($database, "SELECT * FROM uzytkownicy")))
                print("<p>Nieudane wykonanie zapytania</p>");
                die(mysqli_error($database) . "</body></hyml>")
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