<tr class="tr-shadow">
	<td>{{ id }}</td>
	<td>{{ title }}</td>
	<td>{{ category }}</td>
	<td>
		<label class="switch switch-default switch-success mr-2">
			<input type="checkbox" class="switch-input" {{ published }} disabled="disabled">
			<span class="switch-label"></span>
			<span class="switch-handle"></span>
		</label>
	</td>
	<td title="{{ date-updated-label }} : {{ date-updated }}">{{ date-created }}</td>
	<td>
		<div class="table-data-feature">
			<a href="{{ mdl-url }}edit/{{ id }}" class="item" data-toggle="tooltip" data-placement="top" title="Edit">
				<i class="zmdi zmdi-edit"></i>
			</a>
			<a href="{{ mdl-url }}delete/{{ id }}" class="item" data-toggle="tooltip" data-placement="top" title="Delete">
				<i class="zmdi zmdi-delete"></i>
			</a>
		</div>
	</td>
</tr>
<tr class="spacer"></tr>
