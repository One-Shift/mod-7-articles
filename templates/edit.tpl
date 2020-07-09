<form name="add-category" action="" method="post">
	<div class="row">
		<div class="col-sm-8">
			<div class="card">
				<div class="card-body">
					<div class="content-tabs">
						{{ tabs-article-content }}
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
						<label for="inputParent">{{ parent }}</label>
						<select name="category-parent[]" id="inputParent" class="selectpicker bo3-form-control form-control" multiple data-live-search="true">
							<!-- <option value="-1" disabled selected>{{ select-option-parent }}</option>
							<option value="-1">{{ select-option-parent-no }}</option> -->
							{{ parent-options }}
						</select>
					</div>
					<div class="spacer all-15"></div>
					{{ user-select }}
					<div class="spacer all-15"></div>
					<!-- Category Date -->
					<div class="form-group">
						<label for="inputDate">{{ date }}</label>
						<input name="date" type="text" class="bo3-form-control form-control" id="inputDate" placeholder="{{ date-placeholder }}" value="{{ date-value }}">
					</div>
					<!-- END Category Date -->
					<div class="spacer all-15"></div>
					<!-- Category Code -->
					<div class="form-group">
						<label for="inputCode">{{ code }}</label>
						<textarea name="code" id="inputCode" class="bo3-form-control form-control" rows="3"  placeholder="{{ code-placeholder }}" style="resize: vertical;">{{ code-value }}</textarea>
					</div>
					<!-- END Category Code -->
					<div class="spacer all-15"></div>
					<!-- Category Published -->
					<div class="bo3-form-control custom-control custom-checkbox">
						<input type="checkbox" id="inputPublished" class="custom-control-input" name="published" {{ published-checked }} value="1"/>
						<label class="custom-control-label" for="inputPublished">{{ published }}</label>
					</div>
					<!-- END Category Published -->
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 tacenter">
			<button type="submit" class="au-btn au-btn-icon au-btn--green au-btn--block" name="save"><i class="fas fa-save"></i><span class="block all-15"></span>{{ but-submit }}</button>
			<div class="spacer all-30"></div>
		</div>
	</div>
</form>
<div class="row">
	<div class="col-sm-12">
		{{ plg-files }}
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.selectpicker').val('val', {{ val-array }});
		$('.selectpicker').selectpicker('val', {{ val-array }});
	});
</script>

<script src="{{ mdl-path }}/site-assets/js/script.js" charset="utf-8"></script>
<link rel="stylesheet" href="{{ mdl-path }}/site-assets/css/style.css">
