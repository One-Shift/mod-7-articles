<style>
.btn-lang.active {
	color: #28a745 !important;
	border: 1px solid #28a745 !important;
	background-color: #fff !important;
	outline: 0 !important;
	box-shadow: none !important;
}
</style>
<form name="add-category" action="" method="post">
	<div class="row">
		<div class="col-8 col-sm-8 col-md-8 col-lg-9 col-xl-9 float-left">
			<!-- Category Name & Text -->
			<div>
				{c2r-tabs-categories-name-description}
			</div>
			<!-- END Category Name & Text -->
		</div>
		<div class="col-4 col-sm-4 col-md-4 col-lg-3 col-xl-3 float-left">
			<!-- Category Parent -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<label for="inputParent">{c2r-parent}</label>
				<select name="category-parent" id="inputParent" class="form-control">
					<option value="-1" disabled selected>{c2r-select-option-parent}</option>
					<option value="-1">{c2r-select-option-parent-no}</option>
					{c2r-parent-options}
				</select>
			</div>
			<!-- END Category Parent -->

			<!-- Category Date -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<label for="inputDate">{c2r-date}</label>
				<input name="date" type="text" class="form-control" id="inputDate" placeholder="{c2r-date-placeholder}" value="{c2r-date-value}">
			</div>
			<!-- END Category Date -->

			<!-- Category Code -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<label for="inputCode">{c2r-code}</label>
				<textarea name="code" id="inputCode" class="form-control" rows="1"  placeholder="{c2r-code-placeholder}" style="resize: vertical;"></textarea>
			</div>
			<!-- END Category Code -->

			<!-- Category Code -->
			<div class="spacer all-15"></div>
			<div class="form-group">
				<input name="files-fallback" id="files-fallback" type="text" class="form-control">
			</div>
			<!-- END Category Code -->

			<!-- Category Published -->
			<div class="spacer all-15"></div>
			<div class="checkbox">
				<label><input type="checkbox" name="published" value="1"/> {c2r-published}</label>
			</div>
			<!-- END Category Published -->
		</div>
	</div>
	<div class="spacer all-30"></div>
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tacenter">
			<button type="submit" class="btn btn-success" name="save"><i class="fas fa-save"></i><span class="block all-15"></span>{c2r-but-submit}</button>
		</div>
	</div>
</form>
<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
	{c2r-plg-files}
</div>
