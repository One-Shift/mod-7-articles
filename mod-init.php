<?php

/**
 * @var stdClass $cfg
 * @var array $mdl_lang
 * @var string $lg_s
 * @var string $a
 */

$cfg->mdl = new stdClass();
$cfg->mdl->name = "Articles";
$cfg->mdl->folder = "mod-7-articles";
$cfg->mdl->path = "{$cfg->system->path_bo}/modules/{$cfg->mdl->folder}/";
$cfg->mdl->version = "1.1.0";
$cfg->mdl->developer = "Carlos Santos";
$cfg->mdl->contact = "carlos@one-shift.com";
$cfg->mdl->dbTables = ["7_articles", "7_articles_lang"];

// load language for module
if (file_exists("modules/{$cfg->mdl->folder}/languages/{$lg_s}.ini")) {
	$mdl_lang = parse_ini_file("modules/{$cfg->mdl->folder}/languages/{$lg_s}.ini", true);
} else {
	if (file_exists("modules/{$cfg->mdl->folder}/languages/en.ini")) {
		$mdl_lang = parse_ini_file("modules/{$cfg->mdl->folder}/languages/en.ini", true);
	}
}

// check if this module is installed
if (bo3::dbTableExists($cfg->mdl->dbTables) == FALSE || bo3::mdlInstalled($cfg->mdl->folder) == FALSE) {
	$a = "install";
}

/* action controller */
if ($a == null && $a != "install") {
	// if action doesn't exist, system sent you to module homepage
	include "modules/{$cfg->mdl->folder}/actions/home.php";
} else {
	$pg_file = "modules/{$cfg->mdl->folder}/actions/{$a}.php";
	if (file_exists($pg_file)) {
		// if exist an action response
		include $pg_file;
	} else {
		// if doesn't exist an action response, system sent you to 404
		header("Location: {$cfg->system->path_bo}/0/{$lg_s}/404/");
	}
}
