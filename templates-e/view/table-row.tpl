<tr>
    <td>{{ id }}</td>
    <td>{{ title }}</td>
    <td>{{ category-section }}</td>
    <td>{{ parent-nr }}</td>
    <td>{{ published }}</td>
    <td title="{{ date-updated-label }} : {{ date-updated }}">{{ date-created }}</td>
    <td class="taright">
        <a href="{{ path-bo }}/{{ lg }}/categories/view/{{ id }}" class="btn btn-add{{ hide-but }}" role="button">
			<i class="fa fa-eye" aria-hidden="true"></i><div class="block all-15"></div>{{ but-view }}
		</a>
        <a href="{{ path-bo }}/{{ lg }}/categories/edit/{{ id }}" class="btn btn-edit" role="button">
			<i class="fa fa-pencil" aria-hidden="true"></i><div class="block all-15"></div>{{ but-edit }}
		</a>
        <a href="{{ path-bo }}/{{ lg }}/categories/delete/{{ id }}" class="btn btn-cancel{{ show-but }}" role="button">
			<i class="fa fa-pencil" aria-hidden="true"></i><div class="block all-15"></div>{{ but-delete }}
		</a>
    </td>
</tr>
