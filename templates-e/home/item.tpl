<tr class="tr-shadow">
	<td>{c2r-id}</td>
	<td>{c2r-title}</td>
	<td>{c2r-category}</td>
	<td>
		<label class="switch switch-default switch-success mr-2">
			<input type="checkbox" class="switch-input" {c2r-published} disabled="disabled">
			<span class="switch-label"></span>
			<span class="switch-handle"></span>
		</label>
	</td>
	<td title="{c2r-date-updated-label} : {c2r-date-updated}">{c2r-date-created}</td>
	<td>
		<div class="table-data-feature">
			<a href="{c2r-mdl-url}edit/{c2r-id}" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
				<i class="zmdi zmdi-edit"></i>
			</a>
			<a href="{c2r-mdl-url}delete/{c2r-id}" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
				<i class="zmdi zmdi-delete"></i>
			</a>
		</div>
	</td>
</tr>
<tr class="spacer"></tr>
