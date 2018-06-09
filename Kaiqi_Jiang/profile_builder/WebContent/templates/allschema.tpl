{#template MAIN}
<div id="search_{$T.Name}" class="searchname">
	<h4>Name: {$T.Name}</h4>
</div>
<div id="searchdesc_{$T.Name}" class="searchdes">
	Description: {$T.Description}
</div>

<table id="tblsearch_{$T.Name}" class="table table-hover tblsearch">
	<tbody>
		{#param name=count value=0}
		{#foreach $T.data as row}
			
				
		<tr>
			<td>Fields:<br/>Source: {$T.Source[$P.count]}</td>
			{#foreach $T.row as object}
			<td>{$T.object.Name}<br/>{$T.object.type}</td>
			{#/for}
				
				
		</tr>
			
		{#param name=count value=$P.count+1}	
		{#/for}


	</tbody>

</table>





{#/template MAIN}