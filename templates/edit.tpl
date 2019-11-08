<form name="add-category" action="" method="post">
	<div class="row">
		<div class="col-sm-8">
			<div class="card">
				<div class="card-body">
					<div class="content-tabs">
						{c2r-tabs-article-content}
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="card">
				<div class="card-header">
					<strong>Options</strong>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="inputParent">{c2r-parent}</label>
						<select name="category-parent[]" id="inputParent" class="selectpicker bo3-form-control form-control" multiple data-live-search="true">
							<!-- <option value="-1" disabled selected>{c2r-select-option-parent}</option>
							<option value="-1">{c2r-select-option-parent-no}</option> -->
							{c2r-parent-options}
						</select>
					</div>
					<div class="spacer all-15"></div>
					{c2r-user-select}
					<div class="spacer all-15"></div>
					<!-- Category Date -->
					<div class="form-group">
						<label for="inputDate">{c2r-date}</label>
						<input name="date" type="text" class="bo3-form-control form-control" id="inputDate" placeholder="{c2r-date-placeholder}" value="{c2r-date-value}">
					</div>
					<!-- END Category Date -->
					<div class="spacer all-15"></div>
					<!-- Category Code -->
					<div class="form-group">
						<label for="inputCode">{c2r-code}</label>
						<textarea name="code" id="inputCode" class="bo3-form-control form-control" rows="3"  placeholder="{c2r-code-placeholder}" style="resize: vertical;">{c2r-code-value}</textarea>
					</div>
					<!-- END Category Code -->
					<div class="spacer all-15"></div>
					<!-- Category Published -->
					<div class="bo3-form-control custom-control custom-checkbox">
						<input type="checkbox" id="inputPublished" class="custom-control-input" name="published" {c2r-published-checked} value="1"/>
						<label class="custom-control-label" for="inputPublished">{c2r-published}</label>
					</div>
					<!-- END Category Published -->
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tacenter">
			<button type="submit" class="btn btn-submit btn-success btn-block" name="save"><i class="fas fa-save"></i><span class="block all-15"></span>{c2r-but-submit}</button>
			<div class="spacer all-30"></div>
		</div>
	</div>
</form>
<div class="row">
	<div class="col-sm-12">
		{c2r-plg-files}
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.selectpicker').val('val', {c2r-val-array});
		$('.selectpicker').selectpicker('val', {c2r-val-array});
	});
</script>

<script src="{c2r-mdl-path}/site-assets/js/script.js" charset="utf-8"></script>
<link rel="stylesheet" href="{c2r-mdl-path}/site-assets/css/style.css">
