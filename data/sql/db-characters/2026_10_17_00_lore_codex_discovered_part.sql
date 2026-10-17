-- mod-lore-codex (acore_characters): the entry parts each character has earned.

CREATE TABLE IF NOT EXISTS `mod_lore_codex_discovered_part` (
  `guid` INT UNSIGNED NOT NULL COMMENT 'character',
  `entry` INT UNSIGNED NOT NULL COMMENT 'mod_lore_codex_part.Entry',
  `part` TINYINT UNSIGNED NOT NULL COMMENT 'mod_lore_codex_part.Part',
  `time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'unix time, 0 when credited by backfill',
  PRIMARY KEY (`guid`, `entry`, `part`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: entry parts earned per character';
