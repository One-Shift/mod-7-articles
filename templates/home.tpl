<style>
	.table > tbody > tr > td { vertical-align: middle; }
</style>
<div id="articles" class="row">
	<div class="col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
		<div class="spacer all-15"></div>
		<div class="row">
			<form name="sel-category" action="" method="post" class="w-100">
				<div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 taleft float-left">
					<div class="form-group">
						<select name="categoryId" class="form-control">
							<option value="-1" selected>{c2r-category-filter-select}</option>
							{c2r-filter-options}
						</select>
					</div>
				</div>
				<div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 taleft float-left">
					<button type="submit" class="btn btn-primary" name="filterCategory"><i class="fas fa-filter"></i><div class="block all-15"></div>Filter</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 taright">
		<div class="spacer all-15"></div>
		<a href="{c2r-path-bo}/{c2r-lg}/{c2r-module-folder}/add/" class="btn btn-success btn-add" role="button">
			<i class="fas fa-plus" aria-hidden="true"></i><span class="block all-15"></span>{c2r-label-add-category}
		</a>
	</div>
</div>
<div class="spacer sm-30"></div>
<div class="row">
	<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
		<div class="line-header d-none d-xl-flex row">
			<div class="col-sm-9">
				<div class="row">
					<div class="block col-sm-1 tacenter">
						<strong>#</strong>
					</div>
					<div class="block col-sm-4">
						<strong>{c2r-name}</strong>
					</div>
					<div class="block col-sm-3">
						<strong>{c2r-category}</strong>
					</div>
					<div class="block col-sm-2 tacenter">
						<strong>{c2r-published}</strong>
					</div>
					<div class="block col-sm-2 tacenter">
						<strong>{c2r-date}</strong>
					</div>
				</div>
			</div>
			<div class="block col-sm-3 tacenter">
				<strong>Actions</strong>
			</div>
		</div>
		{c2r-list}
	</div>
</div>

<script src="{c2r-module-path}/site-assets/js/script.js" charset="utf-8"></script>
