<form name="add-article" action="" method="post">
	<div class="row">
		<div class="col-8 col-sm-8 col-md-8 col-lg-9 col-xl-9 float-left">
			<!-- Category Name & Text -->
			<div class="content-tabs">
				{c2r-tabs-categories-name-description}
			</div>
			<!-- END Category Name & Text -->
		</div>
		<div class="col-4 col-sm-4 col-md-4 col-lg-3 col-xl-3 float-left">
			<!-- Category Parent -->
			<div class="spacer all-60"></div>
			<div class="form-group">
				<label for="inputParent">{c2r-parent}</label>
				<select name="category-parent[]" id="inputParent" class="selectpicker bo3-form-control form-control" multiple data-live-search="true">
					<!-- <option value="-1" disabled selected>{c2r-select-option-parent}</option>
					<option value="-1">{c2r-select-option-parent-no}</option>-->
					{c2r-parent-options}
				</select>
			</div>
			<!-- END Category Parent -->

			<!-- Category Date -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<label for="inputDate">{c2r-date}</label>
				<input name="date" type="text" class="bo3-form-control form-control" id="inputDate" placeholder="{c2r-date-placeholder}" value="{c2r-date-value}">
			</div>
			<!-- END Category Date -->

			<!-- Category Code -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<label for="inputCode">{c2r-code}</label>
				<textarea name="code" id="inputCode" class="bo3-form-control form-control" rows="3"  placeholder="{c2r-code-placeholder}" style="resize: vertical;"></textarea>
			</div>
			<!-- END Category Code -->

			<!-- Category Code -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<input name="files-fallback" id="files-fallback" type="text" class="bo3-form-control form-control" readonly="readonly">
				<input name="files-fallback" id="files-fallback" type="hidden" class="bo3-form-control form-control">
			</div>
			<!-- END Category Code -->

			<!-- Category Published -->
			<div class="spacer all-15"></div>
			<div class="bo3-form-control custom-control custom-checkbox">
				<input type="checkbox" id="inputPublished" class="custom-control-input" name="published" {c2r-published-checked} value="1"/>
				<label class="custom-control-label" for="inputPublished">{c2r-published}</label>
			</div>
			<!-- END Category Published -->
		</div>
	</div>
	<div class="spacer all-30"></div>
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tacenter">
			<button type="submit" class="btn btn-success btn-submit" name="save"><i class="fas fa-save"></i><span class="block all-15"></span>{c2r-but-submit}</button>
		</div>
	</div>
</form>
<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
	{c2r-plg-files}
</div>
