{#template MAIN}
<div id="allinfo">
	{#foreach $T as row}
		<h3>{$T.row.Name}</h3>
		<hr>
		{#foreach $T.row.data as rec}
			{#foreach $T.rec as record}
				{$T.record},
			{#/for}
		<br/>
		{#/for}
		<br/>
	{#/for}


</div>



{#/template MAIN}