-- mod-lore-codex (acore_world): the categories. Kinds 4 (peoples and factions) and 5 (history: events, ages, powers
-- and relics), a hint for locked entries, and related entries.

ALTER TABLE `mod_lore_codex_entry`
    MODIFY COLUMN `Kind` TINYINT UNSIGNED NOT NULL COMMENT '0 zone, 1 place, 2 person, 3 story, 4 people or faction, 5 history',
    MODIFY COLUMN `Zone` INT UNSIGNED NOT NULL COMMENT 'AreaTable zone the entry is filed under; 0 for peoples, factions and history',
    MODIFY COLUMN `SortOrder` SMALLINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'order within its kind; for history, its place in time',
    ADD COLUMN `Hint` VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'shown while the entry is locked; empty for one built from its zone' AFTER `Body`;

CREATE TABLE IF NOT EXISTS `mod_lore_codex_related` (
  `Entry` INT UNSIGNED NOT NULL,
  `Related` INT UNSIGNED NOT NULL COMMENT 'shown as a link on the entry once the character knows it',
  `SortOrder` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`Entry`, `Related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: entries linked from an entry';
