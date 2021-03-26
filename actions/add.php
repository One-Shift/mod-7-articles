<?php

/**
 * @var stdClass $cfg
 * @var stdClass $authData
 * @var array $lang
 * @var array $mdl_lang
 * @var string $lg_s
 * @var int $lg
 * @var string $pg
 * @var int $id
 * @var string $a
 */

/**
 * @param $parent_id <int> of a Category
 * @param $i <int> represents the deep level
 * @return string
 */
function recursiveWayGet ($parent_id, $i = 0) {
	global $parent_options, $option_item_tpl, $article_result, $lg;

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
			"selected" => isset($article_result[1]->categories_rel) &&  in_array($item->id, $article_result[1]->categories_rel) ? "selected" : ""
		], $option_item_tpl);


		if ($item->nr_sub_cats > 0) {
			$to_return .= recursiveWayGet($item->id, $i);
		}

		return $to_return;
	}
}

if (!isset($_POST["save"])) {
	$nav_tpl = bo3::mdl_load("templates-e/add/nav-tab-item.tpl");
	$nav_content_tpl = bo3::mdl_load("templates-e/add/tab-content-item-input.tpl");
	$option_item_tpl = bo3::mdl_load("templates-e/add/option-item.tpl");
	$tabs = "";
	$nav_content = "";

	$i = 0;
	foreach ($cfg->lg as $index => $lg) {
		if ($lg[0]) {
			$tabs .= bo3::c2r([
				"class" => ($i == 0 ? "active" : ""),
				"nr" => $lg[1],
				"lang-name" => $lg[2]
			], $nav_tpl);

			$nav_content .= bo3::c2r([
				"class" => ($i == 0 ? "show active" : ""),
				"nr" => $lg[1],
				"label-title" => $mdl_lang["label"]["title"],
				"label-content" => $mdl_lang["label"]["content"],
				"label-meta-keywords" => $mdl_lang["label"]["meta-keywords"],
				"label-meta-description" => $mdl_lang["label"]["meta-description"],
				"placeholder-title" => $mdl_lang["label"]["placeholder-title"],
				"placeholder-text" => $mdl_lang["label"]["placeholder-text"],
				"lang-name" => $lg[2]
			], $nav_content_tpl);

			$i++;
		}
	}

	# Retrieve a list of all Main Categories
	$mainCategories = new c8_category();
	$mainCategories->setLangId($lg);
	$allCats = $mainCategories->returnAllMainCategories();

	/* look for the category bind to this article */
	foreach ($allCats as $item) {
		if (!isset($parent_options)) {
			$parent_options = "";
		}

		$parent_options .= bo3::c2r([
			"option-id" => $item->id,
			"option" => $item->title,
			"selected" => isset($article_result[1]->categories_rel) &&  in_array($item->id, $article_result[1]->categories_rel) ? "selected" : ""
		], $option_item_tpl);

		$parent_options .= recursiveWayGet($item->id);
	}

	/*------------------------------------------*/

	$mdl = bo3::c2r([
		//"content" => bo3::mdl_load("templates-e/add/form.tpl"),

		"tabs-categories-name-description" => bo3::mdl_load("templates-e/add/tabs.tpl"),

		"nav-tabs-items" => $tabs,
		"tab-content-items" => $nav_content,

		"type" => $mdl_lang["label"]["type"],
		"select-option-type" => $mdl_lang["form"]["option-type"],
		"parent" => $mdl_lang["label"]["parent"],
		"select-option-parent" => $mdl_lang["form"]["option-parent"],
		"select-option-parent-no" => $mdl_lang["form"]["option-parent-no"],
		"parent-options" => (isset($parent_options)) ? $parent_options : "",
		"date" => $mdl_lang["label"]["date"],
		"date-placeholder" => $mdl_lang["form"]["date-placeholder"],
		"date-value" => date("Y-m-d H:i:s"),
		"code" => $mdl_lang["label"]["code"],
		"code-placeholder" => $mdl_lang["label"]["code-placeholder"],
		"published" => $mdl_lang["label"]["published"],
		"but-submit" => $mdl_lang["label"]["but-submit"]
	], bo3::mdl_load("templates/add.tpl"));
} else {
	$article = new c7_article();

	$article->setContent($_POST["title"], $_POST["content"], $_POST["meta-keywords"], $_POST["meta-description"]);
	$article->setCategories(isset($_POST["category-parent"]) ? $_POST["category-parent"] : []);
	$article->setCode($_POST["code"]);
	$article->setDate($_POST["date"]);
	$article->setPublished(isset($_POST["published"]) ? $_POST["published"] : 0);
	$article->setUserId($authData->id);

	if ($article->insert()) {
		$textToPrint = $mdl_lang["add"]["success"];
		$status = TRUE;

		$obj = $article->returnObject();

		$file = new c4_file();
		$file->fallback($obj["id"], $_POST["files-fallback"]);
	} else {
		$textToPrint = $mdl_lang["add"]["failure"];
		$status = FALSE;
	}

	$mdl = bo3::c2r([
		"content" => (isset($textToPrint)) ? $textToPrint : "",
		"back-list" => $mdl_lang["result"]["back-list"],
		"new-article" => $mdl_lang["result"]["new-article"],
		"edit-mode" => $mdl_lang["result"]["edit-mode"],
		"add-active" => $a != "add" ? "d-none" : "",
		"edit-active" => $a != "edit" ? "d-none" : "",
		"status" => ($status == TRUE) ? "success" : "danger"
	], bo3::mdl_load("templates/result.tpl"));
}

bo3::importPlg ("files", ["module" => "article"]);

include "pages/module-core.php";
