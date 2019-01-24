$(document).ready(function() {

	$('.selectpicker').selectpicker();

	$(".switch").click(function(evt){
		evt.preventDefault();
		var item = $(this);
		var id = $($(this).find(".slider")).attr("data-id");

		$.get(
			path + "/backoffice/" + lg + "/7-articles/api/" + id + "?r=update",
			function(data) {
				data = JSON.parse(data);
				if (data.status) {
					if($($(item).find("input")).is(":checked") == true) {
						$($(item).find("input")).prop( "checked", false );
					} else {
						$($(item).find("input")).prop( "checked", true );
					}
				}
			}
		);

	});
});
