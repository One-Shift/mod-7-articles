<?php

function update ($id) {
	$toReturn = [
		"status" => false,
		"message" => "",
		"object" => []
	];

	$article = new article();
	$article->setId($id);

	$toReturn["status"] = $article->updatePublished();

	return json_encode($toReturn);
}


switch ($_GET["r"]) {
	case 'update':
		$tpl = update($id);
		break;
	default:
		$tpl = "";
		break;
}
