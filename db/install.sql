INSERT INTO `{{ prefix }}_modules` (`name`, `folder`, `code`) VALUES ('{{ mod-name }}', '{c2r-mod-folder}', '{\r\n	\"fa-icon\": \"fa-newspaper\",\r\n	\"img\": \"\",\r\n	\"sub-items\": {\r\n		\"List\": {\r\n			\"url\": \"\"\r\n		},\r\n		\"Add Article\": {\r\n			\"url\": \"add\"\r\n		}\r\n	},\r\n\"sidebar\": true,\r\n\"dropdown\": false\r\n}');

CREATE TABLE `{{ prefix }}_7_articles` (
	`id` int(11) NOT NULL,
	`code` text NOT NULL,
	`category_id` int(11) NOT NULL,
	`user_id` int(11) NOT NULL,
	`published` tinyint(1) NOT NULL,
	`date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `{{ prefix }}_7_articles_lang` (
	`id` int(11) NOT NULL,
	`article_id` int(11) NOT NULL,
	`lang_id` int(11) NOT NULL,
	`title` varchar(255) NOT NULL,
	`text` text NOT NULL,
	`meta-keywords` text NOT NULL,
	`meta-description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `{{ prefix }}_7_articles`
	ADD PRIMARY KEY (`id`);

ALTER TABLE `{{ prefix }}_7_articles_lang`
	ADD PRIMARY KEY (`id`);

ALTER TABLE `{{ prefix }}_7_articles`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `{{ prefix }}_7_articles_lang`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
