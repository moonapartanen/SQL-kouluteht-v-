<?php
	require_once("koneet.inc");

	function GetData($var)
	{
		$data = NULL;
		
		if(isset($_GET[$var]))
		{
			$data = $_GET[$var];
		}
		
		return $data;
	}
	
	function GetPost($var)
	{
		$data = NULL;
		
		if(isset($_POST[$var]))
		{
			$data = $_POST[$var];
		}
		
		return $data;
	}
	
	$poisto = GetData("poisto");
	$poistoavain = GetPost("poistoavain");
	$huoltohistoria = GetData("huoltohistoria");
	$huoltoavain = GetPost("huoltoavain");
	
	if($poisto)
	{
		$query = "DELETE from koneet WHERE ID = $poistoavain;";
		mysqli_set_charset($conn, 'utf8');
		$tulos = mysqli_query($conn, $query);
	
		if($tulos)
		{
			echo "Poisto onnistui!";
		}
		else
		{
			echo "Poisto epäonnistui!";
		}		
	}
	elseif($huoltohistoria)
	{
		$query = "SELECT * FROM huoltohistoria WHERE KONE_ID = $huoltoavain";
		mysqli_set_charset($conn, 'utf8');
		$tulos = mysqli_query($conn, $query);
	
		if($tulos)
		{
			$historia = '{"huoltohistoria":[';
		
			while ($rivi = mysqli_fetch_assoc($tulos)){
				$kuvaus = $rivi["KUVAUS"];
				$historia .= '{"kuvaus":"' . $kuvaus . '"},';
			}			
				
			$historia = rtrim($historia,",");
			$historia .= ']}';
			echo $historia;
		}
		else
		{
			echo "Haku epäonnistui!";
		}		
	}
?>