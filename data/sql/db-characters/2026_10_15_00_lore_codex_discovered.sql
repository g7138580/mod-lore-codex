-- mod-lore-codex (acore_characters): what each character has discovered.

CREATE TABLE IF NOT EXISTS `mod_lore_codex_discovered` (
  `guid` INT UNSIGNED NOT NULL COMMENT 'character',
  `entry` INT UNSIGNED NOT NULL COMMENT 'mod_lore_codex_entry.ID',
  `time` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'unix time, 0 when credited by backfill',
  PRIMARY KEY (`guid`, `entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: discoveries per character';
