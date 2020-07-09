<form class="tacenter" action="{{ bo-path }}/{{ lg }}/{{ module-folder }}/delete/{{ id }}" method="post">
	<div class="spacer all-15"></div>
	<div class="alert alert-danger d-block" role="alert"><i class="fas fa-exclamation-triangle"></i> {{ phrase }}</div>
	<button type="submit" name="submit" class="au-btn au-btn-icon au-btn--red">
		<i class="fas fa-trash-alt" aria-hidden="true"></i><span class="block all-15"></span>{{ del }}
	</button>
	<span class="block all-15"></span>
	<a href="{{ mdl-url }}" class="au-btn au-btn-icon au-btn--yellow" role="button">
		<i class="fas fa-undo"></i><span class="block all-15"></span>{{ cancel }}
	</a>
</form>
