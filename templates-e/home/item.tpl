<div class="line row">
	<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 d-flex">
		<div class="row flex-grow-1">
			<div class="box id col-sm-4 col-md-4 col-lg-1">
				<p><strong>{c2r-id}</strong></p>
			</div>
			<div class="box col-sm-8 col-md-8 col-lg-4">
				<p><strong>{c2r-title}</strong></p>
			</div>
			<div class="box col-sm-4 col-md-4 col-lg-3">
				<p>{c2r-category}</p>
			</div>
			<div class="box col-sm-4 col-md-4 col-lg-2 published">
				<label class="switch">
					<input type="checkbox" {c2r-published}>
					<span class="slider round" data-id="{c2r-id}"></span>
				</label>
			</div>
			<div class="box date col-sm-4 col-md-4 col-lg-2">
				<p title="{c2r-date-updated-label} : {c2r-date-updated}">{c2r-date-created}</p>
			</div>
		</div>
	</div>
	<div class="action-list col-12 col-sm-12 col-md-12 col-lg-12 col-xl-3">
		<a href="{c2r-path-bo}/{c2r-lg}/{c2r-module-folder}/edit/{c2r-id}" class="btn btn-edit" role="button">
			<i class="fas fa-pencil-alt" aria-hidden="true"></i>
			<div class="block all-15"></div>{c2r-but-edit}
		</a>
		<a href="{c2r-path-bo}/{c2r-lg}/{c2r-module-folder}/delete/{c2r-id}" class="btn btn-del" role="button">
			<i class="fas fa-pencil-alt" aria-hidden="true"></i>
			<div class="block all-15"></div>{c2r-but-delete}
		</a>
	</div>
</div>
