DELETE FROM `{{ prefix }}_modules` WHERE `folder` = '{{ mod-folder }}';

DROP TABLE IF EXISTS `{{ prefix }}_7_articles`;
DROP TABLE IF EXISTS `{{ prefix }}_7_articles_lang`;
