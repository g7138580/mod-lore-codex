-- mod-lore-codex (acore_world): codex entries and what unlocks them.

CREATE TABLE IF NOT EXISTS `mod_lore_codex_entry` (
  `ID` INT UNSIGNED NOT NULL COMMENT 'by convention the zone id times 100, plus n',
  `Kind` TINYINT UNSIGNED NOT NULL COMMENT '0 zone, 1 place, 2 person, 3 story',
  `Zone` INT UNSIGNED NOT NULL COMMENT 'AreaTable zone the entry is filed under',
  `SortOrder` SMALLINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'order within its kind',
  `Faction` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 both, 1 Alliance, 2 Horde',
  `RequiredState` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'mod-individual-progression state before it can be discovered',
  `Title` VARCHAR(80) NOT NULL,
  `Body` TEXT NOT NULL,
  `Sources` TEXT NOT NULL COMMENT 'research notes, never sent to players',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: codex entries';

CREATE TABLE IF NOT EXISTS `mod_lore_codex_trigger` (
  `Entry` INT UNSIGNED NOT NULL,
  `Type` TINYINT UNSIGNED NOT NULL COMMENT '1 area, 2 talk to creature, 3 kill creature, 4 accept quest, 5 turn in quest',
  `Value` INT UNSIGNED NOT NULL COMMENT 'AreaTable id, creature entry or quest id',
  PRIMARY KEY (`Type`, `Value`, `Entry`),
  KEY `idx_entry` (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: what unlocks each entry';
