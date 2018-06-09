{#template MAIN}
<table id="tbl_{$T.Name}" class="table table-bordered table-striped" >
	<thead>
		<tr>
			{#foreach $T.fields as field}
			<th>{$T.field} <button class="buttonGray" style="float:right;" onclick="deletecol(this)" >X</button></th>
			{#/for}
	      	<th></th>	
	    </tr>
	</thead>
	<tbody>
		{#foreach $T.data as row}		
			<tr>
				{#foreach $T.row as field}
					<td onclick="editvalue(this,'{$T.field.type}')">{$T.field.value}</td>
				{#/for}
				<td>
					<button class="buttonGray">Edit</button>
					<button class="buttonGray" onclick="del_row(this)" style="margin:5px;">Del</button>
				</td>
				
			</tr>
		{#/for}
	
	</tbody>
</table>


{#/template MAIN}

 
	
	 
		