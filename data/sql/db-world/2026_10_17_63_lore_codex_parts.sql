-- mod-lore-codex (acore_world): entries in parts. An entry's Body is what a character reads first;
-- its parts add to it in order. A part with triggers of its own unlocks when one of them fires (the
-- codex says the entry was updated); a part without triggers always shows with its entry. MinState
-- and MaxState limit a part to some mod-individual-progression states and are ignored without it.

CREATE TABLE IF NOT EXISTS `mod_lore_codex_part` (
  `Entry` INT UNSIGNED NOT NULL COMMENT 'mod_lore_codex_entry.ID',
  `Part` TINYINT UNSIGNED NOT NULL COMMENT '1, 2, ... in reading order',
  `MinState` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'first mod-individual-progression state it shows in',
  `MaxState` TINYINT UNSIGNED NOT NULL DEFAULT 255 COMMENT 'last mod-individual-progression state it shows in',
  `Body` TEXT NOT NULL,
  `Sources` TEXT NOT NULL COMMENT 'research notes, never sent to players',
  PRIMARY KEY (`Entry`, `Part`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='mod-lore-codex: the later parts of entries';

ALTER TABLE `mod_lore_codex_trigger`
  ADD COLUMN `Part` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 unlocks the entry, n unlocks part n (and the entry)' AFTER `Value`,
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (`Type`, `Value`, `Entry`, `Part`);
