<div class="row">
	<div class="col-md-12">
		{{ changelog }}
	</div>
</div>
<div class="spacer30"></div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12">
		<form method="post">
			<div class="form-group tacenter">
				<label>{{ lg-install }}</label>
			</div>
			<div class="form-group tacenter">
				<button type="submit" class="btn btn-success" name="submitInstall">{{ lg-yes }}</button>
				<a href="{{ path-bo }}/{{ lg }}/home/" type="button" class="btn btn-danger">{{ lg-no }}</a>
			</div>
		</form>
	</div>
</div>

