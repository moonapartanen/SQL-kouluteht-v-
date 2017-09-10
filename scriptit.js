$(document).ready(function(){ 
						   
	 $(document).on('click','#huoltonappi',function(e){
		 
		$arvo = $(this).val();		 
		
		$.ajax({
			method: "POST",
			url: "data.php?huoltohistoria=true",
			data: {huoltoavain : $arvo},
			datatype: "json",
			})
			.done(function(response){
				
				var historia = JSON.parse(response);
				TulostaHuoltohistoria(historia);	
			})
			
		});	
	
		$(document).on('click','#poistonappi',function(e){
		 
			$poistoarvo = $(this).val();		
			
			$.ajax({
				method: "POST",
				url: "data.php?poisto=true",
				data: {poistoavain : $poistoarvo},
				})
				.done(function(response){
					window.location.reload(); 
					alert(response);			
				});	
		});
	
});

function TulostaHuoltohistoria(historia)
{
	var out;
	var obj = {};
	
		if (historia.huoltohistoria.length === 0)
		{
			$("#huoltohistoria").empty();
			alert("Koneella ei ole huoltohistoriaa");
		}
		else 
		{
			for (var i = 0; i < historia.huoltohistoria.length; i++)
			{
				out += "<tr><td>" +
				historia.huoltohistoria[i].kuvaus +
				"</td></tr>";
			} 		
		}

		if ($('#huoltohistoria').length == 0) 
		{
			$("#huoltohistoria").append(out);
		}
		else
		{
			$("#huoltohistoria").empty();
			$("#huoltohistoria").append(out);
		}

}