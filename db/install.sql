INSERT INTO `{{ prefix }}_modules` (`name`, `folder`, `code`, `icon`, `img`, `dropdown`, `sidebar`) VALUES ('{{ mod-name }}', '{{ mod-folder }}', '{"fa-icon": "fa-newspaper","img": "","sub-items": {"List": {"url": ""},"Add Article": {"url": "add"}},"sidebar": true,"dropdown": false}', 'fa-newspaper', '', 0, 1);

SET @last_id_in_table = LAST_INSERT_ID();

INSERT INTO `{{ prefix }}_modules_lang` (`codename`, `name`, `link_title`, `lang_id`, `module_id`, `module_type`) VALUES ('articles', 'Artigos', 'Ver Artigos', '1', @last_id_in_table, 'main'), ('articles', 'Articles', 'See Articles', '2', @last_id_in_table, 'main'), ('list-articles', 'Lista', 'Ver Lista', '1', @last_id_in_table, 'sub'), ('list-articles', 'List', 'See List', '2', @last_id_in_table, 'sub'), ('add-articles', 'Adicionar', 'Adicionar Artigos', '1', @last_id_in_table, 'sub'), ('add-articles', 'Add', 'Add Articles', '2', @last_id_in_table, 'sub');

INSERT INTO `{{ prefix }}_modules_submenu` (`name`, `link`, `module_ass`, `status`) VALUES ('list-articles', '', @last_id_in_table, 1), ('add-articles', 'add', @last_id_in_table, 1);

CREATE TABLE `{{ prefix }}_7_articles` (
	`id` int(11) NOT NULL,
	`code` text NOT NULL,
	`user_id` int(11) NOT NULL,
	`published` tinyint(1) NOT NULL,
	`date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `{{ prefix }}_7_articles_lang` (
    `id` int(11) NOT NULL,
    `article_id` int(11) NOT NULL,
    `lang_id` int(11) NOT NULL,
    `title` varchar(255) NOT NULL,
    `text` text NOT NULL,
    `meta-keywords` text NOT NULL,
    `meta-description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

ALTER TABLE `{{ prefix }}_7_articles`
	ADD PRIMARY KEY (`id`);

ALTER TABLE `{{ prefix }}_7_articles_lang`
	ADD PRIMARY KEY (`id`);

ALTER TABLE `{{ prefix }}_7_articles`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `{{ prefix }}_7_articles_lang`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
