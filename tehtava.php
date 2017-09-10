<?php
	require_once("koneet.inc");

	$query = "SELECT koneet.NIMI, koneet.ID, koneet.LUONTIPVM, koneet.KUVAUS, konetyypit.LYHENNE, koneet.KONETYYPPI_ID FROM koneet INNER JOIN konetyypit ON koneet.KONETYYPPI_ID = konetyypit.ID;";
	mysqli_set_charset($conn, 'utf8');
	$tulos = mysqli_query($conn, $query);
	
	echo "<table id='taulukko' class='w3-table'";
	echo "<tr><td>Koneen nimi:</td><td>Luontipäivämäärä:</td><td>Kuvaus:</td><td>Lyhenne:</td></tr>";	
						while ($rivi = mysqli_fetch_ASSOC($tulos)) 
						{ 
							$id = $rivi["ID"];
							$nimi = $rivi["NIMI"];
							$luontipvm = $rivi["LUONTIPVM"];
							$kuvaus = $rivi["KUVAUS"];
							$lyhenne = $rivi["LYHENNE"];
							$konetyyppi_id = $rivi["KONETYYPPI_ID"];
							echo "<tr>
									<td>$nimi</td>
									<td>$luontipvm</td>
									<td>$kuvaus</td>
									<td>$lyhenne</td>
									<td><button class='w3-button w3-blue' id='huoltonappi' value='$konetyyppi_id'>Huoltohistoria</button></td>
									<td><button class='w3-button w3-red' id='poistonappi' value='$id'>Poista laite</button></td>
								</tr>";
						} 
	echo "</table>";
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>SQL-tehtävä</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		<script src = "http://code.jquery.com/jquery-latest.min.js" type = "text/javascript"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src = "scriptit.js"></script>
	</head>
	<body>
		<div id="taulukkodiv" class="container-fluid">
			<table id="taulukko"></table>
		</div>
		<div id="historiadiv" class="container-fluid">
			<table id="huoltohistoria"></table>
		</div>
	</body>
</html>