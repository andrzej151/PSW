<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>php2 - zawartosc bazy</title>
	
	<style>
		.error
		{
			color:red;
			margin-top: 10px;
			margin-bottom: 10px;
		}
	</style>
</head>
    <body>
        <?php
            if(!($database = mysqli_connect("localhost", "root","root","php2")))
                die("Nie można połączyć się z bazą </body></html>");
            if(!($result = mysqli_query($database, "SELECT * FROM uzytkownicy")))
                print("<p>Nieudane wykonanie zapytania</p>");
                die(mysqli_error($database) . "</body></hyml>")
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