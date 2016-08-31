
INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Condominio','com_tgriparti.condominio','{"special":{"dbtable":"#__tgriparti_condominio","key":"id","type":"Condominio","prefix":"TgripartiTable"}}', '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/condominio.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_tgriparti.condominio')
) LIMIT 1;

UPDATE `#__content_types` SET
	`type_title` = 'Condominio', 
	`table` = '{"special":{"dbtable":"#__tgriparti_condominio","key":"id","type":"Condominio","prefix":"TgripartiTable"}}', 
	`content_history_options` = '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/condominio.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'
WHERE (`type_alias` = 'com_tgriparti.condominio');

INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Nominativo','com_tgriparti.nominativo','{"special":{"dbtable":"#__tgriparti_nominativo","key":"id","type":"Nominativo","prefix":"TgripartiTable"}}', '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/nominativo.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"condomino","targetTable":"#__tgriparti_condominio","targetColumn":"id","displayColumn":"via"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_tgriparti.nominativo')
) LIMIT 1;

UPDATE `#__content_types` SET
	`type_title` = 'Nominativo', 
	`table` = '{"special":{"dbtable":"#__tgriparti_nominativo","key":"id","type":"Nominativo","prefix":"TgripartiTable"}}', 
	`content_history_options` = '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/nominativo.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"condomino","targetTable":"#__tgriparti_condominio","targetColumn":"id","displayColumn":"via"}]}'
WHERE (`type_alias` = 'com_tgriparti.nominativo');

INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Ricevuta','com_tgriparti.ricevuta','{"special":{"dbtable":"#__tgriparti_ricevuta","key":"id","type":"Ricevuta","prefix":"TgripartiTable"}}', '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/ricevuta.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"condominio","targetTable":"#__tgriparti_condominio","targetColumn":"id","displayColumn":"via"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_tgriparti.ricevuta')
) LIMIT 1;

UPDATE `#__content_types` SET
	`type_title` = 'Ricevuta', 
	`table` = '{"special":{"dbtable":"#__tgriparti_ricevuta","key":"id","type":"Ricevuta","prefix":"TgripartiTable"}}', 
	`content_history_options` = '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/ricevuta.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"condominio","targetTable":"#__tgriparti_condominio","targetColumn":"id","displayColumn":"via"}]}'
WHERE (`type_alias` = 'com_tgriparti.ricevuta');

INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Lettura','com_tgriparti.lettura','{"special":{"dbtable":"#__tgriparti_lettura","key":"id","type":"Lettura","prefix":"TgripartiTable"}}', '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/lettura.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"nominativo","targetTable":"#__tgriparti_nominativo","targetColumn":"id","displayColumn":"nome"},{"sourceColumn":"ripartizione","targetTable":"#__tgriparti_ricevuta","targetColumn":"id","displayColumn":"nome"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_tgriparti.lettura')
) LIMIT 1;

UPDATE `#__content_types` SET
	`type_title` = 'Lettura', 
	`table` = '{"special":{"dbtable":"#__tgriparti_lettura","key":"id","type":"Lettura","prefix":"TgripartiTable"}}', 
	`content_history_options` = '{"formFile":"administrator\/components\/com_tgriparti\/models\/forms\/lettura.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"nominativo","targetTable":"#__tgriparti_nominativo","targetColumn":"id","displayColumn":"nome"},{"sourceColumn":"ripartizione","targetTable":"#__tgriparti_ricevuta","targetColumn":"id","displayColumn":"nome"}]}'
WHERE (`type_alias` = 'com_tgriparti.lettura');
