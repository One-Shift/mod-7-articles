<div class="articles">
	<div class="spacer all-15"></div>
	<div class="row">
		<div class="col-12 col-sm-12 col-md-5">
			<form name="sel-category" action="" method="post" class="w-100">
				<div class="col-6 col-sm-6 col-md-7 taleft float-left">
					<div class="form-group">
						<select name="categoryId" class="form-control">
							<option value="-1" selected>{{ category-filter-select }}</option>
							{{ filter-options }}
						</select>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-5 taleft float-left">
					<button type="submit" class="au-btn au-btn-icon au-btn--default" name="filterCategory"><i class="fas fa-filter"></i><div class="block all-15"></div>Filter</button>
				</div>
			</form>
		</div>
		<div class="col-12 col-sm-12 col-md-2">
			<!-- <form name="sel-per-page" class="" action="" method="get">
				<div class="input-group">
					<label for="per-page-selector">Per Page</label>
					<div class="block all-15"></div>
					<select id="per-page-selector" name="per-page" class="">
						<option selected value="25">25</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</div>
			</form> -->
		</div>
	</div>
	<div class="spacer sm-30"></div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-data2">
				<thead>
					<tr>
						<th>#</th>
						<th>{{ name }}</th>
						<th>{{ category }}</th>
						<th>{{ published }}</th>
						<th>{{ date }}</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					{{ list }}
				</tbody>
			</table>
		</div>
	</div>
	<div class="spacer all-30"></div>
	<div class="row">
		<div class="col-12 tacenter">
			<p>--</p>
		</div>
	</div>
</div>

<style>
	.table > tbody > tr > td { vertical-align: middle;  }}
</style>

<script src="{{ mdl-path }}/site-assets/js/script.js" charset="utf-8"></script>
<link rel="stylesheet" href="{{ mdl-path }}/site-assets/css/style.css">
