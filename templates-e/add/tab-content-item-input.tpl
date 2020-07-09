<div role="tabpanel" class="tab-pane fade {{ class }}" id="content-{{ nr }}">
	<div class="spacer all-15"></div>
	<div class="form-group">
		<label for="inputTitle-{{ nr }}">{{ label-title }}</label>
		<input type="text" class="form-control" id="inputTitle-{{ nr }}" name="title[]" placeholder="{{ placeholder-title }}" required>
	</div>
	<div class="spacer all-15"></div>
	<div class="form-group">
		<label for="inputContent-{{ nr }}">{{ label-content }}</label>
		<textarea id="inputContent-{{ nr }}" class="form-control editor" rows="10" name="content[]"  placeholder="{{ placeholder-text }}" required=""></textarea>
	</div>
	<div class="spacer all-30"></div>
	<div class="form-group">
		<label for="inputMetaKeyWords-{{ nr }}">{{ label-meta-keywords }}</label>
		<input id="inputMetaTags-{{ nr }}" type="text" class="form-control" name="meta-keywords[]" value="">
	</div>
	<div class="spacer all-30"></div>
	<div class="form-group">
		<label for="inputMetaDescription-{{ nr }}">{{ label-meta-description }}</label>
		<textarea id="inputMetaDescription-{{ nr }}" name="meta-description[]" rows="1" class="form-control"></textarea>
	</div>
</div>
