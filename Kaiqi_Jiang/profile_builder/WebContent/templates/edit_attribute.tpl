


{#template MAIN}

{#foreach $T as Item}

	
	
	<div id="{$T.Item}" style="width:45%;margin-top: 75px;margin-left: 25px;">
		<textarea id="plain_content_{$T.Item}" style="display:none; margin-left: 75px; width: 500px; height: 300px; resize: none;" onchange = "update_innerhtml(plain_content_{$T.Item})"></textarea>
  		<div id="divtbl_{$T.Item}" style="overflow:scroll;max-height:700px;display:none;">
  		</div>
  	</div> 
  
  

  
{#/for}
{#/template MAIN}