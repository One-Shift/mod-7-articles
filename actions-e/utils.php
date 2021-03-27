<?php

/**
 * @param $parent_id <int> of a Category
 * @param int $i <int> represents the deep level
 * @param array $selected_id
 * @return string
 */
function recursiveWayGet ($parent_id = -1, $i = -1, $selected_id = []) {
	global $option_item_tpl, $lg;

	$option_item_tpl = bo3::mdl_load("templates-e/home/option-item.tpl");

	$a = new c8_category();
	$a->setLangId($lg);
	$a->setParentId($parent_id);
	$a = $a->returnChildCategories();

	$i++;

	$to_return = "";

	foreach ($a as $item) {
		$to_return .= bo3::c2r([
			"option-id" => $item->id,
			"option" => sprintf("%s> %s", str_repeat("-", $i), $item->title),
			"selected" => in_array($item->id, $selected_id) ? "selected" : ""
		], $option_item_tpl);


		if ($item->nr_sub_cats > 0) {
			$to_return .= recursiveWayGet($item->id, $i);
		}

		return $to_return;
	}
}