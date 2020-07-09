<tr>
	<td>{{ id }}</td>
	<td>{{ title }}</td>
	<td>{{ category }}</td>
	<td class="sm-tacenter"><i class="fa {{ published }}" aria-hidden="true"></i></td>
	<td title="{{ date-updated-label }} : {{ date-updated }}">{{ date-created }}</td>
	<td class="md-taright xs-tacenter">
		<a href="{{ mdl-url }}edit/{{ id }}" class="btn btn-edit" role="button">
			<i class="fa fa-pencil" aria-hidden="true"></i>
			<span class="sm-block15 xs-block15"></span>
			{{ but-edit }}
		</a>
		<a href="{{ mdl-url }}delete/{{ id }}" class="btn btn-cancel" role="button">
			<i class="fa fa-trash" aria-hidden="true"></i>
			<span class="sm-block15 xs-block15"></span>
			{{ but-delete }}
		</a>
	</td>
</tr>
