<?php

if (!isset($_POST["save"])) {

	$nav_tpl = bo3::mdl_load("templates-e/add/nav-tab-item.tpl");
	$nav_content_tpl = bo3::mdl_load("templates-e/add/tab-content-item-input.tpl");
	$option_item_tpl = bo3::mdl_load("templates-e/add/option-item.tpl");
	$tabs = "";
	$nav_content = "";

	$i = 0;
	foreach ($cfg->lg as $index => $lg) {
		if ($lg[0]) {
			$tabs .= bo3::c2r(
				[
					"class" => ($i == 0 ? "active" : ""),
					"nr" => $index,
					"lang-name" => $lg[2]
				],
				$nav_tpl
			);

			$nav_content .= bo3::c2r(
				[
					"class" => ($i == 0 ? "show active" : ""),
					"nr" => $index,
					"label-name" => $mdl_lang["label"]["name"],
					"label-description" => $mdl_lang["label"]["description"],
					"place-holder-name" => "",
					"place-holder-text" => ""
				],
				$nav_content_tpl
			);
			$i++;
		}
	}

	/*------------------------------------------*/

	function recursiveWayGet($id, $i = 0, &$data = []) {
		$a = new category();
		$a->setLangId(1);
		$a->setParentId($id);
		$a = $a->returnChildCategories();

		foreach ($a as $item) {
			$tmp = [];
			$tmp["id"] = $item->id;
			$tmp["title"] = $item->title;
			$tmp["level"] = $i;

			$data[] = $tmp;

			if ($item->nr_sub_cats > 0 ){
				recursiveWayGet($item->id, $i+1, $data);
			}
		}
	}

	recursiveWayGet(-1, 0, $data);

	if(!empty($data)) {
		foreach ($data as $item) {
			if (!isset($parent_options)) {
				$parent_options = "";
			}

			$parent_options .= bo3::c2r(
				[
					"option-id" => $item["id"],
					"option" => sprintf("%s> %s", str_repeat("-", $item["level"]), $item["title"])
				],
				$option_item_tpl
			);
		}
	}

	/*------------------------------------------*/

	$mdl = bo3::c2r(
		[
			"content" => bo3::mdl_load("templates-e/add/form.tpl"),

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
		],
		bo3::mdl_load("templates/add.tpl")
	);
} else {
	$article = new article();

	$article->setContent($_POST["name"], $_POST["description"]);
	$article->setCategoryId($_POST["category-parent"]);
	$article->setCode($_POST["code"]);
	$article->setDate($_POST["date"]);
	$article->setDateUpdate();
	$article->setPublished(isset($_POST["published"]) ? $_POST["published"] : 0);
	$article->setUserId($authData["id"]);

	if ($article->insert()) {
		$textToPrint = $mdl_lang["add"]["success"];

		$obj = $article->returnObject();

		$file = new file();
		$file->fallback($obj["id"], $_POST["files-fallback"]);
	} else {
		$textToPrint = $mdl_lang["add"]["failure"];
	}

	$mdl = bo3::c2r(["content" => (isset($textToPrint)) ? $textToPrint : ""], bo3::mdl_load("templates/result.tpl"));
}

bo3::importPlg ("files", ["module" => "article"]);

include "pages/module-core.php";
