<?php

/**
 * @var stdClass $cfg
 * @var mysqli $db
 * @var stdClass $authData
 * @var array $lang
 * @var array $mdl_lang
 * @var string $lg_s
 * @var int $lg
 * @var string $pg
 * @var int $id
 * @var string $a
 */

$line_tpl = bo3::mdl_load("templates-e/home/table-row.tpl");
$item_tpl = bo3::mdl_load("templates-e/home/item.tpl");
$option_item_tpl = bo3::mdl_load("templates-e/home/option-item.tpl");

require bo3::mdl_e("actions-e/utils.php");

$categories_list = recursiveWayGet(-1, -1, isset($_POST["categoryId"]) ? [$_POST["categoryId"]] : []);

$articles = new c7_article();
$articles->setLangId($lg);

if (isset($_POST["filterCategory"]) && !empty($_POST["categoryId"]) && $_POST["categoryId"] != "-1") {
	$articles->setCategoryId($_POST["categoryId"]);
	$articles = $articles->returnArticlesByCategory("", "bc.date ASC, bcl.title ASC", null);
} else {
	$articles = $articles->returnAllArticles();
}

if (is_array($articles) && count($articles) > 0) {
	foreach ($articles as $article) {
		if (!isset($table_items)) {
			$table_items = "";
		}

		if (!isset($list)) {
			$list = "";
		}

		$categories = "";

		if (!empty($article->categories_rel) && is_array($article->categories_rel)) {
			foreach ($article->categories_rel as $c => $cat) {
				$category = new c8_category();
				$category->setLangId($lg);
				$category->setId($cat);
				$this_category = $category->returnOneCategory();

				if ($c == (count($article->categories_rel) - 1)) {
					$categories .= "{$this_category->title}";
				} else {
					$categories .= "{$this_category->title}, ";
				}

			}
		}

		$list .= bo3::c2r([
			"id" => $article->id,
			"title" => strip_tags($article->title),
			"category" => (!empty($categories)) ? $categories : "--",
			"published" => ($article->published) ? "checked" : "",
			"date-created" => date('Y-m-d', strtotime($article->date)),
			"date-updated-label" => $mdl_lang["label"]["date-updated"],
			"date-updated" => $article->date_update,
			"but-view" => $mdl_lang["label"]["but-view"],
			"but-edit" => $mdl_lang["label"]["but-edit"],
			"but-delete" => $mdl_lang["label"]["but-delete"],
		], $item_tpl);
	}
}

if (!isset($list)) {
	$message = bo3::c2r(["message" => $mdl_lang["message"]["empty"]], bo3::mdl_load("templates/message.tpl"));
}

$mdl_action_list = bo3::c2r([
	"label-add-article" => $mdl_lang["label"]["add-article"]
], bo3::mdl_load("templates-e/action-list.tpl"));


$mdl = bo3::c2r([
	"category-filter-select" => $mdl_lang["label"]["category-filter-select"],
	"filter-options" => (isset($categories_list)) ? $categories_list : "",
	"name" => $mdl_lang["label"]["name"],
	"category" => $mdl_lang["label"]["category"],
	"section" => $mdl_lang["label"]["type"],
	"parent-nr" => $mdl_lang["label"]["parent-nr"],
	"published" => $mdl_lang["label"]["published"],
	"date" => $mdl_lang["label"]["date"],
	//"table-body" => (isset($table_items)) ? $table_items : "",
	"list" => (isset($list)) ? $list : $message
], bo3::mdl_load("templates/home.tpl"));

include "pages/module-core.php";
