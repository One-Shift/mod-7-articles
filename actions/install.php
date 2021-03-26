<?php

if (!is_writable("class/")) {
	$mdl = "Class Folder is not writable";
} else {
	if (isset($_POST["submitInstall"]) && c9_user::isOwner($authData)) {
		$sql = bo3::c2r([
			"mod-name" => $cfg->mdl->name,
			"mod-folder" => $cfg->mdl->folder,
			"prefix" => $cfg->db->prefix,
		], bo3::mdl_load("db/install.sql"));

		if ($db->multi_query($sql) != FALSE) {
			while ($db->more_results() && $db->next_result()) {;} // flush multi_queries

			copy("modules/{$cfg->mdl->folder}/install/class.7-articles.php", "class/class.7-articles.php");

			$mdl = bo3::c2r([
				"lg-message" => $lang["install"]["success"]
			], bo3::mdl_load("templates-e/install/message.tpl"));
		} else {
			$mdl = bo3::c2r([
				"lg-message" => $lang["install"]["failure"]." : ".$db->error
			], bo3::mdl_load("templates-e/install/message.tpl"));
		}
	} else {
		$mdl = bo3::c2r([
			"changelog" => bo3::mdl_load("templates/changelog.tpl"),
			"lg-install" => $lang["install"]["question"],
			"lg-yes" => $lang["common"]["a-yes"],
			"lg-no" => $lang["common"]["a-no"]
		], bo3::mdl_load("templates-e/install/form.tpl"));
	}
}

include "pages/module-core.php";
