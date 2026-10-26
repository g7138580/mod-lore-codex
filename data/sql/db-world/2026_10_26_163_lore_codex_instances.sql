-- mod-lore-codex (acore_world): the reorganized dungeons and raids, with the category parts they add.

-- Ahn'kahet: The Old Kingdom
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 449400 AND 449499;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 449400 AND 449499;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 449400 AND 449499;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 449400 AND 449499;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(449400, 0, 4494, 0, 0, 13, 'Ahn''kahet: The Old Kingdom', 'Ahn''kahet, the Old Kingdom, lies far beneath Azjol-Nerub, the ancient city from which the Nerubians came. The Scourge''s Ahn''kahar hold its upper halls, web winders, slashers and spell flingers among great crawling beasts, while a San''layn prince keeps watch unseen. Deeper still the caverns turn strange: robed cultists gather in the dark, and beings with no faces stand among them.', '', 'Ahn''kahet spawns (map 619); Ahn''kahet quest 13187; creature_text 29308'),
(449401, 2, 4494, 0, 0, 13, 'Jedoga Shadowseeker', 'Jedoga Shadowseeker leads the Twilight''s Hammer in Ahn''kahet, here on the very borders of her master''s domain. She promises her cultists immortality if they pledge themselves fully to Yogg-Saron, calls the devoted forward to be sacrificed as gifts for him, and swears that the elements will rise against the civilized world and only the faithful will be spared.', '', 'creature_text 29310, 30385'),
(449402, 2, 4494, 0, 0, 13, 'Herald Volazj', 'Herald Volazj is one of the Faceless, the leader of the Old God''s creatures in Ahn''kahet. He speaks mostly in a tongue no one should understand, and when he speaks plainly it is of them: they who dine on lost souls and know only hunger, who do not die and do not live, for they are outside the cycle. Where one falls, he promises, many shall take its place.', '', 'Ahn''kahet quests 13187, 13255; creature_text 29311');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(449400, 1, 0, 255, 'Fighting the Scourge, the Nerubians dug deeper as they lost ground, and in desperation they dug too deep. They exposed a tendril of an Old God''s will, the Faceless, and caught between two enemies they lost the war and their home.', 'Ahn''kahet spawns (map 619); Ahn''kahet quest 13187; creature_text 29308'),
(449400, 2, 0, 255, 'Prince Taldaram of the San''layn called himself the watcher unseen. He hungered for warm blood after too long without it, and died still thirsting.', 'Ahn''kahet spawns (map 619); Ahn''kahet quest 13187; creature_text 29308');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(449400, 1, 4494, 0),
(449401, 3, 29310, 0),
(449402, 3, 29311, 0),
(449402, 4, 13187, 0),
(449400, 4, 13187, 1),
(449400, 3, 29308, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(449400, 427700, 0),
(449400, 90000080, 1),
(449400, 449401, 2),
(449401, 90000009, 0),
(449401, 449400, 1),
(449401, 449402, 2),
(449402, 449400, 0),
(449402, 449401, 1);

-- Temple of Ahn'Qiraj
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 342800 AND 342899;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 342800 AND 342899;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 342800 AND 342899;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 342800 AND 342899;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(342800, 0, 3428, 0, 0, 4, 'Temple of Ahn''Qiraj', 'The Temple of Ahn''Qiraj is the heart of the qiraji city, a vast temple sunk into the earth where the insect empire keeps its holiest halls and its masters, guarded by battleguards who sentence trespassers in the name of the laws of the Ancients. Dragons of the blue, red and green flights wait at its entrance, and deeper in, the qiraji prepare, as their prophet cries, for the return of the ancient ones.', '', 'creature_text 15263; Vethsera gossip 6655'),
(342802, 2, 3428, 0, 0, 4, 'The Twin Emperors', 'The Twin Emperors, Vek''lor and Vek''nilash, rule the qiraji from a hall deep in the temple, one a master of magic, the other of the blade. They welcome intruders as guests at a feast of souls, and each feels the other''s pain.', '', 'creature_text 15275, 15276'),
(342803, 2, 3428, 0, 0, 4, 'C''Thun', 'C''Thun is the Old God the qiraji serve, a force of evil older than the world itself, buried in the deepest chamber of Ahn''Qiraj. It shows itself as a great eye on a stalk of flesh, ringed with tentacles that burst from the floor, and its whispers reach the minds of all who come near.', '', 'quests 8801, 8802'),
(342804, 2, 3428, 0, 0, 4, 'Merithra, Arygos and Caelestrasz', 'A thousand years ago, when the War of the Shifting Sands ended, three dragons held the qiraji inside these halls while Anachronos and Staghelm sealed the city: Merithra of the green flight, Arygos of the blue and Caelestrasz of the red. Their kin vowed to come for them should the Scarab Wall ever fall, and Andorgos, Kandrostrasz and Vethsera now wait at the temple''s entrance.', '', 'Kandrostrasz gossip 6645; Vethsera 6655; Arygos, Caelestrasz, Merithra 6793-6795');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(342803, 1, 0, 255, 'The walls of Ahn''Qiraj trembled as the Old God was destroyed, yet even in death its legacy of evil lingered in the chamber. Its eye went to Anachronos, for his master''s collection.', 'quests 8801, 8802'),
(342804, 1, 0, 255, 'The three were alive, captives for a thousand years in the chamber of the Old God. Freed, they swore they would have given anything to banish C''Thun, and owed the world''s thanks to those who did.', 'Kandrostrasz gossip 6645; Vethsera 6655; Arygos, Caelestrasz, Merithra 6793-6795');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(342800, 1, 3428, 0),
(342802, 3, 15275, 0),
(342802, 3, 15276, 0),
(342803, 3, 15727, 0),
(342803, 3, 15589, 0),
(342803, 4, 8801, 0),
(342804, 2, 15503, 0),
(342804, 2, 15502, 0),
(342804, 2, 15504, 0),
(342803, 4, 8801, 1),
(342803, 5, 8802, 1),
(342804, 2, 15378, 1),
(342804, 2, 15379, 1),
(342804, 2, 15380, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(342800, 90000061, 0),
(342800, 342803, 1),
(342800, 342804, 2),
(342802, 342800, 0),
(342802, 90000061, 1),
(342802, 342803, 2),
(342803, 90000061, 0),
(342803, 91000033, 1),
(342803, 137712, 2),
(342804, 91000033, 0),
(342804, 90000060, 1),
(342804, 342803, 2);

-- The Arcatraz
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 384800 AND 384899;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 384800 AND 384899;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 384800 AND 384899;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 384800 AND 384899;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(384800, 0, 3848, 0, 0, 8, 'The Arcatraz', 'The Arcatraz is the prison satellite of Tempest Keep, where the naaru held some of the most dangerous beings they met in their travels. Kael''thas''s forces hold it now, and the prison is failing: the bodies of its defenders and warders lie in the halls, and the creatures of the cells roam free, demons and void-things, eredar soul-eaters and soldiers of the Ethereum among them.', '', 'Arcatraz spawns (map 552); Tempest Keep quest 10704; Shattrath quest 10886; creature_text 20904'),
(384801, 2, 3848, 0, 0, 8, 'Dalliah and Soccothrates', 'Dalliah the Doomsayer and Wrath-Scryer Soccothrates keep the inner halls of the Arcatraz for Kael''thas, and they cannot stand each other. Soccothrates asks intruders whether they have come to kill Dalliah, and whether he may watch; Dalliah calls him an overstuffed peacock and complains that she is forever cleaning up his messes.', '', 'creature_text 20885, 20886'),
(384802, 2, 3848, 0, 0, 8, 'Harbinger Skyriss', 'Harbinger Skyriss is a servant of the Old Gods, one of the beings the naaru locked away in the Arcatraz. He bears allegiance, he says, to powers untouched by time that no force on this world or beyond can bend, not even the Legion, and he would usher in their vision of conquering every world there is. Controlling a weak mind is a small matter to him.', '', 'Tempest Keep quest 10882; creature_text 20904, 20912');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(384800, 1, 0, 255, 'Nexus-Prince Haramad told the Sha''tar how to get in. The key to the Arcatraz is split in two shards, one held by the ancient Warp Splinter in the Botanica, the other by Pathaleon the Calculator in the Mechanar.', 'Arcatraz spawns (map 552); Tempest Keep quest 10704; Shattrath quest 10886; creature_text 20904'),
(384800, 2, 0, 255, 'Not every prisoner is dangerous. The gnome Millhouse Manastorm is a stowaway, A''dal says, who was in the wrong naaru vessel at the wrong time.', 'Arcatraz spawns (map 552); Tempest Keep quest 10704; Shattrath quest 10886; creature_text 20904'),
(384801, 1, 0, 255, 'Whichever of them fell first, the other congratulated the killers: Dalliah had wanted to do that for years, and Soccothrates could only say finally, well done.', 'creature_text 20885, 20886'),
(384802, 1, 0, 255, 'His voice reached the warden, Mellichar, who released the prisoners one by one for his great one and meant to tell the prince that intruders had done it. Skyriss died saying he was merely one of infinite multitudes.', 'Tempest Keep quest 10882; creature_text 20904, 20912'),
(384802, 2, 0, 255, 'Had he broken free, A''dal says, countless thousands would have died, as they did when another servant of the Old Gods, Skeram, rose on Azeroth.', 'Tempest Keep quest 10882; creature_text 20904, 20912');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(384800, 1, 3848, 0),
(384801, 3, 20885, 0),
(384801, 3, 20886, 0),
(384802, 3, 20912, 0),
(384802, 4, 10882, 0),
(384800, 4, 10704, 1),
(384800, 4, 10886, 2),
(384801, 3, 20885, 1),
(384801, 3, 20886, 1),
(384802, 3, 20912, 1),
(384802, 5, 10882, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(384800, 352315, 0),
(384800, 90000052, 1),
(384800, 384802, 2),
(384801, 384800, 0),
(384801, 92000002, 1),
(384802, 384800, 0),
(384802, 90000052, 1),
(384802, 342800, 2);

-- The Auchenai Crypts
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 379000 AND 379099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 379000 AND 379099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 379000 AND 379099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 379000 AND 379099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(379000, 0, 3790, 0, 0, 8, 'The Auchenai Crypts', 'The Auchenai Crypts lie beneath Auchindoun, where the draenei''s death priests laid their honored dead and tended them for some five hundred years. The priests still keep the halls, though no longer as caretakers: monks and soulpriests hush intruders, warning that the spirits are sleeping, and fall on them as violators. Bones rise from the floors, raging souls drift through the passages, and the ghosts of draenei soldiers flicker in and out of sight.', '', 'Auchindoun quests 10227, 10228, 10253; creature_text 18493-18497'),
(379001, 2, 3790, 0, 0, 8, 'Exarch Maladaar', 'Exarch Maladaar leads the Auchenai in the depths of the crypts. To him every visitor is a defiler of the ancestors'' resting place, fit only to join the dead, and he does not leave the dead at rest either: he calls on his fallen brothers to rise, take form and fight.', '', 'Auchenai Crypts quests 10164, 10167; Auchindoun quest 10228; creature_text 18373'),
(379002, 2, 3790, 0, 2, 8, 'D''ore', 'D''ore is a naaru, the captive spirit freed when Exarch Maladaar fell. Drained by a crash long ago, he was a dim speck of void when the Prophet Velen and his companions bore his remains here and laid them in a sarcophagus: the first tomb, from which all of Auchindoun grew. He has been regenerating for nearly a thousand years, and the cycle is almost complete.', '', 'Auchenai Crypts quest 10167; Nagrand quest 10168');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(379000, 1, 0, 255, 'Ramdor the Mad, once a death priest of the crypts, calls the Auchenai insane to the last. He alone kept his sense, he says, and they cast him out for his beliefs.', 'Auchindoun quests 10227, 10228, 10253; creature_text 18493-18497'),
(379000, 2, 0, 255, 'The book of the dead came to Levixus, a young draenei who stood on the upper ruins binding the souls of the dead to his will. With Levixus slain, the book went to Ramdor, who admitted he had lied to get it.', 'Auchindoun quests 10227, 10228, 10253; creature_text 18493-18497'),
(379001, 1, 0, 255, 'Ramdor says Maladaar withdrew to the Crypt of Remembrance to begin experiments in necromancy on the dead the Auchenai had cared for so long.', 'Auchenai Crypts quests 10164, 10167; Auchindoun quest 10228; creature_text 18373'),
(379001, 2, 0, 255, 'Greatfather Aldrimus, a spirit outside the crypts, escaped both Levixus and Maladaar''s experiments. He asks only that the exarch die, so that the spirits trapped inside may rest.', 'Auchenai Crypts quests 10164, 10167; Auchindoun quest 10228; creature_text 18373'),
(379001, 3, 0, 255, 'Struck down at last among the dead he had raised, the exarch spoke no curse. This, Maladaar sighed, was where he belonged.', 'Auchenai Crypts quests 10164, 10167; Auchindoun quest 10228; creature_text 18373'),
(379002, 1, 0, 255, 'Over the centuries the spirits of Auchindoun gathered into his darkened essence, and many of the crypt''s catastrophes came of his weakness. Nothing can stop it, he says: without the void, the Light cannot exist.', 'Auchenai Crypts quest 10167; Nagrand quest 10168');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(379000, 1, 3790, 0),
(379001, 3, 18373, 0),
(379001, 4, 10164, 0),
(379001, 4, 10167, 0),
(379002, 5, 10167, 0),
(379002, 4, 10168, 0),
(379000, 5, 10227, 1),
(379000, 4, 10228, 1),
(379000, 5, 10253, 2),
(379001, 4, 10228, 1),
(379001, 4, 10164, 2),
(379001, 3, 18373, 3),
(379002, 4, 10168, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(379000, 351916, 0),
(379000, 90000051, 1),
(379000, 379001, 2),
(379001, 379000, 0),
(379001, 379002, 1),
(379001, 90000051, 2),
(379002, 90000052, 0),
(379002, 351810, 1),
(379002, 351916, 2),
(379002, 379001, 3);

-- Azjol-Nerub
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 427700 AND 427799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 427700 AND 427799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 427700 AND 427799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 427700 AND 427799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(427700, 0, 4277, 0, 0, 13, 'Azjol-Nerub', 'Azjol-Nerub is the underground kingdom of the Nerubians beneath the Dragonblight, and its upper city belongs to the dead now. Anub''ar warriors, shadowcasters and skirmishers hold its gate, brood keepers tend the clutches of eggs from which the Scourge''s next Nerubians will hatch, and webs hang thick across tunnels that once carried the traffic of a great and ancient empire.', '', 'Azjol-Nerub spawns (map 601); Azjol-Nerub quest 13182; creature_text 28684'),
(427701, 2, 4277, 0, 0, 13, 'Anub''arak', 'Anub''arak, the traitor king, rules the ruins of Azjol-Nerub for the Lich King, a crypt lord at the head of an army of undead Nerubians sworn to his master. He was king of this empire once, he says: in life he stood as its champion, in death he returned as its conqueror, and now he protects the kingdom once more. Ironic, he finds it.', '', 'Azjol-Nerub quests 13167, 13254; creature_text 29120');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(427700, 1, 0, 255, 'The gatewatcher Krik''thir held that the kingdom belonged to the Scourge and only the dead might enter. Dying, he said he should have been grateful, but had long ago lost the capacity.', 'Azjol-Nerub spawns (map 601); Azjol-Nerub quest 13182; creature_text 28684'),
(427701, 1, 0, 255, 'As he died, something left him with a roar. He had never thought, he gasped, that he would be free of him.', 'Azjol-Nerub quests 13167, 13254; creature_text 29120'),
(427701, 2, 0, 255, 'Kilix''s eyes blazed at the sight of the traitor king''s husk: the deed would be recorded in the history of his people.', 'Azjol-Nerub quests 13167, 13254; creature_text 29120');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(427700, 1, 4277, 0),
(427701, 3, 29120, 0),
(427701, 4, 13167, 0),
(427700, 3, 28684, 1),
(427701, 3, 29120, 1),
(427701, 5, 13167, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(427700, 90000080, 0),
(427700, 427701, 1),
(427700, 90000006, 2),
(427701, 90000080, 0),
(427701, 427700, 1),
(427701, 92000005, 2);

-- The Black Morass
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 236600 AND 236699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 236600 AND 236699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 236600 AND 236699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 236600 AND 236699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(236600, 0, 2366, 0, 0, 8, 'The Black Morass', 'The timeway opens onto the Black Morass on the day the Dark Portal first opened, a swamp of black water and twisted trees where the Blasted Lands will one day lie. At its heart the Guardian, Medivh, works inside a shield of his own to open the gate for Gul''dan''s Horde. Sa''at of the Keepers of Time waits at the swamp''s edge, for rifts are tearing open across the morass.', '', 'Caverns of Time quests 10296, 10297; creature_text 15608');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(236600, 1, 0, 255, 'The Infinite mean to kill Medivh before the portal opens. It may look like a boon to the Alliance, Andormu says, but it would be a catastrophe.', 'Caverns of Time quests 10296, 10297; creature_text 15608'),
(236600, 2, 0, 255, 'Without the orcs, Sa''at explains, the Alliance would never form. The human kingdoms would fall into civil war, and when the Burning Legion came there would be no one left to defend the world.', 'Caverns of Time quests 10296, 10297; creature_text 15608'),
(236600, 3, 0, 255, 'Medivh thanked his champions, taking them as a sign of the dark one''s blessing. Now Gul''dan''s Horde would sweep across the world like a locust swarm, he said, and all his carefully laid plans would fall into place.', 'Caverns of Time quests 10296, 10297; creature_text 15608');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(236600, 1, 2366, 0),
(236600, 4, 10296, 1),
(236600, 5, 10296, 2),
(236600, 5, 10297, 3);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(236600, 44007, 0),
(236600, 91000017, 1),
(236600, 90000089, 2),
(236600, 400, 3);

-- The Black Temple
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 395900 AND 395999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 395900 AND 395999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 395900 AND 395999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 395900 AND 395999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(395900, 0, 3959, 0, 0, 10, 'The Black Temple', 'Inside, the Black Temple is Illidan''s fortress, and the old sanctuary of Karabor shows only in the stone. Coilskar naga and water elementals hold the flooded lower halls, Shadowmoon orcs and Bonechewer fel orcs crowd the barracks and the arena, the Dragonmaw keep the walls, courtesans and temple concubines wait in the upper halls, and blood elves and demons of the Illidari guard the way to the summit.', '', 'Black Temple spawns (map 564); Shadowmoon quest 10985; Spirit of Udalo gossip 8749, Spirit of Olum 8750'),
(395901, 2, 3959, 0, 0, 10, 'The Shade of Akama', 'Akama''s soul is not his own. Illidan holds it prisoner in the Black Temple, and could destroy him at any moment, which is why the leader of the Ashtongue has hidden his intentions so long rather than side openly with the naaru. Inside the temple his shade stands bound by Ashtongue channelers, and he must take it back before he can strike.', '', 'Shattrath quest 10948; Black Temple quest 10957; creature_text 23191'),
(395902, 2, 3959, 0, 0, 10, 'Teron Gorefiend', 'Teron Gorefiend keeps a hall of the Black Temple, the temple whose clerics he murdered when it fell. He was the first, he says, and for him the wheel of death has spun many times; so much time has passed that he has a lot of catching up to do. Whoever he marks with the shadow of death dies where they stand, and must fight on as a spirit.', '', 'creature_text 22871; boss_teron_gorefiend.cpp (Shadow of Death, shadowy constructs)'),
(395903, 2, 3959, 0, 0, 10, 'The Illidari Council', 'The Illidari Council is the high command of Illidan''s blood elves, four lords who guard the way to their master and fight as one: Gathios the Shatterer, High Nethermancer Zerevor, who scorns the common tongue as crude, Lady Malande, who cries for Quel''Thalas and the Sunwell, and Veras Darkshadow, who strikes from hiding.', '', 'creature_text 22949-22952, 23089');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(395900, 1, 0, 255, 'Xi''ri''s army of Aldor and Scryers drew Illidan''s forces away from the gates so that Akama and Maiev could slip inside, and the naaru gave back the Medallion of Karabor, its power augmented, as the key to the temple.', 'Black Temple spawns (map 564); Shadowmoon quest 10985; Spirit of Udalo gossip 8749, Spirit of Olum 8750'),
(395900, 2, 0, 255, 'The spirits of two of Akama''s Deathsworn, Udalo and Olum, linger in the temple. Their bond to their brethren is still strong enough to carry Akama''s allies deeper inside.', 'Black Temple spawns (map 564); Shadowmoon quest 10985; Spirit of Udalo gossip 8749, Spirit of Olum 8750'),
(395901, 1, 0, 255, 'With the shade destroyed, Akama called the Broken of the Ashtongue out of the shadows: the Betrayer''s dark magic over the Ashtongue soul was broken, and the time had come to turn on their Illidari masters.', 'Shattrath quest 10948; Black Temple quest 10957; creature_text 23191'),
(395903, 1, 0, 255, 'Gathios was the last to speak to his master, or tried to: Lord Illidan, he began, and never finished. With the council dead, Akama could force open the doors to Illidan''s sanctum.', 'creature_text 22949-22952, 23089');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(395900, 1, 3959, 0),
(395901, 3, 22841, 0),
(395901, 4, 10957, 0),
(395901, 4, 10948, 0),
(395902, 3, 22871, 0),
(395903, 3, 22949, 0),
(395903, 3, 22950, 0),
(395903, 3, 22951, 0),
(395903, 3, 22952, 0),
(395900, 5, 10985, 1),
(395900, 2, 23410, 2),
(395900, 2, 23411, 2),
(395901, 3, 22841, 1),
(395903, 3, 22949, 1),
(395903, 3, 22950, 1),
(395903, 3, 22951, 1),
(395903, 3, 22952, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(395900, 352016, 0),
(395900, 92000009, 1),
(395900, 352028, 2),
(395900, 395901, 3),
(395901, 352028, 0),
(395901, 395900, 1),
(395901, 90000021, 2),
(395902, 352016, 0),
(395902, 352017, 1),
(395902, 395900, 2),
(395903, 395900, 0),
(395903, 92000009, 1),
(395903, 90000033, 2);

-- Blackfathom Deeps
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 71900 AND 71999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 71900 AND 71999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 71900 AND 71999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 71900 AND 71999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(71900, 0, 719, 0, 0, 0, 'Blackfathom Deeps', 'Blackfathom Deeps opens at the northern end of the Zoram Strand, where Ashenvale meets the sea. It was once a temple of Elune, until the Sundering shattered it and sank it beneath the waves. For ages its drowned halls lay undisturbed, until the naga and the satyrs came, drawn by its ancient power. Murlocs crowd the halls nearest the entrance, naga hold the great pools beyond, and deeper in the Twilight''s Hammer has gathered, crying that Aku''mai demands more sacrifices.', '', 'warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (partially underwater dungeon in northwestern Ashenvale; temple of Elune sunk beneath the Veiled Sea by the Great Sundering, untouched until the naga and satyrs found it; the Twilight''s Hammer guards Aku''mai, a pet of the Old Gods); the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the Old Gods, has taken up residence in the temple''s ruins; the Twilight''s Hammer drawn to its presence); ashenvale.json 33103 (the Zoram Strand, the entrance north of Zoram''gar) and 33143 (the Deeps of Blackfathom: the cult and naga, the Argent Dawn''s and the Earthen Ring''s quests), pointed to in one clause; DB spawns map 48: Blindlight Murloc 4818, Muckdweller 4819, Oracle 4820 at x -178 to -461 (the entrance teleport, areatrigger_teleport 257, lands at -152,107); Blackfathom Sea Witch 4805 x30, Myrmidon 4807 x27 at x -301 to -713; Fallenroot Shadowstalker 4798 x14, Hellcaller 4799 x11 at x -469 to -720; Twilight Acolyte, Reaver, Aquamancer, Loreseeker, Shadowmage, Elementalist (4809-4814) at x -693 to -849; faction templates: naga, satyrs and cultists share 128 (Blackfathom); the Blindlight murlocs are 18 (Murloc); creature_text 4809-4814 group 0 (Aku''mai demands more sacrifices; The Old Gods will be restored), said on aggro: base smart_scripts 4810 (Twilight Reaver), the module''s dungeon_blackfathom_deeps.sql all six cult types; quest 971 (the Lorgalis Manuscript at the bottom of Blackfathom Deeps), as the premise only; zones/blackfathom_deeps.txt (map 48: 719 only); Blackfathom quests 1198, 1199, 1275, 6563, 6564'),
(71901, 1, 719, 0, 0, 0, 'The Pool of Ask''ar', 'The Pool of Ask''ar is the first great flooded hall of the deeps, a wide basin of dark water beyond the murlocs'' passages. Naga sea witches and myrmidons keep watch around it, a great sea turtle swims in it, and off its shore a naga called Lady Sarevess holds a side cavern. Past it lies an old shrine where the murloc Gelihast keeps his tribe.', '', 'WMOAreaTable 11909/11910 The Pool of Ask''ar (WMO 1204, Blackfathom Deeps), 3.3.5 DBC: shown as the minimap subzone name; warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (Ghamoo-Ra in the Pool of Ask''ar; Lady Sarevess in the Pool of Ask''ar, side cavern); creature 4887 Ghamoo-ra, single spawn on map 48 at -442,212 z-53; display 5027, SeaTurtle model at scale 1.5; creature 4831 Lady Sarevess, single spawn (guid 26129) at -300,414 z-57; display 4979, naga Siren model; Blackfathom Myrmidon 4807 (guid 26121) at -328,400; the module gives her a patrol path (261290) within x -300 to -354, y 324 to 407; Snapping Crustacean 4822 x18 at x -358 to -568, y 106 to 284; Blackfathom Sea Witch 4805 and Myrmidon 4807 spawns across the pool; gameobject 103015 Shrine of Gelihast, single spawn on map 48 at -413,44 z-48; gameobject_template_addon flags 16 (not selectable); instance_blackfathom_deeps.cpp and smart_scripts 6243 (On Just Died: instance data TYPE_GELIHAST done, remove the not-selectable flag); linked trap 94039 casts Blessing of Blackfathom 8733; creature 6243 Gelihast, single spawn at -413,41 z-48; display 1773, Murloc model at scale 2.0; Blindlight Muckdweller 4819 and Oracle 4820 x5 each at -400 to -461, 4 to 38; warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (Gelihast at the Shrine of Gelihast); the entrance teleport lands at -152,107, about 270 yards away'),
(71903, 1, 719, 0, 0, 0, 'The Moonshrine Ruins', 'Deep within the flooded temple lie the Moonshrine Ruins, the broken remains of a shrine of the moon, half drowned in dark water. The Twilight''s Hammer has made its camp among them. Its aquamancers keep elementals of living water at their sides, and its cries that the Old Gods will be restored echo off the old stones. Somewhere in the water lies the ruins'' fathom stone.', '', 'WMOAreaTable 11923/11924 Moonshrine Ruins (WMO 1204), 3.3.5 DBC; quest 6921 description (the Twilight''s Hammer has moved into the Moonshrine Ruins; the ruin''s fathom stone somewhere close in the water), as a source only; DB spawns map 48: Twilight Acolyte 4809, Reaver 4810 x11, Aquamancer 4811 x7, Loreseeker 4812 x8 at x -693 to -822, y -106 to 8, z -30 to -38; gameobject 177964 Fathom Stone at -782,-64 z-45 (size 0.15); smart_scripts base and module: Acolyte Heal and Renew on friends; Reaver Arcing Smash 8374; Loreseeker Enlarge 8365 and Slow 18972; Aquamancer Summon Aqua Guardian 8372 out of combat; creature_text 4810 group 0 (The Old Gods will be restored), reavers in base, all cult types in the module; warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (Baron Aquanis, a quest boss, in the Moonshrine Ruins); gameobject 177964 Fathom Stone at -782,-64 z-45; loot 15100 holds only the Fathom Core 16762 (QuestRequired, quest 6921, AllowableRaces 690); smart_scripts 177964 (On Just Deactivated: summon Baron Aquanis 12876 at -776,-74); creature 12876 Baron Aquanis: no spawn, summoned only by the stone; display 110, WaterElemental model at scale 1.5; faction 91 (Elemental); rank 2; creature_text 12876 group 0 (%s emerges to protect the Fathom Stone!), emote on AI init; warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (Baron Aquanis, quest boss, Moonshrine Ruins)'),
(71905, 2, 719, 0, 0, 0, 'Twilight Lord Kelris', 'Twilight Lord Kelris, an orc, leads the Twilight''s Hammer in Blackfathom Deeps. He sits in meditation in the Moonshrine Sanctum, channeling dark power among the four Fires of Aku''mai, and beyond them a massive portal holds shut the way deeper into the temple. Every cultist who cries that Aku''mai demands sacrifices answers to him, and he sacrifices innocents to the beast for power.', '', 'creature 4832 Twilight Lord Kelris, single spawn on map 48 at -819,-156 z-26; display 4939, OrcMale model; smart_scripts 4832 id 2 (out of combat: Blackfathom Channeling 8734); creature_text 4832 group 0 (Who dares disturb my meditation?); DB spawns: Twilight Shadowmage 4813 x7 and Elementalist 4814 x6 at z-26, x -784 to -849, y -99 to -162; gameobject 21118-21121 Fire of Aku''mai at -813 to -824, -159 to -170 z-25 (not lit until used); 21117 Portal of Aku''Mai at -818,-201 (door, flags 34, opened by the instance script once all four fires are done and their summons slain); WMOAreaTable 11925 Moonshrine Sanctum (WMO 1204); warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (Kelris in the Moonshrine Sanctum); quest 6561 description (the cultists, led by Kelris), for the Horde way in; Blackfathom quest 1200'),
(71906, 2, 719, 0, 0, 0, 'Aku''mai', 'Aku''mai is a hydra of terrible size, the beast the Twilight''s Hammer reveres. Legend calls it a favored pet of the Old Gods. The Argent Dawn tells how it came: the corruption of an Old God seeped up from beneath the earth and tainted the temple''s moonwell, and Aku''mai rose from the waters. It has preyed on the place ever since, and its lair lies beyond the portal the cult guards.', '', 'the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the primordial Old Gods, has taken up residence within the temple''s ruins and preyed upon the area ever since; the Twilight''s Hammer drawn to its presence); warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (the cult guards Aku''mai, a pet of the Old Gods); creature_text 4809-4814 group 0 line (Aku''mai demands more sacrifices, now you must die!); gameobject 21117 Portal of Aku''Mai at -818,-201 (door, closed); creature 4829 Aku''mai at -848,-454 z-34 beyond it; ashenvale.json 33143 part 1 (Thaelrid''s account: Aku''mai rose from the tainted moonwell), pointed to in one phrase; Blackfathom quest 1200');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(71900, 1, 0, 255, 'The Argent Dawn has heard that the Twilight''s Hammer and the naga have joined forces in the old temple, and the scout it sent to learn more has not come back.', 'warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (partially underwater dungeon in northwestern Ashenvale; temple of Elune sunk beneath the Veiled Sea by the Great Sundering, untouched until the naga and satyrs found it; the Twilight''s Hammer guards Aku''mai, a pet of the Old Gods); the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the Old Gods, has taken up residence in the temple''s ruins; the Twilight''s Hammer drawn to its presence)'),
(71900, 2, 0, 255, 'The naga harvest sapphire crystals from the walls of the first tunnels. The spirits of water cling to them, and the cult''s aquamancers use them in their summonings.', 'warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (partially underwater dungeon in northwestern Ashenvale; temple of Elune sunk beneath the Veiled Sea by the Great Sundering, untouched until the naga and satyrs found it; the Twilight''s Hammer guards Aku''mai, a pet of the Old Gods); the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the Old Gods, has taken up residence in the temple''s ruins; the Twilight''s Hammer drawn to its presence)'),
(71900, 3, 0, 255, 'A cultist named Lorgus Jett means to use the crystals to appease Aku''mai and bring it back, and with it an era of rule by the Old Gods.', 'warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (partially underwater dungeon in northwestern Ashenvale; temple of Elune sunk beneath the Veiled Sea by the Great Sundering, untouched until the naga and satyrs found it; the Twilight''s Hammer guards Aku''mai, a pet of the Old Gods); the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the Old Gods, has taken up residence in the temple''s ruins; the Twilight''s Hammer drawn to its presence)'),
(71900, 4, 0, 255, 'In Auberdine Gershala Nightwhisper studies the naga and satyrs here, elves deformed by demonic magic, to learn what fate awaits the blood elves.', 'warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (partially underwater dungeon in northwestern Ashenvale; temple of Elune sunk beneath the Veiled Sea by the Great Sundering, untouched until the naga and satyrs found it; the Twilight''s Hammer guards Aku''mai, a pet of the Old Gods); the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the Old Gods, has taken up residence in the temple''s ruins; the Twilight''s Hammer drawn to its presence)'),
(71903, 1, 0, 255, 'Inside the fathom stone is a fathom core, a device that relates a history of all elemental activity. The Earthen Ring hopes it will show what the cult is doing to the elements here.', 'WMOAreaTable 11923/11924 Moonshrine Ruins (WMO 1204), 3.3.5 DBC; quest 6921 description (the Twilight''s Hammer has moved into the Moonshrine Ruins; the ruin''s fathom stone somewhere close in the water), as a source only'),
(71903, 2, 0, 255, 'Disturbing the stone raises Baron Aquanis, a water elemental long thought a corrupted power. The globe that fed him should prove who corrupted him, and how.', 'WMOAreaTable 11923/11924 Moonshrine Ruins (WMO 1204), 3.3.5 DBC; quest 6921 description (the Twilight''s Hammer has moved into the Moonshrine Ruins; the ruin''s fathom stone somewhere close in the water), as a source only'),
(71905, 1, 0, 255, 'The Argent Dawn had hunted him for years and thought him dead or missing. Wherever evil showed itself in these parts, it says, Kelris had a hand in it.', 'creature 4832 Twilight Lord Kelris, single spawn on map 48 at -819,-156 z-26; display 4939, OrcMale model'),
(71906, 1, 0, 255, 'A dwarf of Khaz Modan waited by the altar in its lair. Morridune had followed the Twilight''s Hammer here to draw power from the beast, until the sacrifice of countless innocents brought him to his senses.', 'the pre-Cataclysm official description (legends hold the ancient beast Aku''mai, a favored pet of the primordial Old Gods, has taken up residence within the temple''s ruins and preyed upon the area ever since; the Twilight''s Hammer drawn to its presence); warcraft.wiki.gg/wiki/Blackfathom_Deeps_(Classic) (the cult guards Aku''mai, a pet of the Old Gods)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(71900, 1, 719, 0),
(71901, 3, 4822, 0),
(71901, 3, 4824, 0),
(71903, 3, 4810, 0),
(71903, 3, 4812, 0),
(71903, 3, 4811, 0),
(71905, 3, 4832, 0),
(71905, 4, 6561, 0),
(71905, 4, 1200, 0),
(71906, 3, 4829, 0),
(71900, 4, 1198, 1),
(71900, 4, 1199, 1),
(71900, 4, 6563, 2),
(71900, 4, 6564, 2),
(71900, 5, 6564, 3),
(71900, 4, 1275, 4),
(71903, 4, 6921, 1),
(71903, 3, 12876, 2),
(71903, 5, 909, 2),
(71903, 5, 6922, 2),
(71905, 5, 1200, 1),
(71906, 2, 6729, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(71900, 90000009, 0),
(71900, 90000055, 1),
(71900, 33103, 2),
(71901, 71900, 0),
(71901, 90000055, 1),
(71903, 90000009, 0),
(71903, 90000070, 1),
(71903, 71905, 2),
(71905, 90000009, 0),
(71905, 71906, 1),
(71905, 71903, 2),
(71906, 71905, 0),
(71906, 90000009, 1),
(71906, 71900, 2);

-- Blackrock Depths
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 158400 AND 158499;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 158400 AND 158499;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 158400 AND 158499;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 158400 AND 158499;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(158400, 0, 1584, 0, 0, 0, 'Blackrock Depths', 'Blackrock Depths is the capital of the Dark Iron dwarves, Shadowforge City, buried in the molten heart of Blackrock Mountain. Emperor Dagran Thaurissan rules it from his throne, and the whole nation serves the Firelord whose coming made the mountain. Its halls hold a prison block and a court that sentences outsiders to death in an arena, forges and a golem manufactory, a tavern and a vault, and lava runs everywhere beneath the stone.', '', 'Blackrock Depths quests 4081, 4132'),
(158401, 2, 1584, 0, 0, 0, 'Emperor Dagran Thaurissan', 'Emperor Dagran Thaurissan rules the Dark Iron nation from the Imperial Seat in Shadowforge City, and he names himself the most powerful servant of Ragnaros. At his side stands Princess Moira Bronzebeard, daughter of King Magni of Ironforge, who fights at his side and heals him as he falls. The emperor scorns every challenger as beneath him.', '', 'Blackrock Depths quests 3982, 4003, 4004; creature_text 9019, 8929'),
(158402, 2, 1584, 0, 0, 0, 'Kharan Mighthammer', 'Kharan Mighthammer was charged with protecting Princess Moira when she answered Lakeshire''s plea against the Blackrock orcs. In the Burning Steppes a hundred Dark Irons fell on them out of the very rocks, his twenty guardsmen were executed, and the princess was carried off to Thaurissan. Kharan sits in the Depths'' prison, sure he is kept alive only for ransom, or out of cruelty.', '', 'Kharan Mighthammer gossip 1822-1839; quest 4341'),
(158403, 2, 1584, 0, 0, 0, 'Marshal Windsor', 'Marshal Windsor commanded Morgan''s Vigil until a Blackrock raid took him, and with him a great store of intelligence on the clan. He sits in the Depths'' prison, half mad with rage. He was gathering proof for Highlord Bolvar, he says, who is a blind fool: proof stands two feet from him and he does not see it. Windsor means to put his hammer between that reptile''s eyes.', '', 'Blackrock Depths quests 4241, 4242, 4264, 4282, 4322'),
(158404, 2, 1584, 0, 0, 0, 'Franclorn Forgewright', 'Franclorn Forgewright was the Dark Iron architect of the stonewrought style, and he built Blackrock Spire. Under Ragnaros''s control, he says, Thaurissan tore out the heart of the mountain and raised the Spire, and Franclorn stood by his king and watched the Firelord''s corruption drive an honorable people to madness. When the Spire was done his will to live gave way, and he lies in a tomb at its entrance.', '', 'Franclorn Forgewright gossip 1663-1667; quests 3801, 3802'),
(158405, 1, 1584, 0, 0, 0, 'The Tomb of the Seven', 'In a tomb within the Depths dwell seven Dark Iron spirits whom the city calls the Seven, Doom''rel and his six brothers. They challenge any who come to their tomb. Their fate, Doom''rel says, is the doom of all who face the Great Fire. In the ruins of the old capital, visions show a lone dwarf kneeling before a monolith of flame among seven corpses.', '', 'Doom''rel gossip 1947, 1950; creature_text 9039'),
(158406, 2, 1584, 0, 0, 0, 'Lord Incendius', 'Lord Incendius is a being of fire who keeps the Black Anvil deep in the Depths, a minion of Ragnaros by every account. He cannot be destroyed, he cries: by the Firelord''s will he shall be reborn, and he raises his servant Pyron from the ashes at the quarry gate however often it is put down.', '', 'Blackrock Depths quests 4262, 4263, 3907; creature_text 9017'),
(158407, 2, 1584, 0, 0, 0, 'Golem Lord Argelmach', 'Golem Lord Argelmach rules the Manufactory of the Depths, where the Dark Irons build golems of incomparable killing power around a unique essence of the elements. The gnome Lotwil Veriatus swears it cannot be him: Argelmach twisted Lotwil''s life''s work to his own ends, and Lotwil killed him ten years ago.', '', 'Blackrock Depths quests 4063, 3911; creature_text 8983'),
(158408, 1, 1584, 0, 0, 0, 'The Grim Guzzler', 'The Grim Guzzler is the tavern of Shadowforge City, where Dark Irons drink under the eye of Plugger Spazzring and even the Thorium Brotherhood does business: Lokhtos Darkbargainer trades here with the Brotherhood''s friends, and will sell plans no smith above ground can buy.', '', 'Blackrock Depths quests 4126, 4128, 4134, 7604');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(158400, 1, 0, 255, 'General Angerforge''s forces in the Depths slaughtered the 109th division of the Kargath Expeditionary Force, and Warlord Goretooth wants every one of them destroyed.', 'Blackrock Depths quests 4081, 4132'),
(158401, 1, 0, 255, 'The princess is not there by choice. Thaurissan holds her under a powerful spell that bends her thoughts to his will.', 'Blackrock Depths quests 3982, 4003, 4004; creature_text 9019, 8929'),
(158401, 2, 0, 255, 'With the emperor dead, Moira mourned him as her husband. She carries his child, she said, who will be the next ruler of Ironforge, and Thrall saw a new threat on the horizon.', 'Blackrock Depths quests 3982, 4003, 4004; creature_text 9019, 8929'),
(158402, 1, 0, 255, 'The ambush was too well made, as if the Dark Irons knew every move before it was made. Someone tipped them off, Kharan swears, and he means to find the traitor.', 'Kharan Mighthammer gossip 1822-1839; quest 4341'),
(158403, 1, 0, 255, 'A note from Thaurissan himself says General Angerforge and the golem lord Argelmach have nearly broken the code of Windsor''s notes, and that their lord will rise from the depths.', 'Blackrock Depths quests 4241, 4242, 4264, 4282, 4322'),
(158403, 2, 0, 255, 'Windsor won back his notes and his freedom, and stormed off to Stormwind to confront Bolvar, and Lady Prestor, with his evidence.', 'Blackrock Depths quests 4241, 4242, 4264, 4282, 4322'),
(158404, 1, 0, 255, 'His great hammer Ironfel passed to the new chief architect, Fineous Darkvire, a man of despicable motive and little talent. Franclorn wants it back in the hands of his statue at the Shrine of Thaurissan.', 'Franclorn Forgewright gossip 1663-1667; quests 3801, 3802'),
(158406, 1, 0, 255, 'He is only an emissary. A tablet taken from him names his master, and the shaman of Kargath read it with dread: Ragnaros himself is in the mountain, a general of the Old Gods in this world.', 'Blackrock Depths quests 4262, 4263, 3907; creature_text 9017'),
(158406, 2, 0, 255, 'Dying, Incendius spoke his master''s name, and at Morgan''s Vigil the gnome who had sent the hunt could only ask, aghast, whether he had truly said Ragnaros.', 'Blackrock Depths quests 4262, 4263, 3907; creature_text 9017'),
(158407, 1, 0, 255, 'The head brought back from the Manufactory was not flesh. It was a Dark Iron machine, a shadow of Argelmach, and Lotwil expects another to rise in its place.', 'Blackrock Depths quests 4063, 3911; creature_text 8983'),
(158408, 1, 0, 255, 'Its pride is Thunderbrew Lager, made from a recipe that Hurley Blackbreath''s Dark Irons stole from the Thunderbrew Distillery of Kharanos.', 'Blackrock Depths quests 4126, 4128, 4134, 7604');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(158400, 1, 1584, 0),
(158401, 3, 9019, 0),
(158401, 4, 4003, 0),
(158402, 2, 9021, 0),
(158402, 4, 4341, 0),
(158403, 2, 9023, 0),
(158403, 4, 4242, 0),
(158404, 4, 3801, 0),
(158405, 2, 9039, 0),
(158406, 3, 9017, 0),
(158406, 4, 4263, 0),
(158406, 4, 3907, 0),
(158407, 3, 8983, 0),
(158407, 4, 4063, 0),
(158408, 2, 12944, 0),
(158408, 2, 9499, 0),
(158400, 4, 4081, 1),
(158400, 4, 4132, 1),
(158401, 2, 9021, 1),
(158401, 4, 3982, 1),
(158401, 4, 4003, 1),
(158401, 4, 4004, 2),
(158401, 5, 4004, 2),
(158402, 2, 9021, 1),
(158403, 4, 4264, 1),
(158403, 5, 4264, 1),
(158403, 5, 4322, 2),
(158404, 4, 3802, 1),
(158406, 5, 3907, 1),
(158406, 5, 4263, 2),
(158407, 5, 4063, 1),
(158408, 4, 4126, 1),
(158408, 4, 4134, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(158400, 90000010, 0),
(158400, 91000018, 1),
(158400, 4610, 2),
(158401, 153702, 0),
(158401, 90000010, 1),
(158401, 158402, 2),
(158402, 158401, 0),
(158402, 153702, 1),
(158402, 4407, 2),
(158403, 4613, 0),
(158403, 158401, 1),
(158403, 90000024, 2),
(158404, 4610, 0),
(158404, 158300, 1),
(158404, 90000010, 2),
(158405, 4607, 0),
(158405, 91000018, 1),
(158405, 158401, 2),
(158406, 91000018, 0),
(158406, 158400, 1),
(158406, 5100, 2),
(158407, 319, 0),
(158407, 158400, 1),
(158407, 90000010, 2),
(158408, 90000025, 0),
(158408, 104, 1),
(158408, 158400, 2);

-- Blackrock Spire
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 158300 AND 158399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 158300 AND 158399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 158300 AND 158399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 158300 AND 158399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(158300, 0, 1583, 0, 0, 0, 'Blackrock Spire', 'Blackrock Spire is the citadel the Dark Irons carved in the upper reaches of Blackrock Mountain, and it is theirs no longer. The Blackrock orcs hold it as their capital, with ogres and Smolderthorn trolls in the lower city, and worgs are bred here for their raids. Above them, in the upper citadel, dragonkin of the black flight hold the halls, and the clan''s warchief keeps his court.', '', 'Blackrock Spire quests 4701, 4724, 4903, 5002, 5081'),
(158301, 1, 1583, 0, 0, 0, 'The Halls of Binding', 'The Halls of Binding guard the way into the upper citadel of Blackrock Spire. There the Blackhand legion''s incarcerators keep a great fire elemental, Pyroguard Emberseer, chained in their magic, and none pass on to the upper halls without first dealing with what the halls hold bound.', '', 'creature_text 9816'),
(158302, 2, 1583, 0, 0, 0, 'Warchief Rend Blackhand', 'Rend Blackhand is the son of Blackhand, warchief of the old Horde, and he calls himself Warchief in Blackrock Spire. His war with the Dark Irons for the Spire cost the clan dearly, and the black dragonflight protects him now. He rides the dragon Gyth, and Thrall wants his head.', '', 'Blackrock Spire quests 4974, 4941; creature_text 10162, 10429'),
(158304, 2, 1583, 0, 0, 0, 'Vaelan', 'Vaelan appears in the lower citadel in a form mortals can bear: he is the red dragon Vaelastrasz. Nefarian rules this citadel, he says, and carries on his father Deathwing''s work, breeding chromatic dragonkin that no Aspect''s power can touch. Ysera saw the abominations and forced the flights to act, but ancient wards keep every dragon from Nefarian''s sanctum.', '', 'Vaelan gossip 12039-12048; quests 4742, 4743'),
(158305, 2, 1583, 0, 0, 0, 'General Drakkisath', 'General Drakkisath, a black dragon champion, rules the dragonspawn armies of Nefarian from the heights of the upper citadel, with drakonids and dragonspawn guarding the halls around him. He answers to no one in the Spire but the lord of the black flight, and Marshal Maxwell of Morgan''s Vigil wants him dead.', '', 'Blackrock Spire quests 5089, 5102, 6502, 6602, 7761');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(158300, 1, 0, 255, 'The lower city answers to three commanders: the ogre Highlord Omokk, the Smolderthorn war master Voone, and Overlord Wyrmthalak, master of the lower citadel.', 'Blackrock Spire quests 4701, 4724, 4903, 5002, 5081'),
(158300, 2, 0, 255, 'The worgs of Blackrock come from Halycon, their gigantic den mother, and her mate, of whom no one has lived to tell.', 'Blackrock Spire quests 4701, 4724, 4903, 5002, 5081'),
(158300, 3, 0, 255, 'The goblin operative Bijou learned the truth of the place: the orcs are beasts of burden and cannon fodder for the black dragonflight, and their true master is Nefarian, brood of Deathwing.', 'Blackrock Spire quests 4701, 4724, 4903, 5002, 5081'),
(158301, 1, 0, 255, 'When the incarcerators fell, Emberseer regained its strength and broke free of its bonds. It laughed, thanked its liberators, and set about charring the flesh from their bones.', 'creature_text 9816'),
(158302, 1, 0, 255, 'Rend was thought slain decades ago, and the Horde had long believed it. Even Eitrigg, who knows the workings of the Blackrock better than anyone, had believed it.', 'Blackrock Spire quests 4974, 4941; creature_text 10162, 10429'),
(158302, 2, 0, 255, 'Rend fought in an arena while Lord Victor Nefarius, Lord of Blackrock, looked on from above, and when his champions failed, Nefarius sent the warchief himself. Rend was knocked from his drake and died.', 'Blackrock Spire quests 4974, 4941; creature_text 10162, 10429'),
(158302, 3, 0, 255, 'Thrall called his death a crippling blow to the forces of Blackrock: with their false Warchief slain, the Blackrock legion was thrown back into chaos.', 'Blackrock Spire quests 4974, 4941; creature_text 10162, 10429'),
(158304, 1, 0, 255, 'One not of dragon kind may pass the wards with a Seal of Ascension, the token of Nefarian''s Blackhand legion, forged from an unadorned seal in black dragonfire.', 'Vaelan gossip 12039-12048; quests 4742, 4743'),
(158304, 2, 0, 255, 'The seal complete, Vaelastrasz laid the protection of his flight on it: in their darkest hour its bearers would have the might of the red flight at their side.', 'Vaelan gossip 12039-12048; quests 4742, 4743'),
(158305, 1, 0, 255, 'Only the blood of a black dragon champion can mend the Drakefire Amulet, the key that opens Onyxia''s lair, and Drakkisath is that champion.', 'Blackrock Spire quests 5089, 5102, 6502, 6602, 7761'),
(158305, 2, 0, 255, 'A letter from Rend Blackhand to his quartermaster says the orb that leads into Blackwing works only for those with Drakkisath''s mark branded on their hand, and the general guards the brand himself.', 'Blackrock Spire quests 5089, 5102, 6502, 6602, 7761');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(158300, 1, 1583, 0),
(158301, 1, 4628, 0),
(158302, 3, 10429, 0),
(158302, 4, 4974, 0),
(158302, 4, 4941, 0),
(158304, 2, 10296, 0),
(158304, 4, 4742, 0),
(158305, 3, 10363, 0),
(158305, 4, 5102, 0),
(158305, 4, 6502, 0),
(158305, 4, 6602, 0),
(158305, 4, 7761, 0),
(158300, 4, 4903, 1),
(158300, 4, 5081, 1),
(158300, 4, 4724, 2),
(158300, 4, 4701, 2),
(158300, 4, 5002, 3),
(158301, 3, 9816, 1),
(158302, 4, 4941, 1),
(158302, 3, 10429, 2),
(158302, 5, 4974, 3),
(158304, 4, 4742, 1),
(158304, 4, 4743, 1),
(158304, 5, 4743, 2),
(158305, 4, 6502, 1),
(158305, 4, 6602, 1),
(158305, 4, 7761, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(158300, 90000017, 0),
(158300, 90000024, 1),
(158300, 4610, 2),
(158301, 158300, 0),
(158301, 158302, 1),
(158302, 90000017, 0),
(158302, 163709, 1),
(158302, 158300, 2),
(158304, 90000024, 0),
(158304, 90000079, 1),
(158304, 158305, 2),
(158305, 90000024, 0),
(158305, 158304, 1),
(158305, 4613, 2);

-- Blackwing Lair
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 267700 AND 267799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 267700 AND 267799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 267700 AND 267799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 267700 AND 267799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(267700, 0, 2677, 0, 0, 1, 'Blackwing Lair', 'Blackwing Lair is the inner sanctum of the lord of the black flight, high in the peak of Blackrock Spire, reached only by those who bear the right mark. Here Deathwing''s son keeps his court and his laboratories, where black dragonkin and the Blackwing legion tend his work, and where eggs of a new brood lie waiting in their hundreds.', '', 'Blackwing Lair quest 8288'),
(267701, 2, 2677, 0, 0, 1, 'Razorgore the Untamed', 'Razorgore the Untamed is a great black dragon kept in the first hall of the lair, bound by an orb that Grethok the Controller holds, to guard the eggs of the new brood. Those eggs, he warns, are more precious than any intruder knows, and he swears they will pay for every one that is broken.', '', 'creature_text 12435'),
(267702, 2, 2677, 0, 0, 1, 'Vaelastrasz the Corrupt', 'Vaelastrasz of the red flight, who came to the Spire to stand against Nefarian, matched his power against the Lord of Blackrock and lost. Nefarius consumed his energy with ease and filled him with black fire, and now he begs the heroes who find him to kill him before he loses all control.', '', 'Vaelastrasz gossip 21333; quest 8730; creature_text 13020'),
(267703, 2, 2677, 0, 0, 1, 'Chromaggus', 'Chromaggus is the fruit of Nefarian''s experiments, a dragon of many colors bred to hold the powers of every flight and to answer to none of their Aspects. He waits in his own hall beyond the Halls of Strife, his scales shifting from one hue to the next, his breath a different ruin with every change.', '', 'Vaelan gossip 12044'),
(267704, 2, 2677, 0, 0, 1, 'Nefarian', 'Nefarian, son of Deathwing and Lord of Blackrock, walks the Spire in the guise of a man, Lord Victor Nefarius, and carries on his father''s work. Time, he says, is his greatest ally, and the game mortals think they play in fact plays them. When his minions fail he takes his true form and calls on his birthright, the fury of the earth.', '', 'creature_text 11583, 10162; Lord Victor Nefarius gossip 21330-21332; quests 7781, 7783');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(267700, 1, 0, 255, 'The bronze dragonflight wants the Broodlord Lashlayer dead, the beast that guards the Halls of Strife before the inner sanctum. Whoever does it may be the first in a thousand years to earn the Brood''s favor.', 'Blackwing Lair quest 8288'),
(267702, 1, 0, 255, 'For a thousand years Vaelastrasz had kept a shard of the Scepter of the Shifting Sands. Nefarius took it from him and means to destroy it.', 'Vaelastrasz gossip 21333; quest 8730; creature_text 13020'),
(267702, 2, 0, 255, 'With his death his soul found its ease, and the Aspects, a dragon said, watch the shard''s new bearer with great interest.', 'Vaelastrasz gossip 21333; quest 8730; creature_text 13020'),
(267704, 1, 0, 255, 'Beaten, he raised his fallen servants to fight again, and died crying that he was the master here and that mortals were nothing to his kind.', 'creature_text 11583, 10162; Lord Victor Nefarius gossip 21330-21332; quests 7781, 7783'),
(267704, 2, 0, 255, 'Thrall greeted the great scarred head with a warning: the son of Deathwing lay dead, and surely the evil one stirred.', 'creature_text 11583, 10162; Lord Victor Nefarius gossip 21330-21332; quests 7781, 7783');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(267700, 1, 2677, 0),
(267701, 3, 12435, 0),
(267701, 3, 12557, 0),
(267702, 2, 13020, 0),
(267702, 3, 13020, 0),
(267703, 3, 14020, 0),
(267704, 3, 11583, 0),
(267704, 4, 7781, 0),
(267704, 4, 7783, 0),
(267700, 4, 8288, 1),
(267700, 5, 8288, 1),
(267702, 4, 8730, 1),
(267702, 5, 8730, 2),
(267704, 3, 11583, 1),
(267704, 5, 7783, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(267700, 90000024, 0),
(267700, 158300, 1),
(267700, 267704, 2),
(267701, 267700, 0),
(267701, 267704, 1),
(267702, 158304, 0),
(267702, 90000079, 1),
(267702, 267704, 2),
(267703, 158304, 0),
(267703, 267704, 1),
(267704, 90000024, 0),
(267704, 215901, 1),
(267704, 158304, 2);

-- The Blood Furnace
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 371300 AND 371399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 371300 AND 371399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 371300 AND 371399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 371300 AND 371399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(371300, 0, 3713, 0, 0, 8, 'The Blood Furnace', 'The Blood Furnace lies deep inside Hellfire Citadel, a wing of halls and cell blocks that the Fel Horde guards well. Shadowmoon warlocks tend it beside felguards and imps, a mo''arg demon called the Maker works there like a craftsman at his bench, and orc captives fill its cells. In its chambers wait nascent fel orcs, new to their red skins and eager for blood, and through the halls goes up the cry that the blood is their power.', '', 'zones/blood_furnace.txt (map 542: area 3713 only); DB spawns map 542: Shadowmoon Warlock 17371, Summoner 17395, Adept 17397, Technician 17414, Channeler 17653; Laughing Skull Enforcer 17370, Rogue 17491, Warden 17624, Legionnaire 17626; Felguard Annihilator 17400, Felguard Brute 18894; Hellfire Imp 17477; Orc Captive 17416 (38); Nascent Fel Orc 17398 (23); bosses 17381, 17380, 17377; creature_text 17414 group 1 (begins to arm the Proximity Bomb); 17398 group 0 (The blood is our power!); boss_kelidan_the_breaker.cpp (Evocation ritual inside the ring of Shadowmoon Channelers); quests 9607 and 9608 descriptions (something unnatural is occurring in there); warcraft.wiki.gg/wiki/The_Blood_Furnace; creature_text 17381 groups 0 (My work must not be interrupted; Perhaps I can find a use for you; Anger... hate... These are tools I can use) and 1 (Let''s see what I can make of you); creature_template 17381 type 3 (demon); warcraft.wiki.gg/wiki/The_Maker (male mo''arg); creature_text 17380 (Come intruders....); creature_template 17380 type 3 (demon); boss_broggok.cpp, instance_blood_furnace.cpp, blood_furnace.h (prison cells 181817-181821, lever 181982, rear door 181819); warcraft.wiki.gg/wiki/Broggok (an observer that floats; poison bolt, slime spray, poison cloud); quests 9589 (Gunny 17479, Alliance) and 9590 (Caza''rez 17558, Horde) descriptions, log text and reward text; quest_template_addon PrevQuestID 9589 <- 9587, 9590 <- 9588 (after Dark Tidings, told in the Ramparts file); creature_loot 23894 Fel Orc Blood Vial from the furnace''s fel orcs (loot 17370, 17377, 17381); quests 9607 (Gunny to Danath, Alliance) and 9608 (Caza''rez to Nazgrel, Horde) descriptions and reward text; quest_template RewardNextQuest 9575 -> 9607, 9572 -> 9608 (after Weaken the Ramparts, told in the Ramparts file); hellfire.json 348305 notes (the reveal left for this file)'),
(371303, 2, 3713, 0, 0, 8, 'Keli''dan the Breaker', 'Keli''dan the Breaker, a fel orc sorcerer, holds the deepest chamber of the Blood Furnace. He does not stand guard so much as stand at work: in the middle of a ring of five Shadowmoon channelers he keeps a ritual burning, his whole attention bent on it, and he warns those who interrupt that they will ruin everything.', '', 'boss_kelidan_the_breaker.cpp (Evocation while out of combat; the five Shadowmoon Channelers 17653 around him; he joins the fight once they are dead); creature_text 17377; quest 11362 description (a blood orc within Hellfire Citadel known as Keli''dan the Breaker); warcraft.wiki.gg/wiki/Keli''dan_the_Breaker (fel orc)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(371300, 1, 0, 255, 'Honor Hold and Thrallmar want vials of fel orc blood. If they knew how the fel orcs are made, they might find a way to stop it, or even to reverse it.', 'zones/blood_furnace.txt (map 542: area 3713 only)'),
(371300, 2, 0, 255, 'They have a pit lord. The fel orcs are made from its blood, a new breed not aligned with the Legion, and what was done to the orcs of Draenor could be done to any orc at all.', 'zones/blood_furnace.txt (map 542: area 3713 only)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(371300, 1, 3713, 0),
(371303, 3, 17377, 0),
(371300, 4, 9589, 1),
(371300, 4, 9590, 1),
(371300, 5, 9607, 2),
(371300, 5, 9608, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(371300, 90000064, 0),
(371300, 383600, 1),
(371300, 348305, 2),
(371303, 371300, 0),
(371303, 90000064, 1);

-- The Botanica
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 384700 AND 384799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 384700 AND 384799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 384700 AND 384799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 384700 AND 384799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(384700, 0, 3847, 0, 0, 8, 'The Botanica', 'The Botanica is the garden satellite of Tempest Keep, a vast greenhouse where Kael''thas''s Sunseeker botanists, chemists and gene-splicers raise and remake plant life of every kind. Their creations crowd the paths, nethervine reapers and tricksters, shrieking mutates and lashing horrors, while bloodwarder protectors and falconers keep the halls and the botanists guard their precious specimens jealously against every intruder.', '', 'Botanica spawns (map 553); creature_text 17975'),
(384701, 2, 3847, 0, 0, 8, 'Warp Splinter', 'Warp Splinter is an ancient that dwells at the heart of the Botanica and calls it its sanctuary. It fights intruders with its saplings, its children, yet it is torn even as it fights, stopping to ask what it is doing and why before driving on. It is confused, it says, and it does not belong here.', '', 'creature_text 17977; Tempest Keep quest 10704 (an ancient in the Botanica)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(384700, 1, 0, 255, 'High Botanist Freywinn scolded intruders that his specimens were very delicate, called on nature to bend to his will, and died fretting that the specimens must be preserved.', 'Botanica spawns (map 553); creature_text 17975');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(384700, 1, 3847, 0),
(384701, 3, 17977, 0),
(384700, 3, 17975, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(384700, 352315, 0),
(384700, 384701, 1),
(384700, 384900, 2),
(384701, 384700, 0),
(384701, 384800, 1);

-- The Culling of Stratholme
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 410000 AND 410099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 410000 AND 410099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 410000 AND 410099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 410000 AND 410099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(410000, 0, 4100, 0, 0, 13, 'The Culling of Stratholme', 'The timeway opens onto the day Prince Arthas came to Stratholme, before the city fell. The plague is already in the grain, Uther and Jaina ride with the prince, and Chromie of the bronze flight waits by the road with work for anyone she can find. In the city the townsfolk go about an ordinary market day, footmen and knights of Lordaeron gather at the gates, and something that does not belong here has come too.', '', 'Culling of Stratholme spawns (map 595); Culling of Stratholme quests 13149, 13151; creature_text 26497, 26499, 26527, 26528, 26533');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(410000, 1, 0, 255, 'The Infinite Dragonflight means to deceive Arthas into believing none of the grain carries the plague, so that he never has to make the fateful decision to cull the city. Chromie means for him to make it.', 'Culling of Stratholme spawns (map 595); Culling of Stratholme quests 13149, 13151; creature_text 26497, 26499, 26527, 26528, 26533'),
(410000, 2, 0, 255, 'At the gates Arthas ordered the city purged. Uther refused, Arthas relieved him of his command and called it treason, and Jaina could not watch. You have just crossed a terrible threshold, Uther told him.', 'Culling of Stratholme spawns (map 595); Culling of Stratholme quests 13149, 13151; creature_text 26497, 26499, 26527, 26528, 26533'),
(410000, 3, 0, 255, 'Mal''Ganis would not die. Your journey has just begun, young prince, he said: meet me in Northrend, where your true destiny will unfold. Arthas swore to hunt him to the ends of the earth and began planning an expedition.', 'Culling of Stratholme spawns (map 595); Culling of Stratholme quests 13149, 13151; creature_text 26497, 26499, 26527, 26528, 26533');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(410000, 1, 4100, 0),
(410000, 4, 13149, 1),
(410000, 5, 13151, 2),
(410000, 5, 13151, 3);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(410000, 44007, 0),
(410000, 92000005, 1),
(410000, 90000089, 2),
(410000, 91000005, 3);

-- The Deadmines
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 158100 AND 158199;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 158100 AND 158199;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 158100 AND 158199;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 158100 AND 158199;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(158100, 0, 1581, 0, 0, 0, 'The Deadmines', 'The Deadmines lie beneath Moonbrook in southern Westfall. They were once the richest gold mines in the human lands, and a Stormwind mining crew was still at work in them when a tunnel came down and buried most of its men. Now the Defias Brotherhood holds them as its secret hideout, the place its highest ranks keep to, out of the militia''s sight. Defias miners still cut the rock, goblins labor in the deeper workings, and something is being built at the bottom.', '', 'warcraft.wiki.gg/wiki/The_Deadmines_(original), official description cited to the Battle.net zone page (once the greatest gold production center in the human lands; the Defias turned the dark tunnels into their private sanctum); the same text is npc_text 7187 (broadcast 9892: goblins rumored conscripted to build something at the bottom of the mines, what it is still uncertain), which no gossip menu uses, so it stands only beside the wiki; npc_text 7227 (the Deadmines beneath Moonbrook in the south of Westfall); DB spawns map 36: Defias Miner 598 x46, Defias Strip Miner 4416 x27, Defias Overseer 634 x12, Defias Evoker 1729 x10, Defias Taskmaster 4417 x3; Rhahk''Zor 644 (ogre model) in the first chamber; Goblin Woodcarver 641, Goblin Craftsman 1731, Goblin Engineer 622, Goblin Shipbuilder 3947; quest 214 description (highest ranking members in VanCleef''s secret hideout); quest 2040 description (a functional goblin shredder deep in the Deadmines); quest 167 and 168 descriptions (Wilder Thistlenettle, dwarf model; the mine tunnel collapsed); zones/deadmines.txt (map 36: 1581 The Deadmines, 1582 Ironclad Cove); quests 167 and 168 descriptions and log text (Wilder Thistlenettle 656 starts and ends both; AllowableRaces 1101; QuestSortID 1581); creature 656 Wilder Thistlenettle, dwarf model, single spawn in Stormwind; warcraft.wiki.gg/wiki/The_Deadmines_(original) (the tunnels to the instance portal hold Skeletal Miners, Undead Dynamiters and Undead Excavators; Foreman Thistlenettle outside the instance); quest 214 description and log text (Red Bandanas the trademark; the material signifies rank; highest ranking members in VanCleef''s secret hideout; 10 Red Silk Bandanas as proof of their deaths); creature 820 Scout Riell, The People''s Militia, human female model, at Sentinel Hill; starts and ends 214 (PrevQuestID 155, AllowableRaces 1101, QuestSortID 1581); creature_loot_template: Red Silk Bandana 915 from the Defias in the Deadmines (598, 634, 636, 657, 1725, 1729, 1732, 4416, 4417, 4418) and in the tunnels outside (594, 619, 824, 1726, 1727)'),
(158101, 1, 1581, 0, 0, 0, 'Ironclad Cove', 'At the bottom of the Deadmines an iron-clad door shuts off Ironclad Cove, a sea cavern hidden from the world above, and in it lies what the goblins have been building: a great ship, fitted out at docks and scaffolding. A goblin captain, a tauren first mate and a crew of Defias pirates man her, and aboard waits the master of the Brotherhood himself.', '', 'zones/deadmines.txt (1582 Ironclad Cove, parent 1581); WMOAreaTable rows named Ironclad Cove (WMO 500); gameobject 16397 Iron Clad Door at -101,-669 z7; 16398 Defias Cannon at -108,-660; 17155 Defias Gunpowder at -106,-617; DB spawns map 36, all south of the door (y below -680): Goblin Shipbuilder 3947 x16, Defias Pirate 657 x21, Defias Squallshaper 1732 x19 (Fire Blast, Frost Nova, Frost Armor), Defias Blackguard 636 x4 (stealthed, creature_text 636 jumps out of the shadows); creature 639 Edwin VanCleef at -87,-820 z39, 646 Mr. Smite, 647 Captain Greenskin, 645 Cookie in the cove; warcraft.wiki.gg/wiki/Ironclad_Cove (walled-in cavern holding the Defias ship; shipyard, docks and scaffolding around her); npc_text 7187 (goblins conscripted to build something at the bottom of the mines); map 36 terrain grid (maps/0363232, 0363233) against every creature and gameobject spawn: the terrain lies above every point north of the Iron Clad Door (about z 250 to 300 over the mine), so the core takes the WMO''s area (1581) there; the terrain lies below only at the door and in the cove (y -669 and south), the only places where the grid''s 1582 can be reported; creature 646 Mr. Smite, The Ship''s First Mate, single spawn on map 36 at -23,-797 z20 in the cove; tauren model; C++ boss_mr_smite (not changed by the module); creature_text 646 groups 0 (You there, check out that noise!) and 1 (We''re under attack! Avast, ye swabs! Repel the invaders!); smart_scripts 1639800 (Defias Cannon 16398 hit: open the Iron Clad Door 16397, Smite says line 0, two Defias Squallshapers summoned and sent to the door, Smite says line 1); warcraft.wiki.gg/wiki/The_Deadmines_(original) (a tauren first mate who guards the ship; blasting the door alerts him)'),
(158103, 1, 1581, 0, 0, 0, 'The Mast Room and the Goblin Foundry', 'Deep in the Deadmines the Brotherhood''s goblins do its building. In the Mast Room woodcarvers cut and shape timber under Sneed the Lumbermaster, who oversees them from the cockpit of a logging shredder, and in the Goblin Foundry craftsmen melt ore under Gilnid the Smelter. Everything they make is carried down to the bottom of the mine.', '', 'creature 642 Sneed''s Shredder and 643 Sneed, both subname Lumbermaster; 642 single spawn on map 36 at -289,-513 z50, shredder model; 643 goblin model; DB spawns Goblin Woodcarver 641 x13, x -309 to -264, z 48 to 51, around the shredder (Axe Toss, Cleave); WMOAreaTable 11808 Mast Room (WMO 500); gameobject 16400 Mast Room Door, guid 26185; quest 2040 description (a functional goblin shredder deep in the Deadmines); warcraft.wiki.gg/wiki/The_Deadmines_(original) (Sneed, a goblin, runs the Mast Room inside his shredder and jumps out when it is destroyed); creature 1763 Gilnid, The Smelter, single spawn on map 36 at -177,-574 z19; goblin model; creature_text 1763 group 0 (Get those parts moving down to the ship!; Anyone want to take a break? Well too bad! Get to work you oafs!), said out of combat every 2 minutes (smart_scripts 1763, the same in the module); DB spawns Goblin Craftsman 1731 (Melt Ore), Goblin Engineer 622 x6 at z19-21 (Summon Remote-Controlled Golem), Defias Taskmaster 4417 (one on the foundry floor at -149,-581 z19; the others and the Defias Wizards 4418 stand on the upper passage or by the alcove beyond); WMOAreaTable 11776 Goblin Foundry (WMO 500); warcraft.wiki.gg/wiki/The_Deadmines_(original) (Gilnid, a goblin, presides over the Goblin Foundry); quest 2040 description and log text (Gnomeregan has fallen to the troggs; a functional goblin shredder deep in the Deadmines; the intact power supply; gyrodrillmatic excavationators to break through the rocky underground borders of Gnomeregan; a gnomish assault); quest 2041 description (Shoni the Shilent, commander of our underground assault crew, in Stormwind; RewardNextQuest 2040), used only as a source: ACCEPT 2041 belongs to ironforge.json 153713; creature 6579 Shoni the Shilent, gnome female model, in Stormwind; starts and ends 2040 (AllowableRaces 1101, QuestSortID 1581)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(158100, 1, 0, 255, 'The red bandana marks every member of the Brotherhood, but the cloth tells rank, and the silk ones, worn by its highest, are found here.', 'warcraft.wiki.gg/wiki/The_Deadmines_(original), official description cited to the Battle.net zone page (once the greatest gold production center in the human lands; the Defias turned the dark tunnels into their private sanctum); the same text is npc_text 7187 (broadcast 9892: goblins rumored conscripted to build something at the bottom of the mines, what it is still uncertain), which no gossip menu uses, so it stands only beside the wiki'),
(158100, 2, 0, 255, 'The crew lost in the collapse did not stay buried. Its men walk the fallen tunnels still as skeletal miners, excavators and dynamiters.', 'warcraft.wiki.gg/wiki/The_Deadmines_(original), official description cited to the Battle.net zone page (once the greatest gold production center in the human lands; the Defias turned the dark tunnels into their private sanctum); the same text is npc_text 7187 (broadcast 9892: goblins rumored conscripted to build something at the bottom of the mines, what it is still uncertain), which no gossip menu uses, so it stands only beside the wiki'),
(158101, 1, 0, 255, 'Edwin VanCleef died on the deck of his ship, and at Sentinel Hill the People''s Militia called his death the beginning of the end for the Defias Brotherhood.', 'zones/deadmines.txt (1582 Ironclad Cove, parent 1581); WMOAreaTable rows named Ironclad Cove (WMO 500)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(158100, 1, 1581, 0),
(158101, 1, 1582, 0),
(158101, 3, 657, 0),
(158101, 3, 1732, 0),
(158103, 3, 641, 0),
(158103, 3, 1731, 0),
(158103, 3, 642, 0),
(158103, 3, 1763, 0),
(158100, 4, 214, 1),
(158100, 5, 167, 2),
(158100, 5, 168, 2),
(158101, 3, 639, 1),
(158101, 5, 166, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(158100, 90000015, 0),
(158100, 4010, 1),
(158100, 158101, 2),
(158101, 4017, 0),
(158101, 90000015, 1),
(158101, 4016, 2),
(158103, 158101, 0),
(158103, 158100, 1),
(158103, 90000015, 2);

-- Dire Maul
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 255700 AND 255799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 255700 AND 255799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 255700 AND 255799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 255700 AND 255799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(255700, 0, 2557, 0, 0, 0, 'Dire Maul', 'Within the walls of Dire Maul lie the sealed wings of Eldre''Thalas, the city of Queen Azshara''s Highborne. In the east, the Warpwood Quarter, satyrs and twisted treants have overrun the gardens. In the west the city''s last Highborne still keep their halls, where strange pylons hum and ghosts of their people drift. In the north the Gordok ogres have made a kingdom of the old commons, and the strongest of them wears the crown.', '', 'Dire Maul quests 7488, 7489'),
(255701, 1, 2557, 0, 0, 0, 'The Warpwood Quarter', 'The Warpwood Quarter is the eastern wing of Dire Maul, its old gardens overgrown and corrupted. Satyrs hold it, and the trees themselves have turned: Tendris Warpwood calls the ancients of the grove to rise against intruders. Its master is the satyr Alzzin the Wildshaper, and the imp Pusillin hides among them with a stolen key to the city''s sealed halls.', '', 'Dire Maul quest 7441; creature_text 11489'),
(255702, 2, 2557, 0, 0, 0, 'Prince Tortheldrin', 'Prince Tortheldrin has ruled Eldre''Thalas for ten thousand years. He leads the Shen''dralar, Queen Azshara''s most revered arcanists, in whose halls her most important demands were carried out in secret. After the Well was destroyed he raised the pylons of the west wing, and behind their great field he keeps a demon of immense power, Immol''thar, imprisoned.', '', 'Shen''dralar Ancient gossip 5723-5729; quests 7461, 1318, 7703'),
(255703, 1, 2557, 0, 0, 0, 'The Athenaeum', 'The Athenaeum is the library of the Shen''dralar in the west wing of Dire Maul, kept by lorekeepers who have indexed ten thousand years of existence and find present troubles meaningless. With its chest beneath the stair and its shelves of old knowledge, it is the one place in the city where its Highborne will deal with outsiders.', '', 'Lorekeeper Lydros gossip 5747; quest 7507 (Foror''s Compendium, its seal broken; reward text)'),
(255704, 2, 2557, 0, 0, 0, 'King Gordok', 'King Gordok rules the ogres who have made the north wing of Dire Maul their kingdom, and he means to stay king forever. Among the Gordok the crown passes to whoever kills the king, and Cho''Rush the Observer will serve the next one as faithfully as the last.', '', 'Dire Maul quests 1318, 7703; creature_text 11501; Cho''Rush gossip 5742');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(255700, 1, 0, 255, 'A blood elf mage, Lethtendris, fled into the Warpwood Quarter with a web she made to siphon the city''s tainted magic, and both the Alliance and the Horde want it taken from her.', 'Dire Maul quests 7488, 7489'),
(255702, 1, 0, 255, 'The demon was meant as a battery for the city''s magic. As the cost of holding it grew, the Prince fed it with his own people: the Highborne ghosts in the halls were slain by Tortheldrin himself.', 'Shen''dralar Ancient gossip 5723-5729; quests 7461, 1318, 7703'),
(255702, 2, 0, 255, 'Long ago Tortheldrin stole the Gauntlet of Gordok Might from an ogre king, and every Gordok king since has failed to win it back.', 'Shen''dralar Ancient gossip 5723-5729; quests 7461, 1318, 7703'),
(255703, 1, 0, 255, 'Foror''s Compendium, a book of dragon slaying sealed in the Athenaeum, was found with its seal broken. Lydros is not pleased: its secrets now lie open to any with the wit to read them.', 'Lorekeeper Lydros gossip 5747; quest 7507 (Foror''s Compendium, its seal broken; reward text)'),
(255704, 1, 0, 255, 'Made king, the victor can try for the Gauntlet of Gordok Might, an artifact marked with magic older than the Gordok themselves, which only the one true king may recover.', 'Dire Maul quests 1318, 7703; creature_text 11501; Cho''Rush gossip 5742');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(255700, 1, 2557, 0),
(255701, 3, 11489, 0),
(255701, 3, 11492, 0),
(255701, 3, 11490, 0),
(255701, 3, 14327, 0),
(255701, 4, 7441, 0),
(255702, 3, 11486, 0),
(255702, 3, 11496, 0),
(255702, 2, 14358, 0),
(255702, 4, 7461, 0),
(255703, 2, 14368, 0),
(255703, 2, 16032, 0),
(255704, 3, 11501, 0),
(255704, 2, 14324, 0),
(255700, 4, 7488, 1),
(255700, 4, 7489, 1),
(255702, 2, 14358, 1),
(255702, 4, 7461, 1),
(255702, 4, 1318, 2),
(255702, 4, 7703, 2),
(255703, 5, 7507, 1),
(255704, 5, 7703, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(255700, 35708, 0),
(255700, 90000057, 1),
(255700, 90000026, 2),
(255701, 255700, 0),
(255701, 90000050, 1),
(255702, 90000057, 0),
(255702, 255703, 1),
(255702, 255704, 2),
(255703, 255702, 0),
(255703, 90000057, 1),
(255704, 90000026, 0),
(255704, 255702, 1),
(255704, 35708, 2);

-- Drak'Tharon Keep
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 419600 AND 419699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 419600 AND 419699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 419600 AND 419699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 419600 AND 419699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(419600, 0, 4196, 0, 0, 13, 'Drak''Tharon Keep', 'Drak''Tharon Keep is the Drakkari fortress on the border of the Grizzly Hills and Zul''Drak, raised in ages past to be impervious. The Scourge holds it now as a stepping stone in its war on Zul''Drak: risen Drakkari warriors, soulmages, bat riders and death knights walk its halls with ghouls and brutes, reanimators raise the fallen to fight for their new liege, and webs choke the lower passages.', '', 'Drak''Tharon Keep spawns (map 600); Drak''Tharon quests 12037, 12238, 13129, 13249; Kurzel gossip 9690'),
(419601, 2, 4196, 0, 0, 13, 'The Prophet Tharon''ja', 'The Prophet Tharon''ja rules Drak''Tharon Keep for the Scourge, a Drakkari prophet risen in undeath who holds his dynasty eternal: Tharon''ja sees all, and the work of mortals shall not end it. He strips the flesh of his foes to the bone and takes their mortal shells for his own use.', '', 'creature_text 26632; Drak''Tharon quest 13249');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(419600, 1, 0, 255, 'Kurzel of the Granite Springs bounty hunters came in alone when her partners would not, and was found alive in the depths. She means to teach the lazy lot a lesson they will not forget.', 'Drak''Tharon Keep spawns (map 600); Drak''Tharon quests 12037, 12238, 13129, 13249; Kurzel gossip 9690'),
(419600, 2, 0, 255, 'At the top of the keep Drakuru performed his ritual, meant, he said, to cleanse it and restore it to its noble purpose. Then he told his helpers to seek him in Zul''Drak when the time was right: there was a war to be won.', 'Drak''Tharon Keep spawns (map 600); Drak''Tharon quests 12037, 12238, 13129, 13249; Kurzel gossip 9690'),
(419601, 1, 0, 255, 'Dying, the prophet could not believe what was happening to him: Tharon''ja was eternal, he insisted, until the words failed him.', 'creature_text 26632; Drak''Tharon quest 13249');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(419600, 1, 4196, 0),
(419601, 3, 26632, 0),
(419600, 4, 13129, 1),
(419600, 5, 12238, 2),
(419601, 3, 26632, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(419600, 39406, 0),
(419600, 90000081, 1),
(419600, 6623, 2),
(419600, 419601, 3),
(419601, 419600, 0),
(419601, 90000081, 1),
(419601, 90000006, 2);

-- The Eye of Eternity
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 450000 AND 450099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 450000 AND 450099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 450000 AND 450099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 450000 AND 450099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(450000, 0, 4500, 0, 0, 13, 'The Eye of Eternity', 'The Eye of Eternity is Malygos''s own domain at the heart of the Nexus, a platform hanging in a starry void that can be reached only through the focusing iris. It is a realm of his making, where he claims the rules of reality do not apply, and here all the magic he drains from the world gathers around him in the dark.', '', 'Eye of Eternity quests 13384, 13385; creature_text 28859, 32295');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(450000, 1, 0, 255, 'Krasus brings the judgment of the other Aspects: Malygos cannot be brought back into the fold, and the Spell-Weaver must be put down.', 'Eye of Eternity quests 13384, 13385; creature_text 28859, 32295'),
(450000, 2, 0, 255, 'In his realm Malygos offered one chance to pledge fealty. Then he blamed reckless, careless mortals for the war, and accepted their extinction if that was the price.', 'Eye of Eternity quests 13384, 13385; creature_text 28859, 32295'),
(450000, 3, 0, 255, 'His last words were for his sister: the mortals would destroy everything. Alexstrasza answered that he had given her no alternative, declared the Nexus War ended, and said she would mourn him, once a guardian.', 'Eye of Eternity quests 13384, 13385; creature_text 28859, 32295'),
(450000, 4, 0, 255, 'Magic is now without its guardian, Krasus said. He hoped the decision would prove wise, for a storm was still brewing and the world had lost one of its mightiest defenders.', 'Eye of Eternity quests 13384, 13385; creature_text 28859, 32295');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(450000, 1, 4500, 0),
(450000, 4, 13384, 1),
(450000, 4, 13385, 1),
(450000, 3, 28859, 2),
(450000, 3, 28859, 3),
(450000, 5, 13384, 4),
(450000, 5, 13385, 4);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(450000, 353723, 0),
(450000, 6523, 1),
(450000, 90000063, 2),
(450000, 90000078, 3);

-- The Forge of Souls
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 480900 AND 480999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 480900 AND 480999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 480900 AND 480999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 480900 AND 480999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(480900, 0, 4809, 0, 0, 16, 'The Forge of Souls', 'The Forge of Souls is a side way into Icecrown Citadel, a great engine where the Cult of the Damned harvests the souls of the dead for the master''s host. Soulguard watchmen, reapers, animators and bonecasters tend its machines of death, and souls in torment drift through its halls. Lady Jaina Proudmoore and Lady Sylvanas Windrunner have each found the hole in the citadel''s defenses and slipped inside with a small band, while the Lich King''s eyes are on the front gate.', '', 'Forge of Souls spawns (map 632); Forge of Souls quests 24499, 24511; creature_text 37596, 37597'),
(480901, 2, 4809, 0, 0, 16, 'The Devourer of Souls', 'The Devourer of Souls is the harvest of the forge made flesh, a towering host of the souls it has taken, and it screams at those who dare look upon it that it will devour them whole. Its keeper, Bronjahm, the Godfather of Souls, fed it everyone he could sever from his body, promising that the Devourer awaited.', '', 'creature_text 36497, 36502');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(480900, 1, 0, 255, 'Jaina hopes that past the forge, in the Halls of Reflection where Arthas lets his guard down, she will find a clue to his weakness, or maybe, just maybe, his redemption.', 'Forge of Souls spawns (map 632); Forge of Souls quests 24499, 24511; creature_text 37596, 37597'),
(480900, 2, 0, 255, 'Sylvanas hopes that past the forge, in the Halls of Reflection where Arthas lets his guard down, she will find a clue to his weakness, and a route to a vengeance long overdue.', 'Forge of Souls spawns (map 632); Forge of Souls quests 24499, 24511; creature_text 37596, 37597'),
(480901, 1, 0, 255, 'Dying, the Devourer warned that the swell of souls would not be abated: its killers had only delayed the inevitable.', 'creature_text 36497, 36502');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(480900, 1, 4809, 0),
(480901, 3, 36502, 0),
(480901, 3, 36497, 0),
(480900, 5, 24499, 1),
(480900, 5, 24511, 2),
(480901, 3, 36502, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(480900, 21018, 0),
(480900, 92000005, 1),
(480900, 480901, 2),
(480901, 480900, 0),
(480901, 91000021, 1);

-- Gnomeregan
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 72100 AND 72199;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 72100 AND 72199;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 72100 AND 72199;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 72100 AND 72199;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(72100, 0, 721, 0, 0, 0, 'Gnomeregan', 'Gnomeregan was the capital of the gnomes, a city of workshops and machine halls beneath the western hills of Dun Morogh, lost when troggs broke in from below and the purge meant to stop them poisoned it. Mekgineer Thermaplugg now rules what is left from its lowest halls. The gnomes who stayed are leprous, so clouded by the sickness that they still fight the invasion, cutting down every stranger as a trogg. Irradiated troggs swarm the halls, and the city''s machines still patrol.', '', 'warcraft.wiki.gg/wiki/Gnomeregan_(instance) (gnomish capital, trogg invasion, irradiated, Thermaplugg in the deepest court, mutant troggs, Dark Iron agents and ambassador near the Tinkers'' Court); dun_morogh.json 113 (outdoor entrance in the western hills; failed radiation purge, told there); creature_text 6222, 6223, 6224, 7603 (No gnome will be left behind; the troggs never stop coming; this sickness clouds my vision but I know you must be a trogg); creature_text 6206, 6207, 6211, 6212, 6222-6224, 6228, 6391, 7603 (splashed by the blood and becomes irradiated, on hit by spell 9798 Radiation) and 6329 (Irradiated Pillager: blood sprays into the air); DB spawns on map 90: Irradiated Pillager 6329 x46, Caverndeep Burrower/Reaver/Ambusher, Irradiated Slime 6218, Corrosive Lurker 6219, Irradiated Horror 6220, Leprous Assistant/Technician/Machinesmith/Defender, Mechano-Tank/Flamewalker/Frostwalker, Mechanized Sentry/Guardian, Dark Iron Agent 6212 x34 (x -771 to -626, z about -306), Mekgineer Thermaplugg 7800 (z -325); quests 2841 (goblins want the new rig''s blueprints), 2922, 2924, 2929, 2930 descriptions (the exiles'' errands, told in ironforge.json); quest 2951 description (gnomes holding out against the madness outside the room); npc_text 1693 (gossip_menu 1080: two-headed ogre; overrun by troggs; attempts to wipe them out resulted in mass contamination; scientists in Ironforge working on a cure; stop the invasion and the city may be retaken); creature_text 7998 groups 0-1 (evaluate these tunnels; find out where these troggs are coming from and put a stop to the invasion); creature 7998 single spawn on map 90 at -515,-139; warcraft.wiki.gg/wiki/Blastmaster_Emi_Shortfuse (gnome; end of the first hall on the left after entering); DB spawns on map 90: Mechano-Tank 6225, Mechano-Flamewalker 6226, Mechano-Frostwalker 6227, Mechanized Sentry 6233, Mechanized Guardian 6234, Arcane Nullifier X-21 6232, Peacekeeper Security Suit 6230, Mobile Alert System 7849; faction template 63 shared with the leper gnomes; quest 2928 description (bots and mechs roam around that place like cattle on an open range); creature_text 7800 group 1 (My machines are the future), not used in the opening; smart_scripts 7849 and creature_text 7849 (Mobile Alert System: Warning! Intruder alert!; summons Leprous Assistant 7603 and Leprous Defender 6223); smart_scripts 6224 (Leprous Machinesmith: in combat, Supercharge on the nearest Mechanized Sentry 6233 or Mechano-Flamewalker 6226), not changed by the module'),
(72101, 1, 721, 0, 0, 0, 'The Holdouts'' Room', 'In the middle of the ruined city one room still holds out against the madness outside it. A band of gnome holdouts keeps it, warriors, medics and technicians who stand with the exiles in Ironforge, and an engineer sells supplies there, though business has not been good. Against the walls stand gnomish Sparklematic machines that scrub the grime from any valuable for a few coins.', '', 'quest 2951, 4601, 4602 descriptions (gnomes holding out against the madness outside the room; the Sparklematic plaque); gameobjects 142487, 175084, 175085 The Sparklematic 5200, all at z -193.7 beside the holdouts (x -497 to -550, y 163 to 206); 144179 Mailbox at -548,167; DB spawns: Holdout Warrior 6391, Holdout Medic 6392, Holdout Technician 6407 and Tink Sprocketwhistle 9676 at z -193.6, x -491 to -566, y 167 to 223; templates 23 and 875 are faction 54 Gnomeregan Exiles; npc_text 3156 (Tink: business hasn''t been all that good as of late), creature_template 9676 subname Engineering Supplies; warcraft.wiki.gg/wiki/Clean_Zone and Gnomeregan_(instance) (the room''s NPCs and machines; its name not used, see notes)'),
(72102, 2, 721, 0, 0, 0, 'Mekgineer Thermaplugg', 'Sicco Thermaplugg was once High Tinker Mekkatorque''s trusted friend and chief advisor. Now he holds the deepest chamber of Gnomeregan as his own, calls those who come for it usurpers, and to the exiles in Ironforge he is the traitor who doomed their city. The goblins of Orgrimmar know him for something else: beside him stands a safe holding the plans of a new gnomish rig, and only he knows its combination.', '', 'quest 2904 reward text (that good-for-nothing backstabber, Mekgineer Thermaplugg); quest 2841 description (blueprints locked in a safe near Thermaplugg; combination known only to him); gameobject 142477 Thermaplugg''s Safe at -460,635, beside his spawn at -531,670 (map 90); creature 7800 single spawn on map 90; creature_template faction 63 (faction 53), shared with the leper gnomes, the machines and the Dark Iron agents; warcraft.wiki.gg/wiki/Mekgineer_Thermaplugg (Gelbin''s chief advisor; rules from the Tinkers'' Court); quest 2929 description (betrayed me and the entire gnomish people; that madman is in charge), pointed to in one phrase; told in ironforge.json 153703 and 153713; quest 2841 description and log text; quest 2842 description and reward text; quest 2843 description (transponder calibrated; return by the pad in Gnomeregan); creature 3412 Nogg, Apprentice Engineer, and 3413 Sovik in Orgrimmar; 7853 Scooty in Booty Bay; no zone file uses 2841-2843');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(72100, 1, 0, 255, 'Blastmaster Emi Shortfuse still believes the city can be retaken if the invasion is stopped. She blasted shut the tunnels where the troggs were breaking in from below.', 'warcraft.wiki.gg/wiki/Gnomeregan_(instance) (gnomish capital, trogg invasion, irradiated, Thermaplugg in the deepest court, mutant troggs, Dark Iron agents and ambassador near the Tinkers'' Court)'),
(72102, 1, 0, 255, 'The blueprints reached Orgrimmar, and the goblin Nogg means to make every gnomish innovation in the rig a goblin innovation for his new shredders.', 'quest 2904 reward text (that good-for-nothing backstabber, Mekgineer Thermaplugg)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(72100, 1, 721, 0),
(72101, 2, 9676, 0),
(72101, 4, 2951, 0),
(72101, 4, 4601, 0),
(72101, 4, 4602, 0),
(72102, 3, 7800, 0),
(72102, 4, 2841, 0),
(72100, 3, 7361, 1),
(72102, 5, 2841, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(72100, 90000014, 0),
(72100, 90000013, 1),
(72100, 113, 2),
(72101, 72100, 0),
(72101, 90000014, 1),
(72102, 153703, 0),
(72102, 90000014, 1),
(72102, 72100, 2);

-- Gruul's Lair
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 392300 AND 392399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 392300 AND 392399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 392300 AND 392399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 392300 AND 392399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(392300, 0, 3923, 0, 0, 8, 'Gruul''s Lair', 'Gruul''s Lair lies at the end of Daggermaw Canyon in northern Blade''s Edge, the cave where Gruul the Dragonkiller, greatest of the gronn, makes his home. Only the toughest ogres are trusted to guard its approach. Inside, lair brutes and gronn-priests keep the tunnels, and the ogre lords who serve the gronn hold the first great chamber in his name.', '', 'Blade''s Edge quest 10805 (the toughest ogres guard the exterior); creature_text 18831'),
(392301, 2, 3923, 0, 0, 8, 'Gruul the Dragonkiller', 'Gruul the Dragonkiller waits at the back of his lair, the greatest of the gronn, master of the ogre clans of Blade''s Edge and father of the gronn who rule them in his name. He speaks little, a word at a time: come and die, scurry, beg for life. The longer anyone stands against him, the larger he grows, until the stone of his cave shatters under his blows.', '', 'creature_text 19044');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(392300, 1, 0, 255, 'High King Maulgar, lord of the ogres, holds that chamber for Gruul with four ogre lords at his side: Kiggler the Crazed, Blindeye the Seer, Olm the Summoner and Krosh Firehand. Gronn, he says, are the real power in Outland.', 'Blade''s Edge quest 10805 (the toughest ogres guard the exterior); creature_text 18831');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(392300, 1, 3923, 0),
(392301, 3, 19044, 0),
(392300, 3, 18831, 1),
(392300, 3, 18832, 1),
(392300, 3, 18834, 1),
(392300, 3, 18835, 1),
(392300, 3, 18836, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(392300, 90000072, 0),
(392300, 90000026, 1),
(392300, 392301, 2),
(392301, 90000072, 0),
(392301, 352212, 1),
(392301, 392300, 2);

-- Gundrak
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 441600 AND 441699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 441600 AND 441699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 441600 AND 441699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 441600 AND 441699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(441600, 0, 4416, 0, 0, 13, 'Gundrak', 'Inside, Gundrak is the heart of the Drakkari''s last stand and of their final madness. The high prophets of the animal gods hold its altars, each grown mighty on the mojo of a god his people slew, while lancers, fire weavers, earthshakers and god hunters crowd the halls with golems and war rhinos, serpents coil through the snake prophet''s chambers, and pools of living mojo seep across the floors.', '', 'Gundrak spawns (map 604); Gundrak quest 13098; creature_text 29304, 29305'),
(441601, 2, 4416, 0, 0, 13, 'Gal''darah', 'Gal''darah is the high prophet of Akali, the rhino god whose mojo he has drunk almost to the last, and he rules Gundrak''s deepest hall. Who needs gods, he crows, when the Drakkari are gods? He takes the rhino''s shape and power for his own, and he is poised to break out of the city with his followers.', '', 'Gundrak quests 13096, 13250; creature_text 29306');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(441600, 1, 0, 255, 'History is repeating itself, the Zandalari chronicler Bah''Kini says: when trolls turn on their own gods, the end is certain, and she records it so that others might not walk the same path.', 'Gundrak spawns (map 604); Gundrak quest 13098; creature_text 29304, 29305'),
(441600, 2, 0, 255, 'Slad''ran, prophet of the snake god Sseratus, saw at the end that the Scourge had not been the Drakkari''s greatest enemy.', 'Gundrak spawns (map 604); Gundrak quest 13098; creature_text 29304, 29305'),
(441600, 3, 0, 255, 'Moorabi, prophet of the mammoth god Mam''toth, boasted that his people had fought back the Scourge. Dying, he drew the lesson: if their gods could die, so could they.', 'Gundrak spawns (map 604); Gundrak quest 13098; creature_text 29304, 29305'),
(441601, 1, 0, 255, 'The Zandalari observer Tol''mar was sworn only to watch, but having seen great Akali slain before his eyes, he broke his oath to see the prophet pay.', 'Gundrak quests 13096, 13250; creature_text 29306'),
(441601, 2, 0, 255, 'At the very last even Gal''darah admitted what his people had proven: the mighty can fall, gods and those who drink them alike.', 'Gundrak quests 13096, 13250; creature_text 29306');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(441600, 1, 4416, 0),
(441601, 3, 29306, 0),
(441601, 4, 13096, 0),
(441600, 4, 13098, 1),
(441600, 3, 29304, 2),
(441600, 3, 29305, 3),
(441601, 4, 13096, 1),
(441601, 3, 29306, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(441600, 6622, 0),
(441600, 90000081, 1),
(441600, 90000082, 2),
(441600, 441601, 3),
(441601, 441600, 0),
(441601, 6622, 1),
(441601, 90000081, 2);

-- Halls of Lightning
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 427200 AND 427299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 427200 AND 427299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 427200 AND 427299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 427200 AND 427299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(427200, 0, 4272, 0, 0, 13, 'Halls of Lightning', 'The Halls of Lightning are Ulduar''s other outer work, a titan watchtower of storm and iron. Stormforged tacticians, runeshapers and sentinels hold its halls with titanium vanguards and siegebreakers, hardened steel giants stand guard, and bound storms and firestorms crackle in the air. At its heart, in the watchtower overlooking the peaks, Loken himself sits and listens to his master.', '', 'Halls of Lightning spawns (map 602); Halls of Lightning quests 13108, 13109; creature_text 28586, 28587, 28923');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(427200, 1, 0, 255, 'General Bjarngrim called himself the greatest of his father''s sons, and died unable to believe that flesh had proved stronger than iron.', 'Halls of Lightning spawns (map 602); Halls of Lightning quests 13108, 13109; creature_text 28586, 28587, 28923'),
(427200, 2, 0, 255, 'Volkhan made life from lifelessness at his anvil, golems of molten iron for the armies of iron. To the frost giants of Dun Niffelem he is a threat to their very existence.', 'Halls of Lightning spawns (map 602); Halls of Lightning quests 13108, 13109; creature_text 28586, 28587, 28923'),
(427200, 3, 0, 255, 'Loken told his killers that his master had shown him the future: Azeroth reborn in darkness, Yogg-Saron released, the Pantheon fallen. Dying, he said that his death heralded the end of this world.', 'Halls of Lightning spawns (map 602); Halls of Lightning quests 13108, 13109; creature_text 28586, 28587, 28923');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(427200, 1, 4272, 0),
(427200, 3, 28586, 1),
(427200, 3, 28587, 2),
(427200, 4, 13109, 2),
(427200, 3, 28923, 3);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(427200, 6718, 0),
(427200, 6731, 1),
(427200, 90000077, 2),
(427200, 426402, 3);

-- The Halls of Reflection
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 482000 AND 482099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 482000 AND 482099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 482000 AND 482099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 482000 AND 482099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(482000, 0, 4820, 0, 0, 16, 'The Halls of Reflection', 'The Halls of Reflection are the Lich King''s private sanctum within the citadel, a vaulted chamber of ice where, the scouts say, he lets his guard down. Spectral soldiers, priests and mages stand frozen in its halls, and at its heart, on an altar, rests Frostmourne itself, unguarded, just as the gnome claimed. Arthas would not leave it unguarded entirely, Jaina and Sylvanas both suspect.', '', 'Halls of Reflection spawns (map 668); Halls of Reflection quests 24500, 24711, 24713, 24802; creature_text 36955, 37221, 37223, 37554'),
(482001, 2, 4820, 0, 0, 16, 'Uther the Lightbringer', 'Uther the Lightbringer, first of the paladins of the Silver Hand, died at the hand of the prince he trained, and his soul is one of those locked within Frostmourne. Before the blade in the Halls of Reflection he can still speak, but only for a moment: the Lich King sees what the sword sees.', '', 'Halls of Reflection quests 24480, 24500, 24561, 24802; creature_text 37225, 37158');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(482000, 1, 0, 255, 'The Lich King came for them and they fled before him through walls of ice. Jaina admitted it had been foolish to follow him; she had made that mistake too many times. With Uther''s guidance, she said, they might stand a chance.', 'Halls of Reflection spawns (map 668); Halls of Reflection quests 24500, 24711, 24713, 24802; creature_text 36955, 37221, 37223, 37554'),
(482000, 2, 0, 255, 'The Lich King came for them and they fled before him through walls of ice. His strength has grown tenfold, Sylvanas said; it will take an army greater than even the Horde can rouse to destroy him.', 'Halls of Reflection spawns (map 668); Halls of Reflection quests 24500, 24711, 24713, 24802; creature_text 36955, 37221, 37223, 37554'),
(482001, 1, 0, 255, 'Arthas, Uther said, is only a dwindling presence in the Lich King''s mind. He must be destroyed where he merged with Ner''zhul, at the Frozen Throne, and yet there must always be a Lich King, or the Scourge would wash over the world.', 'Halls of Reflection quests 24480, 24500, 24561, 24802; creature_text 37225, 37158'),
(482001, 2, 0, 255, 'The reforged Quel''Delar leapt to life before Frostmourne. It was forged from saronite, Uther warned, the blood of an Old God, and it drank in the evil of the place; only the waters of the Sunwell could cleanse it.', 'Halls of Reflection quests 24480, 24500, 24561, 24802; creature_text 37225, 37158');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(482000, 1, 4820, 0),
(482001, 4, 24500, 0),
(482001, 4, 24802, 0),
(482001, 5, 24480, 0),
(482001, 5, 24561, 0),
(482000, 5, 24500, 1),
(482000, 5, 24802, 2),
(482001, 4, 24500, 1),
(482001, 4, 24802, 1),
(482001, 5, 24480, 2),
(482001, 5, 24561, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(482000, 21018, 0),
(482000, 92000005, 1),
(482000, 482001, 2),
(482001, 482000, 0),
(482001, 90000032, 1),
(482001, 92000005, 2);

-- Halls of Stone
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 426400 AND 426499;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 426400 AND 426499;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 426400 AND 426499;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 426400 AND 426499;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(426400, 0, 4264, 0, 0, 13, 'Halls of Stone', 'The Halls of Stone are one of Ulduar''s outer works, titan halls of carved stone that the Dark Rune dwarves of Loken have made their own. Warriors, theurgists and shapers stand among iron and lightning constructs, rune giants guard the great doors, and somewhere in the depths a forge still turns out iron where once it made stone. Brann Bronzebeard has found his way here, sure there are monumental discoveries to be made.', '', 'Halls of Stone spawns (map 599); Halls of Stone quest 13207; creature_text 27975'),
(426401, 1, 4264, 0, 0, 13, 'The Tribunal of Ages', 'The Tribunal of Ages is a titan archive deep in the Halls of Stone, watched over by the carved faces of three keepers. Brann Bronzebeard means to make it talk: he wants to know how the dwarves came to be, starting at the beginning. Its guardians do not recognize him, and treat anything they do not recognize as a threat.', '', 'Halls of Stone quest 13207; creature_text 28070, 30897, 30898, 30899'),
(426402, 2, 4264, 0, 0, 13, 'Sjonnir the Ironshaper', 'Sjonnir the Ironshaper keeps the forge at the heart of the Halls of Stone for Loken, a dwarf of iron who pities soft, vulnerable shells and their brief fragile lives. None can escape the curse of flesh, he promises, and armies of iron will smother the world.', '', 'creature_text 27978, 28070; Halls of Stone quest 13252');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(426400, 1, 0, 255, 'The Maiden of Grief keeps a hall of the outer works, a stone guardian weighed down by sorrow, who blames her visitors for her burden and dies saying she never wanted this.', 'Halls of Stone spawns (map 599); Halls of Stone quest 13207; creature_text 27975'),
(426401, 1, 0, 255, 'The archive told of Azeroth''s infancy, infected by parasites it named the Old Gods. They left every system defenseless to assimilate it, the earthen among them, and that unravelling it calls the Curse of Flesh.', 'Halls of Stone quest 13207; creature_text 28070, 30897, 30898, 30899'),
(426401, 2, 0, 255, 'The titans found the infestation too deep to cut out without killing the world, so they imprisoned it within. They made the Forge of Wills to make new earthen and appointed protectors, storm and earth giants under Loken, and set the Dragon Aspects to watch.', 'Halls of Stone quest 13207; creature_text 28070, 30897, 30898, 30899'),
(426401, 3, 0, 255, 'Then the protectors went to war. Loken ended it by destroying the rest and put the seed races, earthen, giants and vrykul, to sleep; by the time the first earthen woke, the curse had made them dwarves.', 'Halls of Stone quest 13207; creature_text 28070, 30897, 30898, 30899'),
(426402, 1, 0, 255, 'Dying, he swore that Loken would not rest until the forge was retaken. Brann set it to making earthen to stand guard, and guessed another machine was turning out iron vrykul: Loken had to be found and stopped.', 'creature_text 27978, 28070; Halls of Stone quest 13252');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(426400, 1, 4264, 0),
(426401, 4, 13207, 0),
(426401, 5, 13207, 0),
(426402, 3, 27978, 0),
(426400, 3, 27975, 1),
(426401, 5, 13207, 1),
(426401, 5, 13207, 2),
(426401, 5, 13207, 3),
(426402, 3, 27978, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(426400, 6718, 0),
(426400, 6732, 1),
(426400, 90000077, 2),
(426400, 426401, 3),
(426401, 426400, 0),
(426401, 91000036, 1),
(426401, 90000086, 2),
(426401, 6731, 3),
(426402, 426400, 0),
(426402, 90000077, 1),
(426402, 6731, 2);

-- Hellfire Ramparts
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 356200 AND 356299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 356200 AND 356299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 356200 AND 356299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 356200 AND 356299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(356200, 0, 3562, 0, 0, 8, 'Hellfire Ramparts', 'The Hellfire Ramparts are the battlements on the outer face of Hellfire Citadel, the first of its defenses that any attacker from the peninsula must climb. The Fel Horde holds them in strength: Bonechewer and Bleeding Hollow warriors walk the walls, Shattered Hand warhounds wait to be loosed, and Watchkeeper Gargolmar commands the watch. A demon, Omor the Unscarred, holds a stretch of the wall, and at the far end a herald circles overhead on his drake.', '', 'zones/hellfire_ramparts.txt (map 543: 3562 and its unreachable sub-area 3563 only); DB spawns map 543: Bonechewer Hungerer 17259, Ravener 17264, Destroyer 17271, Ripper 17281, Beastmaster 17455; Bleeding Hollow Darkcaster 17269, Archer 17270, Scryer 17478; Shattered Hand Warhound 17280; Hellfire Watcher 17309 (Watchkeeper''s Subordinate); bosses 17306, 17307, 17308; creature_text 17264 group 1 (keep a close watch on these ramparts, intruders could approach at any time), 17271 group 1, 17455 groups 0-1 (release the warhounds); boss_vazruden_the_herald.cpp (Vazruden the Herald 17307 circles above the far battlement; sentries; Vazruden 17537 and Nazan 17536 come down); quests 9572 and 9575 descriptions (Thrallmar and Honor Hold caught between the citadel and the Legion; first break through the ramparts); creature_text 17306 groups 0 (fresh meat has somehow breached our citadel; be wary of any intruders), 1, 3 (this may hurt a little); creature_template 17309 Hellfire Watcher, subname Watchkeeper''s Subordinate; boss_watchkeeper_gargolmar.cpp; quests 9572/9575 (Watchkeeper Gargolmar named as a leader of the ramparts); creature_text 17308 groups 0 (You dare stand against ME? Your insolence will be your death), 1 (Feast, my pet! Eat your fill!), 2 (A-kreesh, on cursing); creature_template 17308 type 3 (demon), faction 90; boss_omor_the_unscarred.cpp (Summon Fiendish Hound, curse); warcraft.wiki.gg/wiki/Omor_the_Unscarred; quests 9572 (Stok''ton 17493 to Caza''rez 17558, Horde) and 9575 (Lieutenant Chadwick 17557 to Gunny 17479, Alliance) descriptions, log text and reward text; quest_template_addon PrevQuestID 9572 <- 10124, 9575 <- 10142 (after the Legion Front chain told by hellfire.json 348333)'),
(356203, 2, 3562, 0, 0, 8, 'Vazruden the Herald', 'Vazruden the Herald guards the far end of the Hellfire Ramparts, circling above it on his drake Nazan until he comes down to meet intruders himself. Soon, he promises, their people will kneel to his lord. Whose herald he is he does not say, though the fel orcs of the citadel name no lord but Kargath Bladefist.', '', 'creature_text 17307 group 0 (You have faced many challenges... Soon your people will kneel to MY lord!); creature_text 17537 groups 0-3; boss_vazruden_the_herald.cpp (controller 17307 circles; two Hellfire Sentries; when they die it calls Vazruden 17537 and Nazan 17536); quests 9572/9575 (the drake, Nazan); quests 9587, 9588, 11354; warcraft.wiki.gg/wiki/Vazruden_the_Herald; quests 9587 and 9588 description and reward text (started by Ominous Letter 23890/23892, dropped by Vazruden 17537); hellfire.json 348305 (Kargath as self-styled warchief; how the fel orcs come to be is the citadel''s secret); creature_text 17307 group 0 (Soon your people will kneel to MY lord!, said in every fight when the sentries fall)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(356200, 1, 0, 255, 'Honor Hold and Thrallmar, caught between the citadel and the Legion, mean to break the walls while the Legion''s eyes are on the Dark Portal, so that an army can come close enough to strike at the fortress.', 'zones/hellfire_ramparts.txt (map 543: 3562 and its unreachable sub-area 3563 only)'),
(356203, 1, 0, 255, 'On his body was a letter sealed with a blood-red I, and it was signed by Illidan. The Fel Horde may call Kargath warchief, but their herald answered to the Betrayer.', 'creature_text 17307 group 0 (You have faced many challenges... Soon your people will kneel to MY lord!)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(356200, 1, 3562, 0),
(356203, 3, 17537, 0),
(356200, 4, 9572, 1),
(356200, 4, 9575, 1),
(356203, 5, 9587, 1),
(356203, 5, 9588, 1),
(356203, 4, 11354, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(356200, 90000064, 0),
(356200, 348305, 1),
(356200, 356203, 2),
(356203, 92000009, 0),
(356203, 90000064, 1),
(356203, 371403, 2);

-- Hyjal Summit
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 360600 AND 360699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 360600 AND 360699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 360600 AND 360699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 360600 AND 360699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(360600, 0, 3606, 0, 0, 10, 'Hyjal Summit', 'The timeway opens onto Mount Hyjal at the end of the Third War, as the Burning Legion and its Scourge come up the mountain toward the World Tree. Lady Jaina Proudmoore''s Alliance force holds the first line, Thrall''s Horde holds a camp beyond it, and Tyrande Whisperwind''s night elves keep the slopes above, each ready to fight and then fall back in turn. Keepers of the bronze flight stand among them, there to see that the battle ends as it must.', '', 'Hyjal Summit spawns (map 534); Caverns of Time quests 10445, 13432; Jaina, Thrall and Tyrande gossip 7552, 7581, 7706'),
(360601, 2, 3606, 0, 0, 10, 'Rage Winterchill', 'Rage Winterchill is a lich of the Scourge, sent at the head of the first wave against Jaina Proudmoore''s line. The Legion''s final conquest has begun, he cries; the subjugation of this world is within its grasp once more, and none shall survive.', '', 'Hyjal Summit quest 10947; creature_text 17767'),
(360602, 2, 3606, 0, 0, 10, 'Archimonde', 'Archimonde, eredar lord of the Burning Legion, leads its assault on Mount Hyjal. At the summit he reaches the World Tree, Nordrassil, and begins to drain it: soon, he gloats, the heart of this world will beat no more. Those who stand against him there are buying time for Malfurion''s plan.', '', 'creature_text 17968; Tyrande gossip 9410; boss_archimonde.cpp (ancient wisps)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(360600, 1, 0, 255, 'Illidan drew seven vials from the Well of Eternity and poured three into the lake atop Hyjal to make the second Well. Kael''thas and Vashj each held another, and what remains of them can serve the bronze flight as a focus to reach any moment tied to Hyjal.', 'Hyjal Summit spawns (map 534); Caverns of Time quests 10445, 13432; Jaina, Thrall and Tyrande gossip 7552, 7581, 7706'),
(360600, 2, 0, 255, 'In the water Soridormi could see every moment linked to Hyjal: the making of the second Well, Illidan''s imprisonment, the enchantment of the World Tree and the battle itself. The timeline, she warned, is not safe.', 'Hyjal Summit spawns (map 534); Caverns of Time quests 10445, 13432; Jaina, Thrall and Tyrande gossip 7552, 7581, 7706'),
(360601, 1, 0, 255, 'Akama had a vision of the lich''s phylactery. Its power was lost forever when Winterchill fell at Hyjal, so only the timeway can reach it as it was.', 'Hyjal Summit quest 10947; creature_text 17767'),
(360601, 2, 0, 255, 'The phylactery can contain a soul and siphon it into itself, and with its power Akama meant to reclaim what belonged to him.', 'Hyjal Summit quest 10947; creature_text 17767'),
(360602, 1, 0, 255, 'Dying, he cried that it could not be, and the ancient wisps of the forest swarmed over him by the dozen.', 'creature_text 17968; Tyrande gossip 9410; boss_archimonde.cpp (ancient wisps)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(360600, 1, 3606, 0),
(360601, 3, 17767, 0),
(360601, 4, 10947, 0),
(360602, 3, 17968, 0),
(360600, 4, 10445, 1),
(360600, 4, 13432, 1),
(360600, 5, 13432, 2),
(360601, 4, 10947, 1),
(360601, 5, 10947, 2),
(360602, 3, 17968, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(360600, 44007, 0),
(360600, 91000030, 1),
(360600, 90000060, 2),
(360600, 360602, 3),
(360601, 360600, 0),
(360601, 395901, 1),
(360601, 90000006, 2),
(360602, 360600, 0),
(360602, 91000030, 1),
(360602, 90000065, 2);

-- Icecrown Citadel
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 481200 AND 481299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 481200 AND 481299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 481200 AND 481299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 481200 AND 481299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(481200, 0, 4812, 0, 0, 16, 'Icecrown Citadel', 'Icecrown Citadel stands open at last. The Argent Crusade and the Knights of the Ebon Blade, joined as the Ashen Verdict, have broken in, and Tirion Fordring leads the march on the Frozen Throne through halls of saronite and bone, where cultists, deathbound wards and the risen of every race hold the ramparts. The Lich King watches them climb, and he does not hide his amusement.', '', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481201, 2, 4812, 0, 0, 16, 'Deathbringer Saurfang', 'Deathbringer Saurfang was Dranosh, Saurfang the Younger, who led the Horde at the Wrathgate and died there. The Lich King raised him, and he bars the way to the upper citadel: for every soldier the Alliance and the Horde killed of each other, he tells them, the Lich King''s armies grew. He has become death, he says, and to the Horde he offers his own father a place at his side.', '', 'creature_text 37813, 37187, 37879, 37200'),
(481202, 2, 4812, 0, 0, 16, 'The Blood Princes and the Blood-Queen', 'The princes of the San''layn have risen again in the citadel: Valanar, who calls Naxxanar a mere setback, Keleseth and Taldaram, each made mighty by the power of the Darkfallen Orb. Above them in the Crimson Hall reigns their queen, Blood-Queen Lana''thel, whose bite turns the thirst of her victims on their own companions.', '', 'creature_text 37955, 37970, 37972, 37973');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(481200, 1, 0, 255, 'As the march began the Lich King taunted Tirion with a prize: Highlord Bolvar Fordragon, whom all thought dead at the Wrathgate, lives in his hands, his soul nearly broken. Lord Marrowgar, the first of his guardians, swore none would enter the sanctum.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481200, 2, 0, 255, 'Lady Deathwhisper, who leads the Cult of the Damned in the citadel, preached that flesh is a crippling flaw, a joke the Creators played upon their own creations, and released her faithful from the curse of flesh.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481200, 3, 0, 255, 'Professor Putricide ran the citadel''s plague works with his favorites, Festergut and Rotface, and announced the good news that he had perfected a plague to destroy all life on Azeroth.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481200, 4, 0, 255, 'Sindragosa, queen of the frost wyrms, guarded the way to the Frozen Throne and swore the icy winds of Northrend would consume all who came. Dying, she sighed that she was free at last.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481200, 5, 0, 255, 'The throne was once a prison: Kil''jaeden made it from the Nether to hold Ner''zhul''s spirit. When Arthas struck it with Frostmourne, Ner''zhul''s soul merged with his own, and splinters of the crystal lie scattered through the citadel.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481200, 6, 0, 255, 'Among the Lich King''s sealed possessions was a medal. Uther knew it: he had presented it to Arthas himself, long ago, and with it returned, his soul could rest at last.', 'Icecrown Citadel spawns (map 631); Icecrown Citadel quests 24548, 24919; creature_text 36678, 36853, 36855, 37119, 37181, 37187, 38608'),
(481201, 1, 0, 255, 'Dying, the Deathbringer said he was released. His father came for his body: he had named him Dranosh, Heart of Draenor, and crossed the Dark Portal alone so that his son would stay untainted, and he took him home to Nagrand.', 'creature_text 37813, 37187, 37879, 37200'),
(481202, 1, 0, 255, 'Dying, the Blood-Queen sounded almost wounded, as though her killers had betrayed a friendship: they had been getting along so well.', 'creature_text 37955, 37970, 37972, 37973');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(481200, 1, 4812, 0),
(481201, 3, 37813, 0),
(481202, 3, 37970, 0),
(481202, 3, 37972, 0),
(481202, 3, 37973, 0),
(481202, 3, 37955, 0),
(481200, 3, 36612, 1),
(481200, 3, 36855, 2),
(481200, 3, 36678, 3),
(481200, 3, 36853, 4),
(481200, 4, 24548, 5),
(481200, 5, 24919, 6),
(481201, 3, 37813, 1),
(481202, 3, 37955, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(481200, 21018, 0),
(481200, 92000005, 1),
(481200, 92000001, 2),
(481200, 481201, 3),
(481201, 91000035, 0),
(481201, 353719, 1),
(481201, 481200, 2),
(481202, 481200, 0),
(481202, 20601, 1),
(481202, 449400, 2),
(481202, 353718, 3);

-- Karazhan
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 345700 AND 345799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 345700 AND 345799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 345700 AND 345799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 345700 AND 345799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(345700, 0, 3457, 0, 0, 8, 'Karazhan', 'Inside Karazhan, the tower of Medivh, time does not run as it should. Its stewards and servants still keep the house as though their master were about to come home, guests linger at a dinner that never ends, and ghosts walk the stables and the halls. The Violet Eye has sent agents inside for years, and few have come back. Somewhere at the top of the tower, something has come that does not belong.', '', 'Karazhan quests 9840, 9843; Koren gossip 7435'),
(345701, 2, 3457, 0, 0, 8, 'Moroes', 'Moroes is the steward of Karazhan, and he goes on keeping the tower as he always has. The Master is deep in study, he tells visitors, or resting after his labors, or meeting with his apprentice; the Master will return from Stormwind soon. Unannounced guests mean one more for dinner this evening, and he never has enough time.', '', 'creature_text 15687'),
(345702, 1, 3457, 0, 0, 8, 'The Opera House', 'Karazhan''s opera house still puts on its plays, and Barnes, the stage manager, has everything in place for his visitors'' big debut. Each evening''s presentation is a different tale, a lost girl and a wicked crone, a grandmother who is not what she seems, or a forbidden love that ends as such loves do, and the visitors find themselves cast in the parts.', '', 'Barnes gossip 7421; creature_text 16812'),
(345703, 2, 3457, 0, 0, 8, 'The Shade of Aran', 'The Shade of Aran haunts the library of Karazhan, a tormented old wizard who begs to be left alone: please, no more, his son has gone mad. He is Nielas Aran, Medivh''s father, and he is no simple jester, he insists; his son is powerful, but he has powers of his own.', '', 'Karazhan quest 9640; creature_text 16524'),
(345704, 1, 3457, 0, 0, 8, 'The Guardian''s Library', 'The Guardian''s Library is where the Violet Eye''s agents went looking for Medivh''s journal and never came out. Wravien, Gradav and Kamsis are still there, alive, lost in the books and scrolls; each has forgotten what they came for, and each is sure that one of the others must have found it by now.', '', 'Karazhan quests 9630, 9638, 9639, 9645'),
(345705, 2, 3457, 0, 0, 8, 'Nightbane', 'Nightbane is what became of Arcanagos, a dragon of the blue flight, whose charred remains lie at the foot of Karazhan. An urn on the Master''s Terrace can bring them back to life, and the stars predict that whoever does it must destroy what rises, or let a great terror loose upon the skies.', '', 'Karazhan quests 9644, 9645; creature_text 17225, 17651, 17652'),
(345706, 1, 3457, 0, 0, 8, 'The Gamesman''s Hall', 'The Gamesman''s Hall holds a great chessboard, and the echo of Medivh waits beside it. To pass beyond his hall, he says, visitors must defeat him in a game of skill, and he plays as his living self might have, coolly, with an eye on every move, and not above cheating.', '', 'Echo of Medivh gossip 8404; creature_text 16816'),
(345707, 2, 3457, 0, 0, 8, 'Prince Malchezaar', 'Prince Malchezaar is an eredar lord of the Burning Legion who has taken the top of Karazhan for his own. The Violet Eye''s agent Keanna sensed his coming before she died. Karazhan is a portal into the nether, a beacon shining into other worlds, and in his hands, he boasts, all realities and all dimensions are open to him.', '', 'Karazhan quest 9844; creature_text 15690');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(345700, 1, 0, 255, 'Koren, the tower''s blacksmith, was in the Violet Eye''s pay. Now he remembers nothing but making horseshoes, over and over, and the Eye''s agent Keanna is confirmed dead.', 'Karazhan quests 9840, 9843; Koren gossip 7435'),
(345703, 1, 0, 255, 'The Violet Eye''s agent Kamsis gave Medivh''s journal to Aran, because he asked for it so nicely, and he was the master''s father, after all.', 'Karazhan quest 9640; creature_text 16524'),
(345703, 2, 0, 255, 'Struck down at last, the shade of the old wizard did not curse his killers. He sighed that the nightmare was over.', 'Karazhan quest 9640; creature_text 16524'),
(345704, 1, 0, 255, 'Medivh''s journal is not like other journals. It does not merely record his memories: it holds them, and read on the Master''s Terrace a page will show what it remembers.', 'Karazhan quests 9630, 9638, 9639, 9645'),
(345705, 1, 0, 255, 'The journal''s page shows the Master''s Terrace long ago: Arcanagos warned Medivh that a dark power sought to use him. Medivh would not be bullied, and wove his own essence into a spell that burned the dragon from within.', 'Karazhan quests 9644, 9645; creature_text 17225, 17651, 17652'),
(345705, 2, 0, 255, 'From the risen dragon came a fragment of Medivh''s own essence, faint but enough, Alturus said, to tell the Violet Eye much about its master.', 'Karazhan quests 9644, 9645; creature_text 17225, 17651, 17652'),
(345706, 1, 0, 255, 'Bested, the echo let the curse binding the doors of the hall lift, and the halls of Karazhan shook as they opened.', 'Echo of Medivh gossip 8404; creature_text 16816'),
(345707, 1, 0, 255, 'When the prince fell, the Violet Eye''s readings of the tower began to return to normal, and Alturus sent word to Cedric in Dalaran.', 'Karazhan quest 9844; creature_text 15690');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(345700, 1, 3457, 0),
(345701, 3, 15687, 0),
(345702, 2, 16812, 0),
(345702, 3, 17534, 0),
(345702, 3, 17533, 0),
(345702, 3, 17521, 0),
(345702, 3, 18168, 0),
(345703, 3, 16524, 0),
(345703, 4, 9640, 0),
(345704, 2, 16813, 0),
(345704, 2, 16814, 0),
(345704, 2, 16815, 0),
(345704, 4, 9630, 0),
(345705, 3, 17225, 0),
(345705, 4, 9644, 0),
(345706, 2, 16816, 0),
(345707, 3, 15690, 0),
(345707, 4, 9844, 0),
(345700, 4, 9840, 1),
(345700, 4, 9843, 1),
(345700, 2, 16388, 1),
(345703, 4, 9640, 1),
(345703, 3, 16524, 2),
(345704, 4, 9645, 1),
(345705, 5, 9645, 1),
(345705, 5, 9644, 2),
(345706, 2, 16816, 1),
(345707, 5, 9844, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(345700, 4107, 0),
(345700, 91000017, 1),
(345700, 4111, 2),
(345701, 345700, 0),
(345701, 91000017, 1),
(345702, 345700, 0),
(345703, 345704, 0),
(345703, 91000017, 1),
(345704, 345703, 0),
(345704, 345705, 1),
(345704, 4111, 2),
(345705, 90000063, 0),
(345705, 91000017, 1),
(345705, 345704, 2),
(345706, 91000017, 0),
(345706, 345700, 1),
(345707, 90000065, 0),
(345707, 345700, 1),
(345707, 4111, 2);

-- Magisters' Terrace
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 413100 AND 413199;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 413100 AND 413199;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 413100 AND 413199;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 413100 AND 413199;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(413100, 0, 4131, 0, 0, 12, 'Magisters'' Terrace', 'Magisters'' Terrace rises over the Isle of Quel''Danas, a sanctum of the magisters of Quel''Thalas, and the forces of Prince Kael''thas hold it now. Sunblade magisters, warlocks, physicians and blood knights keep its halls, wretched elves maddened by their hunger for magic shamble among them, and Coilskar naga, Ethereum smugglers and sisters of torment stand with the Sunblade against all comers.', '', 'Magisters'' Terrace spawns (map 585); Magisters'' Terrace quests 11488, 11490; creature_text 24723'),
(413101, 2, 4131, 0, 0, 12, 'Kalecgos', 'Kalecgos is a dragon of the blue flight who has watched over the nascent powers of the Sunwell for some time, and he comes in the guise of a high elf to those who use the scrying orb on the terrace. Their ends are the same, he assures them: the well''s terrible power could usher in the end of the world.', '', 'Magisters'' Terrace quests 11490, 11492; Kalecgos gossip 9199-9201');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(413100, 1, 0, 255, 'The Shattered Sun Offensive had a blood elf spy, Tyrith, embedded in the terrace, and he has suddenly stopped reporting.', 'Magisters'' Terrace spawns (map 585); Magisters'' Terrace quests 11488, 11490; creature_text 24723'),
(413100, 2, 0, 255, 'Tyrith was found dying. With his last breath he gasped that they are feeding the Sunwell, and that they must be stopped.', 'Magisters'' Terrace spawns (map 585); Magisters'' Terrace quests 11488, 11490; creature_text 24723'),
(413100, 3, 0, 255, 'Magister Selin Fireheart held the first hall, drawing on fel crystals until he cried that he was a god. Dying, he begged for more.', 'Magisters'' Terrace spawns (map 585); Magisters'' Terrace quests 11488, 11490; creature_text 24723'),
(413101, 1, 0, 255, 'The Legion works tirelessly to bend the Sunwell''s power to its ends, and Kael''thas has risen from the ashes of defeat to lead them once more. Kalecgos leaves the prince''s fate to others; more urgent matters call him.', 'Magisters'' Terrace quests 11490, 11492; Kalecgos gossip 9199-9201');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(413100, 1, 4131, 0),
(413101, 2, 24848, 0),
(413101, 5, 11490, 0),
(413101, 4, 11492, 0),
(413100, 4, 11488, 1),
(413100, 4, 11490, 2),
(413100, 3, 24723, 3),
(413101, 4, 11492, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(413100, 408000, 0),
(413100, 90000036, 1),
(413100, 92000002, 2),
(413100, 413101, 3),
(413101, 413100, 0),
(413101, 90000063, 1),
(413101, 92000002, 2);

-- Magtheridon's Lair
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 383600 AND 383699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 383600 AND 383699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 383600 AND 383699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 383600 AND 383699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(383600, 0, 3836, 0, 0, 8, 'Magtheridon''s Lair', 'Magtheridon''s Lair is the deepest vault beneath Hellfire Citadel, a great round chamber where the pit lord Magtheridon, once master of Outland, is held fast in bonds of shadow. Five Hellfire channelers stand about him, never pausing in the work that keeps him bound, and five Manticron cubes stand around the chamber''s edge. He rages at his jailers without end, swearing he will crush Illidan and reclaim Outland as his own.', '', 'zones/magtheridons_lair.txt (map 544: area 3836 only); DB spawns map 544: Magtheridon 17257, five Hellfire Channelers 17256 around him, twelve Hellfire Warders 18829; gameobjects Manticron Cube 181713 (five), Magtheridon Column 184634-184639, Doodad_HF_Mag_door01 183847; smart_scripts 17256 (Shadow Grasp channeled on him out of combat); creature_text 17257 group 0 (Wretched, meddling insects! Release me...; Vermin! Leeches!; Illidan is an arrogant fool! I will crush him and reclaim Outland as my own!; How long do you believe your pathetic sorcery can hold me?); boss_magtheridon.cpp (he breaks free once the channelers are attacked); shadowmoon.json (Magtheridon ruled from the Black Temple until Illidan drove him out); warcraft.wiki.gg/wiki/Magtheridon (Lord of Outland; bound beneath Hellfire Citadel by Illidan)'),
(383601, 2, 3836, 0, 0, 8, 'Magtheridon', 'Magtheridon is a pit lord of the Burning Legion, and for a time he was master of Outland, ruling from the Black Temple until Illidan Stormrage and his allies cast him down. Chained beneath Hellfire Citadel, he has lost none of his pride: he scorns his jailers as leeches, tells them to take his blood and choke on it, and calls Illidan an arrogant fool.', '', 'creature_text 17257; boss_magtheridon.cpp; instance_magtheridons_lair.cpp; shadowmoon.json (Magtheridon ruled from the Black Temple until Illidan drove him out with the help of Akama''s Broken); warcraft.wiki.gg/wiki/Magtheridon (Warcraft III: The Frozen Throne: defeated by Illidan, Kael''thas, Vashj and Akama; bound beneath Hellfire Citadel); quests 11002/11003 descriptions (his head); quests 11002 (to Danath, Alliance) and 11003 (to Nazgrel, Horde) descriptions, completion and reward text; item 32385/32386 Magtheridon''s Head, dropped by Magtheridon 17257, starts 11002/11003; hellfire.json 348305 notes (11002/11003 left for a Hellfire Citadel file)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(383601, 1, 0, 255, 'With Magtheridon dead the manufactory beneath the citadel stopped its grim work, and the source of the fel orc army Illidan raised there was gone. The Legion''s siege of the citadel no longer served any purpose.', 'creature_text 17257');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(383600, 1, 3836, 0),
(383601, 3, 17257, 0),
(383601, 4, 11002, 0),
(383601, 4, 11003, 0),
(383601, 5, 11002, 1),
(383601, 5, 11003, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(383600, 383601, 0),
(383600, 92000009, 1),
(383600, 352016, 2),
(383601, 383600, 0),
(383601, 92000009, 1),
(383601, 90000065, 2);

-- The Mana-Tombs
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 379200 AND 379299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 379200 AND 379299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 379200 AND 379299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 379200 AND 379299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(379200, 0, 3792, 0, 0, 8, 'The Mana-Tombs', 'The Mana-Tombs are the wing of Auchindoun where ethereals have shut themselves in with the draenei dead. Crypt raiders, sorcerers and nexus stalkers strip the tombs hall by hall, greeting strangers with a whisper of welcome to the Void, and they have warded the way in against every other ethereal band. Mana leeches and nexus terrors drift through the dark between the sarcophagi.', '', 'Mana-Tombs quests 10216, 10218, 10977; creature_text 18309-18331, 19671; npc_text 9897 (Kaftiz)'),
(379201, 2, 3792, 0, 0, 8, 'Nexus-Prince Shaffar', 'Nexus-Prince Shaffar is the ethereal lord who holds the Mana-Tombs, a shrewd rival who keeps the Consortium out while he pillages the crypt for all it is worth. He greets intruders as a gracious host, apologizing that he was not expecting company, and then tends to them personally, calling ethereal beacons to his side.', '', 'Mana-Tombs quest 10165; creature_text 18344');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(379200, 1, 0, 255, 'With the way cleared, the Consortium came in through the ethereals'' own transporters, and its cryo-engineer Sha''heen drained the ether gathered in the collectors. By the energy levels, he said, Shaffar had been set to make a killing.', 'Mana-Tombs quests 10216, 10218, 10977; creature_text 18309-18331, 19671; npc_text 9897 (Kaftiz)'),
(379200, 2, 0, 255, 'The Ethereum keep two stasis chambers in the tombs, one near the entrance and one beside Shaffar''s own rooms. Commander Ameer of the Protectorate has forged a key to open them and learn what they hold.', 'Mana-Tombs quests 10216, 10218, 10977; creature_text 18309-18331, 19671; npc_text 9897 (Kaftiz)'),
(379201, 1, 0, 255, 'Nexus-Prince Haramad of the Consortium paid well for proof of Shaffar''s death, and remarked only that another competitor had gone under.', 'Mana-Tombs quest 10165; creature_text 18344');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(379200, 1, 3792, 0),
(379201, 3, 18344, 0),
(379201, 4, 10165, 0),
(379200, 5, 10218, 1),
(379200, 4, 10977, 2),
(379201, 5, 10165, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(379200, 90000071, 0),
(379200, 351916, 1),
(379200, 379201, 2),
(379201, 379200, 0),
(379201, 90000071, 1),
(379201, 352316, 2);

-- Maraudon
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 210000 AND 210099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 210000 AND 210099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 210000 AND 210099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 210000 AND 210099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(210000, 0, 2100, 0, 0, 0, 'Maraudon', 'Maraudon lies beneath the Valley of Spears, the holy ground of the centaur, a tomb their people guard and only the most devout may enter. Its caverns run far down into the earth, and they are sick. Rot has spread through the upper caves: the water is poisoned, twisted vines choke the passages, satyrs move among them, and dryads tend the poisoned growth as though it were still a garden. Deeper down the stone itself is awake, and pale spirits of centaur drift through the dark.', '', 'AreaTable 2100 Maraudon (map 349); tools/research/zones/maraudon.txt (2100 the only area); WMOAreaTable rows for root 3233 (Foulspore Cavern, The Wicked Grotto, The Noxious Hollow, Vyletongue Seat, Poison Falls, Earth Song Falls, Zaetar''s Grave) all have area 0, so the core reports 2100 throughout; quest 7067 description (a tomb my people protect, only the most devout are ever allowed to enter); desolace.json 40517 (holy ground of the Maraudine), pointed to; DB spawns map 349, placed by WMO group from the vmap: Vylestem Vine 178908, Barbed Lasher 12219, Constrictor Vine 12220, Noxious Slime 12221, Creeping Sludge 12222, Vile Larva 12218, Putridus Satyr, Trickster, Shadowstalker 11790-11792, Celebrian Dryad 11793, Sister of Celebras 11794 in Foulspore Cavern, The Wicked Grotto, The Noxious Hollow and Poison Falls; Theradrim Guardian 11784, Primordial Behemoth 12206 (giant), Deep Borer 11789 in the lower unlabeled groups and Earth Song Falls; Spirit of Maraudos 12242 and Spirit of Veng 12243 (CentaurKhan model, faction 35, no gossip); creature_text 11793 group 0 (You do not belong in these gardens), base and module; quests 7064, 7065 (the Circle''s sisters seek allies), 7067 (the Pariah, an exile), 7068, 7070, 7028 (crystals); npc_text 6574 (Cavindra: my brother and sisters trapped inside); DB spawns map 349: Vile Larva 12218 x56 (Foulspore Cavern 16, The Noxious Hollow 40), no other map; Vylestem Vine 178908 in the Foulspore groups and the Hollow; Barbed Lasher 12219, Constrictor Vine 12220, Creeping Sludge 12222 x15, Celebrian Dryad 11793, Sister of Celebras 11794; gameobject 178559 Larva Spewer at 938,-379 (group 17081, Foulspore Cavern); smart_scripts 178559 (summons Spewed Larva 13533 every 6.4 s, which crawl off at random); Spore Trees 178561-178569 in The Noxious Hollow (Spore Cloud 21547); creature_text 11793 group 0 (You do not belong in these gardens. Your body shall nourish our lovely creations!), said on aggro at 50 percent in base and module; WMOAreaTable 31472-31475, 31480, 31487-31488 Foulspore Cavern; 31485 The Noxious Hollow; DB spawns map 349: Noxious Slime 12221 x27, all in Poison Falls (group 17094); Constrictor Vine 12220 x15, Barbed Lasher 12219, Sister of Celebras 11794 x8, Cavern Lurker 12223, Cavern Shambler 12224, Putridus Trickster 11791, Corruptor 12217 there too; smart_scripts 12221 base (Noxious Cloud in combat) and module (Noxious Cloud in melee range, and on death); smart_scripts 12219 Thorn Volley, 11794 Throw and Strike, 12223 Knockdown, 12224 Wild Regeneration and Knockdown, base and module; WMOAreaTable 31493 Poison Falls; DB spawns map 349: Deep Borer 11789 x98 (family 42, worm), Subterranean Diemetradon 13323 x31, Theradrim Guardian 11784, all in the unlabeled WMO groups 17055-17070, no other map; Primordial Behemoth 12206 (type 5) in 17066, 17070 and Zaetar''s Grave; smart_scripts 11784 (Knockdown; on death Summon Theradrim Shardling 21057, three shardlings), 13323 Sonic Burst 8281, 12206 Boulder and Trample, base and module; positions: Poison Falls and Foulspore z -32 to -80; these groups z -100 to -175; DB spawns map 349: Stolid Snapjaw 13599 x26 (family 21, turtle; Spikes out of combat) in groups 17052 Earth Song Falls, 17072 beside it and 17065 Zaetar''s Grave, no other map; Thessala Hydra 12207 (Deadly Poison, Aqua Jet), Frog 13321, School of Fish 6145; Primordial Behemoth 12206 x10 in 17065; WMOAreaTable 31451 Earth Song Falls, 31464 Zaetar''s Grave; warcraft.wiki.gg/wiki/Maraudon (Zaetar''s Grave spared from the corruption, a green area; Rotgrip below the waterfall); quest 7066 description (this place rings of hope); quests 7068 (Horde), 7070 (Alliance), 7028 (both): all QuestSortID 2100, QuestType 2, flags 8, not auto-complete; no other file uses them; creature_loot_template: Shadowshard Fragment 17756 from Shadowshard Rumbler 11777 and Smasher 11778 (map 1, the outer caves only); Theradric Crystal Carving 17684 from nearly every creature in the instance and the outer caves (quest drop)'),
(210006, 2, 2100, 0, 0, 0, 'Princess Theradras', 'Princess Theradras is an elemental force of earth, related somehow to the Old Gods, and she walks the green valley deep in Maraudon among giants of stone. Ages ago Zaetar, first son of Cenarius, sought her out, and their offspring are the centaur. The centaur killed Zaetar, and Theradras keeps his remains.', '', 'creature 12201 single spawn on map 349 at 28,83 in WMO group 17065 (Zaetar''s Grave), MovementType 2; creature_template_model 12201 display 12292 (Tharazun model at scale 2.0), type 4 elemental; no creature_text; DB spawns: Primordial Behemoth 12206 x10 in the same group; desolace.json 40535 part 1 (her nature and the centaur''s origin, ACCEPT 7064/7065) and parts 4-5 (her death on DONE 7064/7065), pointed to; Maraudon quests 7064, 7065'),
(210007, 2, 2100, 0, 0, 0, 'Celebras the Cursed', 'Celebras the Cursed is a keeper of the grove, antlered and stag-bodied, who wanders a hollow beside the poisoned falls with dryads about him. Whatever he was before, the corruption of the caverns has him now. His sister waits in the Valley of Spears, begging for someone to help him.', '', 'creature 12225 single spawn on map 349 at 726,78 (WMO group 17071, unlabeled, beside Corrupt Force of Nature 13743 x3, Celebrian Dryad 11793 x2, Sister of Celebras 11794 x2); display 12350 KeeperOfTheGrove at scale 1.3; creature 13716 Celebras the Redeemed: no spawn, summoned only by 12225''s death (faction 35, gossip 5349, questgiver of 7046, ender of 7044 and 7046); desolace.json 40535 opening (Cavindra pleads for her brother Celebras, cursed) and part 3 (DONE 7044: the scepter pieces back and his waking), pointed to, not retold; Poison Falls group 17094 (z -56 to -80) lies beside his grove (17071, x 700-800, z -87)'),
(210008, 2, 2100, 0, 0, 0, 'Lord Vyletongue', 'Lord Vyletongue is a dark satyr, master of the Putridus who hold the Wicked Grotto, and the rot of Maraudon is his work. He spread his evil through its caves and poisoned the minds of all inside, and he treats the centaur''s holy place as his own. He and the creature he made stole the two halves of a scepter that once gave its bearer power over the caverns.', '', 'creature 12236 single spawn on map 349 at 749,-220 in WMO group 17092 (Vyletongue Seat, within The Wicked Grotto); display 12334 Satyr model at scale 2.0; type 3 (demon); DB spawns in group 17092: Putridus Trickster 11791 x4, Shadowstalker 11792 x4, Deeprot Stomper 13141 x4, Deeprot Tangler 13142 x6; desolace.json 40535 opening (Vyletongue poisoned the caverns, made Noxxion, stole a piece of the scepter), pointed to in one phrase; creature 13282 single spawn on map 349 at 1130,-191 in WMO group 17086 (The Noxious Hollow); display 11172 WaterElemental at scale 2.0; type 4; DB spawns in 17086: Vile Larva 12218 x40, Spore Trees 178561-178569, Corruption Spewer 178570 beside him; desolace.json 40535 opening (Vyletongue made Noxxion as a living symbol of his corruption), pointed to; DB spawns map 349: Putridus Satyr 11790 x16, all in The Wicked Grotto groups (17080, 17091, 17095, 17911); Deeprot Stomper 13141 x12 in The Wicked Grotto and Vyletongue Seat (17092); Putridus Trickster 11791, Shadowstalker 11792, Poison Sprite 12216, Corruptor 12217 (type 3, demon), Deeprot Tangler 13142; smart_scripts base and module: 11790 Putrid Breath, Sinister Strike, Gouge; 11791 Backstab from behind; 11792 Sneak; 12216 Poison Bolt; 12217 Corruption (base; the module does not touch 12217); 13141 War Stomp; 13142 Thorns, Entangling Roots; WMOAreaTable 31476-31479, 31490, 31492, 31494, 31496, 32592 The Wicked Grotto; 31491 Vyletongue Seat; creature 12236 Lord Vyletongue at 749,-220 in group 17092'),
(210011, 2, 2100, 0, 0, 0, 'Zaetar''s Spirit', 'Freed when Theradras fell, the spirit of Zaetar stands in the green valley where she walked, and he does not mean to leave it. The centaur are his misbegotten sons and daughters, he says, and they need their father. The valley rings with all that Cenarius preaches, and it sprang from him; he will not take that from them, not even for their crimes against him.', '', 'quest 7066 description and log (the misbegotten centaur, my sons and daughters, have need of their father; this place rings of hope and all that my father Cenarius preaches, it sprung from me; not even for their crimes against me; ease my brother''s mind; the first seed that fell from the life my remains nourished; seek out Remulos in Moonglade); QuestType 2, flags 0; starter 12238 only; creature 12238 no spawn: summoned only by 12201''s death (smart_scripts 12201 id 4); creature_text 12238 (Free! Free from my bonds at last!); display 12369 KeeperOfTheGrove at scale 3.0; gossip 5304 (npc_text 6336: I greet you); moonglade.json 49305 part 1 (DONE 7066: the seed''s delivery and Remulos''s answer), not retold'),
(210012, 2, 2100, 0, 0, 0, 'The Spirits of the Khans', 'Ghosts of centaur walk the caverns of Maraudon, great khans by their look, each bearing the title of a khan of old as though in a line of rulers long gone. They take no notice of the living and harm no one. Yet those who know the way can call them back into the world, and what is called back does not come in peace.', '', 'creatures 12242 Spirit of Maraudos (The Fourth Kahn) at 650,-360 in The Wicked Grotto (group 17091; the module moves him to a patrol from 790,-500) and 12243 Spirit of Veng (The Fifth Kahn) at 1055,-424 in Foulspore Cavern (group 17073), both faction 35, CentaurKhan model, no gossip; creature_template 13738 Veng and 13739 Maraudos (faction 134, no AIName); no spawn of their own, reached only by the template update; desolace.json 40527 parts 1-2 (the Pariah, the five khans and their gems, ACCEPT and DONE 7067), pointed to');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(210000, 1, 0, 255, 'Willow of the Twilight''s Hammer wants the theradric carvings of Terramok, deep in the caverns, where relics of the Old Gods lie hidden behind giant doors.', 'AreaTable 2100 Maraudon (map 349); tools/research/zones/maraudon.txt (2100 the only area); WMOAreaTable rows for root 3233 (Foulspore Cavern, The Wicked Grotto, The Noxious Hollow, Vyletongue Seat, Poison Falls, Earth Song Falls, Zaetar''s Grave) all have area 0, so the core reports 2100 throughout'),
(210006, 1, 0, 255, 'When Theradras fell, a spirit rose in the valley, a towering keeper of the grove, crying that he was free of his bonds at last.', 'creature 12201 single spawn on map 349 at 28,83 in WMO group 17065 (Zaetar''s Grave), MovementType 2; creature_template_model 12201 display 12292 (Tharazun model at scale 2.0), type 4 elemental; no creature_text'),
(210007, 1, 0, 255, 'Freed of the curse, Celebras tells who he is: a son of Remulos, who came into these caves with his dryad sisters to free the tortured spirit of his uncle Zaetar, and fell to the corruption instead.', 'creature 12225 single spawn on map 349 at 726,78 (WMO group 17071, unlabeled, beside Corrupt Force of Nature 13743 x3, Celebrian Dryad 11793 x2, Sister of Celebras 11794 x2); display 12350 KeeperOfTheGrove at scale 1.3'),
(210007, 2, 0, 255, 'Zaetar always felt he could not match his brother Remulos. Blinded by jealousy he set out to outdo him, and fell for a princess of elemental earth, though Remulos knew the union was cursed.', 'creature 12225 single spawn on map 349 at 726,78 (WMO group 17071, unlabeled, beside Corrupt Force of Nature 13743 x3, Celebrian Dryad 11793 x2, Sister of Celebras 11794 x2); display 12350 KeeperOfTheGrove at scale 1.3'),
(210008, 1, 0, 255, 'Noxxion, a great shape of poisoned water at the end of the Noxious Hollow, is Vyletongue''s creation, a living symbol of his corruption.', 'creature 12236 single spawn on map 349 at 749,-220 in WMO group 17092 (Vyletongue Seat, within The Wicked Grotto); display 12334 Satyr model at scale 2.0; type 3 (demon)'),
(210011, 1, 0, 255, 'Zaetar sent the first seed of the life his remains nourished to his brother Remulos. Remulos had thought him lost in his arrogance and anger, and found him reborn.', 'quest 7066 description and log (the misbegotten centaur, my sons and daughters, have need of their father; this place rings of hope and all that my father Cenarius preaches, it sprung from me; not even for their crimes against me; ease my brother''s mind; the first seed that fell from the life my remains nourished; seek out Remulos in Moonglade); QuestType 2, flags 0; starter 12238 only'),
(210012, 1, 0, 255, 'A centaur pariah, exiled as a heretic, needs an outsider to enter the holy halls for him. His destiny, he says, is to unite the tribes of the centaur.', 'creatures 12242 Spirit of Maraudos (The Fourth Kahn) at 650,-360 in The Wicked Grotto (group 17091; the module moves him to a patrol from 790,-500) and 12243 Spirit of Veng (The Fifth Kahn) at 1055,-424 in Foulspore Cavern (group 17073), both faction 35, CentaurKhan model, no gossip'),
(210012, 2, 0, 255, 'With what was taken from the khans of old, the Pariah declared he could begin the great task of uniting the tribes, and hoped to meet his helper again on very different terms.', 'creatures 12242 Spirit of Maraudos (The Fourth Kahn) at 650,-360 in The Wicked Grotto (group 17091; the module moves him to a patrol from 790,-500) and 12243 Spirit of Veng (The Fifth Kahn) at 1055,-424 in Foulspore Cavern (group 17073), both faction 35, CentaurKhan model, no gossip');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(210000, 1, 2100, 0),
(210006, 3, 12201, 0),
(210006, 4, 7064, 0),
(210006, 4, 7065, 0),
(210007, 3, 12225, 0),
(210007, 4, 7044, 0),
(210008, 3, 12236, 0),
(210008, 4, 7044, 0),
(210008, 4, 7029, 0),
(210008, 4, 7041, 0),
(210011, 4, 7066, 0),
(210012, 3, 13739, 0),
(210012, 3, 13738, 0),
(210012, 4, 7067, 0),
(210000, 4, 7028, 1),
(210006, 3, 12201, 1),
(210007, 2, 13716, 1),
(210007, 2, 13716, 2),
(210008, 3, 13282, 1),
(210008, 4, 7044, 1),
(210011, 5, 7066, 1),
(210012, 4, 7067, 1),
(210012, 5, 7067, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(210000, 90000045, 0),
(210000, 40517, 1),
(210000, 210006, 2),
(210006, 210011, 0),
(210006, 90000045, 1),
(210006, 210007, 2),
(210007, 210006, 0),
(210007, 210011, 1),
(210007, 49305, 2),
(210008, 90000050, 0),
(210008, 210007, 1),
(210008, 210000, 2),
(210011, 210006, 0),
(210011, 49305, 1),
(210011, 90000045, 2),
(210012, 90000045, 0),
(210012, 210000, 1),
(210012, 40500, 2);

-- The Mechanar
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 384900 AND 384999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 384900 AND 384999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 384900 AND 384999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 384900 AND 384999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(384900, 0, 3849, 0, 0, 8, 'The Mechanar', 'The Mechanar is the satellite of Tempest Keep given over to machines. Kael''thas''s Sunseeker astromages, engineers and netherbinders keep its works running, Tempest-Forge golems and great drilling engines stalk its ramps, and blood elf physicians and slayers stand guard among them. Two mechanical gatewatchers hold the way in, and stacks of overcharged manacells hum in the halls above, each holding more power than any forge could use.', '', 'Mechanar spawns (map 554); Shadowmoon quest 10665 (manacells around Capacitus); creature_text 19218, 19710'),
(384901, 2, 3849, 0, 0, 8, 'Pathaleon the Calculator', 'Pathaleon the Calculator runs the Mechanar for Kael''thas, and runs it on a strict timetable: nothing, he warns intruders, will be allowed to interfere. He prefers to be hands-on. Short of hands, he simply takes new ones, bending a visitor''s mind to his service and calling nether wraiths to supplement his work force.', '', 'creature_text 19220');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(384900, 1, 3849, 0),
(384901, 3, 19220, 0);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(384900, 352315, 0),
(384900, 352305, 1),
(384900, 384901, 2),
(384901, 384900, 0),
(384901, 92000002, 1),
(384901, 352305, 2);

-- Molten Core
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 271700 AND 271799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 271700 AND 271799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 271700 AND 271799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 271700 AND 271799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(271700, 0, 2717, 0, 0, 0, 'Molten Core', 'The Molten Core lies at the very bottom of Blackrock Mountain, beneath the depths of the Dark Iron city: the domain of the Firelord, a world of lava and burning stone. Core hounds and fire elementals walk its halls, giants of molten rock guard its passages, and fiery runes on its floors are tended by the Firelord''s captains. Nothing short of an army can hope to enter it and live.', '', 'Molten Core quests 6822, 6824; creature_text 12018'),
(271701, 2, 2717, 0, 0, 0, 'Ragnaros the Firelord', 'Ragnaros the Firelord, ancient when this world was young, rules the Molten Core from a lake of fire at its heart, the master whose coming made Blackrock Mountain. His steward, Majordomo Executus, leads the Sons of the Living Flame and guards the way to his lair. Ragnaros wields the great hammer Sulfuras, and those who face him are purged by fire.', '', 'creature_text 11502, 12018');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(271700, 1, 0, 255, 'Duke Hydraxis of the Waterlords wants the hands of the Firelord''s captains, Lucifron, Sulfuron, Gehennas and Shazzrah: their deaths would deal the lords of fire a terrible blow.', 'Molten Core quests 6822, 6824; creature_text 12018'),
(271700, 2, 0, 255, 'Among the Firelord''s lieutenants here are Baron Geddon and Garr, who betrayed Thunderaan, Prince of Air, in the Elemental Sundering.', 'Molten Core quests 6822, 6824; creature_text 12018'),
(271701, 1, 0, 255, 'Beaten, Executus submitted and went to summon his lord. Woken too soon, Ragnaros named his steward a failure who had let insects run through the hallowed Core, and destroyed him.', 'creature_text 11502, 12018'),
(271701, 2, 0, 255, 'The Firelord''s form in this world was broken in his own lair, though no mortal blade can end him: he is the living flame.', 'creature_text 11502, 12018');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(271700, 1, 2717, 0),
(271701, 3, 11502, 0),
(271701, 2, 12018, 0),
(271700, 4, 6824, 1),
(271700, 5, 6824, 1),
(271700, 3, 12056, 2),
(271700, 3, 12057, 2),
(271701, 2, 12018, 1),
(271701, 3, 11502, 1),
(271701, 3, 11502, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(271700, 91000018, 0),
(271700, 271701, 1),
(271700, 1613, 2),
(271701, 91000018, 0),
(271701, 90000010, 1),
(271701, 271700, 2);

-- Naxxramas
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 345600 AND 345699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 345600 AND 345699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 345600 AND 345699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 345600 AND 345699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(345600, 0, 3456, 0, 0, 0, 'Naxxramas', 'Naxxramas is the floating necropolis of Kel''Thuzad, the dread citadel of the Scourge and the seat of his power. Four quarters ring its heart, each held by the master''s greatest servants: the spider kingdom of the Nerubians, the plague works, the halls where death knights train, and the laboratories where the dead are stitched into abominations. Above them all lies the frozen lair where the lich himself waits.', '', 'Naxxramas quests 9121-9123; creature_text 15990, 16980'),
(345601, 1, 3456, 0, 0, 0, 'The Arachnid Quarter', 'The Arachnid Quarter is the Nerubian wing of Naxxramas. The crypt lord Anub''Rekhan greets intruders to his parlor, hungry after too long without blood; Grand Widow Faerlina tells her worshippers they are the master''s acolytes now, and that the greatest glory is to die in his service; and the great spider Maexxna wraps her prey in webs.', '', 'creature_text 15956, 15953, 15952'),
(345602, 1, 3456, 0, 0, 0, 'The Plague Quarter', 'The Plague Quarter is where the Scourge works its plague. Noth the Plaguebringer raises his fallen soldiers to fight again, glad to serve the master even in death; Heigan the Unclean sees endless suffering and promises that the races of the world will perish; and in the last hall Loatheb, a thing of fungus and rot, fills the air with an aura that blocks all healing.', '', 'creature_text 15954, 15936, 16011'),
(345603, 1, 3456, 0, 0, 0, 'The Military Quarter', 'The Military Quarter trains the Scourge''s death knights. Instructor Razuvious drills his students, Gothik the Harvester waits behind a gate dividing the living from the dead, and at the end of the halls ride the Four Horsemen: Thane Korth''azz, Lady Blaumeux, who wagers on the first kill, and Sir Zeliek, who begs intruders to turn back and obeys only because he has no choice.', '', 'creature_text 16061, 16060, 16063, 16064, 16065, 30549'),
(345604, 1, 3456, 0, 0, 0, 'The Construct Quarter', 'The Construct Quarter is the Scourge''s laboratory of flesh. Patchwerk, an abomination Kel''Thuzad made his avatar of war, only wants to play; Grobbulus and Gluth feed on what the plague and the hounds leave behind; and Thaddius, stitched from the dead and bound by two guardians of living current, cries that he must obey.', '', 'creature_text 16028, 15928'),
(345605, 2, 3456, 0, 0, 0, 'Sapphiron', 'Sapphiron is the frost wyrm that guards the way to Kel''Thuzad''s lair, a dragon of the Scourge that takes to the air to bury intruders in ice, and those who reach the lich must first pass him in the frozen heart of Naxxramas.', '', 'creature_text 15989; quest 13372');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(345600, 1, 0, 12, 'Its entrance lies in the Plaguewood, behind a rune portal sealed by magical wards, and the Argent Dawn has found a way past them with an old Kirin Tor cantrip of arcane cloaking.', 'Naxxramas quests 9121-9123; creature_text 15990, 16980'),
(345600, 2, 0, 12, 'Of the master of Naxxramas only his phylactery remained, and a priest at Light''s Hope paid hugely for it, whatever it might mean for the lich''s return.', 'Naxxramas quests 9121-9123; creature_text 15990, 16980'),
(345600, 3, 13, 255, 'Now the necropolis hangs over the Dragonblight above Wintergarde Keep, sent down by the Lich King to strike at the armies of the living in Northrend.', ''),
(345603, 1, 13, 255, 'The fourth rider in these days is Baron Rivendare, raised again after his fall in Stratholme. Life is meaningless, he says; it is in death that we are truly tested.', 'creature_text 16061, 16060, 16063, 16064, 16065, 30549'),
(345603, 2, 0, 12, 'The fourth rider is Highlord Mograine, a fallen hero of the Light whom Kel''Thuzad holds in chains of his own.', 'creature_text 16061, 16060, 16063, 16064, 16065, 30549'),
(345604, 1, 0, 255, 'Even as he fought, the souls inside Thaddius begged for help and for an end. When it came, his last word was thank you.', 'creature_text 16028, 15928'),
(345605, 1, 0, 255, 'In his clutches lay a key held only by the most ancient of Malygos''s blue dragons, and Alexstrasza called it the break the dragons had waited for to strike at the Aspect of Magic.', 'creature_text 15989; quest 13372');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(345600, 1, 3456, 0),
(345601, 3, 15956, 0),
(345601, 3, 351009, 0),
(345601, 3, 15953, 0),
(345601, 3, 351007, 0),
(345601, 3, 15952, 0),
(345601, 3, 351006, 0),
(345602, 3, 15954, 0),
(345602, 3, 351008, 0),
(345602, 3, 15936, 0),
(345602, 3, 351005, 0),
(345602, 3, 16011, 0),
(345602, 3, 351020, 0),
(345603, 3, 16061, 0),
(345603, 3, 351036, 0),
(345603, 3, 16060, 0),
(345603, 3, 351035, 0),
(345603, 3, 16064, 0),
(345603, 3, 351039, 0),
(345603, 3, 16065, 0),
(345603, 3, 351040, 0),
(345603, 3, 16063, 0),
(345603, 3, 351038, 0),
(345604, 3, 16028, 0),
(345604, 3, 351028, 0),
(345604, 3, 15931, 0),
(345604, 3, 351003, 0),
(345604, 3, 15932, 0),
(345604, 3, 351004, 0),
(345604, 3, 15928, 0),
(345604, 3, 351000, 0),
(345605, 3, 15989, 0),
(345605, 3, 351018, 0),
(345600, 4, 9121, 1),
(345600, 4, 9122, 1),
(345600, 4, 9123, 1),
(345600, 4, 9120, 2),
(345600, 5, 9120, 2),
(345603, 3, 30549, 1),
(345603, 3, 351037, 2),
(345604, 3, 15928, 1),
(345604, 3, 351000, 1),
(345605, 4, 13372, 1),
(345605, 5, 13372, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(345600, 92000000, 0),
(345600, 13915, 1),
(345600, 6519, 2),
(345601, 345600, 0),
(345601, 90000080, 1),
(345601, 90000006, 2),
(345602, 345600, 0),
(345602, 90000006, 1),
(345603, 345600, 0),
(345603, 429801, 1),
(345603, 201704, 2),
(345604, 345600, 0),
(345604, 90000006, 1),
(345605, 345600, 0),
(345605, 92000000, 1),
(345605, 90000063, 2);

-- The Nexus
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 426500 AND 426599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 426500 AND 426599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 426500 AND 426599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 426500 AND 426599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(426500, 0, 4265, 0, 0, 13, 'The Nexus', 'The Nexus is the fortress of Malygos beneath Coldarra, a frozen maze of halls where the blue flight''s servants gather the magic drawn out of the world. Azure magi, warders and enforcers keep it beside the mage hunters who abduct the world''s spellcasters, crazed mana-wyrms and mana-surges drift through its passages, and in one cavern the flood of arcane power has turned a grove and its ancients to living crystal.', '', 'Nexus spawns (map 576); Nexus quests 11905, 11911; creature_text 26763'),
(426501, 2, 4265, 0, 0, 13, 'Keristrasza', 'Keristrasza is the red dragon who slew Saragosa, consort of Malygos, and Malygos took her in Saragosa''s place. She lies frozen at the heart of the Nexus, and she will never cooperate willingly, but the Aspect of Magic is powerful and in time he will bend her will.', '', 'Nexus quests 11973, 13246; creature_text 26723');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(426500, 1, 0, 255, 'Azeroth''s ley lines are being redirected to the Nexus, Archmage Berinand has found, and the influx is tearing a rift between dimensions deep inside. He cannot stop it, only slow it.', 'Nexus spawns (map 576); Nexus quests 11905, 11911; creature_text 26763'),
(426500, 2, 0, 255, 'The ancients of the crystal grove are changing into something different, and they fight back: some intelligence, Berinand suspects, is behind the transformation.', 'Nexus spawns (map 576); Nexus quests 11905, 11911; creature_text 26763'),
(426500, 3, 0, 255, 'The rift had a guardian, Anomalus, a creature of chaos that tore the fabric of reality open around it until it was itself unwoven.', 'Nexus spawns (map 576); Nexus quests 11905, 11911; creature_text 26763'),
(426501, 1, 0, 255, 'Her will was already breaking. She raved that there was no truth in preserving, only in the taking, and begged to be finished; dying, she called on the Dragonqueen, the Life-Binder, to preserve her.', 'Nexus quests 11973, 13246; creature_text 26723'),
(426501, 2, 0, 255, 'Raelorasz swore that their kind would never forget the sacrifice Keristrasza made for the cause, and that her fate would only steel the dragons'' resolve.', 'Nexus quests 11973, 13246; creature_text 26723');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(426500, 1, 4265, 0),
(426501, 3, 26723, 0),
(426501, 4, 11973, 0),
(426500, 4, 11905, 1),
(426500, 5, 11911, 2),
(426500, 3, 26763, 3),
(426501, 3, 26723, 1),
(426501, 5, 11973, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(426500, 353712, 0),
(426500, 353723, 1),
(426500, 90000063, 2),
(426500, 426501, 3),
(426501, 353723, 0),
(426501, 90000079, 1),
(426501, 426500, 2);

-- The Obsidian Sanctum
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 449300 AND 449399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 449300 AND 449399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 449300 AND 449399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 449300 AND 449399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(449300, 0, 4493, 0, 0, 13, 'The Obsidian Sanctum', 'The Obsidian Sanctum is the black dragonflight''s chamber among the sanctums of the Aspects beneath Wyrmrest Temple, a hot cavern of black rock and running lava. Onyx sanctum guardians, brood generals, blaze mistresses and flight captains keep its approaches, and at its heart, ringed by fire and lava, lies a clutch of strange eggs watched over by the greatest of them.', '', 'Obsidian Sanctum spawns (map 615); creature_text 30453, 30680'),
(449301, 2, 4493, 0, 0, 13, 'Sartharion', 'Sartharion, the Onyx Guardian, holds the Obsidian Sanctum, and it is his charge to watch over its eggs: he will see intruders burn before any harm comes to them. When the siege presses him he calls his three drakes to his side, Tenebron, Shadron and Vesperon, and the lava around him churns until it sweeps the floor.', '', 'creature_text 28860, 30449, 30451, 30452');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(449301, 1, 0, 255, 'His drakes are twilight dragons, and they think little of him. Father taught us well, Shadron boasts; Father was right about you, Vesperon tells Sartharion, you are a weakling. Who their father is, none of them says.', 'creature_text 28860, 30449, 30451, 30452');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(449300, 1, 4493, 0),
(449301, 3, 28860, 0),
(449301, 3, 30452, 0),
(449301, 3, 30451, 0),
(449301, 3, 30449, 0),
(449301, 3, 30452, 1),
(449301, 3, 30451, 1),
(449301, 3, 30449, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(449300, 6509, 0),
(449300, 90000024, 1),
(449300, 449301, 2),
(449301, 449300, 0),
(449301, 90000024, 1);

-- The Oculus
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 422800 AND 422899;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 422800 AND 422899;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 422800 AND 422899;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 422800 AND 422899;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(422800, 0, 4228, 0, 0, 13, 'The Oculus', 'The Oculus floats above the Nexus, a great orb of rings turning around a core of raw arcane power: the conduit through which Malygos draws the magic of the world''s ley lines. Azure ring guardians patrol its bands on blue drakes, inquisitors, spellbinders and ring-lords keep its platforms, and centrifuge constructs turn in the middle rings, shielding the commander who holds the skies.', '', 'Oculus spawns (map 578); Oculus quests 13124, 13128; creature_text 27447'),
(422801, 2, 4228, 0, 0, 13, 'Belgaristrasz, Verdisa and Eternos', 'Belgaristrasz of the red flight, Verdisa of the green and Eternos of the bronze led the dragons'' strike into the Oculus and were taken prisoner, held by Drakos the Interrogator, for whom the word of Malygos is law. Freed, they lend drakes of their own flights to their rescuers: only on dragonback can anyone reach the blue flight''s lords on the rings above.', '', 'Oculus quests 13124, 13126; creature_text 27654, 27658'),
(422802, 2, 4228, 0, 0, 13, 'Mage-Lord Urom', 'Mage-Lord Urom guards the Oculus''s third ring for the Spell-Weaver, a trickster and conjurer who appears alone and defenseless and is neither. He pities those who defy Malygos as blind fools without foresight: Malygos, he insists, is saving the world from itself.', '', 'Oculus quest 13127; creature_text 27655, 28012'),
(422803, 2, 4228, 0, 0, 13, 'Ley-Guardian Eregos', 'Ley-Guardian Eregos is a blue dragon of immense power and one of Malygos''s most trusted servants, the guardian of the ley line conduit at the top of the Oculus. He draws his strength from the energies he defends, sipping from the well of the Aspect himself, and he scorns those who would turn the arcane against its masters.', '', 'Oculus quest 13128; creature_text 27656');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(422800, 1, 0, 255, 'The dragons'' latest strike team was captured and is held inside the Oculus. Malygos and his servants, Raelorasz admits, grow stronger with each passing day.', 'Oculus spawns (map 578); Oculus quests 13124, 13128; creature_text 27447'),
(422800, 2, 0, 255, 'Not since the start of the Nexus War, Raelorasz said, had the dragons dealt the Lord of Magic a blow of such magnitude.', 'Oculus spawns (map 578); Oculus quests 13124, 13128; creature_text 27447'),
(422802, 1, 0, 255, 'Even dying he did not recant: everything he had done, he insisted with his last breath, had been for Azeroth.', 'Oculus quest 13127; creature_text 27655, 28012'),
(422803, 1, 0, 255, 'Beaten, he told the victors to savor their small victory: they and their dragon allies had won a battle, but the blue flight would win the Nexus War.', 'Oculus quest 13128; creature_text 27656');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(422800, 1, 4228, 0),
(422801, 5, 13124, 0),
(422801, 4, 13126, 0),
(422801, 3, 27654, 0),
(422802, 3, 27655, 0),
(422802, 4, 13127, 0),
(422803, 3, 27656, 0),
(422803, 4, 13128, 0),
(422800, 4, 13124, 1),
(422800, 5, 13128, 2),
(422802, 3, 27655, 1),
(422803, 3, 27656, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(422800, 353712, 0),
(422800, 353723, 1),
(422800, 90000078, 2),
(422800, 422801, 3),
(422801, 422800, 0),
(422801, 90000079, 1),
(422801, 90000022, 2),
(422801, 90000060, 3),
(422802, 422800, 0),
(422802, 353723, 1),
(422803, 422800, 0),
(422803, 90000063, 1),
(422803, 353723, 2);

-- Old Hillsbrad Foothills
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 236700 AND 236799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 236700 AND 236799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 236700 AND 236799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 236700 AND 236799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(236700, 0, 2367, 0, 0, 8, 'Old Hillsbrad Foothills', 'The timeway west of the Caverns opens onto the Hillsbrad Foothills of seven years ago. Durnholde Keep still stands over its internment camps, its sentries, riflemen and tracking hounds patrolling the hills, and Tarren Mill is still a human village with its own guardsmen and lookouts. Two agents of the bronze flight, Erozion and the drake Brazen, wait on the hillside below the keep.', '', 'Caverns of Time quests 10282, 10283, 10284; creature_text 18723, 18887');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(236700, 1, 0, 255, 'It was Taretha Foxton who set the diversion that let Thrall escape Durnholde. The Infinite have taken her to Tarren Mill, so unless someone else lights the internment lodges, the escape will never happen.', 'Caverns of Time quests 10282, 10283, 10284; creature_text 18723, 18887'),
(236700, 2, 0, 255, 'Taretha bade Thrall farewell: they call you a monster, she told him, but they are the monsters, not you. Erozion then made them forget the strangers, and said that her fate was, regrettably, unavoidable.', 'Caverns of Time quests 10282, 10283, 10284; creature_text 18723, 18887');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(236700, 1, 2367, 0),
(236700, 4, 10283, 1),
(236700, 5, 10284, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(236700, 44007, 0),
(236700, 91000002, 1),
(236700, 90000089, 2),
(236700, 26710, 3);

-- Onyxia's Lair
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 215900 AND 215999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 215900 AND 215999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 215900 AND 215999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 215900 AND 215999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(215900, 0, 2159, 0, 0, 0, 'Onyxia''s Lair', 'Behind a cave mouth shaped like a dragon''s jaws in the Wyrmbog lies the lair of Onyxia, brood mother of the black dragonflight and daughter of Deathwing. A winding passage guarded by her warders opens on a great cavern, its walls lined with eggs where her whelps hatch, and in its heart the brood mother herself waits on a floor scorched black by her breath.', '', 'creature_text 10184'),
(215901, 2, 2159, 0, 0, 0, 'Onyxia', 'Onyxia is the brood mother of the black dragonflight, daughter of Deathwing and twin of Nefarian. Usually, she says, she must leave her lair to feed, and she greets intruders as a fortunate meal. When the fight wearies her she takes wing and pours fire on them from above, and her eggs answer her from the walls.', '', 'creature_text 10184; quests 7490, 7509, 24428, 24429');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(215901, 1, 0, 255, 'Her head has been taken before, and those who receive it again would rather not think too hard about how she came to be in her lair once more.', 'creature_text 10184; quests 7490, 7509, 24428, 24429'),
(215901, 2, 0, 255, 'The lorekeeper of the Shen''dralar in Dire Maul sends the ancient blade Quel''Serrar to her lair: only her breath can heat it, and only her blood can temper it.', 'creature_text 10184; quests 7490, 7509, 24428, 24429');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(215900, 1, 2159, 0),
(215901, 3, 10184, 0),
(215901, 3, 301000, 0),
(215901, 5, 24428, 1),
(215901, 5, 24429, 1),
(215901, 4, 7509, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(215900, 1520, 0),
(215900, 90000024, 1),
(215900, 215901, 2),
(215901, 90000024, 0),
(215901, 215900, 1),
(215901, 255703, 2);

-- People
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 92000000 AND 92000099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 92000000 AND 92000099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 92000000 AND 92000099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 92000000 AND 92000099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(92000000, 2, 0, 0, 0, 0, 'Kel''Thuzad', 'Kel''Thuzad was an archmage of Dalaran and sat on the Council of Six, until his hunger for forbidden knowledge drew him into necromancy. Censured by the Kirin Tor, he left the city, heeded the call of the Lich King in Northrend and came back to found the Cult of the Damned, through which he spread the plague that made Lordaeron the Scourge''s own.', 'Learned where the Cult of the Damned first spread its plague.', 'Western Plaguelands 2800, 2804, 2805, 2824; Eastern Plaguelands 13900, 13915; Dragonblight 6531; Quel''Danas 408000, Eversong 343012 (raised at the Sunwell); Alterac 3619 (Archimonde at Dalaran); warcraft.wiki.gg Kel''Thuzad (pre-Cataclysm); Borean 353725; Naxxramas creature_text 15990'),
(92000001, 2, 0, 0, 0, 0, 'Tirion Fordring', 'Tirion Fordring has spent long years as a hermit in a small hut by the Thondroril River, with only his old horse Mirador for company. He holds to one credo and asks every guest to respect it: race does not dictate honor. He has known orcs as honorable as the noblest knights and humans as vile as the Scourge.', 'Learned from an old hermit who keeps a hut by the river.', 'warcraft.wiki.gg/wiki/Tirion_Fordring (Silver Hand, Lord of Mardenholde, Eitrigg, trial and exile, hermit by the Thondroril with Mirador, Argent Crusade); npc_text 4494 (banished, chose to remain to watch over Taelan; Taelan their Highlord); quest 5781 description (his mother told him I had died); npc_text 4254 (race does not dictate honor; orcs as honorable as knights); creature_text 12126 groups 6, 7 (malaise; a new Order is born); creature_text 29175 (Tirion at Light''s Hope Chapel); quests 5542, 5543, 5544 descriptions and reward texts; quest 5742 and gossip menus 3681-3683 (npc_text 4493-4495); quests 5781, 5845, 5846, 5848 descriptions and reward texts; quest 5861 description; quest 5848 description (search for a painting of our twin moons, chip away at the paint); quest 5862 log and reward text (Scarlet Illusion, Mardenholde Keep); quest 5944 description and reward text; creature_text 1842, 1840 (Isillien: forest''s edge, Grand Crusader charged me), 12126 (murdered my boy; too long have I sat idle; a new Order is born); warcraft.wiki.gg/wiki/Tirion_Fordring (Isillien killed Taelan in Hearthglen; Tirion avenged his son); creature_text 1840 group 0 (you will not make it to the forest''s edge); Icecrown 21003 (Crusaders'' Pinnacle)'),
(92000002, 2, 0, 0, 0, 0, 'Prince Kael''thas Sunstrider', 'Kael''thas Sunstrider is the prince of Quel''Thalas, son of King Anasterian, and sat on the Council of Six in Dalaran. When the Scourge destroyed his homeland he gathered the survivors and named them blood elves, then fought for the Alliance in Lordaeron until its commander condemned him for accepting naga help. He escaped to Outland, joined Illidan, and promised his people a cure for their hunger.', 'Learned in the city that still awaits its prince.', 'Silvermoon 348700, 348701, 348703; Quel''Danas 408000; warcraft.wiki.gg Kael''thas Sunstrider (pre-Cataclysm); creature_text 19622; creature_text 24664'),
(92000003, 2, 0, 0, 0, 0, 'Lady Liadrin', 'Orphaned by Amani trolls and raised in the faith, Liadrin became a high priestess of Quel''Thalas and lost her faith when the Scourge laid her homeland waste. Grand Magister Rommath offered her a new path, and she became the first Blood Knight and matriarch of the order, which keeps its headquarters in the Hall of Blood in Farstriders'' Square.', 'Learned from the knights who serve the matriarch of their order.', 'warcraft.wiki.gg/wiki/Liadrin (Vandellor, lost faith, Rommath''s offer, first Blood Knight, A''dal in Shattrath, Shattered Sun Offensive, faith restored after the Sunwell); warcraft.wiki.gg/wiki/Blood_Knight (M''uru held beneath the Hall of Blood, stolen by Kael''s felblood elves); quest 9721 description (Solanar, Lady Liadrin''s right hand); quest 9684 description and npc_text 12370 (Liadrin seeks a new source of power); DB: Lady Liadrin 17076 (faction 35, quest giver) spawned only in Shattrath City; warcraft.wiki.gg/wiki/Solanar_Bloodwrath (Liadrin went to Shattrath for a new power source after Kael''s betrayal); creature_questender 17076 ends 10960 (Children''s Week, AllowableRaces 0); npcflag 2 so right-click passes through the gossip hello hook; quest 9721 description (Liadrin''s right hand, hero in his own right, leaves the rank-and-file to Bloodvalor); quest 9722 description (inner circle, thalassian chargers); quests 9735, 9737 descriptions and completion text (false paladins); warcraft.wiki.gg/wiki/Solanar_Bloodwrath (one of the first Blood Knights, took over Liadrin''s post while she was away); creature_template 25223 faction 1604'),
(92000004, 2, 0, 0, 0, 0, 'Highlord Darion Mograine', 'Darion Mograine is the son of Alexandros Mograine, the paladin called the Ashbringer, and a death knight raised in the Lich King''s service. As Highlord of Acherus he commands the death knights from the Hall of Command, carrying his master''s will to them, for he hears the Lich King''s voice in his thoughts.', 'Learned from the knights of the Ebon Hold.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man); npc_text 13482; creature_text 28444 (the scarlet apocalypse has begun); quest 12657 description (Hall of Command); quest 12706 reward text (since my father wielded...); quest 12801 reward text (join me as a Knight of the Ebon Blade, destroy the Lich King); warcraft.wiki.gg/wiki/Darion_Mograine (son of Alexandros, raised by Kel''Thuzad, Highlord, founded the Ebon Blade); quest 12714 description (our existence is tied to his consciousness, Mograine answers an unseen host); creature_text 28444 (tear this land asunder); quests 13165, 13166 descriptions and reward texts; quests 13188 and 13189 (Tirion''s letter); warcraft.wiki.gg/wiki/Acherus:_The_Ebon_Hold (Patchwerk, Scourge banners replaced with Ebon Blade banners); Icecrown 21031, 21042, 21045'),
(92000005, 2, 0, 0, 0, 0, 'The Lich King', 'The Lich King was made by the Burning Legion: the spirit of the orc shaman Ner''zhul, bound in armor and sealed in ice atop Icecrown to raise the Scourge. Prince Arthas Menethil took up the runeblade Frostmourne in his service, and after the Third War he climbed to the Frozen Throne and put on the Helm of Domination, becoming one with his master. He rules the Scourge from Icecrown still.', 'Learned in the presence of the master of the Scourge.', 'quest 12593 description (immortality, force of retribution); quest 12641 reward text (I sense an old enemy, destroyed long ago); quest 12657 description (Death. To. All.); creature_text 29110 (The Light has abandoned you); quest 12779 reward text (helm, Light''s Hope Chapel); creature_text 29183 group 47 and 29175 group 28 (he sent them in to die, knew what lies beneath the chapel); creature_text 28391 (Arthas... my king); quest 13165 reward text; quest 12593 description (all that I am: anger, cruelty, vengeance, I bestow upon you); quests 12593, 12619, 12842, 12848, 12636, 12641, 12657 descriptions and reward texts; creature_text 28357 (retains emotion and memory); creature_text 29520 (unworthy initiate: I was a soldier of the Light once); warcraft.wiki.gg/wiki/Acherus:_The_Ebon_Hold (necromancers raised bodies Razuvious selected); warcraft.wiki.gg Lich King, Ner''zhul, Arthas Menethil (pre-Cataclysm); Icecrown 21030, 21036, 21045; creature_text 36597, 38579, 38995'),
(92000006, 2, 0, 0, 0, 0, 'Thrall', 'Thrall, son of Durotan, is Warchief of the Horde. Born a Frostwolf and raised a gladiator slave at Durnholde, he broke free, learned the ways of the shaman, freed the orcs from the internment camps and took up the Doomhammer from the dying Orgrim. Heeding a prophet''s warning he led them across the sea to Kalimdor, stood with the humans against Archimonde at Mount Hyjal and founded Durotar, where he works to keep a fragile peace with the Alliance.', 'Learned in the Warchief''s own hall.', 'warcraft.wiki.gg/wiki/Thrall (Durotan and Draka, Frostwolf, Durnholde gladiator, internment camps, Doomhammer''s warhammer and Warchief title, Kalimdor); npc_text 4477 (Thrall gossip: wisdom and honor, quarter and compassion, the new Horde); npc_text 5736 (peace with the Alliance; too young to remember the wars and bloodshed of ages past); quest 10175 reward text (I have a grandmother? She lives?); quest 13266 description (Justice must be served); warcraft.wiki.gg Thrall (pre-Cataclysm); Caverns of Time quest 10284'),
(92000007, 2, 0, 0, 0, 0, 'Lady Jaina Proudmoore', 'Jaina Proudmoore, ruler of Theramore, is the daughter of Admiral Daelin Proudmoore of Kul Tiras and was apprentice to Archmage Antonidas of Dalaran. When the plague struck Lordaeron, a prophet urged her to lead what survivors she could west across the sea, and at Mount Hyjal she stood with Thrall and the night elves against Archimonde. After the battle she founded Theramore, and she has worked for peace with the Horde ever since.', 'Learned in the island city she founded.', 'warcraft.wiki.gg/wiki/Jaina_Proudmoore (Kul Tiras, Antonidas, prophet, Hyjal, founded Theramore, Daelin''s assault); durotar.json 1408 (the admiral died at Theramore); quest 1285 reward text (deserters loyal to Admiral Daelin); npc_text 3157 (no time for pleasantries; my city must come first); warcraft.wiki.gg Jaina Proudmoore (pre-Cataclysm)'),
(92000008, 2, 0, 0, 0, 8, 'Garrosh Hellscream', 'Garrosh, son of Grommash Hellscream, is the young war chief of the Mag''har, heir to lead them when the Greatmother passes, and he carries that duty like a curse. He has grown up in the shadow of his father''s name, for the blood lust that consumed Grom is said to have cursed their people, and he fears the same rage waits in his own veins.', 'Learned by the fire in Garadar.', 'creature_template 18063 subname Son of Hellscream; warcraft.wiki.gg/wiki/Mag''har (military chief, to succeed Geyah); quests 9868, 9872, 9934 reward texts (depressed, dismissive); quest 9891 reward text (Jorin: impotent whelp); npc_text 9509, 9510 (Geyah: the blood lust that consumed his father and cursed our people; he fears his rage will consume him); npc_text 9271 (Kurkush: not his father''s boy); warcraft.wiki.gg Garrosh Hellscream (pre-Cataclysm); Borean 353706'),
(92000009, 2, 0, 0, 0, 8, 'Illidan Stormrage', 'Illidan Stormrage, twin brother of Malfurion, is called the Betrayer. In the War of the Ancients he made a new well of power on Mount Hyjal, and for it he was imprisoned for ten thousand years under the watch of the Warden Maiev Shadowsong. Freed by Tyrande in the Third War, he consumed the Skull of Gul''dan and destroyed the dreadlord Tichondrius, then fled to Outland, where he took the Black Temple and now rules as its lord.', 'Learned before the walls of the temple he took.', 'warcraft.wiki.gg/wiki/Shadowmoon_Valley (clan named after the valley, ancestor worship, Temple of Karabor as spiritual capital, Hand of Gul''dan raised to sever the link to the elements, Black Temple as Shadow Council base, Illidan''s headquarters, settlements); quest 10642 description (ancestral grounds of the Shadowmoon orcs); quest 10635 description (Gul''dan''s Horde defeated the draenei of Karabor); npc_text 10250 (Torlok: Gul''dan severed the tie between orcs and spirits); quest 10568 description (Gul''dan raised the volcano); creature_template subnames ''Servant of Illidan'' on Ashtongue, Coilskar, Shadowmoon fel orcs; Eclipsion blood elves; quests 10562, 10595 (infernals from Legion Hold); warcraft.wiki.gg/wiki/Black_Temple (sacred draenei site; no coastal setting in BC); warcraft.wiki.gg Illidan Stormrage (pre-Cataclysm); creature_text 22917, 23197');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(92000000, 1, 0, 255, 'House Barov gave him Caer Darrow in exchange for his help, and in the vaults beneath the keep he founded Scholomance, where the cult trained its necromancers.', ''),
(92000000, 2, 0, 255, 'When his work was done he fell to Prince Arthas at Andorhal, as the Lich King intended. Arthas carried his remains to the Sunwell and raised him as a lich, and at Dalaran he called down the demon lord Archimonde.', ''),
(92000000, 3, 0, 12, 'Now he rules the Plaguelands in the Lich King''s name from Naxxramas, the great necropolis that floats above the Plaguewood.', ''),
(92000000, 4, 13, 255, 'The necropolis is gone from the Plaguewood. Naxxramas now hangs over Dragonblight in Northrend, and Kel''Thuzad with it, once more the Lich King''s general in the war.', 'Western Plaguelands 2800, 2804, 2805, 2824'),
(92000000, 5, 13, 255, 'On the Plains of Nasam in the Borean Tundra a Scourge host massed under Kel''Thuzad himself, and the Warsong knew then that Naxxramas had returned.', 'Western Plaguelands 2800, 2804, 2805, 2824'),
(92000000, 6, 0, 255, 'In the frozen lair of Naxxramas Kel''Thuzad fell to mortal heroes, and swore with his last breath that their victory was hollow, for he would return with powers beyond their imagining.', 'Western Plaguelands 2800, 2804, 2805, 2824'),
(92000001, 1, 0, 255, 'He was a paladin of the Silver Hand and Lord of Mardenholde until he was found guilty of treason for standing by an honorable orc against his own people, and banished. He stayed near to watch over his son, Taelan, now Highlord of the Scarlet Crusade.', 'warcraft.wiki.gg/wiki/Tirion_Fordring (Silver Hand, Lord of Mardenholde, Eitrigg, trial and exile, hermit by the Thondroril with Mirador, Argent Crusade)'),
(92000001, 2, 0, 255, 'His son''s murder ended his long idleness. Tirion fought down the Grand Inquisitor who killed Taelan and, kneeling over him, swore that a new Order of the Silver Hand was born that day.', 'warcraft.wiki.gg/wiki/Tirion_Fordring (Silver Hand, Lord of Mardenholde, Eitrigg, trial and exile, hermit by the Thondroril with Mirador, Argent Crusade)'),
(92000001, 3, 13, 255, 'In the war against the Lich King he has taken up the Ashbringer, and he leads the Argent Crusade, born of the Argent Dawn and the Silver Hand, against Icecrown.', 'warcraft.wiki.gg/wiki/Tirion_Fordring (Silver Hand, Lord of Mardenholde, Eitrigg, trial and exile, hermit by the Thondroril with Mirador, Argent Crusade)'),
(92000002, 1, 12, 255, 'He has betrayed his people. Kael''thas has given himself to the Burning Legion, his felbloods have robbed Silvermoon, and his forces now hold Quel''Danas to bring Kil''jaeden through the Sunwell.', 'Silvermoon 348700, 348701, 348703'),
(92000002, 2, 0, 255, 'In the Eye he met his challengers with a boast: energy and power, his people''s addiction since the Sunwell fell, were their future. He set his four advisors on them, raised them again when they fell, since fair treatment was never shown his people, and died crying for Quel''Thalas.', 'Silvermoon 348700, 348701, 348703'),
(92000002, 3, 0, 255, 'On Quel''Danas he met his challengers again, scorning Tempest Keep as a mere setback: he had never trusted the future to a blind, half night elf mongrel, who was only an instrument. He died swearing that the master would have them and the world would burn.', 'Silvermoon 348700, 348701, 348703'),
(92000003, 1, 12, 255, 'When Kael''thas betrayed his people his felbloods took the naaru that gave the order its power, and Liadrin set out to find a new source.', 'warcraft.wiki.gg/wiki/Liadrin (Vandellor, lost faith, Rommath''s offer, first Blood Knight, A''dal in Shattrath, Shattered Sun Offensive, faith restored after the Sunwell)'),
(92000003, 2, 12, 255, 'Her road led to Shattrath, where she stands beside the naaru A''dal. She has renounced the house of Sunstrider, and her knights fight beside the Shattered Sun Offensive.', 'warcraft.wiki.gg/wiki/Liadrin (Vandellor, lost faith, Rommath''s offer, first Blood Knight, A''dal in Shattrath, Shattered Sun Offensive, faith restored after the Sunwell)'),
(92000003, 3, 13, 255, 'The Sunwell burns again, and in its light Liadrin has found her faith once more. She now teaches her knights to embrace the Light rather than bend it.', ''),
(92000004, 1, 0, 255, 'Something of the old Darion lingers. Reading of the Scarlet fleet''s destruction, he marveled that he had not seen such power since his father wielded... and let the thought go.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000004, 2, 0, 255, 'Before the march on Light''s Hope he looked toward the chapel and said it was where he had once sacrificed everything to free his father. Now he came to destroy it.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000004, 3, 0, 255, 'At Light''s Hope he broke free. He remembered driving the Ashbringer into his own heart to free his father''s cursed soul, his last act as a free man, and he founded the Knights of the Ebon Blade, sworn to destroy the Lich King.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000004, 4, 13, 255, 'The Ebon Watcher who advised the Argent Crusade outside the Breach was Mograine himself, paying a debt to Tirion; once the Crusade had its foothold, the Ebon Blade would go its own way.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000004, 5, 13, 255, 'He came in person to see Orbaz Bloodbane, self-proclaimed hand of the Lich King, die at the lip of the pit beneath the citadel. Good riddance, he said.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000004, 6, 13, 255, 'When Tirion was struck down in the Cathedral of Darkness, Mograine came with Thassarian, Koltira and his knights and saw the survivors out: for once, it was Tirion who stood in their debt.', 'quest 13165 description (plunged the Ashbringer into my own heart to free my father''s soul, last memory as a free man)'),
(92000005, 1, 0, 255, 'Through the eye of Acherus he studied New Avalon and sensed an old enemy there, one he had thought destroyed long ago, and sent the full might of the Scourge before the Crusade could prepare.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 2, 0, 255, 'He sent his knights to Light''s Hope to die, knowing what lay beneath the chapel. Struck by the Ashbringer in Tirion Fordring''s hands, he withdrew, swearing their next meeting would not be on holy ground.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 3, 13, 255, 'At the Crusaders'' Pinnacle his voice rang over the field, calling on the crusaders to surrender their souls. They did not, and the pinnacle was lost to him.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 4, 13, 255, 'When he became king, Arthas cast his heart down the pit beneath the citadel: he had understood, after a duel with Illidan that nearly killed him, that what held him back was that he could still feel.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 5, 13, 255, 'In the Cathedral of Darkness Tirion struck at his heart with the Ashbringer, and the Lich King fell to his knees. There is no Arthas Menethil anymore, Tirion said, only the Lich King.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 6, 0, 255, 'On the Frozen Throne he told Tirion he had trained the greatest fighting force the world had ever known and delivered it into his hands, as he intended: he would raise them as masters of the Scourge.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 7, 0, 255, 'Tirion broke free and shattered Frostmourne, and from the blade came the spirit of King Terenas Menethil, Arthas''s father: free at last, he told his son, it was over.', 'quest 12593 description (immortality, force of retribution)'),
(92000005, 8, 0, 255, 'Dying, he looked on his killers: now he stood, the lion before the lambs, and they did not fear. They could not fear.', 'quest 12593 description (immortality, force of retribution)'),
(92000006, 1, 8, 255, 'News from Outland shook even the Warchief: his father''s mother, Greatmother Geyah, still lives in Garadar in Nagrand, and Thrall resolved to set his affairs in order and go to her.', 'warcraft.wiki.gg/wiki/Thrall (Durotan and Draka, Frostwolf, Durnholde gladiator, internment camps, Doomhammer''s warhammer and Warchief title, Kalimdor)'),
(92000006, 2, 0, 255, 'As a young slave in Durnholde he hid his dreams: one day his people would overthrow their oppressors and rise as one, and from that uprising the orcish Horde would be born.', 'warcraft.wiki.gg/wiki/Thrall (Durotan and Draka, Frostwolf, Durnholde gladiator, internment camps, Doomhammer''s warhammer and Warchief title, Kalimdor)'),
(92000007, 1, 0, 255, 'When her father brought the fleet of Kul Tiras against the Horde, she would not fight beside him, and he died at her city. Her city, she says, must come first.', 'warcraft.wiki.gg/wiki/Jaina_Proudmoore (Kul Tiras, Antonidas, prophet, Hyjal, founded Theramore, Daelin''s assault)'),
(92000008, 1, 0, 255, 'Thrall told him the truth of how his father died, and Garrosh, who had hated Grom for the burden he left, found redemption in it and proclaimed himself Garrosh Hellscream, chieftain of the Mag''har.', 'creature_template 18063 subname Son of Hellscream'),
(92000008, 2, 13, 255, 'When the Horde went to war against the Lich King, Garrosh Hellscream was named Overlord of the Warsong Offensive, its army in Northrend.', 'creature_template 18063 subname Son of Hellscream'),
(92000008, 3, 13, 255, 'At Warsong Hold the Overlord of the Warsong Offensive sniffs the air for newcomers'' fear and quarrels openly with Saurfang, sure the Horde needs nothing but its warrior spirit.', 'creature_template 18063 subname Son of Hellscream'),
(92000009, 1, 12, 255, 'Champions from Shattrath fought their way to the summit of the Black Temple, and Illidan Stormrage was struck down in the seat he had taken from Magtheridon.', ''),
(92000009, 2, 0, 255, 'When Akama opened his sanctum, Illidan said he should have slaughtered Akama''s malformed brethren long ago. Then Maiev Shadowsong came for him. Dying, he told her the huntress is nothing without the hunt, and she admitted he was right: she felt nothing.', 'warcraft.wiki.gg/wiki/Shadowmoon_Valley (clan named after the valley, ancestor worship, Temple of Karabor as spiritual capital, Hand of Gul''dan raised to sever the link to the elements, Black Temple as Shadow Council base, Illidan''s headquarters, settlements)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(92000000, 1, 193, 0),
(92000000, 1, 2298, 0),
(92000000, 1, 2297, 0),
(92000001, 2, 1855, 0),
(92000002, 1, 3487, 0),
(92000002, 1, 3704, 0),
(92000003, 2, 17076, 0),
(92000003, 4, 9721, 0),
(92000003, 2, 25223, 0),
(92000004, 2, 28444, 0),
(92000004, 2, 31084, 0),
(92000005, 2, 25462, 0),
(92000005, 2, 29110, 0),
(92000006, 2, 4949, 0),
(92000007, 2, 4968, 0),
(92000008, 2, 18063, 0),
(92000008, 4, 10044, 0),
(92000009, 1, 3756, 0),
(92000009, 1, 3752, 0),
(92000000, 1, 4234, 4),
(92000000, 4, 12235, 4),
(92000000, 5, 11652, 5),
(92000000, 3, 15990, 6),
(92000000, 3, 351019, 6),
(92000001, 5, 5742, 1),
(92000001, 5, 5944, 2),
(92000001, 2, 31044, 3),
(92000001, 2, 32239, 3),
(92000002, 2, 16802, 1),
(92000002, 2, 17718, 1),
(92000002, 4, 9681, 1),
(92000002, 3, 19622, 2),
(92000002, 3, 24664, 3),
(92000003, 4, 9684, 1),
(92000003, 2, 17076, 2),
(92000004, 5, 12706, 1),
(92000004, 2, 29173, 2),
(92000004, 5, 12801, 3),
(92000004, 5, 13105, 4),
(92000004, 5, 13164, 5),
(92000004, 5, 13364, 6),
(92000004, 5, 13403, 6),
(92000005, 5, 12641, 1),
(92000005, 5, 12801, 2),
(92000005, 5, 13141, 3),
(92000005, 5, 13361, 4),
(92000005, 5, 13400, 4),
(92000005, 5, 13364, 5),
(92000005, 5, 13403, 5),
(92000005, 3, 36597, 6),
(92000005, 3, 36597, 7),
(92000005, 3, 36597, 8),
(92000006, 5, 10175, 1),
(92000006, 4, 10284, 2),
(92000007, 2, 4968, 1),
(92000008, 5, 10212, 1),
(92000008, 5, 10212, 2),
(92000008, 2, 25237, 3),
(92000009, 3, 22917, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(92000000, 91000021, 0),
(92000000, 90000003, 1),
(92000000, 91000003, 2),
(92000000, 90000006, 3),
(92000000, 2804, 4),
(92000000, 2805, 5),
(92000001, 90000032, 0),
(92000001, 90000031, 1),
(92000001, 2816, 2),
(92000001, 91000023, 3),
(92000002, 90000033, 0),
(92000002, 91000025, 1),
(92000002, 90000003, 2),
(92000002, 348703, 3),
(92000002, 408000, 4),
(92000002, 352315, 5),
(92000003, 90000035, 0),
(92000003, 90000036, 1),
(92000003, 348703, 2),
(92000004, 90000037, 0),
(92000004, 91000023, 1),
(92000004, 92000005, 2),
(92000004, 92000001, 3),
(92000004, 21005, 4),
(92000005, 90000006, 0),
(92000005, 91000005, 1),
(92000005, 92000000, 2),
(92000005, 92000004, 3),
(92000005, 91000023, 4),
(92000005, 21018, 5),
(92000006, 90000041, 0),
(92000006, 91000002, 1),
(92000006, 91000027, 2),
(92000006, 163708, 3),
(92000006, 163709, 4),
(92000007, 1501, 0),
(92000007, 92000006, 1),
(92000007, 91000030, 2),
(92000007, 91000027, 3),
(92000007, 90000003, 4),
(92000008, 90000066, 0),
(92000008, 351801, 1),
(92000008, 90000056, 2),
(92000008, 92000006, 3),
(92000008, 353706, 4),
(92000009, 352016, 0),
(92000009, 91000029, 1),
(92000009, 165707, 2),
(92000009, 352028, 3),
(92000009, 92000002, 4);

-- Peoples and Factions
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 90000000 AND 90000099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 90000000 AND 90000099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 90000000 AND 90000099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 90000000 AND 90000099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(90000001, 4, 0, 0, 0, 0, 'The Syndicate', 'The Syndicate is what remains of Alterac''s nobility. When King Aiden Perenolde was found to have let the Horde through his passes in the Second War, his kingdom was broken up and its lords lost their lands and titles. Many took to the hills with their households and hired blades. Now they rob, smuggle and murder across Alterac, Hillsbrad and Arathi, still dreaming of the crown they lost.', 'Found among the outlaws of Alterac, Hillsbrad and Arathi.', 'Alterac 3600, 3601, 3607, 3613, 3616, 3617 and Hillsbrad 26727 (quests 505-537), Arathi 4502, 4505, 4518; warcraft.wiki.gg Syndicate (pre-Cataclysm parts only)'),
(90000002, 4, 0, 0, 0, 0, 'Ravenholdt', 'Ravenholdt is the Assassin''s League, the finest thieves and killers in the eastern kingdoms, sworn to no king and no warchief. Its manor hides in the hills above Hillsbrad, and no one finds it uninvited: the League watches its recruits long before it summons them, and tests them with traps at the door. Lord Jorach Ravenholdt hires out its blades and keeps its secrets.', 'Learned in the hidden hills above Hillsbrad.', 'Alterac 3611, 3618; quest 6701 Syndicate Emblems (request text); warcraft.wiki.gg Ravenholdt (pre-Cataclysm)'),
(90000003, 4, 0, 0, 0, 0, 'The Kirin Tor', 'The Kirin Tor are the wizards who ruled Dalaran, the city of magi, and watched over the use of magic in the human kingdoms, governed by a Council of Six. The Third War broke their city and killed their leader, Archmage Antonidas, but the survivors never left: they shut themselves away in the ruins and set about rebuilding.', 'Learned among the ruins on the shore of Lordamere Lake.', 'Alterac 3610, 3619, 3620; Netherstorm 352310, 352311; Borean 353710; Dalaran 439500'),
(90000004, 4, 0, 0, 0, 0, 'The Royal Apothecary Society', 'The Royal Apothecary Society is the Forsaken''s order of alchemists, and its masters serve the Banshee Queen''s hunger for a New Plague, one that will kill humans and the Scourge alike. Its apothecaries work wherever the Forsaken reach, gathering poisons from the wild and testing their brews on whatever they can catch, from frogs to farmers.', 'Learned where the Forsaken brew their poisons.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661); Tirisfal 8524, 8530; Silverpine 13019, 13030; Undercity 149704, 149705, 149707; Howling Fjord 49505, 49508, 49532'),
(90000005, 4, 0, 0, 0, 0, 'The Forsaken', 'The Forsaken are the undead of Lordaeron who broke free of the Lich King. Led by Lady Sylvanas Windrunner, they claimed the ruins of the old capital, built the Undercity beneath them, and joined the Horde more out of need than love. They fight the Scourge that made them and the living who would destroy them, and they trust almost no one.', 'Learned in the lands the undead of Lordaeron have claimed.', 'Tirisfal 8500, 8501, 8520; Undercity 149700, 149702, 149706, 149707, 149714; Ghostlands 343301, 343320, 343330; Ashenvale 33102, 33119'),
(90000006, 4, 0, 0, 0, 0, 'The Scourge', 'The Scourge is the Lich King''s army of the dead, raised by a plague spread through Lordaeron''s grain. Its mindless soldiers obey his will alone. From the Plaguelands it still presses into Tirisfal and Silverpine, raising the dead, sending gnolls to rob the mass graves for fresh bodies, and turning the fallen heroes of the old kingdom into its commanders.', 'Learned wherever the dead do not stay dead.', 'Tirisfal 8500, 8507, 8509, 8532; Silverpine 13021, 13027; Western Plaguelands 2800; Eastern Plaguelands 13900, 13917; Borean 353718'),
(90000007, 4, 0, 0, 0, 0, 'The Scarlet Crusade', 'The Scarlet Crusade is a militant order of the Light that rose from the ruins of Lordaeron, sworn to purge every trace of the plague. Its zealots make no distinction between the Scourge and the free-willed Forsaken, and they trust few of the living either. From their great monastery in Tirisfal they send captains and missionaries across the glades.', 'Learned from the zealots in red who hunt the undead.', 'Tirisfal 8512, 8514, 8515, 8528; Western Plaguelands 2812, 2816; Eastern Plaguelands 13908, 13917; Desolace 40526; Icecrown 21004, 21032'),
(90000008, 4, 0, 0, 0, 0, 'Stromgarde', 'Stromgarde is the kingdom that grew from Strom, the first city of humankind, and its Trollbane kings fought the trolls for generations. In the Second War its king, Thoras Trollbane, stood with the Alliance; now he lies dead and his city in ruins, and the last loyal soldiers of Stromgarde hold Refuge Pointe, sworn to see the king''s banner fly over the city again.', 'Learned in the ruins of humanity''s first city.', 'Arathi 4500, 4505, 4508, 4516, 4517, 4526; Wetlands 1120, 1129; Hellfire 348324'),
(90000009, 4, 0, 0, 0, 0, 'The Twilight''s Hammer', 'The Twilight''s Hammer is a cult that worships the Old Gods and longs for the end of the world. Its members hide among the peoples of Azeroth and gather wherever an ancient, terrible power lies sleeping, working to set it free.', 'Learned from those who serve what sleeps beneath the earth.', 'Arathi 4524, 4530; Darkshore 14804, 14813, 14826; warcraft.wiki.gg Twilight''s Hammer (pre-Cataclysm); Silithus 137703, 137706, 137713, 137726'),
(90000010, 4, 0, 0, 0, 0, 'The Dark Iron Dwarves', 'The Dark Iron dwarves broke from their kin in the War of the Three Hammers, lost, and fled south under their sorcerer-thane Thaurissan. His summoning of the Firelord Ragnaros buried their capital beneath Blackrock Mountain, and they have served the Firelord ever since, striking at Ironforge whenever its soldiers are away.', 'Learned where the dwarves of the dark fight their kin.', 'Wetlands 1100, 1109, 1110, 1122, 1128; Burning Steppes, Searing Gorge (Blackrock Mountain); Gnomeregan 72104, 72106'),
(90000011, 4, 0, 0, 0, 0, 'The Dragonmaw Clan', 'The Dragonmaw are the orc clan that tamed the red dragonflight in the Second War, holding its queen captive in Grim Batol and riding her children into battle. When the dragons broke free they turned on their masters and all but destroyed the clan. The survivors fled into the eastern hills of the Wetlands, and there they have grown strong again.', 'Learned in the hills where the dragon riders hide.', 'Wetlands 1100, 1114, 1118, 1119, 1121, 1127; Shadowmoon 352021, 352030, 352031'),
(90000012, 4, 0, 0, 0, 0, 'The Explorers'' League', 'The Explorers'' League is the dwarves'' society of archaeologists, founded with King Magni''s blessing to dig up the past. Its great ambition is to prove that the dwarves were not born but made, shaped by the titans from the stone-skinned earthen of old, and its digs reach from Khaz Modan to the farthest corners of the world.', 'Learned among the dwarves who dig for their own beginnings.', 'Ironforge 153700, 153705, 153706, 153707, 153714; Loch Modan 3804, 3812, 3824; Wetlands 1113; Darkshore 14814, 14822, 14827; Silithus 137712; Howling Fjord 49512, 49513; Grizzly Hills 39432'),
(90000013, 4, 0, 0, 0, 0, 'The Troggs', 'Troggs are brutish, stone-skinned creatures who come boiling up from caverns deep below whenever the dwarves dig too far. In Dun Morogh they burst out of the Gol''Bolar Quarry and seized the Coldridge tunnel, in Loch Modan they swarm from Stonesplinter Valley, and it was a tide of troggs from below that drove the gnomes to the purge that ruined Gnomeregan.', 'Learned where the deep places spill into the light.', 'Dun Morogh 100, 103, 113, 115, 131; Loch Modan 3802, 3812, 3823'),
(90000014, 4, 0, 0, 0, 0, 'The Gnomes of Gnomeregan', 'The gnomes are a small, brilliant people of inventors and engineers, long the allies of Ironforge, whose city of Gnomeregan was the wonder of Khaz Modan until it was lost. Now they live as exiles in Ironforge''s Tinker Town, and nearly every one of them carries some piece of the catastrophe, from research left behind to friends turned into mindless lepers.', 'Learned from the exiles of a poisoned city.', 'Dun Morogh 106, 113, 125, 127, 134; Ironforge 153703, 153708, 153713'),
(90000015, 4, 0, 0, 0, 0, 'The Defias Brotherhood', 'The Defias Brotherhood is a gang of thieves in red masks that has taken Westfall from its farmers and spread into Elwynn, Redridge and Duskwood. It is better organized than any gang has a right to be, with camps from Northshire to the Westfall coast and Riverpaw gnolls in its pay. Who leads it, and where it hides, the People''s Militia means to find out.', 'Learned from the thieves in red masks.', 'Elwynn 1200, 1204, 1206, 1209, 1216, 1217, 1222, 1229 (quests 123, 147); Westfall 4000, 4013, 4017, 4024; Stormwind 151912 (quests 373-434); warcraft.wiki.gg Defias Brotherhood (pre-Cataclysm)'),
(90000016, 4, 0, 0, 0, 0, 'The Church of the Holy Light', 'The Church of the Holy Light is the faith of the human kingdoms, led by its archbishop from the Cathedral of Light in Stormwind. Its clerics came south from Lordaeron long ago to found Northshire Abbey, and after the First War Archbishop Alonsus Faol gathered priests and paladins there into the Brotherhood of Northshire. Faol also raised the money to rebuild Stormwind, and his pupil Benedictus now leads the Church in his place.', 'Learned where the priests of the Light keep their abbey.', 'Elwynn 1202; Stormwind 151900, 151907; warcraft.wiki.gg Northshire Abbey, Alonsus Faol'),
(90000017, 4, 0, 0, 0, 0, 'The Blackrock Clan', 'The Blackrock clan is one of the great clans of the old Horde, the clan of Blackhand, who led the orcs in the First War. After the Second War its survivors held out in Blackrock Mountain rather than go to the internment camps, and they have never joined Thrall''s new Horde. From the Burning Steppes they now pour over the mountains into Redridge, and with a warlock''s magic to help them they have taken Stonewatch Keep.', 'Learned from the orcs who came over the mountains from the Burning Steppes.', 'Redridge 4400, 4407, 4410, 4417, 4423; warcraft.wiki.gg Blackrock clan (pre-Cataclysm)'),
(90000018, 4, 0, 0, 0, 0, 'The Gnolls', 'Gnolls are hyena-like brutes who live and hunt in packs, and the human lands are full of their clans: the Riverpaw of Elwynn and Westfall, the Redridge gnolls of the hills above Lakeshire, the Shadowhide of Galardell Valley and more. Fierce but seldom their own masters, the clans are often found serving stronger ones, from the Defias Brotherhood to the warlock Morganth.', 'Learned from the packs that raid the farms and roads.', 'Elwynn 1211, 1221, 1232; Westfall 4000, 4007; Redridge 4405, 4411, 4419, 4425; warcraft.wiki.gg Gnoll, Riverpaw, Shadowhide clan; Feralas 35705, 35736'),
(90000019, 4, 0, 0, 0, 0, 'The Night Watch', 'The Night Watch is the militia Darkshire raised from its own people when Stormwind recalled its guards from Duskwood. Under Commander Althea Ebonlocke it has never had enough watchers: she warns every traveler to keep to the roads and move only by day, and sends volunteers against the dead of the cemeteries. Darkshire''s anger at the capital runs deep, and Lord Ello Ebonlocke says openly that the Watch alone cannot protect the town forever.', 'Learned in the town that guards itself through the endless night.', 'Duskwood 1000, 1016, 1017, 1026; Redridge 4422 (quest 146)'),
(90000020, 4, 0, 0, 0, 0, 'The Worgen', 'The worgen are wolf-men of terrible ferocity. In Silverpine they came at the call of the archmage Arugal. In Duskwood they appeared as if from thin air, overrunning Brightwood Grove and the Rotting Orchard, and every time the hunters thin their packs, more spring up to refill them. What draws them to these woods, no one in Darkshire can say.', 'Learned from the wolf-men of the darkened forests.', 'Duskwood 1010, 1011, 1020, 1021, 1028; creature_text 3946 (Velinde Starsong); page_text 185-190 (Jitters'' Completed Journal); Ashenvale 33114; Grizzly Hills 39405, 39417, 39418, 39427'),
(90000021, 4, 0, 0, 0, 0, 'The Broken', 'The Broken are draenei of Draenor, twisted in body and mind by the fel magic that ravaged their world. A few crossed the Dark Portal to Azeroth, and the journey drove many of them mad. In the Swamp of Sorrows the sane among them shelter at the Harborage, while their maddened kin, the Lost Ones, hold the Fallow Sanctuary and kill any who wander near.', 'Learned among the exiles of a shattered world.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824; Exodar 355707; warcraft.wiki.gg Broken (pre-Cataclysm); Hellfire 348321, 348341; Zangarmarsh 352103, 352108, 352117, 352120; Nagrand 351802, 351808, 351832'),
(90000022, 4, 0, 0, 0, 0, 'The Green Dragonflight', 'The green dragonflight is the flight of Ysera, the Dreamer, keeper of the Emerald Dream, a realm of the world as it might have been. Its dragons guard the few gateways into the Dream, each beneath a great tree, and they watch over places where old evils sleep. In the Swamp of Sorrows they drowned the temple of the Atal''ai beneath the Pool of Tears, and they stand guard over it still.', 'Learned from the dragons who guard the gateways of the Dream.', 'Swamp of Sorrows 800, 808, 809, 813, 822, 828; Duskwood 1009; warcraft.wiki.gg Green dragonflight; Moonglade 49302, 49316; Dragonblight 6512'),
(90000023, 4, 0, 0, 0, 0, 'The Shadowsworn', 'The Shadowsworn are the cult that holds the Blasted Lands for the demons: warlocks and cultists who have given themselves to the dreadlord the wastes call the Defiler. They keep the Altar of Storms on the western edge, one of the few such altars left in Azeroth, and the caves of the Serpent''s Coil, and the Dreadmaul ogres fight beside them. Three masters lead them: Archmage Allistarj, Lady Sevine and Grol the Destroyer.', 'Learned among the cultists of the red wastes.', 'Blasted Lands 404, 406, 410, 411, 421; warcraft.wiki.gg Shadowsworn, Altar of Storms (Blasted Lands)'),
(90000024, 4, 0, 0, 0, 0, 'The Black Dragonflight', 'The black dragonflight is the flight of Deathwing, the Aspect of the earth who betrayed his kind and was driven from the world. His children still scheme in his absence. Their dragonspawn and drakes swarm the Burning Steppes and the slopes of Blackrock Mountain, their whelps flit through the hills of Redridge, and they hold the upper reaches of Blackrock Spire.', 'Learned from the dragonkin of the burning lands.', 'Burning Steppes 4600, 4604, 4610, 4612, 4613, 4620; quest 6403 (Prestor is Onyxia, twin of Nefarian); warcraft.wiki.gg Black dragonflight (pre-Cataclysm); Dustwallow 1519, 1520; Blade''s Edge 352207, 352212, 352218; Dragonblight 6511'),
(90000025, 4, 0, 0, 0, 0, 'The Thorium Brotherhood', 'The Thorium Brotherhood are Dark Iron smiths who left their clan beneath Blackrock Mountain to explore the world, or to exploit it, as one of them lets slip. From Thorium Point, high above the Cauldron, they keep a close eye on their former kin and trade their mastery of the forge with Alliance and Horde alike. Overseer Oilfist leads them, and he does not forgive desertion.', 'Learned from the dwarves who left the dark depths.', 'Searing Gorge 5101, 5113, 5114, 5117, 5125; warcraft.wiki.gg Thorium Brotherhood'),
(90000026, 4, 0, 0, 0, 0, 'The Ogres', 'Ogres are hulking, brutish giants, some of them two-headed, and most of the ogre clans of the eastern kingdoms came from Draenor with the Horde; the warlock Gul''dan made the first ogre magi of them. Since the old Horde broke, the clans fight for themselves or for whoever pays: the Crushridge of Alterac, the Boulderfist of Arathi, the Dreadmaul of the Blasted Lands, the Firegut of the Burning Steppes, the Dustbelcher of the Badlands and more.', 'Learned from the ogre clans of the eastern kingdoms.', 'Alterac 3605, 3614; Arathi 4500, 4505; Blasted Lands 403; Burning Steppes 4603; Badlands 309-312; Duskwood 1008; warcraft.wiki.gg Ogre (pre-Cataclysm); Feralas 35700, 35704, 35708, 35710, 35737; Dustwallow 1510, 1517; Tanaris 44013, 44014, 44015; Zangarmarsh 352118, 352119; Nagrand 351814, 351815, 351816; Blade''s Edge 352203, 352205, 352214, 352255'),
(90000027, 4, 0, 0, 0, 0, 'The Steamwheedle Cartel', 'The Steamwheedle Cartel is the greatest of the goblin trading companies, and its ports are the neutral ground of the world: Booty Bay in Stranglethorn, and Gadgetzan, Ratchet and Everlook across the sea in Kalimdor. In a Steamwheedle town every race is welcome so long as it brings coin and keeps the peace, and the cartel''s bruisers fall hard on anyone who spills blood there.', 'Learned in the goblin ports where every coin is welcome.', 'Stranglethorn 3317, 3322; npc_text 7965 (servant of the Steamwheedle Cartel); warcraft.wiki.gg Steamwheedle Cartel (pre-Cataclysm); Tanaris 44005, 44033; Dustwallow 1518'),
(90000028, 4, 0, 0, 0, 0, 'The Venture Company', 'The Venture Company is a goblin cartel of miners, loggers and prospectors that strips any land it can reach of its timber, ore and crystal, and leaves no room for honest trade. In Stranglethorn its shredders fell the jungle around Lake Nazferiti while its geologists hunt the blue Singing Crystals found only in the Vale, and the goblins of Booty Bay count it among their enemies.', 'Learned from the goblins who strip the land bare.', 'Stranglethorn 3304, 3311; Mulgore 21509, 21511; Barrens 1709, 1741, 1742; warcraft.wiki.gg Venture Company (pre-Cataclysm); Stonetalon 40610, 40611, 40628'),
(90000029, 4, 0, 0, 0, 0, 'The Wildhammer Clan', 'The Wildhammers are the dwarves of the open sky, one of the three clans of old Khaz Modan. After the War of the Three Hammers they held Grim Batol until the Dark Irons'' curse drove them out, and rather than live under Ironforge they built Aerie Peak in the Hinterlands, where they bonded with the gryphons of the crags. They fight beside the Alliance as they see fit, but call themselves no part of it.', 'Learned among the gryphon riders of the high crags.', 'Hinterlands 4700, 4701, 4702, 4717; page_text 1914-1931 (War of the Three Hammers); warcraft.wiki.gg Wildhammer clan (pre-Cataclysm)'),
(90000030, 4, 0, 0, 0, 0, 'The Forest Trolls', 'The forest trolls are the heirs of the Amani empire, which once ruled the northern forests of Lordaeron from Zul''Aman and fought the high elves and the humans of Arathor in the Troll Wars. The empire is long broken. Its tribes now hold scattered ruins across the north: the Witherbark of the Hinterlands and the Arathi Highlands, the Vilebranch of Jintha''Alor, who have turned to the blood god Hakkar, and the Revantusk, who keep faith with the Horde.', 'Learned among the tribes of the old Amani empire.', 'Hinterlands 4700, 4706, 4708, 4711, 4713, 4716; Arathi 4513; Eastern Plaguelands 13912; Eversong 343019, 343027, 343034; Ghostlands 343308, 343312, 343327, 343332; warcraft.wiki.gg Amani, Forest troll'),
(90000031, 4, 0, 0, 0, 0, 'The Argent Dawn', 'The Argent Dawn is an order sworn to destroy the Scourge, founded after the Third War by paladins, priests and soldiers who wanted to fight the dead without the blind zeal of the Scarlet Crusade. It takes no side between Horde and Alliance and welcomes both. Lord Maxwell Tyrosus leads it from Light''s Hope Chapel, and its officers pay for every scourgestone brought back from the field.', 'Learned among those who fight the dead whatever banner they fly.', 'Eastern Plaguelands 13909, 13920, 13921; Western Plaguelands 2800, 2801; Tirisfal 8517; warcraft.wiki.gg Argent Dawn (pre-Cataclysm); Zul''Drak 6601, 6608; Icecrown 21019, 21046'),
(90000032, 4, 0, 0, 0, 0, 'The Order of the Silver Hand', 'The Order of the Silver Hand was the first order of paladins, founded in the Second War by Archbishop Alonsus Faol, who chose Uther the Lightbringer to lead it. Its knights fought in every war that followed, until Prince Arthas, once one of them, killed Uther. The order broke apart: many of its paladins joined the Scarlet Crusade, others the Argent Dawn.', 'Learned at the tomb of the first paladin.', 'Western Plaguelands 2803, 2816; Eastern Plaguelands 13918, 13920, 13927; warcraft.wiki.gg Knights of the Silver Hand (pre-Cataclysm)'),
(90000033, 4, 0, 0, 0, 0, 'The Blood Elves', 'The blood elves, the sin''dorei, are what remains of the high elves of Quel''Thalas. When the Scourge destroyed the Sunwell most of their people died, and the survivors took a new name in memory of the fallen. Without the well they hunger for magic, and they feed that hunger on crystals, sanctums and whatever else they can drain.', 'Learned in the golden forests of Quel''Thalas.', 'Eversong 343000, 343020, 343021; Silvermoon 348700, 348703; warcraft.wiki.gg Blood elf (pre-Cataclysm); Hellfire 348317'),
(90000034, 4, 0, 0, 0, 0, 'The Farstriders', 'The Farstriders are the rangers of Quel''Thalas, sworn to defend their people against enemies near and far. Their ranger-general once was Sylvanas Windrunner, and Lor''themar Theron rose through their ranks. For thousands of years they have fought the Amani trolls on the eastern borders, and they fight them still from lodges in Eversong and the Ghostlands, now under Ranger-General Halduron Brightwing.', 'Learned from the rangers who guard the borders of Quel''Thalas.', 'Eversong 343015, 343034; Ghostlands 343307, 343324; Silvermoon 348702, 348704; warcraft.wiki.gg Farstriders (pre-Cataclysm)'),
(90000035, 4, 0, 0, 0, 0, 'The Blood Knights', 'The Blood Knights are the paladins of the sin''dorei, an order conceived by Grand Magister Rommath with Lady Liadrin as its first knight and matriarch. They claim to wield the Light as no other order can, not as a gift but as a power seized, and the other paladins of the world despise them for it. They keep their headquarters in the Hall of Blood in Silvermoon''s Farstriders'' Square.', 'Learned in the Hall of Blood.', 'Silvermoon 348705, 348706, 348707, 348708, 348709, 348710, 348711; warcraft.wiki.gg Blood Knights (pre-Cataclysm)'),
(90000036, 4, 0, 0, 0, 12, 'The Shattered Sun Offensive', 'The Shattered Sun Offensive is the army the Aldor and the Scryers of Shattrath raised together, setting aside their old feud at the naaru''s urging when Prince Kael''thas seized the Isle of Quel''Danas for the Burning Legion. Draenei and blood elves serve side by side under its banner, sworn to win back Sun''s Reach and stop the Legion at the Sunwell.', 'Learned among the soldiers of two rival orders who fight as one.', 'Quel''Danas 408000, 408001, 408010, 408018; warcraft.wiki.gg Shattered Sun Offensive'),
(90000037, 4, 0, 0, 0, 0, 'The Knights of the Ebon Blade', 'The Knights of the Ebon Blade are the death knights who broke from the Lich King at Light''s Hope Chapel. Led by Highlord Darion Mograine, they took the Ebon Hold for their own and swore to destroy their old master. They know themselves for monsters, and seek no atonement but amends paid in his death.', 'Learned from death knights who serve no master.', 'Scarlet Enclave 429800, 429816, 429832, 429833, 429834; Stormwind 151916; warcraft.wiki.gg Knights of the Ebon Blade (pre-Cataclysm); Zul''Drak 6606, 6631; Icecrown 21004, 21005, 21031'),
(90000038, 4, 0, 0, 0, 0, 'The Darkspear Trolls', 'The Darkspear are a tribe of jungle trolls driven from Stranglethorn long ago. Shipwrecked orcs under Thrall freed them from their captors on a storm-swept isle where their chieftain Sen''jin died, and his son Vol''jin pledged the tribe to the Horde. They followed the orcs to Kalimdor and settled the Echo Isles, until their own witch doctor, Zalazane, drove them to the mainland at Sen''jin Village.', 'Learned among the trolls of the Echo Isles.', 'Durotar 1404, 1405, 1421, 1422; Orgrimmar 163706, 163708; warcraft.wiki.gg Darkspear tribe (pre-Cataclysm); Zangarmarsh 352116'),
(90000039, 4, 0, 0, 0, 0, 'The Burning Blade', 'Once a clan of the old Horde, maddened by demon blood, the Burning Blade is now a demon cult hiding among the orcs of the new Horde, who have sworn off the demons that once enslaved them. Its cultists burn their flesh with searing collars to bind themselves to demonic power, and they nest in caves across Durotar, from the Valley of Trials to the doorstep of Orgrimmar.', 'Learned in the caves where cultists burn their own flesh.', 'Durotar 1401, 1402, 1414, 1417, 1424, 1425, 1428; Orgrimmar 163704, 163710, 163713; warcraft.wiki.gg Burning Blade clan (pre-Cataclysm); Desolace 40503, 40512'),
(90000040, 4, 0, 0, 0, 0, 'The Shattered Hand', 'The Shattered Hand is the Horde''s order of spies, assassins and poisoners, whose rogues train in Orgrimmar''s Cleft of Shadow. It calls itself the veil over Kalimdor, its police, judges and executioners, and counts the Deathstalkers of the Undercity as allies. Its loyalty is less certain: its masters speak openly of restoring the Horde''s old glory without the Warchief''s caution.', 'Learned from the rogues of the Cleft of Shadow.', 'Orgrimmar 163712, 163718; Barrens 1742; warcraft.wiki.gg Shattered Hand (pre-Cataclysm)'),
(90000041, 4, 0, 0, 0, 0, 'The Horde', 'The old Horde was the orcs'' army of conquest, bound to the Burning Legion by demon blood. Thrall remade it as a people of honor: orcs freed from the camps and the Darkspear trolls, joined in Kalimdor by the tauren and later by the Forsaken of Lordaeron. Its Warchief rules from Orgrimmar, and it holds a wary peace with the Alliance.', 'Learned in the Warchief''s city.', 'Orgrimmar 163700, 163707; Durotar 1400; warcraft.wiki.gg Horde (pre-Cataclysm)'),
(90000042, 4, 0, 0, 0, 0, 'The Tauren', 'The tauren, who call themselves the Shu''halo, are a people of hunters and shaman who revere the Earthmother. For generations their tribes wandered the plains of Kalimdor, harried by the centaur, until Cairne Bloodhoof and Thrall''s orcs won them Mulgore. Most tribes have gathered at Thunder Bluff under Cairne, and the young earn their place through the Rites of the Earthmother.', 'Learned on the plains of Mulgore.', 'Mulgore 21500, 21526; Thunder Bluff 163800, 163806, 163811, 163820; warcraft.wiki.gg Tauren (pre-Cataclysm)'),
(90000043, 4, 0, 0, 0, 0, 'The Grimtotem', 'The Grimtotem are a tauren tribe who never accepted Cairne Bloodhoof''s rule. Led by the Elder Crone, Magatha Grimtotem, they believe the tauren should be theirs to lead, and many of them have no love for the other races of the Horde. Their matriarch lives on Elder Rise, where Cairne can watch her, while far from the bluff, in Stonetalon, Thousand Needles and Feralas, Grimtotem braves attack every outsider.', 'Learned from the tauren who never bowed to the high chieftain.', 'Thunder Bluff 163800, 163802, 163807; warcraft.wiki.gg Grimtotem tribe (pre-Cataclysm); Stonetalon 40603, 40604, 40634; Thousand Needles 40002, 40016, 40027; Feralas 35707, 35728, 35734; Dustwallow 1508, 1514'),
(90000044, 4, 0, 0, 0, 0, 'The Quilboar', 'The quilboar are a race of boar-men who revere Agamaggan, a boar demigod who fell in the War of the Ancients. Where his blood fell, giant thorns burst from the earth, and the quilboar dig their dens among them; the greatest, the Razorfen, they hold to be his body. Their tribes are bitter rivals, the Razormane and the Bristleback above all, but both make war on the Horde in Durotar, Mulgore and the Barrens.', 'Learned among the giant thorns of the plains.', 'Barrens 1704, 1718, 1720, 1722, 1727, 1740; Durotar 1410; Mulgore 21503; warcraft.wiki.gg Quilboar, Agamaggan (pre-Cataclysm)'),
(90000045, 4, 0, 0, 0, 0, 'The Centaurs', 'The centaurs are the old enemies of the tauren, who harried their tribes across the plains for generations. Their homeland is Desolace, but the Kolkar range widely, camping at the oases of the Barrens and in the crags of Durotar, while the Galak roam the Thousand Needles. Undisciplined and fierce, they cannot focus their rage as the orcs can, but a few among them have the wit to lead.', 'Learned from the tauren''s oldest enemies.', 'Barrens 1707, 1715, 1716, 1738; Durotar 1406; Mulgore 21500; warcraft.wiki.gg Centaur (pre-Cataclysm); Desolace 40508, 40514, 40516, 40517, 40519, 40520, 40527, 40529'),
(90000046, 4, 0, 0, 0, 0, 'The Night Elves', 'The night elves, the kaldorei, are among the oldest peoples of Azeroth. Their ancestors'' abuse of the Well of Eternity drew the Burning Legion into the world, and after the War of the Ancients they turned from arcane magic to the druidism of Cenarius and the worship of Elune, guarding their forests for ten thousand years. Hyjal cost them their immortality, and they now stand with the Alliance, ruled from Darnassus.', 'Learned beneath the boughs of the World Tree.', 'Teldrassil 14100, 14115; Darnassus 165700, 165707; warcraft.wiki.gg Night elf (pre-Cataclysm)'),
(90000047, 4, 0, 0, 0, 0, 'The Sentinels', 'The Sentinels are the army of the night elves, its warriors almost all women. Through the long ages while the druids slept, Tyrande Whisperwind and her priestesses led them in guarding the forests of Kalimdor, and they guard them still, riding the nightsabers the army has long relied upon. On Teldrassil they hold the Oracle Glade and the roads against harpies and maddened furbolgs.', 'Learned from the warriors who guard the night elves'' forests.', 'Darnassus 165701, 165703, 165707, 165713; Teldrassil 14105, 14108, 14124; Ashenvale 33118, 33141; warcraft.wiki.gg Sentinel Army (pre-Cataclysm)'),
(90000048, 4, 0, 0, 0, 0, 'The Cenarion Circle', 'The Cenarion Circle is the order of druids that follows the teachings of the demigod Cenarius, night elves and, of late, tauren as well. Its seat is Moonglade under Keeper Remulos, son of Cenarius, while Arch Druid Fandral Staghelm leads the druids of Darnassus. Some of its druids, the Druids of the Talon and the Claw, sleep in barrow dens with their spirits walking the Emerald Dream.', 'Learned among the druids who walk the Emerald Dream.', 'Darnassus 165701, 165709, 165718; Thunder Bluff 163808; Teldrassil 14109, 14117; Ashenvale 33113; warcraft.wiki.gg Cenarion Circle (pre-Cataclysm); Feralas 35723; Silithus 137705; Felwood 36102; Moonglade 49300, 49301; Zangarmarsh 352101, 352124; Hellfire 348322'),
(90000049, 4, 0, 0, 0, 0, 'The Furbolgs', 'The furbolgs are a bear-like people of Kalimdor''s forests, once peaceful and long friends of the night elves. Something has turned them. On Teldrassil the Gnarlpine tribe has deserted its homes and gone savage, overrunning Starbreeze Village and the sacred barrow of the sleeping druids from their hold in the southwest, and the dryad Tarindrella fears the fel moss is to blame.', 'Learned among the bear-folk of the forests.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127; Azuremyst 352410, 352413; Bloodmyst 352503; Darkshore 14812, 14818, 14828; Ashenvale 33105, 33127, 33132; warcraft.wiki.gg Furbolg (pre-Cataclysm); Felwood 36103, 36116, 36117; Winterspring 61802, 61810, 61827; Azshara 1607, 1608; Grizzly Hills 39410'),
(90000050, 4, 0, 0, 0, 0, 'The Satyrs', 'Satyrs are an old shame of the night elves. The first were Highborne who followed Queen Azshara''s counselor Xavius in the War of the Ancients, and the Burning Legion twisted them into horned, cloven-hoofed demons. Their kind still haunt the forests of Kalimdor; on Teldrassil a satyr lord leads grells from Fel Rock, and another dwells alone at the edge of the Oracle Glade.', 'Learned from the horned demons who haunt the forests.', 'Teldrassil 14106, 14120, 14122, 14125; Bloodmyst 352511, 352512; Ashenvale 33115, 33116, 33137; warcraft.wiki.gg Satyr (pre-Cataclysm); Desolace 40502; Felwood 36104, 36105, 36112; Azshara 1603, 1617'),
(90000051, 4, 0, 0, 0, 0, 'The Draenei', 'The draenei are the eredar who would not serve the Burning Legion. Led by Prophet Velen, they fled their homeworld of Argus and wandered for ages, guided by the naaru, until they settled on a world they named Draenor, where the orcs, corrupted by the Legion, slaughtered them. The survivors seized the Exodar and fled to Azeroth, and they have joined the Alliance.', 'Learned among the exiles who fell from the sky.', 'Exodar 355700, 355705; Azuremyst 352400; Bloodmyst 352519; warcraft.wiki.gg Draenei (pre-Cataclysm)'),
(90000052, 4, 0, 0, 0, 0, 'The Naaru', 'The naaru are beings of living Light who oppose the Burning Legion wherever it goes. They guided the draenei in their flight from Argus, and three of them, A''dal, M''uru and O''ros, brought the fortress of Tempest Keep to the Netherstorm of Outland. When Kael''thas Sunstrider seized the keep and captured M''uru, O''ros hid within the vessel that became the Exodar, and it dwells there still.', 'Learned in the presence of living Light.', 'Exodar 355700, 355706; warcraft.wiki.gg Naaru (pre-Cataclysm); Shattrath 370300, 370301, 370306'),
(90000053, 4, 0, 0, 0, 0, 'The Hand of Argus', 'The Hand of Argus is the military order of the draenei, its vindicators sworn to serve and die without question. On the isles it holds Azure Watch and Blood Watch, where the three vindicators of the Triumvirate command, and its recruits are tested hard, for the draenei learned on Draenor what hesitation costs.', 'Learned from the vindicators who guard the draenei.', 'Bloodmyst 352501, 352505, 352519, 352520, 352529; Azuremyst 352407, 352419; Ashenvale 33121, 33128'),
(90000054, 4, 0, 0, 0, 0, 'The Sunhawks', 'The Sunhawks are the blood elves who fought the draenei aboard the Exodar and survived its crash. They hold the west of Bloodmyst around the Vector Coil, harvest the fallen crystals for their own devices and send scouts across both isles, and their numbers never seem to shrink.', 'Learned from the blood elves who followed the draenei across the stars.', 'Bloodmyst 352500, 352513, 352518, 352522, 352530, 352531; Azuremyst 352405, 352429'),
(90000055, 4, 0, 0, 0, 0, 'The Naga', 'The naga are what became of Queen Azshara''s Highborne who were dragged beneath the sea when the Sundering destroyed the Well of Eternity. Twisted into serpentine forms, they serve their queen from the sunken city of Nazjatar, and they have risen to claim the shores of the world. On the isles the Wrathscale hold old night elf ruins and keep a shrine to Azshara on Bloodcurse Isle.', 'Learned on the shores the serpent-folk have claimed.', 'Azuremyst 352416, 352427; Bloodmyst 352504, 352507, 352533; Darkshore 14804, 14807; Ashenvale 33103; warcraft.wiki.gg Naga (pre-Cataclysm); Desolace 40504, 40505; Feralas 35719, 35720, 35732; Azshara 1605, 1611, 1612; Zangarmarsh 352102, 352110, 352115, 352121; Shadowmoon 352009'),
(90000056, 4, 0, 0, 0, 0, 'The Warsong Clan', 'The Warsong is the clan of Grom Hellscream, the first orc to drink the demon blood of Mannoroth. When Thrall''s Horde came to Kalimdor, the Warsong marched into Ashenvale to cut timber, clashed with the Sentinels and, drinking the blood again, slew the demigod Cenarius. Grom won back his honor in Demon Fall Canyon, killing Mannoroth at the cost of his own life. The clan still logs the forest from Splintertree Post.', 'Learned among the orcs who fell the ancient forest.', 'Ashenvale 33100, 33117, 33120, 33122, 33141; page_text 2077-2078, 2211; quests 8368, 8372 (Silverwing Sentinels and Warsong Outriders); warcraft.wiki.gg Warsong clan (pre-Cataclysm); Borean 353706'),
(90000057, 4, 0, 0, 0, 0, 'The Highborne', 'The Highborne were the sorcerer nobility of Queen Azshara''s empire, whose reckless use of the Well of Eternity drew the Burning Legion into the world. The Sundering destroyed their towns along with the Well. Of those who survived, some were twisted into satyrs or naga, and others, exiled across the sea for their magic, founded Quel''Thalas. In Darkshore their restless dead still walk the ruins.', 'Learned among the ruins of Azshara''s sorcerers.', 'Darkshore 14800, 14805, 14809, 14829; page_text 364-367 (The Lay and The Fall of Ameth''Aran); warcraft.wiki.gg Highborne (pre-Cataclysm); Stonetalon 40621, 40629; Feralas 35703, 35708, 35729; Winterspring 61803, 61804; Azshara 1602'),
(90000058, 4, 0, 0, 0, 0, 'The Cult of the Dark Strand', 'The Cult of the Dark Strand is a band of warlocks gathered in the old elven ruins of Darkshore and Ashenvale, at the Tower of Althalaxx and the Ruins of Ordil''Aran, where its excavators dig among the stones, and satyrs serve in its ranks. Its fanatics and voidcallers guard the tower, and the strongest of them keep to its upper room.', 'Learned among the warlocks who dig in the old elven ruins.', 'Darkshore 14806, 14820, 14831; Ashenvale 33102, 33108, 33116, 33133, 33136; page_text 361, 443-444; warcraft.wiki.gg Cult of the Dark Strand (pre-Cataclysm)'),
(90000059, 4, 0, 0, 0, 0, 'The Silithid', 'The silithid are insects that swarm from hives deep beneath the earth of southern Kalimdor. Some think them a mindless nuisance; those who know them better call them an ancient threat. In Thousand Needles dwarves of the Explorers'' League dug into a hive beneath the Rustmaul site, and the swarm that broke out nearly destroyed the Horde war party that had just slain them.', 'Learned where the insect swarms break out of the earth.', 'Thousand Needles 40013, 40014; Feralas 35706, 35736; warcraft.wiki.gg Silithid (pre-Cataclysm); Tanaris 44012, 44016, 44030; Un''Goro 49007; Silithus 137704, 137710, 137711'),
(90000060, 4, 0, 0, 0, 0, 'The Bronze Dragonflight', 'The bronze dragonflight is the flight of Nozdormu, the Timeless One, the Aspect charged by the titans with guarding the flow of time. From the Caverns of Time in Tanaris his dragons watch over history and bar any who would meddle with it. Nozdormu himself never meddles in mortal affairs; he only corrects what others alter.', 'Learned from the guardians of time.', 'Tanaris 44007, 44028, 44037; Teldrassil 14100; warcraft.wiki.gg Bronze dragonflight (pre-Cataclysm); Silithus 137717, 137728; Storm Peaks 6737'),
(90000061, 4, 0, 0, 0, 0, 'The Qiraji', 'The qiraji are the masters of the silithid, an empire of insect-folk whose fortress city of Ahn''Qiraj lies in southern Silithus. Nearly a thousand years ago they poured out of it to sweep across Kalimdor, until they were sealed behind the Scarab Wall. Crystals carved with their glyphs stand in every hive of the desert.', 'Learned before the sealed gates of the insect city.', 'Silithus 137700, 137714, 137715, 137724, 137725; warcraft.wiki.gg Qiraji (pre-Cataclysm)'),
(90000062, 4, 0, 0, 0, 0, 'The Shadow Council', 'The Shadow Council is the secret cabal of warlocks that bound the orcs to the Burning Legion on Draenor, led by Gul''dan, and it claims credit for much of the orcish people''s suffering. It outlived the old Horde. Its seat on Azeroth is Jaedenar in Felwood, a ruin named in worship of Kil''jaeden, where it still plots with the Legion.', 'Learned in the ruin named for the Deceiver.', 'Felwood 36108, 36109, 36128, 36129; warcraft.wiki.gg Shadow Council (pre-Cataclysm); Terokkar 351909, 351937; Nagrand 351813'),
(90000063, 4, 0, 0, 0, 0, 'The Blue Dragonflight', 'The blue dragonflight is the flight of Malygos, the Spell-Weaver, the Aspect charged by the titans with guarding magic. Its dragons are said to watch over the arcane wherever it gathers; in Kalimdor they lair in the ice of Mazthoril in Winterspring, and Azuregos roams the ruins of Azshara.', 'Learned from the dragons of the frozen caverns.', 'Winterspring 61808, 61817; warcraft.wiki.gg Blue dragonflight (pre-Cataclysm); Azshara 1609, 1619; Borean 353712, 353723'),
(90000064, 4, 0, 0, 0, 8, 'The Fel Horde', 'A new Fel Horde of red-skinned orcs pours out of Hellfire Citadel under Kargath Bladefist, its self-styled warchief: the old clans of the Shattered Hand, the Bleeding Hollow and the Bonechewer, larger, meaner and more cunning than the orcs the Sons of Lothar remember, and bound to the demons by their blood. How so many have come to be is a secret the citadel still keeps.', 'Learned from the red-skinned orcs of the citadel.', 'Hellfire 348305, 348306, 348308, 348335; warcraft.wiki.gg Fel Horde (pre-Cataclysm); Terokkar 351908, 351936'),
(90000065, 4, 0, 0, 0, 0, 'The Burning Legion', 'The Burning Legion is the demon army of the fallen titan Sargeras, led by the eredar lords Kil''jaeden and Archimonde. Twice it has invaded Azeroth: in the War of the Ancients, when the Highborne drew it through the Well of Eternity, and in the Third War, when Archimonde fell at Mount Hyjal. Its remnants still haunt the forests and wastes of Kalimdor, and it means to return.', 'Learned where the demons still linger.', 'Hellfire 348300, 348312-348314, 348326; Ashenvale 33122; Desolace 40512; Winterspring 61815; warcraft.wiki.gg Burning Legion (pre-Cataclysm); Nagrand 351817; Blade''s Edge 352210, 352217, 352223'),
(90000066, 4, 0, 0, 0, 8, 'The Mag''har', 'The Mag''har, the uncorrupted, are orcs of Draenor who never drank the demon''s blood and kept their brown skin and their old ways. They survived the ruin of their world in hiding, and their camp in Hellfire Peninsula stays hidden from the fel orcs who would destroy it.', 'Learned among the orcs who never drank the blood.', 'Hellfire 348318, 348329, 348337; warcraft.wiki.gg Mag''har (pre-Cataclysm); Nagrand 351801, 351822'),
(90000067, 4, 0, 0, 0, 8, 'The Arakkoa', 'The arakkoa are a bird-like people of Outland, as clever as any gnome and quick to dark magic. In Terokkar their veils answer to Skettis, the hidden city of their ancient king Terokk, whose talonpriests watch the colonies through enchanted orbs; their warriors raid the roads and escape through summoning circles. In Hellfire the Haal''eshi raid Alliance caravans with lightning magic.', 'Learned among the veils of the bird-folk.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934; Hellfire 348320; Shattrath 370313; warcraft.wiki.gg Arakkoa (pre-Cataclysm); Blade''s Edge 352202, 352208, 352219, 352220, 352257; Shadowmoon 352006, 352041'),
(90000068, 4, 0, 0, 0, 8, 'The Aldor', 'The Aldor are the draenei priesthood that kept its rites among the ruins of Shattrath until the naaru came, and it was they who named the naaru Sha''tar, born from light. From Aldor Rise, the highest tier of the city, and its Shrine of Unending Light, High Priestess Ishanah leads them, while Adyen the Lightwarden protects the priesthood and hunts the enemies of the Light. Many of their priests died at the hands of the magisters who became the Scryers.', 'Learned on the heights of the draenei priests.', 'Shattrath 370300, 370304, 370308, 370310, 370317; Shadowmoon 352013'),
(90000069, 4, 0, 0, 0, 8, 'The Scryers', 'The Scryers are blood elves who abandoned Kael''thas for the naaru. Their leader, Voren''thal the Seer, once a close advisor of the prince, led the regiment sent to destroy Shattrath; on the bridge before the Terrace of Light his soldiers laid down their arms, and he knelt before A''dal, saying he had seen the naaru in a vision. From Scryer''s Tier and its Seer''s Library they war with Kael''s armies on sight.', 'Learned among the blood elves who knelt to the naaru.', 'Shattrath 370300, 370305, 370309, 370311, 370318; Shadowmoon 352018'),
(90000070, 4, 0, 0, 0, 0, 'The Earthen Ring', 'The Earthen Ring is an order of shaman sworn to keep the balance of the elements and to heed the spirits of earth, air, fire and water. Its shaman go wherever the elements are in turmoil, and at Zoram''gar in Ashenvale one of them reads the waves and watches the depths of Blackfathom, fearing what the Twilight''s Hammer means to do there.', 'Learned from the shaman who keep the balance of the elements.', 'Ashenvale 33131; Nagrand 351805, 351835, 351836; warcraft.wiki.gg Earthen Ring (pre-Cataclysm)'),
(90000071, 4, 0, 0, 0, 8, 'The Ethereals', 'The ethereals are wanderers from another world, beings of energy who wrap themselves in bandages to keep their shape. On Outland most of them trade: the Consortium buys, sells and smuggles anything of value under its nexus-princes, and covets even the diamond mountain of Nagrand. Others are rivals or worse, such as the rogue Razaani and the Ethereum, who keep great prisons in the mountains of Blade''s Edge.', 'Learned from the bandaged traders of the nether.', 'Nagrand 351812; Blade''s Edge 352211, 352224, 352254, 352259; Terokkar 351917; warcraft.wiki.gg Ethereal (pre-Cataclysm); Netherstorm 352329, 352332'),
(90000072, 4, 0, 0, 0, 8, 'The Gronn', 'The gronn are giants of Draenor, the ancient masters of its ogres, worshipped as gods by the clans of Blade''s Edge. The greatest is Gruul the Dragonkiller, who led gronn and ogres against Deathwing''s black dragons and impaled them on the spires, and whose seven sons enforce his will across the mountains and as far as Nagrand, where Durn the Hungerer hunts the fields around Oshu''gun.', 'Learned in the valleys where the dragons were slain.', 'Blade''s Edge 352212, 352233, 352234, 352251; Nagrand 351816, 351830, 351831; warcraft.wiki.gg Gronn (pre-Cataclysm)'),
(90000073, 4, 0, 0, 0, 8, 'The Netherwing', 'The Netherwing are a young dragonflight born of black dragon eggs that were steeped in raw nether energy when Draenor was torn apart: they have the black flight''s ferocity, yet are something entirely new. Their patron, Neltharaku, flies high above Shadowmoon, while the Dragonmaw orcs capture and torture his children into carrying riders, and his mate lies chained atop their fortress.', 'Learned beneath the wheeling nether drakes.', 'Shadowmoon 352017, 352021, 352022, 352030, 352039; Blade''s Edge 352207; Netherstorm 352324; warcraft.wiki.gg Netherwing (pre-Cataclysm)'),
(90000074, 4, 0, 0, 0, 13, 'The Tuskarr', 'The tuskarr are a walrus-like people of Northrend''s coasts, peaceful fishers and whalers who live mostly from the sea and honor spirits such as Tayutka and Issliruk, the silver eagle of war. Their villages line the shores from the Borean Tundra to the Isle of Spears, and now the Kvaldir, giant raiders out of the mist, and pirate slavers fall upon them.', 'Learned in the fishing villages of the frozen coasts.', 'Borean 353704, 353705, 353721; Howling Fjord 49520, 49528, 49534; warcraft.wiki.gg Tuskarr'),
(90000075, 4, 0, 0, 0, 13, 'The Taunka', 'The taunka are a people of winter, kin to the tauren but sturdier and shaggier, and among them trust is earned, not given. Their villages of Taunka''le in the Borean Tundra and Camp Winterhoof in the Howling Fjord are being abandoned as the Scourge and the vrykul close in, their people going north to Icemist, their capital in the Dragonblight, and they have struck up relations with the Horde.', 'Learned among the winter kin of the tauren.', 'Borean 353716, 353727; Howling Fjord 49517, 49526; warcraft.wiki.gg Taunka; Dragonblight 6501, 6508, 6529; Grizzly Hills 39413'),
(90000076, 4, 0, 0, 0, 13, 'The Vrykul', 'The vrykul are giants of Northrend, of whom there had been no sign for centuries, now woken in great numbers: fearless warriors who yearn for death in battle and ride proto-drakes. The Dragonflayer make war from Utgarde Keep, the Winterskorn hold Skorn and Baleheim, and the Kvaldir, raiders of the mist, prey on the coasts. The Scourge walks among them, and some have cast their lot with the Lich King.', 'Learned from the giants who woke in the fjords.', 'Howling Fjord 49500, 49503, 49507, 49515, 49516; Borean 353703, 353707; warcraft.wiki.gg Vrykul; Zul''Drak 6605; Storm Peaks 6703, 6704'),
(90000077, 4, 0, 0, 0, 13, 'The Iron Dwarves', 'Dwarves of living iron have appeared in Northrend. In the Howling Fjord they rune stone giants into weapons at Giants'' Run and have driven the Explorers'' League from its digs on the eastern bluffs, burying the relics there rather than digging them up, as though no one must ever find what lies below.', 'Learned where the iron dwarves bury what was dug up.', 'Howling Fjord 49535; warcraft.wiki.gg Iron dwarf; Grizzly Hills 39415, 39416, 39431; Storm Peaks 6709, 6710, 6744'),
(90000078, 4, 0, 0, 0, 13, 'The Wyrmrest Accord', 'The Wyrmrest Accord is the council of the dragonflights at Wyrmrest Temple in the Dragonblight, led by Alexstrasza the Life-Binder. Red, green, bronze and even black dragons meet there in peace among the bones of their ancestors, though Malygos''s blue flight has turned on the temple, and each flight''s sacred shrine in the valley is now beset.', 'Learned at the temple where the dragons meet.', 'Dragonblight 6509, 6510-6513, 6523; warcraft.wiki.gg Wyrmrest Accord'),
(90000079, 4, 0, 0, 0, 13, 'The Red Dragonflight', 'The red dragonflight is the flight of Alexstrasza the Life-Binder, the Aspect charged by the titans with guarding all living things. For years the Dragonmaw held her captive in Grim Batol and enslaved her young, until she was freed; her consort Korialstrasz walked among the mages of Dalaran as Krasus. In the Dragonblight the Scourge has overrun its Ruby Dragonshrine.', 'Learned among the dragons who guard all life.', 'Dragonblight 6509, 6510, 6523, 6524; warcraft.wiki.gg Red dragonflight'),
(90000080, 4, 0, 0, 0, 13, 'The Nerubians', 'The Nerubians are a spider-like people whose kingdom of Azjol-Nerub lies beneath the ice of Northrend. They fought the Lich King when he came, and lost; their dead rose as the Anub''ar, the undead Nerubians who now tunnel beneath the camps of the living and razed the taunka capital of Icemist. In the depths a remnant still fights on against total annihilation.', 'Learned in the tunnels of the spider kingdom.', 'Dragonblight 6507, 6526; Borean 353715; warcraft.wiki.gg Nerubian'),
(90000081, 4, 0, 0, 0, 13, 'The Drakkari', 'The Drakkari are the ice trolls of Northrend, whose empire once ruled from Zul''Drak. Now they are dying: in the Grizzly Hills the Scourge spreads disease through their ziggurats and raises their dead, bounty hunters sell them alive to the armies, and even the spirits of their ancestors find no rest.', 'Learned among the dying ice trolls.', 'Grizzly Hills 39406, 39407, 39414, 39429, 39430; warcraft.wiki.gg Drakkari; Zul''Drak 6600, 6609, 6617, 6630'),
(90000082, 4, 0, 0, 0, 13, 'The Zandalari', 'The Zandalari are an ancient tribe of troll priests and scholars from the isle of Zandalar, honored by the other troll nations. In Zul''Drak they have come to defend the gods the Drakkari are slaying, holding a refuge at Zim''Torga, and they warn that the power the Drakkari win by killing their gods is fleeting and will be lost to them for all eternity.', 'Learned among the troll priests who came to save the gods.', 'Zul''Drak 6615, 6625, 6629; warcraft.wiki.gg Zandalari (Wrath)'),
(90000083, 4, 0, 0, 0, 13, 'The Wolvar', 'The wolvar are wolf-like hunters of Northrend who live in tribes. The Rageclaw of Zul''Drak lived beside the Drakkari as allies for thousands of years until the trolls turned on them; the Snowfall Glade tribe raids the tuskarr of the Dragonblight; and the Frenzyheart, newcomers to Sholazar Basin, mean to take it from the gorlocs.', 'Learned among the wolf-folk of the north.', 'Sholazar 371106, 371121, 371122; Zul''Drak 6601, 6602; Dragonblight 6502; warcraft.wiki.gg Wolvar'),
(90000084, 4, 0, 0, 0, 13, 'The Oracles', 'The Oracles are the gorlocs of Sholazar Basin, a gentle, chattering people who call outsiders dryskins and believe the Great Ones made them. They tend the stone shrines they think the Great Ones left behind, rain, mist, lightning and moss, feeding them with shinies dug from the earth, and the wolvar of the Frenzyheart war on them for the land.', 'Learned among the gorlocs who tend the great stones.', 'Sholazar 371107, 371108, 371109, 371113, 371123-371125; warcraft.wiki.gg Oracles'),
(90000085, 4, 0, 0, 0, 13, 'The Sons of Hodir', 'The Sons of Hodir are the frost giants of Dun Niffelem in the Storm Peaks, who look to the keeper Hodir for protection and guidance and treasure everfrost, ice that never melts, as the symbol of their people''s heart. Once allies of Thorim, they have nursed a hatred of the Stormlord since a dark day at Thunderfall, and they war with the Hyldnir of Brunnhildar. Outsiders earn their regard slowly, by deeds.', 'Learned among the frost giants of the peaks.', 'Storm Peaks 6713, 6733, 6743; warcraft.wiki.gg Sons of Hodir'),
(90000086, 4, 0, 0, 0, 13, 'The Earthen', 'The earthen are dwarves of living stone, shaped by the titans to build and tend their works. Loken expelled those of Ulduar, and since then the weakest have died and the strongest craftsmen have been reborn as warriors, holding out at Bouldercrag''s Refuge and on the Terrace of the Makers against the iron dwarves. In the Grizzly Hills earthen and stone giants besiege the iron dwarves at Thor Modan.', 'Learned among the stone-born exiles of Ulduar.', 'Storm Peaks 6709, 6717, 6734; Grizzly Hills 39412; warcraft.wiki.gg Earthen'),
(90000087, 4, 0, 0, 1, 13, 'The Silver Covenant', 'The Silver Covenant is the order of high elves who rejected the admission of blood elves into the Kirin Tor, gathered by Ranger General Vereesa Windrunner and joined to the Alliance in Northrend. In Dalaran they keep the Silver Enclave, whose guardian mages teleport out any member of the Horde who tries to enter, and in Crystalsong Forest they hold Windrunner''s Overlook, facing the Sunreavers across the ruins.', 'Learned among the high elves who stood apart.', 'Dalaran 439507, 439521; Crystalsong 281707; warcraft.wiki.gg Silver Covenant'),
(90000088, 4, 0, 0, 2, 13, 'The Sunreavers', 'The Sunreavers are the blood elves who follow Archmage Aethas Sunreaver, through whose efforts the Horde was accepted into Dalaran at all. They keep Sunreaver''s Sanctuary, whose guardian mages teleport away any member of the Alliance who strays inside, and in Crystalsong Forest they hold Sunreaver''s Command, facing the Silver Covenant across the ruins.', 'Learned among the blood elves of the Kirin Tor.', 'Dalaran 439508, 439522; Crystalsong 281708; warcraft.wiki.gg Sunreavers'),
(90000089, 4, 0, 0, 0, 8, 'The Infinite Dragonflight', 'The Infinite Dragonflight is a new flight of dragons that even the bronze flight cannot account for: no one knows where it came from or why it strikes at the timeways. Its agents slip into moments of history to unmake them, and the changes they seek would end the world as it is.', 'Learned in the timeways of the Caverns of Time.', 'Caverns of Time quests 10282, 10296; creature_text 17879, 17880, 17881, 18096; creature_text 26532');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(90000001, 1, 0, 255, 'Their founder is Aliden Perenolde, the traitor king''s son. He served Aedelas Blackmoore at Durnholde before he turned his back on the camps and claimed his father''s mountains for himself.', 'Alterac 3600, 3601, 3607, 3613, 3616, 3617 and Hillsbrad 26727 (quests 505-537), Arathi 4502, 4505, 4518'),
(90000001, 2, 0, 255, 'They are not as free as they think. Letters taken from their camps point to a hidden patron, the Argus Wake, guiding them from the shadows on behalf of someone none of them has seen.', 'Alterac 3600, 3601, 3607, 3613, 3616, 3617 and Hillsbrad 26727 (quests 505-537), Arathi 4502, 4505, 4518'),
(90000001, 3, 0, 255, 'In the Arathi Highlands they hold much of ruined Stromgarde, where Lord Falconcrest commands them from the keep itself, and their camps reach as far as Northfold Manor.', 'Alterac 3600, 3601, 3607, 3613, 3616, 3617 and Hillsbrad 26727 (quests 505-537), Arathi 4502, 4505, 4518'),
(90000001, 4, 0, 255, 'They have friends even in the Undercity: a merchant beside the Apothecarium was caught keeping a ledger of his sales to the fallen lords of Alterac.', 'Alterac 3600, 3601, 3607, 3613, 3616, 3617 and Hillsbrad 26727 (quests 505-537), Arathi 4502, 4505, 4518'),
(90000002, 1, 0, 255, 'Its oldest quarrel is with the Syndicate, the outlaw nobles who claim the same mountains. To the League they are amateurs with titles, short on skill and long on numbers, too many to kill, so Ravenholdt shames them instead: steal a man''s emblem, and his own people deal with him.', 'Alterac 3611, 3618'),
(90000003, 1, 8, 255, 'Long ago the Kirin Tor set an order, the Violet Eye, to watch over Medivh and his tower of Karazhan in case his power got out of hand, as it soon did.', 'Alterac 3610, 3619, 3620'),
(90000003, 2, 13, 255, 'With their city whole again, the Kirin Tor lifted it into the skies of Northrend to stand against the Lich King.', ''),
(90000003, 3, 8, 255, 'In Netherstorm the Kirin Tor of the Alliance expedition founded Kirin''Var, which held twenty years until Kael''thas, once of the Kirin Tor himself, leveled it.', 'Alterac 3610, 3619, 3620'),
(90000003, 4, 13, 255, 'Mages across Azeroth are being abducted, and from Amber Ledge in the Borean Tundra the Kirin Tor of Dalaran hunt the mage hunters who take them.', 'Alterac 3610, 3619, 3620'),
(90000003, 5, 13, 255, 'Faced with the blue dragonflight and the Scourge, the Kirin Tor lifted Dalaran from Lordamere Lake and carried it to Northrend, where it floats above Crystalsong Forest under Rhonin.', 'Alterac 3610, 3619, 3620'),
(90000004, 1, 0, 255, 'In Tarren Mill the work has already gone past animals: a plague brewed there was poured into a stolen keg and left with the captured farmers.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 2, 0, 255, 'Southshore has its first proof. Papers stolen at Go''Shek Farm in the Arathi Highlands show a Forsaken apothecary at work on deadly experiments there, his findings likely bound for Tarren Mill.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 3, 0, 255, 'In Brill the brews have claimed their first victims: a Scarlet zealot twisted into a ghoul by a laced pumpkin, and a captured dwarf who raised a defiant toast to his captors and fell dead.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 4, 0, 255, 'Whatever its apothecaries learn, in Brill, Silverpine or Tarren Mill, flows to Master Apothecary Faranell in the Apothecarium, who delights in every grisly reagent that brings the New Plague closer.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 5, 13, 255, 'At the Wrathgate in Northrend the New Plague was loosed on Alliance and Horde alike by the Society''s own Grand Apothecary, Putress.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 6, 13, 255, 'Orcs of the Kor''kron, the Warchief''s own guard, now stand over the apothecaries in the Apothecarium itself, and nothing is brewed without their leave.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000004, 7, 13, 255, 'In Northrend the Society works at Vengeance Landing and New Agamand on a plague meant to devour all flesh, living, dead or undead.', 'Hillsbrad 26715, 26723, 26724 (quests 496-524, 658-661)'),
(90000005, 1, 0, 255, 'The Dark Lady''s eyes and knives are the Deathstalkers, her elite agents, who go wherever a secret must be kept or a traitor found.', 'Tirisfal 8500, 8501, 8520'),
(90000005, 2, 13, 255, 'Kor''kron orcs, the Warchief''s own guard, now walk the Undercity''s halls and stand over the apothecaries, for the Horde keeps a closer watch on the Forsaken than ever.', 'Tirisfal 8500, 8501, 8520'),
(90000005, 3, 0, 255, 'Sylvanas was born in Quel''Thalas, and she has sent Forsaken soldiers to fight beside the blood elves against the Scourge in the Ghostlands, an alliance that opened the Horde to them.', 'Tirisfal 8500, 8501, 8520'),
(90000005, 4, 0, 255, 'In Ashenvale they defile night elf ground: their seekers prowl the ruins of Bathran''s Haunt, and beside the Dor''Danil Barrow Den they brew diseases in bottles.', 'Tirisfal 8500, 8501, 8520'),
(90000006, 1, 0, 255, 'Not all its servants are mindless. Thule Ravenclaw, once a mage of Dalaran, chose the Scourge of his own will, and in Silverpine he leads gnolls and undead of his own making.', 'Tirisfal 8500, 8507, 8509, 8532'),
(90000006, 2, 0, 255, 'Its heart is the Plaguelands. There the lich Kel''Thuzad commands in the Lich King''s name, Baron Rivendare holds Stratholme, and the Cult of the Damned keeps living servants at its work.', 'Tirisfal 8500, 8507, 8509, 8532'),
(90000006, 3, 13, 255, 'In Northrend the Scourge holds the land in force: undead Nerubians tunnel beneath the camps of the living, and the San''layn, the blood princes, command its cities.', 'Tirisfal 8500, 8507, 8509, 8532'),
(90000007, 1, 0, 255, 'Papers taken from a Scarlet messenger show how the Crusade holds the glades: a Tirisfal Regional Command answering to the Highlord through three captains, Perrine, Vachon and Melrache.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000007, 2, 0, 255, 'In the Western Plaguelands the Crusade holds Hearthglen, the old seat of those lands, under Highlord Taelan Fordring, and cuts down anyone who will not follow it.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000007, 3, 0, 255, 'Its stronghold in the east is Tyr''s Hand, and its command sits in the Scarlet Bastion of Stratholme under the Grand Crusader, walled in among the Scourge.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000007, 4, 0, 255, 'When death knights sacked its haven in the Scarlet Enclave, High General Abbendis gave the Scarlet lands up for lost and led the faithful to Northrend as the Scarlet Onslaught.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000007, 5, 0, 255, 'The Crusade reaches even Kalimdor: an emissary at Nijel''s Point, drawn by rumors of undead in Desolace, recruits the worthy and sends them back across the sea to the Scarlet Monastery.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000007, 6, 13, 255, 'Grand Admiral Westwind, who undermined Abbendis and took command of the Onslaught, was the dreadlord Mal''Ganis. Once again the Scarlets had been led by a demon.', 'Tirisfal 8512, 8514, 8515, 8528'),
(90000008, 1, 0, 255, 'Stromgarde can spare no one. When the dwarves of Dun Modr begged Refuge Pointe for soldiers, Captain Nials could offer only her condolences.', 'Arathi 4500, 4505, 4508, 4516, 4517, 4526'),
(90000008, 2, 8, 255, 'Beyond the Dark Portal, Danath Trollbane, nephew of the dead king, has learned of Stromgarde''s fall and swears that if he ever returns to Azeroth, Stromgarde will rise again.', 'Arathi 4500, 4505, 4508, 4516, 4517, 4526'),
(90000009, 1, 0, 255, 'In the Arathi Highlands they revere Myzrael, the princess bound beneath the hills, as their Lady, and they mean to see her rise.', 'Arathi 4524, 4530'),
(90000009, 2, 0, 255, 'In Darkshore they camp at the Master''s Glaive, a great blade that marks where one of the old lords of the earth fell, and share a cave with naga behind Cliffspring Falls.', 'Arathi 4524, 4530'),
(90000009, 3, 0, 255, 'In Silithus the cult camps across the desert and calls up elemental nobles through wind stones, taking orders from them.', 'Arathi 4524, 4530'),
(90000009, 4, 0, 255, 'Behind it stands a darker master, the Abyssal Council, which rules the Twilight''s Hammer through those wind stones, and whose lords meet impostors with fury.', 'Arathi 4524, 4530'),
(90000010, 1, 0, 255, 'In the Wetlands their warlock Balgaras the Foul, who counted himself among the Firelord''s minions, led the campaign that broke the Thandol Span and took Dun Modr.', 'Wetlands 1100, 1109, 1110, 1122, 1128'),
(90000010, 2, 0, 255, 'In Gnomeregan Dark Iron agents hold the last tunnels before Thermaplugg''s court, among machines that leave them be. Who sent them, and what the clan wants in the ruin, none of them will say.', 'Wetlands 1100, 1109, 1110, 1122, 1128'),
(90000010, 3, 0, 255, 'The goblin Kernobee found that the Dark Irons had a hand in making the gnomes'' new rig. For that they beat him nearly to death and threw him to the troggs.', 'Wetlands 1100, 1109, 1110, 1122, 1128'),
(90000010, 4, 0, 255, 'Rings taken from the Dark Irons there bore the seals of Ironforge and Orgrimmar. Nogg wonders whether the gnomes stole Dark Iron golem plans, and whether the clan wants payback.', 'Wetlands 1100, 1109, 1110, 1122, 1128'),
(90000011, 1, 0, 255, 'Their chieftain Nek''rosh, son of the warlock Nekros who held the dragons captive, has sworn revenge on the dragons who killed his father, and has built catapults to besiege Menethil Harbor.', 'Wetlands 1100, 1114, 1118, 1119, 1121, 1127'),
(90000011, 2, 0, 255, 'Nek''rosh fell in his own encampment with his vow unfulfilled, and Menethil hailed it as a blow from which the clan may never recover.', 'Wetlands 1100, 1114, 1118, 1119, 1121, 1127'),
(90000011, 3, 8, 255, 'In Outland the Dragonmaw serve Illidan, and do to the nether drakes of Shadowmoon what they once did to the red dragons of Azeroth; their chieftain Zuluhed once took the Aspect Alexstrasza captive.', 'Wetlands 1100, 1114, 1118, 1119, 1121, 1127'),
(90000012, 1, 0, 255, 'Out of Uldaman came a miniature copy of the Discs of Norgannon, a titan record of how the Creators made the earthen, and High Explorer Magellas hailed it as the find of the century.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000012, 2, 0, 255, 'The discs led the league to the sealed gates of Uldum in Tanaris, but they are only part of a set. Without the Plates of Uldum the gates stay closed, and where the plates lie, no one knows.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000012, 3, 0, 255, 'In Darkshore Prospector Remtravel''s dig turned up evidence of a great society, until golems sprang from the ground and overran it. The prospector, oblivious, kept chiseling.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000012, 4, 0, 255, 'In Silithus Brann Bronzebeard''s expedition searches the silithid hives for lost artifacts, and Brann himself has gone missing again somewhere among them.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000012, 5, 13, 255, 'In the Howling Fjord its digs went badly: most of its people went into Whisper Gulch and came back raving that That Which Must Not Be Named is coming.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000012, 6, 0, 255, 'At Thor Modan the torn journal of Brann Bronzebeard pointed to what he believes is a new titan city: Ulduar nestled in the storm.', 'Ironforge 153700, 153705, 153706, 153707, 153714'),
(90000014, 1, 13, 255, 'At last the exiles are preparing to take their city back, readying mechano-tanks and recruits at Steelgrill''s Depot for an assault on Gnomeregan.', ''),
(90000015, 1, 0, 255, 'The Brotherhood''s Collector, who gathered gold from the Elwynn mines twice a week at the Brackwell farm, wore an engraved ring of the old Stonemasons'' Guild of Stormwind.', 'Elwynn 1200, 1204, 1206, 1209, 1216, 1217, 1222, 1229 (quests 123, 147)'),
(90000015, 2, 0, 255, 'A rogue''s note named the Stonemasons, and Mathias Shaw of SI:7 made the connection: the masons who rebuilt Stormwind, and the guildmaster who led them, Edwin VanCleef.', 'Elwynn 1200, 1204, 1206, 1209, 1216, 1217, 1222, 1229 (quests 123, 147)'),
(90000015, 3, 0, 255, 'In the Dust Plains the Brotherhood holds a tower that receives shipments from Duskwood, guarded by the dead, raised with a poison the Zanzil trolls learned to brew.', 'Elwynn 1200, 1204, 1206, 1209, 1216, 1217, 1222, 1229 (quests 123, 147)'),
(90000015, 4, 0, 255, 'They had a friend at court. Lord Gregor Lescovar met in secret with the assassin Marzon to talk of the Defias, until both were cut down in the keep''s garden.', 'Elwynn 1200, 1204, 1206, 1209, 1216, 1217, 1222, 1229 (quests 123, 147)'),
(90000018, 1, 0, 255, 'Some Riverpaw even carry the Brotherhood''s papers: a schedule for the gold taken from Elwynn''s mines turns up among them, in Hogger''s pack as well.', 'Elwynn 1211, 1221, 1232'),
(90000018, 2, 0, 255, 'In Kalimdor the Palemane gnolls poach and skin the beasts of Mulgore from their den at Palemane Rock, and scorn every tauren attempt to speak with them.', 'Elwynn 1211, 1221, 1232'),
(90000018, 3, 0, 255, 'In Feralas the Woodpaw hold the hills south of Camp Mojache and raid the tauren ever more savagely, almost as if they were desperate.', 'Elwynn 1211, 1221, 1232'),
(90000019, 1, 0, 255, 'The Watch cannot spare anyone. Asked by Lakeshire for men, Lord Ebonlocke wrote back that if it marched, Darkshire would be overrun before its guards reached the forest''s edge.', 'Duskwood 1000, 1016, 1017, 1026'),
(90000020, 1, 0, 255, 'In the mine called Roland''s Doom, where the worgen were first found, the spirit of Velinde Starsong rose: a night elf priestess, granted a scythe by Elune to fight the demons of Felwood. She died there lamenting the worgen running rampant and the Scythe lost.', 'Duskwood 1010, 1011, 1020, 1021, 1028'),
(90000020, 2, 0, 255, 'The Scythe surfaced again in the same mine, dug from the rubble by a Defias digger called Jitters. Then the worgen came, and half the miners fell in minutes. He fled and lost it, and riders out of Deadwind Pass have hunted it since.', 'Duskwood 1010, 1011, 1020, 1021, 1028'),
(90000020, 3, 0, 255, 'In Ashenvale worgen fill the Shrine of Mel''Thandris in the Howling Vale, and the Sentinels do not know why they have come.', 'Duskwood 1010, 1011, 1020, 1021, 1028'),
(90000020, 4, 13, 255, 'In the Grizzly Hills a wolfcult has turned the trappers of Silverbrook and the people of Solstice Village into worgen, and a shade bearing Arugal''s name keeps Shadowfang Tower on Bloodmoon Isle.', 'Duskwood 1010, 1011, 1020, 1021, 1028'),
(90000021, 1, 8, 255, 'Anchorite Avuun believes the fel energies consuming the Lost Ones can be cured, and that the same cure would undo the damage done to all the Broken. Those twisted past saving, he asks only to be granted mercy.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 2, 8, 255, 'The blood elf Cersei Dusksinger of Stonard is testing a curse on them: fel-tainted morsels fed to the Lost Ones'' caged livestock, so that the curse passes to whoever eats them.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 3, 0, 255, 'Among the draenei of the Exodar, Farseer Nobundo, a vindicator twisted into one of the Broken, learned that the elements offer the Broken another path to the Light, and Velen asked him to teach shamanism to all.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 4, 8, 255, 'In Hellfire Peninsula Illidari taskmasters drive the Dreghood tribe to dig through the ruins of Sha''naar, their elders chained in the depths.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 5, 8, 255, 'Wherever a tribe of Broken is enslaved, a freed Dreghood elder says, there is also a traitor who sold his brothers for promises of power, and he confesses he was one.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 6, 8, 255, 'In Zangarmarsh tribes of Lost Ones have taken the naga''s side or turned to worship of animal spirits, while the Kurenai, Broken who wish to rejoin their draenei kin, hold the Orebor Harborage.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000021, 7, 8, 255, 'In Nagrand the Kurenai have reclaimed Telaar, while the Murkblood, servants of the bog lord Musel''ek of Coilfang, sacked the Mag''har village of Sunspring.', 'Swamp of Sorrows 803, 805, 814, 815, 816, 824'),
(90000022, 1, 2, 255, 'Not all of them have kept faith with the Dream. Dragons of the flight, twisted and driven mad by nightmare, have come out of its gateways to spread their madness.', ''),
(90000022, 2, 0, 255, 'One of their own fell to the very evil they guarded against: Eranikus, keeper of the sunken temple, now lies trapped in a nightmare within the Dream.', 'Swamp of Sorrows 800, 808, 809, 813, 822, 828'),
(90000022, 3, 0, 255, 'Drawn into the waking world above Lake Elune''ara and redeemed by Tyrande''s prayers, Eranikus returned to the Dream to fight beside Malfurion.', 'Swamp of Sorrows 800, 808, 809, 813, 822, 828'),
(90000022, 4, 13, 255, 'In the Dragonblight the Emerald Dragonshrine has lost its balance: asked to help against the Scourge, a Ysera gripped by nightmare told its defenders to treat all but green dragons as enemies.', 'Swamp of Sorrows 800, 808, 809, 813, 822, 828'),
(90000023, 1, 0, 255, 'The servants bound at their stones were men of Thrall''s Grasp, whose souls Razelikh tore out and shared among the three.', 'Blasted Lands 404, 406, 410, 411, 421'),
(90000023, 2, 0, 255, 'Each of the three wears a third of an amulet of Razelikh''s making around the neck, the key needed to summon the demon lord.', 'Blasted Lands 404, 406, 410, 411, 421'),
(90000023, 3, 0, 255, 'Razelikh granted them near-limitless power within the wastes, and the amulet keeps them from death there by ordinary means; the price of their immortality is to be bound to the land forever.', 'Blasted Lands 404, 406, 410, 411, 421'),
(90000024, 1, 0, 255, 'Their leaders are Deathwing''s own children: Nefarian, lord of Blackrock Spire, and his twin sister Onyxia, who had been hiding in plain sight at the court of Stormwind as Lady Katrana Prestor.', 'Burning Steppes 4600, 4604, 4610, 4612, 4613, 4620'),
(90000024, 2, 0, 255, 'In Dustwallow Marsh Onyxia broods in her lair in the Wyrmbog, and her brood has spread through the southern fens.', 'Burning Steppes 4600, 4604, 4610, 4612, 4613, 4620'),
(90000024, 3, 8, 255, 'Deathwing''s dragons once nested in Blade''s Edge, until the gronn tore them from the sky; their eggs, washed by nether energy, hatched nether drakes, and a Wyrmcult still worships the survivors.', 'Burning Steppes 4600, 4604, 4610, 4612, 4613, 4620'),
(90000024, 4, 13, 255, 'In the Dragonblight the Cult of the Damned raised the dead of the black flight at the Obsidian Dragonshrine, and a black dragon came to deal with them, disgusted to stoop to the cult.', 'Burning Steppes 4600, 4604, 4610, 4612, 4613, 4620'),
(90000025, 1, 0, 255, 'One of their own, Overseer Maltorius, went over to the Dark Irons to command the Slag Pit crew, a post the Brotherhood suspects he bought with its secret recipe for fiery flux. A bounty hangs on his head.', 'Searing Gorge 5101, 5113, 5114, 5117, 5125'),
(90000025, 2, 0, 255, 'With the plans recovered, Master Smith Burninate sends the Brotherhood''s trusted friends on to Lokhtos Darkbargainer at the Grim Guzzler in Blackrock Depths.', 'Searing Gorge 5101, 5113, 5114, 5117, 5125'),
(90000026, 1, 0, 255, 'In Feralas the Gordunni are the strongest power in the forest, and the land withers wherever they settle; the Gordok hold the grounds of Dire Maul.', 'Alterac 3605, 3614'),
(90000026, 2, 0, 255, 'In Dustwallow the Stonemaul, burned out of their southern village by Onyxia''s brood, took refuge at Brackenwall and fight for the Horde; their ruined home is held by dragonkin.', 'Alterac 3605, 3614'),
(90000026, 3, 0, 255, 'In Tanaris the Dunemaul, nomads newly come to the desert, have built a compound south of Gadgetzan and spread into the old troll ruins.', 'Alterac 3605, 3614'),
(90000026, 4, 8, 255, 'In Zangarmarsh the Ango''rosh are cutting down the mushroom forests of the north, a path that points straight at the troll town of Zabra''jin.', 'Alterac 3605, 3614'),
(90000026, 5, 8, 255, 'In Nagrand the Warmaul drive the Boulderfist south, and in Blade''s Edge the Bloodmaul and Bladespire fight one another for the favor of Gruul.', 'Alterac 3605, 3614'),
(90000027, 1, 0, 255, 'The Cartel pays the Southsea pirates of Lost Rigger Cove in Tanaris to leave its ships alone, and lately the pirates take the money and raid anyway.', 'Stranglethorn 3317, 3322'),
(90000027, 2, 8, 255, 'In Dustwallow it has founded Mudsprocket, a trading town open to both sides, though the zeppelin that should have stocked it crashed in the swamp.', 'Stranglethorn 3317, 3322'),
(90000028, 1, 0, 255, 'In Mulgore, refused mining rights by the tauren, it dug a mine in the eastern hills anyway and fouled their sacred wells with its poisons.', 'Stranglethorn 3304, 3311'),
(90000028, 2, 0, 255, 'In the northern Barrens its derricks foul the Sludge Fen, and its Boulder Lode Mine digs into the hills beyond.', 'Stranglethorn 3304, 3311'),
(90000028, 3, 0, 255, 'In Stonetalon it strips Windshear Crag of its forests with great shredders, and its fires left the Charred Vale a ruin of raging elementals.', 'Stranglethorn 3304, 3311'),
(90000029, 1, 8, 255, 'Not all of the clan stayed at Aerie Peak. Kurdran Wildhammer, thought lost with the Alliance Expedition, leads the Wildhammers of Shadowmoon Valley in Outland.', 'Hinterlands 4700, 4701, 4702, 4717'),
(90000030, 1, 0, 255, 'Far to the north, in the Eastweald, the small Mossflayer tribe clings to Zul''Mashar, worn down by long wars with Lordaeron and now by the plague as well.', 'Hinterlands 4700, 4706, 4708, 4711, 4713, 4716'),
(90000030, 2, 0, 255, 'In Quel''Thalas the Amani still raid the elves almost daily from Zeb''Watha and Tor''Watha, on the shores of Lake Elrendar in southeastern Eversong.', 'Hinterlands 4700, 4706, 4708, 4711, 4713, 4716'),
(90000030, 3, 0, 255, 'Along the road to Zul''Aman the Shadowpine hold three camps in the Ghostlands under their chieftain, Kel''gash the Wicked, and their oracles raise the mummified dead of the Amani Catacombs.', 'Hinterlands 4700, 4706, 4708, 4711, 4713, 4716'),
(90000031, 1, 13, 255, 'In the war against the Lich King the Dawn joined the remnants of the Silver Hand to form the Argent Crusade, which now leads the fight in Northrend.', 'Eastern Plaguelands 13909, 13920, 13921'),
(90000031, 2, 13, 255, 'In Zul''Drak the Argent Crusade holds the Argent Stand and Light''s Breach against both the Scourge and the Drakkari, who slay their own gods.', 'Eastern Plaguelands 13909, 13920, 13921'),
(90000031, 3, 15, 255, 'In northeastern Icecrown the Crusade has raised the grounds of a great tournament, so that the strongest of every banner will be ready to face the Lich King.', ''),
(90000032, 1, 0, 255, 'In the Plaguelands an old paladin, Tirion Fordring, has sworn to raise it again: a new Order of the Silver Hand, born over the body of his murdered son.', 'Western Plaguelands 2803, 2816'),
(90000032, 2, 13, 255, 'Joined with the Argent Dawn, the reborn order now marches in the Argent Crusade against the Lich King in Northrend.', 'Western Plaguelands 2803, 2816'),
(90000033, 1, 0, 255, 'Those who cannot master the hunger become the Wretched, shells of themselves who are cast out to raid ruins and roads for any scrap of power.', 'Eversong 343000, 343020, 343021'),
(90000033, 2, 8, 255, 'In Outland blood elf pilgrims cross the shattered land in search of Prince Kael''thas, resting at Falcon Watch, many of them starved for magic.', 'Eversong 343000, 343020, 343021'),
(90000035, 1, 0, 255, 'Their Light was taken from a naaru that Prince Kael''thas sent home as a gift. The being begrudged them its power, so the magisters found a way to claim it on their own terms.', 'Silvermoon 348705, 348706, 348707, 348708, 348709, 348710, 348711'),
(90000035, 2, 12, 255, 'That source is lost: when Kael''thas betrayed his people, his felbloods took the naaru, and the order must learn new ways to wield the Light.', 'Silvermoon 348705, 348706, 348707, 348708, 348709, 348710, 348711'),
(90000037, 1, 0, 255, 'Tirion Fordring''s letter won them a place among the living again: Thrall, remembering the paladin who saved Eitrigg, welcomed the knights back into the Horde, and King Varian took back the Alliance''s own.', 'Scarlet Enclave 429800, 429816, 429832, 429833, 429834'),
(90000037, 2, 13, 255, 'In Zul''Drak the knights keep Ebon Watch and hunt Overlord Drakuru, the troll commander of the Scourge, whom they have followed since the Grizzly Hills.', 'Scarlet Enclave 429800, 429816, 429832, 429833, 429834'),
(90000037, 3, 13, 255, 'In Icecrown the knights hold Death''s Rise and the Shadow Vault, taken from the Scourge, and keep watch on the citadel from camps across the glacier.', 'Scarlet Enclave 429800, 429816, 429832, 429833, 429834'),
(90000038, 1, 8, 255, 'In Zangarmarsh the Darkspear have built the town of Zabra''jin, the Horde''s stronghold in the marsh, hemmed in by ogres and Lost One assassins.', 'Durotar 1404, 1405, 1421, 1422'),
(90000039, 1, 0, 255, 'Neeru Fireblade names its heart: an object of demonic power called the Demon Seed, atop Dreadmist Peak in the Barrens.', 'Durotar 1401, 1402, 1414, 1417, 1424, 1425, 1428'),
(90000039, 2, 0, 255, 'Thrall knows the cult''s true leader: Neeru Fireblade himself, the warlock who claims to serve the Warchief. He leaves him in place, to use him against the Horde''s enemies.', 'Durotar 1401, 1402, 1414, 1417, 1424, 1425, 1428'),
(90000039, 3, 0, 255, 'To one he takes for a fellow cultist, Neeru sneers that Thrall is a fool, and that the Burning Legion will drain this world and make ash of it.', 'Durotar 1401, 1402, 1414, 1417, 1424, 1425, 1428'),
(90000039, 4, 0, 255, 'In Desolace the cult holds Thunder Axe Fortress, and its summoners have opened portals at Mannoroc Coven through which the Burning Legion pours into the land.', 'Durotar 1401, 1402, 1414, 1417, 1424, 1425, 1428'),
(90000040, 1, 0, 255, 'The Hand spent a year planting an agent inside the Venture Company''s tower in the Barrens, and when he called, its rogues left the tower in a bloodied heap.', 'Orgrimmar 163712, 163718'),
(90000041, 1, 8, 255, 'In recent years the blood elves of Quel''Thalas, championed by the Forsaken, have joined the Horde as well, the newest of its peoples.', ''),
(90000042, 1, 0, 255, 'Not every voice on the bluff approves of the pact that brought the Forsaken into the Horde. Some, like Sage Truthseeker, think it was made too hastily, and that the Forsaken''s history is thick with deceit.', 'Mulgore 21500, 21526'),
(90000043, 1, 0, 255, 'In Stonetalon they fell on the tauren village of Camp Aparaje and killed nearly everyone, and the raid''s leader, Grundig Darkcloud, holds Grimtotem Post a little farther up the path.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 2, 0, 255, 'Not all of Aparaje died: Makaba Flathoof''s daughter Kaya, whom her father believed lost, was carried off alive and held at the post.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 3, 0, 255, 'Letters hidden on Darkcloud Pinnacle show the clan in secret league with three who call themselves Harbingers: together, they promise, their forces will be mightier than all the tribes combined, and agents from Lordaeron are to meet the clan''s delegates.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 4, 0, 255, 'Asked to help against the vengeful serpent Arikara, Magatha called the news grave, glanced about her and smiled, and warned that Arikara was stalking Cairne Bloodhoof.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 5, 0, 255, 'In Feralas the clan has raised a compound east of Dire Maul and pens captured faerie dragons there, for purposes no one has learned, while Orgrimmar has put a bounty on its horns.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 6, 8, 255, 'In Dustwallow the clan has raised Blackhoof Village and Direhorn Post, raids Theramore''s road and towers, and its elders are said to take their orders from Thunder Bluff.', 'Thunder Bluff 163800, 163802, 163807'),
(90000043, 7, 8, 255, 'A letter carried by a Forsaken apothecary at Direhorn Post comes from the new masters of Lordaeron, who sent her to aid the Grimtotem against their mutual enemy in Kalimdor.', 'Thunder Bluff 163800, 163802, 163807'),
(90000044, 1, 0, 255, 'The caged Mangletooth, forgotten by his own tribe, gave up who truly led the Razormane raids: Nak, Kuz and Lok Orcbane, come out of Razorfen Kraul.', 'Barrens 1704, 1718, 1720, 1722, 1727, 1740'),
(90000045, 1, 0, 255, 'Regthar Deathgate has hunted down the leaders who rallied the Kolkar of the Barrens, Barak Kodobane, Verog the Dervish and Hezrul Bloodmark, to break the centaurs apart.', 'Barrens 1707, 1715, 1716, 1738'),
(90000045, 2, 0, 255, 'In Desolace the clans fight one another. The Kolkar hold the east, the Magram respect only strength, and the Gelkis, their brother clan and mortal enemy, trust in Theradras of the earth, whom they call the mother of the centaur.', 'Barrens 1707, 1715, 1716, 1738'),
(90000045, 3, 0, 255, 'The Maraudine guard Maraudon, the holy ground at the end of the Valley of Spears, where only spirits and the most sacred priests may tread.', 'Barrens 1707, 1715, 1716, 1738'),
(90000045, 4, 0, 255, 'An exile called the Pariah, cast out as a heretic, dreams of one great tribe: the clans fight over scraps, he says, when their heritage is as noble as any night elf''s or orc''s.', 'Barrens 1707, 1715, 1716, 1738'),
(90000047, 1, 0, 255, 'In Ashenvale the Silverwing Sentinels, under the fierce Duriel Moonfire, hold an outpost close by Splintertree and fight the Warsong over every grove the orcs cut down.', 'Darnassus 165701, 165703, 165707, 165713'),
(90000048, 1, 0, 255, 'Mistrust runs thick between Fandral and Remulos, each suspecting the other of trickery, and Fandral calls the druids of Moonglade fools who waste his time.', 'Darnassus 165701, 165709, 165718'),
(90000048, 2, 0, 255, 'At the top of Raynewood, in the heart of Ashenvale, dwells Keeper Ordanus, one of the eldest sons of Cenarius, guarded by dryads and Cenarion protectors.', 'Darnassus 165701, 165709, 165718'),
(90000048, 3, 0, 255, 'Not everyone in the Circle trusts Fandral. Quintis Jonespyre of Feathermoon asks why the Arch Druid gathers vast amounts of morrowgrain in its name, a grain that can show the qualities of herbs used in primitive curses.', 'Darnassus 165701, 165709, 165718'),
(90000048, 4, 0, 255, 'In Silithus the Circle holds Cenarion Hold, raised on the site of an old night elf settlement, against what lies sealed beyond the Scarab Wall.', 'Darnassus 165701, 165709, 165718'),
(90000048, 5, 0, 255, 'In Felwood its Emerald Circle, a largely independent branch, labors from the Emerald Sanctuary to undo the corruption of the forest.', 'Darnassus 165701, 165709, 165718'),
(90000048, 6, 0, 255, 'Its seat is Nighthaven in Moonglade, where Malfurion gathered the first druids, and where Keeper Remulos now keeps the peace between Horde and Alliance.', 'Darnassus 165701, 165709, 165718'),
(90000048, 7, 8, 255, 'In Outland its Cenarion Expedition, grown large and largely independent, studies the tortured land from the Cenarion Refuge in Zangarmarsh.', 'Darnassus 165701, 165709, 165718'),
(90000049, 1, 0, 255, 'The madness has a master: Ursal the Mauler, chieftain of the Gnarlpine, wields the evil power of the fel moss to drive his tribe into frenzy.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 2, 0, 255, 'On Azuremyst the Stillpine and Bristlelimb tribes are at war, and the Stillpine, driven from their hold by maddened wildkin, await a hero their prophecies promised.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 3, 0, 255, 'In Darkshore the Blackwood tribe, long friends of Auberdine, has turned savage, its camps spread along the fouling Cliffspring River and in a den south of the town.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 4, 0, 255, 'The Blackwood are not wholly to blame: satyrs hold them in thrall through talismans that channel dark magic into the tribe.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 5, 0, 255, 'In Ashenvale the Thistlefur and Foulweald have grown so numerous and bold that Astranaar fears an attack, and the Horde fights them too, for Thistlefur Village blocks its road between its outposts.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 6, 0, 255, 'Krolg, an old Foulweald outcast whom the fel moss has spared, blames the night elves'' pride for his people''s ruin, yet holds that the furbolgs must answer for their own evils.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 7, 0, 255, 'In Felwood the Deadwood have fallen to the fel and turn on all others; only the Timbermaw, in their mountain hold, escaped the corruption.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 8, 0, 255, 'In Winterspring the Winterfall, once allies of the Timbermaw and never known for aggression, turned savage at the strange demands of their high chief.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 9, 0, 255, 'In Azshara the Timbermaw of Ursolan and Bear''s Head meet outsiders with hostility, and no one knows whether the plague of Felwood has touched them.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000049, 10, 13, 255, 'In the Grizzly Hills the Frostpaw and Redfang tribes of Grizzlemaw, at peace for thousands of years, are locked in a deadly war.', 'Teldrassil 14104, 14108, 14110, 14118, 14121, 14127'),
(90000050, 1, 0, 255, 'On Bloodmyst the Nazzivus satyrs gather the Exodar''s corrupted crystals at Nazzivian and Axxarien, feeding on the corruption the crash has spread.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000050, 2, 0, 255, 'Armor taken from a felguard among them is armor only the Burning Legion uses: the Legion is gathering the island''s satyrs against the draenei.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000050, 3, 0, 255, 'In Ashenvale satyr tribes hold the ruins of old night elf temples: the Bleakheart at Satyrnaar, the Felmusk at Night Run, and at Xavian the satyrs who took the Branch of Cenarius from the dryads.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000050, 4, 0, 255, 'In Desolace the Hatefury satyrs infest a night elf city broken since the War of the Ancients, whose true name is forgotten. They call it Sargeron, after their dark master, and stand with the Burning Blade.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000050, 5, 0, 255, 'In Felwood the Jadefire feast on the corruption, bringing forth more of their kind from the fouled moonwell of Constellas.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000050, 6, 0, 255, 'In Azshara the Haldarr camp among old ruins on the western edge, and the Legashi hold the northern heights above the blood elves'' camp.', 'Teldrassil 14106, 14120, 14122, 14125'),
(90000052, 1, 8, 255, 'In Outland the naaru called the Sha''tar, led by A''dal, reclaimed the ruined draenei capital of Shattrath and make war on the Legion from it.', 'Exodar 355700, 355706'),
(90000053, 1, 8, 255, 'At the night elves'' invitation the Hand helps restore Forest Song in Ashenvale, where Vindicator Vedaar has sworn his people will retreat from the Burning Legion no more.', 'Bloodmyst 352501, 352505, 352519, 352520, 352529'),
(90000054, 1, 0, 255, 'They are led by a being called Sironas, who means to destroy the draenei, bind the naaru O''ros and take back the Exodar, and who keeps to the summit of the Coil.', 'Bloodmyst 352500, 352513, 352518, 352522, 352530, 352531'),
(90000054, 2, 0, 255, 'A declaration from Kael''thas himself promised them reinforcements from Tempest Keep through a sun portal, the recapture of the Exodar and Velen''s punishment.', 'Bloodmyst 352500, 352513, 352518, 352522, 352530, 352531'),
(90000054, 3, 0, 255, 'A captured Sunhawk let slip that Sironas is no elf but an eredar, who lived among the draenei long enough to pass as one of them.', 'Bloodmyst 352500, 352513, 352518, 352522, 352530, 352531'),
(90000055, 1, 0, 255, 'In Darkshore the Stormscale hold the ruins of Mathystra and a cave behind Cliffspring Falls, where cultists of the Twilight''s Hammer keep them company.', 'Azuremyst 352416, 352427'),
(90000055, 2, 0, 255, 'In Ashenvale the Wrathtail have returned to Zoram, a night elf city the Sundering drowned off the Zoram Strand, for reasons no one knows.', 'Azuremyst 352416, 352427'),
(90000055, 3, 0, 255, 'Off Desolace the Slitherblade dwell among sunken night elf ruins near Ranazjar Isle, gathered about a great serpent statue, and guard secrets kept for centuries.', 'Azuremyst 352416, 352427'),
(90000055, 4, 0, 255, 'In Feralas the Hatecrest hold the Ruins of Solarsal on Sardor Isle, perilously near Feathermoon Stronghold, and their royals command from a cave on the Isle of Dread.', 'Azuremyst 352416, 352427'),
(90000055, 5, 0, 255, 'In Azshara the Spitelash hold the Ruins of Eldarath, strip the Bay of Storms of its enchanted coral and keep the shattered Ravencrest Monument as a stronghold.', 'Azuremyst 352416, 352427'),
(90000055, 6, 8, 255, 'In Zangarmarsh the naga pump water from the great lakes with steam engines worked by enslaved Broken, and keep a stronghold beneath Serpent Lake.', 'Azuremyst 352416, 352427'),
(90000055, 7, 8, 255, 'In Shadowmoon the Coilskar naga, servants of Illidan, have seized the only clean water left in the valley and foul it for their own ends.', 'Azuremyst 352416, 352427'),
(90000056, 1, 0, 255, 'Its outriders fight the Silverwing Sentinels for every grove, and both sides send fighters to the gulch on the Barrens border where their war has a battlefield of its own.', 'Ashenvale 33100, 33117, 33120, 33122, 33141'),
(90000056, 2, 13, 255, 'In Northrend the Warsong Offensive, the Horde''s army against the Lich King, holds Warsong Hold in the Borean Tundra under Overlord Garrosh Hellscream.', 'Ashenvale 33100, 33117, 33120, 33122, 33141'),
(90000057, 1, 0, 255, 'Not all are gone. The mage Braelyn Firehand, who serves a master in Jaedenar, calls Azshara''s temple on Stonetalon Peak her own people''s, and knew Keeper Ordanus long ago.', 'Darkshore 14800, 14805, 14809, 14829'),
(90000057, 2, 0, 255, 'In Feralas Azj''Tordin, who fled Eldre''Thalas and traded his immortality for freedom, says the Shen''dralar who linger in the city have been marred by the madness of their Prince Tortheldrin.', 'Darkshore 14800, 14805, 14809, 14829'),
(90000057, 3, 0, 255, 'In Winterspring the spirits of Highborne sorcerers, cursed when a stolen relic shattered in their ritual, drift over frozen Lake Kel''Theril.', 'Darkshore 14800, 14805, 14809, 14829'),
(90000057, 4, 0, 255, 'In Azshara Highborne apparitions haunt the Shadowsong Shrine, their craving for the arcane undimmed by death, and the ghost of Varo''then, captain of the queen''s guard, walks among them.', 'Darkshore 14800, 14805, 14809, 14829'),
(90000058, 1, 0, 255, 'The orc warlock Ilkrud Magthrull of the Fire Scar Shrine fights in its name, shouting for the Dark Strand as he attacks.', 'Darkshore 14806, 14820, 14831'),
(90000058, 2, 0, 255, 'An orc warlock''s writings betray its secret: its master, Athrikus Narassin, draws his power from soul gems that hold trapped Highborne souls, hidden with the satyrs of Night Run and Satyrnaar.', 'Darkshore 14806, 14820, 14831'),
(90000058, 3, 0, 255, 'A page of Athrikus''s journal shows how the cult wins servants: hatred bends people easily, and the orcs and trolls, hating the Alliance, listened most readily of all.', 'Darkshore 14806, 14820, 14831'),
(90000059, 1, 0, 255, 'The insects Feralas calls the Zukk''ash are silithid too, the scholar Zilzibin Drumlore warns in Orgrimmar: a threat the Horde keeps choosing to ignore, far worse than anything the Alliance could muster.', 'Thousand Needles 40013, 40014'),
(90000059, 2, 0, 255, 'In Tanaris the Centipaar and Hazzali hives drain the desert''s pools, and the Gadgetzan Water Company counts its missing surveyors among their victims.', 'Thousand Needles 40013, 40014'),
(90000059, 3, 0, 255, 'Gadgetzan''s alchemist found them controlled by a powerful and malignant force and changed into pure ravagers, a threat to all of southern Kalimdor and perhaps the world.', 'Thousand Needles 40013, 40014'),
(90000059, 4, 0, 255, 'In Un''Goro the Gorishi have dug the Slithering Scar, a hive wholly alien to the crater, and scholars wonder whether the silithid draw their strength from it.', 'Thousand Needles 40013, 40014'),
(90000059, 5, 0, 255, 'In Silithus the hives of Ashi, Zora and Regal swarm once more, each guarding a crystal carved with qiraji glyphs.', 'Thousand Needles 40013, 40014'),
(90000060, 1, 0, 255, 'When Fandral Staghelm sought the dragons'' blessing for Teldrassil, Nozdormu refused it and chided the Arch Druid for his arrogance.', 'Tanaris 44007, 44028, 44037'),
(90000060, 2, 3, 255, 'A thousand years ago a great one of the flight healed the dying night elf Baristolth with the sands of time and bound him as a Watcher; at Cenarion Hold he waits to keep a promise made in that war.', 'Tanaris 44007, 44028, 44037'),
(90000060, 3, 13, 255, 'Xarantaur the Witness, among the first tauren druids, was made immortal by the bronze dragonflight and keeps the true stories of the world with a Lorehammer from Nozdormu.', 'Tanaris 44007, 44028, 44037'),
(90000061, 1, 0, 255, 'They serve an Old God. Natalia Mar''alith, taken by a trance at a hive crystal, came back as the High Priestess of C''Thun, crying that C''Thun would retake this world.', 'Silithus 137700, 137714, 137715, 137724, 137725'),
(90000062, 1, 0, 255, 'Its leader below Jaedenar is Shadow Lord Fel''dan, the mortal in power in Shadow Hold, the one making pacts with the Burning Legion.', 'Felwood 36108, 36109, 36128, 36129'),
(90000062, 2, 8, 255, 'At Grangol''var in Terokkar its cultists boast of sacrifices to Murmur, yet whisper among themselves that the council has lost all control of what it called up in Auchindoun.', 'Felwood 36108, 36109, 36128, 36129'),
(90000062, 3, 8, 255, 'In Nagrand its Kil''sorrow agents hold a walled fortress named for Kil''jaeden, still commune with the Legion and have crept into Oshu''gun.', 'Felwood 36108, 36109, 36128, 36129'),
(90000063, 1, 0, 255, 'Haleh, a consort of Malygos, will not stand idle while Nefarian of the black flight schemes behind Blackrock Mountain, and offers her power to mortals against him.', 'Winterspring 61808, 61817'),
(90000063, 2, 0, 255, 'Malygos charged Azuregos with guarding a shard of an old scepter, and after five hundred years of trouble Azuregos hid it inside a very special creature of his own making.', 'Winterspring 61808, 61817'),
(90000063, 3, 13, 255, 'Malygos has declared war on mortal magic, drawing the world''s arcane energies to the Nexus on Coldarra while his servants hunt mages; the red dragons and the Kirin Tor fight him in what they call the Nexus War.', 'Winterspring 61808, 61817'),
(90000064, 1, 0, 255, 'At Zeth''Gor in the southern hills the Bleeding Hollow carry talismans made from the insignias of fallen Honor Hold soldiers, cursed to work against the living.', 'Hellfire 348305, 348306, 348308, 348335'),
(90000064, 2, 0, 255, 'The Royal Apothecary Society studies their blood, to learn how the orcs of Hellfire became fel orcs and keep that tragedy from ever befalling the orcs of the Horde.', 'Hellfire 348305, 348306, 348308, 348335'),
(90000064, 3, 0, 255, 'Bonechewer fel orcs rebuilding ruins in Terokkar take their orders from the blood elves of Firewing Point, sent to keep the garrisons busy.', 'Hellfire 348305, 348306, 348308, 348335'),
(90000065, 1, 8, 255, 'Through the reopened Dark Portal it marches on Outland under Doom Lord Kazzak, raising forge camps to build fel reavers on the ridges of Hellfire Peninsula.', 'Hellfire 348300, 348312-348314, 348326'),
(90000065, 2, 8, 255, 'Its forge camps stand in Nagrand and on the terraces of Blade''s Edge, and at Death''s Door it holds open a portal onto the world where it breeds its hounds.', 'Hellfire 348300, 348312-348314, 348326'),
(90000066, 1, 0, 255, 'Their home is Garadar in Nagrand, where Greatmother Geyah raised nearly every orc, most of them orphans kept apart from the healthy when the red pox struck.', 'Hellfire 348318, 348329, 348337'),
(90000067, 1, 0, 255, 'Not all revere Terokk. Exiles led out of Skettis by Kirrik the Awakened learned of the Light from A''dal and live in Shattrath''s Lower City, where Rilak the Redeemed leads them.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934'),
(90000067, 2, 0, 255, 'When an altar of Skettis exploded rather than be purified by A''dal''s touch, Kirrik concluded that arakkoa who will not turn to the Light cannot be saved.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934'),
(90000067, 3, 0, 255, 'In Blade''s Edge the arakkoa, long a quiet people, have been stirred into a frenzy by a cult that whispers of a coming raven.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934'),
(90000067, 4, 0, 255, 'At the cult''s shrines the faithful hear the Word of the Raven: the raven will rise again from the darkest night, and the old blood will flow once more.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934'),
(90000067, 5, 0, 255, 'The Sketh''lon of Shadowmoon planned to strike at Gul''dan first, and the warlock answered with a spell that destroyed their camps and twisted their spirits into the Dark Conclave.', 'Terokkar 351903, 351904, 351914, 351915, 351921, 351928, 351934'),
(90000068, 1, 0, 255, 'In the Shrine of Unending Light a fel-forged weapon does not last: its foul materials disintegrate until only the pure residue of the Light remains.', 'Shattrath 370300, 370304, 370308, 370310, 370317'),
(90000068, 2, 0, 255, 'In Shadowmoon the Aldor carry their war to Illidan''s doorstep from the Altar of Sha''tar, northwest of the Black Temple.', 'Shattrath 370300, 370304, 370308, 370310, 370317'),
(90000069, 1, 0, 255, 'In Shadowmoon the Scryers fight Illidan and the Sunfury alike from the Sanctum of the Stars, whose ranks keep swelling with pilgrims from Quel''Thalas.', 'Shattrath 370300, 370305, 370309, 370311, 370318'),
(90000070, 1, 8, 255, 'In Nagrand the Ring keeps the Throne of the Elements, where the four furies dwell in person, and Broken elementalists serve among its shaman.', 'Ashenvale 33131'),
(90000071, 1, 0, 255, 'The pink orbs drifting over Razaan''s Landing are no ornaments: they are nether energy bound together with captured souls, gnome and Mok''Nathal among them.', 'Nagrand 351812'),
(90000071, 2, 0, 255, 'The Ethereum''s stasis chambers at Bash''ir Landing hold savage beasts and creatures of many worlds, which they hope one day to bend to their bidding.', 'Nagrand 351812'),
(90000071, 3, 0, 255, 'They fled their homeworld, K''aresh, shortly before the void lord Dimensius ravaged it, and the Ethereum, its old rulers, have hunted him ever since.', 'Nagrand 351812'),
(90000072, 1, 0, 255, 'A son of Gruul, Gorgrom the Dragon-Eater, stands behind the Bloodmaul and drives them against their neighbors, while the Bladespire, Gruul''s favorites, answer to Goc.', 'Blade''s Edge 352212, 352233, 352234, 352251'),
(90000072, 2, 0, 255, 'In Nagrand the Warmaul ogres served gronn until their king, Cho''war, drove the gronn out of their cave and named himself king.', 'Blade''s Edge 352212, 352233, 352234, 352251'),
(90000073, 1, 0, 255, 'Their keeper Mordenai is one of them: when the flight''s mother was freed from Dragonmaw Fortress, he rejoiced that his mother was free and his brothers and sisters saved.', 'Shadowmoon 352017, 352021, 352022, 352030, 352039'),
(90000075, 1, 0, 255, 'Icemist, their capital, has fallen to the Anub''ar, and what shelters at Westwind is all that remains of the taunka of the tundra and the Dragonblight.', 'Borean 353716, 353727'),
(90000075, 2, 0, 255, 'Freed from the Anub''ar, their High Chief Roanauk Icemist swore the blood oath at Agmar''s Hammer and brought the taunka into the Horde.', 'Borean 353716, 353727'),
(90000075, 3, 0, 255, 'In the Grizzly Hills the taunka of Camp Oneqwah, beyond Grizzlemaw, are allies of the Horde and watch the iron dwarves of the coast warily.', 'Borean 353716, 353727'),
(90000076, 1, 0, 255, 'Some of them rise from the dead, a different undeath from the Scourge''s, and a scroll from Skorn shows a thane rising into the heavens among angelic figures: the worthy among them may transcend death.', 'Howling Fjord 49500, 49503, 49507, 49515, 49516'),
(90000076, 2, 0, 255, 'The vargul of the Scourge are vrykul the Lich King did not find worthy, a dying crusader said: imagine how strong the worthy must be.', 'Howling Fjord 49500, 49503, 49507, 49515, 49516'),
(90000076, 3, 0, 255, 'In the Storm Peaks the Hyldnir, frost vrykul women, serve Thorim from Brunnhildar, while their sisters at Valkyrion have taken the Lich King''s gift and fly as val''kyr.', 'Howling Fjord 49500, 49503, 49507, 49515, 49516'),
(90000077, 1, 0, 255, 'Their mightiest runed giant died urging his brethren to let nothing keep them from the Stoneforge, a name that sounded like something of the titans.', 'Howling Fjord 49535'),
(90000077, 2, 0, 255, 'A false construct sent among them brought back word that the iron dwarves are at work in the Storm Peaks, and a name no one knew: Loken.', 'Howling Fjord 49535'),
(90000077, 3, 0, 255, 'At Dun Argol their thane receives Loken''s orders: to set the titans'' creations against one another, the sons of stone against the sons of iron, in a war for the titan city of Ulduar.', 'Howling Fjord 49535'),
(90000077, 4, 0, 255, 'Along the Eastwind Shore their runes of compulsion bind stone giants summoned from the earth and send them marching north to the battlefields.', 'Howling Fjord 49535'),
(90000077, 5, 0, 255, 'In the Storm Peaks the stormforged iron dwarves march in Loken''s name from Nidavelir against the exiled earthen and the frost giants.', 'Howling Fjord 49535'),
(90000078, 1, 0, 255, 'Nozdormu, Lord of Time, who disappeared to deal with very important matters, is alive: the bronze flight''s shrine showed him fighting the Infinite Dragonflight himself.', 'Dragonblight 6509, 6510-6513, 6523'),
(90000079, 1, 0, 255, 'The shrine''s keeper fell at the feet of a death knight and was turned into the source of its corruption. The Lich King, her spirit warned, now treads on the most sacred lands of every flight to force the dragons to act.', 'Dragonblight 6509, 6510, 6523, 6524'),
(90000080, 1, 0, 255, 'A free Nerubian of the Pit of Narjun offered the Horde a common enemy in Arthas, and a scroll of the Anub''ar''s strengths and weaknesses.', 'Dragonblight 6507, 6526'),
(90000081, 1, 0, 255, 'In Zul''Drak, their heartland, the Drakkari slay their own animal gods at their altars so that their prophets may drink the gods'' power against the Scourge.', 'Grizzly Hills 39406, 39407, 39414, 39429, 39430'),
(90000082, 1, 0, 255, 'Their chronicler records the end of the empire: the Drakkari were exiled from the other troll nations for their extreme violence, and Northrend was once the far north of Kalimdor before the Sundering.', 'Zul''Drak 6615, 6625, 6629'),
(90000089, 1, 0, 255, 'At Hillsbrad its Epoch Hunter came for the young Thrall himself, whose future must not come to pass. Dying, he said that the master would not be pleased.', 'Caverns of Time quests 10282, 10296; creature_text 17879, 17880, 17881, 18096'),
(90000089, 2, 0, 255, 'In the Black Morass its rift lords tried to talk the Guardian''s defenders out of it: think how many lives could be saved, they asked, if the portal never opened and the wars that followed were erased.', 'Caverns of Time quests 10282, 10296; creature_text 17879, 17880, 17881, 18096'),
(90000089, 3, 0, 255, 'Aeonus, who led them in the morass, would shatter this clockwork universe so that none need be slaves of the hourglass, and warned that those who would not embrace that greater path would become its victims.', 'Caverns of Time quests 10282, 10296; creature_text 17879, 17880, 17881, 18096'),
(90000089, 4, 0, 255, 'At Stratholme Chrono-Lord Epoch came for Prince Arthas himself, promising that the death he was destined to visit upon others would be his own that day.', 'Caverns of Time quests 10282, 10296; creature_text 17879, 17880, 17881, 18096');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(90000001, 1, 280, 0),
(90000001, 1, 284, 0),
(90000001, 1, 1678, 0),
(90000001, 1, 1679, 0),
(90000001, 1, 275, 0),
(90000001, 3, 2240, 0),
(90000001, 3, 2242, 0),
(90000001, 3, 2260, 0),
(90000001, 3, 2261, 0),
(90000001, 4, 505, 0),
(90000001, 4, 498, 0),
(90000002, 1, 3486, 0),
(90000002, 2, 6766, 0),
(90000003, 1, 279, 0),
(90000003, 2, 2543, 0),
(90000004, 2, 2216, 0),
(90000004, 4, 496, 0),
(90000004, 4, 501, 0),
(90000004, 4, 509, 0),
(90000004, 4, 659, 0),
(90000004, 2, 1518, 0),
(90000004, 4, 367, 0),
(90000004, 2, 1937, 0),
(90000004, 4, 447, 0),
(90000005, 1, 1497, 0),
(90000005, 1, 154, 0),
(90000005, 1, 159, 0),
(90000005, 1, 228, 0),
(90000005, 1, 272, 0),
(90000005, 2, 1569, 0),
(90000006, 3, 1501, 0),
(90000006, 3, 1890, 0),
(90000006, 3, 1520, 0),
(90000006, 3, 1525, 0),
(90000006, 3, 1526, 0),
(90000006, 3, 1866, 0),
(90000006, 3, 1674, 0),
(90000006, 3, 1941, 0),
(90000006, 3, 1939, 0),
(90000007, 3, 1535, 0),
(90000007, 3, 1506, 0),
(90000007, 3, 1507, 0),
(90000007, 3, 1536, 0),
(90000007, 3, 1537, 0),
(90000007, 3, 1538, 0),
(90000007, 1, 160, 0),
(90000007, 1, 161, 0),
(90000007, 4, 381, 0),
(90000007, 4, 427, 0),
(90000007, 4, 374, 0),
(90000008, 1, 324, 0),
(90000008, 1, 320, 0),
(90000008, 2, 2700, 0),
(90000008, 3, 2607, 0),
(90000009, 4, 687, 0),
(90000009, 3, 5860, 0),
(90000009, 3, 5861, 0),
(90000009, 3, 5862, 0),
(90000009, 3, 8419, 0),
(90000009, 1, 1442, 0),
(90000010, 3, 1051, 0),
(90000010, 3, 1052, 0),
(90000010, 3, 1053, 0),
(90000010, 3, 1054, 0),
(90000010, 3, 5844, 0),
(90000010, 3, 5846, 0),
(90000010, 3, 8566, 0),
(90000011, 3, 1034, 0),
(90000011, 3, 1035, 0),
(90000011, 3, 1057, 0),
(90000011, 3, 2102, 0),
(90000011, 3, 2103, 0),
(90000011, 1, 1036, 0),
(90000011, 1, 836, 0),
(90000012, 2, 5387, 0),
(90000012, 2, 2916, 0),
(90000012, 2, 2918, 0),
(90000012, 2, 1356, 0),
(90000012, 1, 142, 0),
(90000012, 4, 2398, 0),
(90000012, 4, 2279, 0),
(90000013, 3, 707, 0),
(90000013, 3, 1115, 0),
(90000013, 3, 1117, 0),
(90000013, 3, 1116, 0),
(90000013, 3, 1161, 0),
(90000013, 3, 1162, 0),
(90000013, 3, 1166, 0),
(90000013, 1, 134, 0),
(90000013, 1, 923, 0),
(90000014, 2, 7937, 0),
(90000014, 2, 7944, 0),
(90000014, 1, 133, 0),
(90000015, 3, 38, 0),
(90000015, 3, 116, 0),
(90000015, 3, 504, 0),
(90000015, 3, 589, 0),
(90000015, 3, 590, 0),
(90000015, 3, 122, 0),
(90000015, 3, 215, 0),
(90000015, 3, 909, 0),
(90000015, 1, 62, 0),
(90000015, 4, 65, 0),
(90000016, 1, 9, 0),
(90000016, 1, 24, 0),
(90000016, 2, 1284, 0),
(90000017, 3, 485, 0),
(90000017, 3, 437, 0),
(90000017, 3, 435, 0),
(90000017, 3, 440, 0),
(90000017, 3, 4463, 0),
(90000017, 3, 615, 0),
(90000017, 3, 4065, 0),
(90000017, 3, 4064, 0),
(90000017, 3, 436, 0),
(90000017, 3, 4464, 0),
(90000017, 3, 4462, 0),
(90000017, 3, 7025, 0),
(90000017, 3, 7026, 0),
(90000017, 3, 7027, 0),
(90000017, 3, 7028, 0),
(90000017, 3, 7029, 0),
(90000018, 3, 117, 0),
(90000018, 3, 123, 0),
(90000018, 3, 97, 0),
(90000018, 3, 478, 0),
(90000018, 3, 124, 0),
(90000018, 3, 98, 0),
(90000018, 3, 452, 0),
(90000018, 3, 500, 0),
(90000018, 3, 423, 0),
(90000018, 3, 446, 0),
(90000018, 3, 430, 0),
(90000018, 3, 426, 0),
(90000018, 3, 424, 0),
(90000018, 3, 433, 0),
(90000018, 3, 568, 0),
(90000018, 3, 431, 0),
(90000018, 3, 429, 0),
(90000019, 2, 264, 0),
(90000019, 2, 263, 0),
(90000019, 4, 56, 0),
(90000020, 3, 205, 0),
(90000020, 3, 533, 0),
(90000020, 3, 206, 0),
(90000020, 3, 920, 0),
(90000020, 3, 898, 0),
(90000020, 1, 241, 0),
(90000020, 1, 242, 0),
(90000021, 1, 657, 0),
(90000021, 1, 76, 0),
(90000021, 2, 1776, 0),
(90000021, 4, 1389, 0),
(90000021, 3, 763, 0),
(90000021, 3, 1106, 0),
(90000021, 3, 757, 0),
(90000021, 3, 759, 0),
(90000021, 3, 760, 0),
(90000021, 3, 755, 0),
(90000021, 3, 762, 0),
(90000021, 3, 761, 0),
(90000022, 3, 745, 0),
(90000022, 3, 746, 0),
(90000022, 3, 743, 0),
(90000022, 3, 742, 0),
(90000022, 3, 12900, 0),
(90000022, 3, 1063, 0),
(90000022, 1, 1778, 0),
(90000023, 3, 6004, 0),
(90000023, 3, 6005, 0),
(90000023, 3, 6006, 0),
(90000023, 3, 6007, 0),
(90000023, 3, 6008, 0),
(90000023, 3, 6009, 0),
(90000023, 1, 1441, 0),
(90000023, 3, 7666, 0),
(90000023, 3, 7667, 0),
(90000023, 3, 7665, 0),
(90000024, 3, 7040, 0),
(90000024, 3, 7047, 0),
(90000024, 3, 7041, 0),
(90000024, 3, 7044, 0),
(90000024, 3, 7049, 0),
(90000024, 3, 7046, 0),
(90000024, 3, 7042, 0),
(90000024, 3, 7043, 0),
(90000024, 3, 8964, 0),
(90000025, 1, 1446, 0),
(90000025, 2, 14625, 0),
(90000025, 2, 14624, 0),
(90000026, 3, 2252, 0),
(90000026, 3, 2253, 0),
(90000026, 3, 2562, 0),
(90000026, 3, 2566, 0),
(90000026, 3, 5974, 0),
(90000026, 3, 5976, 0),
(90000026, 3, 7033, 0),
(90000026, 3, 7035, 0),
(90000026, 3, 2701, 0),
(90000026, 3, 2717, 0),
(90000026, 3, 2719, 0),
(90000026, 3, 889, 0),
(90000026, 3, 212, 0),
(90000027, 1, 35, 0),
(90000027, 2, 2496, 0),
(90000027, 2, 2487, 0),
(90000027, 1, 392, 0),
(90000028, 1, 1740, 0),
(90000028, 1, 1760, 0),
(90000028, 3, 921, 0),
(90000028, 3, 4260, 0),
(90000028, 3, 1096, 0),
(90000028, 3, 674, 0),
(90000028, 3, 1094, 0),
(90000028, 3, 1097, 0),
(90000028, 3, 676, 0),
(90000028, 3, 677, 0),
(90000029, 1, 348, 0),
(90000029, 2, 5635, 0),
(90000029, 2, 5636, 0),
(90000030, 3, 2554, 0),
(90000030, 3, 2556, 0),
(90000030, 3, 2555, 0),
(90000030, 3, 2557, 0),
(90000030, 3, 2649, 0),
(90000030, 3, 2651, 0),
(90000030, 3, 2653, 0),
(90000030, 3, 2650, 0),
(90000030, 3, 4466, 0),
(90000030, 3, 4467, 0),
(90000030, 3, 4465, 0),
(90000030, 3, 2643, 0),
(90000030, 3, 2646, 0),
(90000030, 3, 2645, 0),
(90000031, 1, 2268, 0),
(90000031, 2, 10839, 0),
(90000031, 2, 10840, 0),
(90000031, 2, 11039, 0),
(90000031, 2, 11034, 0),
(90000032, 1, 196, 0),
(90000033, 1, 3430, 0),
(90000033, 1, 3433, 0),
(90000033, 1, 3487, 0),
(90000034, 1, 3464, 0),
(90000034, 1, 3496, 0),
(90000034, 2, 16220, 0),
(90000035, 2, 17717, 0),
(90000035, 2, 17076, 0),
(90000035, 2, 25223, 0),
(90000036, 1, 4080, 0),
(90000036, 2, 24813, 0),
(90000036, 2, 24967, 0),
(90000036, 4, 11481, 0),
(90000036, 4, 11482, 0),
(90000037, 5, 12801, 0),
(90000037, 4, 13165, 0),
(90000037, 2, 31084, 0),
(90000038, 1, 367, 0),
(90000038, 1, 368, 0),
(90000038, 2, 3188, 0),
(90000038, 2, 10540, 0),
(90000038, 2, 8404, 0),
(90000039, 1, 365, 0),
(90000039, 1, 817, 0),
(90000039, 1, 369, 0),
(90000039, 4, 792, 0),
(90000040, 2, 3401, 0),
(90000040, 4, 1859, 0),
(90000040, 4, 1963, 0),
(90000041, 1, 1637, 0),
(90000041, 1, 14, 0),
(90000041, 2, 4949, 0),
(90000042, 1, 215, 0),
(90000042, 1, 1638, 0),
(90000042, 2, 3057, 0),
(90000043, 2, 4046, 0),
(90000044, 1, 1699, 0),
(90000044, 1, 1700, 0),
(90000044, 1, 1698, 0),
(90000044, 1, 1701, 0),
(90000044, 1, 816, 0),
(90000044, 1, 358, 0),
(90000045, 1, 366, 0),
(90000045, 1, 386, 0),
(90000045, 1, 387, 0),
(90000045, 1, 388, 0),
(90000045, 2, 3389, 0),
(90000046, 1, 141, 0),
(90000046, 1, 1657, 0),
(90000046, 1, 188, 0),
(90000047, 2, 8026, 0),
(90000047, 2, 3519, 0),
(90000048, 1, 1658, 0),
(90000048, 2, 5769, 0),
(90000048, 2, 4217, 0),
(90000049, 1, 260, 0),
(90000049, 1, 736, 0),
(90000049, 1, 261, 0),
(90000049, 2, 1992, 0),
(90000050, 1, 258, 0),
(90000050, 2, 2150, 0),
(90000050, 3, 2038, 0),
(90000051, 1, 3524, 0),
(90000051, 1, 3557, 0),
(90000051, 1, 3525, 0),
(90000052, 2, 17538, 0),
(90000052, 2, 17468, 0),
(90000053, 1, 3576, 0),
(90000053, 1, 3584, 0),
(90000053, 2, 17658, 0),
(90000054, 1, 3586, 0),
(90000054, 1, 3585, 0),
(90000055, 1, 3570, 0),
(90000055, 1, 3569, 0),
(90000055, 1, 3590, 0),
(90000055, 1, 3589, 0),
(90000055, 1, 3604, 0),
(90000056, 1, 431, 0),
(90000056, 1, 437, 0),
(90000056, 1, 3177, 0),
(90000056, 1, 435, 0),
(90000057, 1, 447, 0),
(90000057, 1, 446, 0),
(90000058, 1, 444, 0),
(90000058, 1, 412, 0),
(90000059, 1, 479, 0),
(90000060, 1, 2300, 0),
(90000060, 2, 15192, 0),
(90000061, 1, 2737, 0),
(90000061, 1, 3478, 0),
(90000062, 1, 1763, 0),
(90000062, 1, 1770, 0),
(90000062, 1, 1771, 0),
(90000063, 1, 2245, 0),
(90000063, 2, 10929, 0),
(90000064, 1, 3545, 0),
(90000064, 1, 3582, 0),
(90000064, 1, 3809, 0),
(90000064, 1, 3810, 0),
(90000064, 1, 3811, 0),
(90000065, 1, 435, 0),
(90000065, 1, 602, 0),
(90000065, 1, 2256, 0),
(90000065, 1, 3547, 0),
(90000066, 1, 3555, 0),
(90000066, 1, 3801, 0),
(90000067, 1, 3689, 0),
(90000067, 1, 3676, 0),
(90000067, 1, 3677, 0),
(90000067, 1, 3686, 0),
(90000067, 1, 3678, 0),
(90000067, 1, 3556, 0),
(90000068, 1, 3896, 0),
(90000068, 2, 18538, 0),
(90000068, 2, 18537, 0),
(90000069, 1, 3898, 0),
(90000069, 2, 18530, 0),
(90000069, 2, 18531, 0),
(90000070, 2, 12736, 0),
(90000070, 1, 3615, 0),
(90000071, 1, 3623, 0),
(90000071, 1, 3942, 0),
(90000071, 1, 3864, 0),
(90000071, 1, 3956, 0),
(90000072, 1, 3825, 0),
(90000072, 1, 3904, 0),
(90000072, 1, 3631, 0),
(90000073, 1, 3758, 0),
(90000073, 1, 3759, 0),
(90000073, 2, 21657, 0),
(90000074, 1, 3988, 0),
(90000074, 1, 4041, 0),
(90000074, 1, 4040, 0),
(90000075, 1, 4037, 0),
(90000075, 1, 4018, 0),
(90000076, 1, 3983, 0),
(90000076, 1, 4002, 0),
(90000076, 1, 4001, 0),
(90000076, 1, 4006, 0),
(90000076, 1, 4028, 0),
(90000077, 1, 4061, 0),
(90000077, 1, 4005, 0),
(90000077, 1, 3996, 0),
(90000078, 1, 4161, 0),
(90000079, 1, 4168, 0),
(90000079, 2, 27990, 0),
(90000080, 1, 4163, 0),
(90000080, 1, 4164, 0),
(90000080, 2, 26653, 0),
(90000081, 1, 4209, 0),
(90000081, 1, 4475, 0),
(90000081, 1, 4216, 0),
(90000082, 1, 4323, 0),
(90000082, 2, 28479, 0),
(90000083, 1, 4292, 0),
(90000083, 1, 4316, 0),
(90000084, 1, 4291, 0),
(90000084, 1, 4306, 0),
(90000085, 1, 4438, 0),
(90000086, 1, 4484, 0),
(90000086, 1, 4446, 0),
(90000086, 1, 4221, 0),
(90000087, 1, 4740, 0),
(90000087, 1, 4559, 0),
(90000088, 1, 4616, 0),
(90000088, 1, 4558, 0),
(90000089, 5, 10282, 0),
(90000089, 4, 10296, 0),
(90000001, 3, 2423, 1),
(90000001, 4, 507, 1),
(90000001, 5, 525, 2),
(90000001, 1, 313, 3),
(90000001, 1, 324, 3),
(90000001, 3, 2586, 3),
(90000001, 3, 2589, 3),
(90000001, 4, 1978, 4),
(90000001, 4, 14418, 4),
(90000002, 5, 6701, 1),
(90000003, 2, 18165, 1),
(90000003, 1, 3934, 3),
(90000003, 1, 3733, 3),
(90000003, 1, 4023, 4),
(90000003, 1, 4395, 5),
(90000004, 5, 524, 1),
(90000004, 5, 661, 2),
(90000004, 5, 492, 3),
(90000004, 2, 2055, 4),
(90000004, 2, 102055, 4),
(90000004, 5, 447, 4),
(90000004, 5, 13257, 5),
(90000004, 2, 36217, 6),
(90000004, 1, 4000, 7),
(90000004, 1, 3991, 7),
(90000005, 4, 1885, 1),
(90000005, 4, 14420, 1),
(90000005, 2, 36213, 2),
(90000005, 2, 36217, 2),
(90000005, 2, 16252, 3),
(90000005, 1, 411, 4),
(90000005, 1, 432, 4),
(90000006, 3, 1947, 1),
(90000006, 4, 442, 1),
(90000006, 1, 28, 2),
(90000006, 1, 139, 2),
(90000006, 1, 4125, 3),
(90000006, 1, 4128, 3),
(90000007, 5, 382, 1),
(90000007, 1, 190, 2),
(90000007, 1, 203, 2),
(90000007, 1, 2266, 3),
(90000007, 1, 2267, 3),
(90000007, 4, 12756, 4),
(90000007, 2, 1182, 5),
(90000007, 5, 12852, 6),
(90000008, 5, 634, 1),
(90000008, 2, 16819, 2),
(90000009, 4, 687, 1),
(90000009, 1, 449, 2),
(90000009, 1, 2739, 3),
(90000009, 1, 3098, 3),
(90000009, 1, 3099, 3),
(90000009, 1, 3446, 3),
(90000009, 4, 8331, 4),
(90000010, 3, 1364, 1),
(90000010, 5, 304, 1),
(90000010, 3, 6212, 2),
(90000010, 4, 2945, 2),
(90000010, 4, 2904, 3),
(90000010, 5, 2947, 4),
(90000010, 5, 2949, 4),
(90000011, 5, 464, 1),
(90000011, 3, 2091, 2),
(90000011, 5, 474, 2),
(90000011, 1, 3939, 3),
(90000011, 1, 3759, 3),
(90000012, 5, 2279, 1),
(90000012, 5, 2946, 2),
(90000012, 5, 2964, 2),
(90000012, 1, 450, 3),
(90000012, 2, 2917, 3),
(90000012, 1, 3427, 4),
(90000012, 1, 4071, 5),
(90000012, 5, 11993, 6),
(90000012, 5, 12058, 6),
(90000015, 5, 147, 1),
(90000015, 4, 141, 2),
(90000015, 5, 2359, 3),
(90000015, 5, 434, 4),
(90000018, 4, 123, 1),
(90000018, 1, 818, 2),
(90000018, 1, 2519, 3),
(90000018, 1, 2520, 3),
(90000019, 5, 146, 1),
(90000020, 5, 1043, 1),
(90000020, 4, 268, 2),
(90000020, 1, 419, 3),
(90000020, 5, 12308, 4),
(90000021, 4, 9448, 1),
(90000021, 4, 9440, 2),
(90000021, 2, 17204, 3),
(90000021, 1, 3551, 4),
(90000021, 1, 3795, 4),
(90000021, 5, 10369, 5),
(90000021, 1, 3641, 6),
(90000021, 1, 3642, 6),
(90000021, 1, 3640, 6),
(90000021, 1, 3766, 6),
(90000021, 1, 3626, 7),
(90000021, 1, 3622, 7),
(90000021, 1, 3621, 7),
(90000022, 4, 3374, 2),
(90000022, 5, 8736, 3),
(90000022, 4, 12454, 4),
(90000023, 5, 2801, 1),
(90000023, 4, 2743, 2),
(90000023, 5, 2744, 3),
(90000024, 5, 6403, 1),
(90000024, 5, 7495, 1),
(90000024, 4, 24428, 1),
(90000024, 1, 511, 2),
(90000024, 1, 510, 2),
(90000024, 1, 3825, 3),
(90000024, 1, 3780, 3),
(90000024, 1, 4167, 4),
(90000024, 1, 4223, 4),
(90000025, 4, 7701, 1),
(90000025, 4, 7722, 1),
(90000025, 5, 7722, 2),
(90000026, 1, 2522, 1),
(90000026, 1, 1103, 1),
(90000026, 1, 2577, 1),
(90000026, 1, 496, 2),
(90000026, 1, 508, 2),
(90000026, 1, 509, 2),
(90000026, 1, 983, 3),
(90000026, 1, 984, 3),
(90000026, 1, 992, 3),
(90000026, 1, 3650, 4),
(90000026, 1, 3651, 4),
(90000026, 1, 3667, 4),
(90000026, 1, 3617, 5),
(90000026, 1, 3616, 5),
(90000026, 1, 3776, 5),
(90000026, 1, 3773, 5),
(90000026, 1, 3777, 5),
(90000027, 1, 1336, 1),
(90000027, 1, 4010, 2),
(90000028, 1, 360, 1),
(90000028, 1, 396, 1),
(90000028, 1, 397, 1),
(90000028, 1, 398, 1),
(90000028, 1, 382, 2),
(90000028, 1, 381, 2),
(90000028, 1, 461, 3),
(90000028, 1, 465, 3),
(90000029, 2, 21330, 1),
(90000030, 1, 2273, 1),
(90000030, 3, 8560, 1),
(90000030, 3, 8561, 1),
(90000030, 3, 8562, 1),
(90000030, 1, 3475, 2),
(90000030, 1, 3476, 2),
(90000030, 1, 3512, 3),
(90000030, 1, 3516, 3),
(90000030, 1, 3517, 3),
(90000030, 1, 3510, 3),
(90000031, 1, 4501, 1),
(90000031, 1, 4275, 2),
(90000031, 1, 4317, 2),
(90000032, 5, 5944, 1),
(90000032, 1, 4501, 2),
(90000033, 1, 3533, 1),
(90000033, 1, 3461, 1),
(90000033, 1, 3554, 2),
(90000035, 5, 9681, 1),
(90000035, 5, 109681, 1),
(90000035, 4, 9684, 2),
(90000037, 5, 13189, 1),
(90000037, 5, 13188, 1),
(90000037, 1, 4312, 2),
(90000037, 1, 4477, 3),
(90000037, 1, 4470, 3),
(90000038, 1, 3645, 1),
(90000039, 5, 829, 1),
(90000039, 4, 5727, 2),
(90000039, 5, 5727, 3),
(90000039, 1, 599, 4),
(90000039, 1, 602, 4),
(90000040, 5, 2478, 1),
(90000042, 2, 3978, 1),
(90000043, 1, 2538, 1),
(90000043, 1, 2537, 1),
(90000043, 4, 6523, 2),
(90000043, 5, 5064, 3),
(90000043, 4, 5088, 4),
(90000043, 1, 1100, 5),
(90000043, 1, 512, 6),
(90000043, 1, 4046, 6),
(90000043, 4, 11185, 7),
(90000043, 4, 11186, 7),
(90000044, 4, 879, 1),
(90000045, 5, 852, 1),
(90000045, 1, 609, 2),
(90000045, 1, 604, 2),
(90000045, 1, 606, 2),
(90000045, 1, 607, 3),
(90000045, 2, 13717, 4),
(90000047, 1, 2360, 1),
(90000048, 5, 6761, 1),
(90000048, 1, 426, 2),
(90000048, 4, 3791, 3),
(90000048, 1, 3425, 4),
(90000048, 1, 2479, 5),
(90000048, 1, 2361, 6),
(90000048, 1, 3565, 7),
(90000048, 1, 3808, 7),
(90000049, 4, 476, 1),
(90000049, 1, 3572, 2),
(90000049, 1, 3571, 2),
(90000049, 1, 3600, 2),
(90000049, 1, 456, 3),
(90000049, 1, 455, 3),
(90000049, 4, 4763, 4),
(90000049, 1, 2301, 5),
(90000049, 1, 2357, 5),
(90000049, 5, 1030, 6),
(90000049, 1, 1761, 7),
(90000049, 1, 1762, 7),
(90000049, 1, 1769, 7),
(90000049, 1, 2244, 8),
(90000049, 1, 2243, 8),
(90000049, 1, 1225, 9),
(90000049, 1, 1216, 9),
(90000049, 1, 1224, 9),
(90000049, 1, 395, 10),
(90000050, 1, 3592, 1),
(90000050, 1, 3593, 1),
(90000050, 5, 9594, 2),
(90000050, 1, 430, 3),
(90000050, 1, 428, 3),
(90000050, 1, 429, 3),
(90000050, 1, 603, 4),
(90000050, 1, 2481, 5),
(90000050, 1, 2480, 5),
(90000050, 1, 2618, 5),
(90000050, 1, 1236, 6),
(90000050, 1, 1219, 6),
(90000052, 1, 3703, 1),
(90000053, 2, 17303, 1),
(90000054, 4, 9753, 1),
(90000054, 4, 9698, 2),
(90000054, 5, 9756, 3),
(90000055, 1, 443, 1),
(90000055, 1, 445, 1),
(90000055, 1, 414, 2),
(90000055, 1, 2406, 3),
(90000055, 1, 2405, 3),
(90000055, 1, 1117, 4),
(90000055, 1, 1121, 4),
(90000055, 1, 1221, 5),
(90000055, 1, 1232, 5),
(90000055, 1, 3653, 6),
(90000055, 1, 3655, 6),
(90000055, 1, 3659, 6),
(90000055, 1, 3656, 6),
(90000055, 1, 3750, 7),
(90000055, 1, 3749, 7),
(90000056, 1, 2360, 1),
(90000056, 1, 4129, 2),
(90000057, 5, 1088, 1),
(90000057, 2, 14355, 2),
(90000057, 1, 2251, 3),
(90000057, 1, 2252, 3),
(90000057, 1, 1235, 4),
(90000058, 5, 970, 1),
(90000058, 3, 3664, 1),
(90000058, 5, 973, 2),
(90000058, 4, 1140, 2),
(90000058, 5, 981, 3),
(90000059, 5, 7732, 1),
(90000059, 1, 982, 2),
(90000059, 1, 981, 2),
(90000059, 5, 110, 3),
(90000059, 1, 540, 4),
(90000059, 1, 2742, 5),
(90000059, 1, 2743, 5),
(90000059, 1, 2744, 5),
(90000060, 5, 7383, 1),
(90000060, 2, 15180, 2),
(90000060, 2, 30381, 3),
(90000061, 5, 8306, 1),
(90000062, 4, 5242, 1),
(90000062, 5, 10040, 2),
(90000062, 5, 10041, 2),
(90000062, 1, 3637, 3),
(90000063, 2, 10929, 1),
(90000063, 4, 8575, 2),
(90000063, 1, 4024, 3),
(90000064, 5, 10485, 1),
(90000064, 5, 10835, 2),
(90000064, 5, 10012, 3),
(90000064, 5, 10013, 3),
(90000065, 1, 3547, 1),
(90000065, 1, 3804, 1),
(90000065, 1, 3831, 2),
(90000065, 1, 3625, 2),
(90000065, 1, 3785, 2),
(90000066, 1, 3613, 1),
(90000067, 2, 22292, 1),
(90000067, 4, 10849, 1),
(90000067, 5, 10839, 2),
(90000067, 1, 3781, 3),
(90000067, 1, 3782, 3),
(90000067, 1, 3783, 3),
(90000067, 5, 10607, 4),
(90000067, 4, 10777, 5),
(90000068, 5, 10420, 1),
(90000068, 1, 3754, 2),
(90000069, 1, 3938, 1),
(90000070, 1, 3615, 1),
(90000071, 4, 10675, 1),
(90000071, 4, 10865, 1),
(90000071, 5, 10974, 2),
(90000071, 2, 20448, 3),
(90000072, 4, 10798, 1),
(90000072, 5, 10714, 1),
(90000072, 1, 3617, 2),
(90000073, 5, 10870, 1),
(90000075, 5, 11977, 1),
(90000075, 5, 11979, 1),
(90000075, 5, 12140, 2),
(90000075, 1, 4211, 3),
(90000076, 5, 11249, 1),
(90000076, 5, 11260, 1),
(90000076, 5, 12904, 2),
(90000076, 1, 4422, 3),
(90000076, 1, 4424, 3),
(90000077, 5, 11359, 1),
(90000077, 5, 11367, 1),
(90000077, 5, 11495, 2),
(90000077, 5, 12185, 3),
(90000077, 5, 12203, 3),
(90000077, 1, 4212, 4),
(90000077, 1, 4250, 4),
(90000077, 1, 4249, 4),
(90000077, 1, 4434, 5),
(90000078, 5, 12470, 1),
(90000079, 5, 12418, 1),
(90000079, 5, 12450, 1),
(90000080, 5, 12041, 1),
(90000081, 1, 4276, 1),
(90000081, 1, 4322, 1),
(90000081, 1, 4375, 1),
(90000082, 5, 12650, 1),
(90000089, 3, 18096, 1),
(90000089, 3, 17879, 2),
(90000089, 3, 17880, 2),
(90000089, 3, 17881, 3),
(90000089, 3, 26532, 4);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(90000001, 90000002, 0),
(90000001, 3613, 1),
(90000001, 3617, 2),
(90000001, 91000001, 3),
(90000002, 90000001, 0),
(90000002, 3618, 1),
(90000002, 3611, 2),
(90000003, 91000003, 0),
(90000003, 3610, 1),
(90000003, 3619, 2),
(90000003, 3620, 3),
(90000004, 26705, 0),
(90000004, 149704, 1),
(90000004, 90000005, 2),
(90000004, 91000004, 3),
(90000005, 149702, 0),
(90000005, 91000006, 1),
(90000005, 90000004, 2),
(90000005, 90000006, 3),
(90000005, 91000026, 4),
(90000006, 91000005, 0),
(90000006, 90000005, 1),
(90000006, 13021, 2),
(90000006, 92000000, 3),
(90000006, 91000021, 4),
(90000007, 8514, 0),
(90000007, 2812, 1),
(90000007, 13908, 2),
(90000007, 90000032, 3),
(90000007, 429814, 4),
(90000008, 91000009, 0),
(90000008, 4505, 1),
(90000008, 4508, 2),
(90000008, 91000012, 3),
(90000009, 4524, 0),
(90000009, 137707, 1),
(90000010, 91000010, 0),
(90000010, 1109, 1),
(90000010, 1110, 2),
(90000011, 91000011, 0),
(90000011, 1115, 1),
(90000011, 90000073, 2),
(90000012, 3812, 0),
(90000012, 1113, 1),
(90000012, 153700, 2),
(90000013, 113, 0),
(90000013, 3812, 1),
(90000014, 113, 0),
(90000014, 153703, 1),
(90000014, 106, 2),
(90000015, 4017, 0),
(90000015, 91000015, 1),
(90000015, 91000016, 2),
(90000015, 4010, 3),
(90000016, 1202, 0),
(90000016, 151907, 1),
(90000016, 91000013, 2),
(90000017, 4410, 0),
(90000017, 4417, 1),
(90000017, 4407, 2),
(90000018, 1221, 0),
(90000018, 90000015, 1),
(90000018, 4411, 2),
(90000019, 1012, 0),
(90000019, 4414, 1),
(90000019, 1025, 2),
(90000020, 91000007, 0),
(90000020, 1019, 1),
(90000020, 4418, 2),
(90000021, 803, 0),
(90000021, 807, 1),
(90000021, 355702, 2),
(90000022, 1009, 0),
(90000022, 808, 1),
(90000022, 813, 2),
(90000022, 35715, 3),
(90000023, 410, 0),
(90000023, 406, 1),
(90000023, 403, 2),
(90000024, 91000016, 0),
(90000024, 90000017, 1),
(90000024, 4613, 2),
(90000025, 5101, 0),
(90000025, 90000010, 1),
(90000026, 312, 0),
(90000026, 403, 1),
(90000026, 4603, 2),
(90000026, 35710, 3),
(90000027, 3317, 0),
(90000027, 90000028, 1),
(90000027, 1710, 2),
(90000027, 44001, 3),
(90000028, 90000027, 0),
(90000028, 21511, 1),
(90000028, 40611, 2),
(90000029, 4701, 0),
(90000029, 4717, 1),
(90000029, 91000010, 2),
(90000030, 91000009, 0),
(90000030, 4711, 1),
(90000030, 4513, 2),
(90000030, 13912, 3),
(90000030, 343318, 4),
(90000031, 13909, 0),
(90000031, 90000032, 1),
(90000031, 91000023, 2),
(90000031, 90000006, 3),
(90000032, 90000016, 0),
(90000032, 90000031, 1),
(90000032, 90000007, 2),
(90000032, 2803, 3),
(90000032, 92000001, 4),
(90000033, 91000024, 0),
(90000033, 91000025, 1),
(90000033, 91000026, 2),
(90000033, 92000002, 3),
(90000034, 348704, 0),
(90000034, 348702, 1),
(90000034, 90000030, 2),
(90000034, 343015, 3),
(90000034, 343307, 4),
(90000035, 92000003, 0),
(90000035, 348703, 1),
(90000035, 90000032, 2),
(90000035, 92000002, 3),
(90000036, 408000, 0),
(90000036, 408001, 1),
(90000036, 408002, 2),
(90000036, 92000002, 3),
(90000037, 92000004, 0),
(90000037, 92000005, 1),
(90000037, 91000023, 2),
(90000037, 429801, 3),
(90000038, 1404, 0),
(90000038, 163708, 1),
(90000038, 90000041, 2),
(90000038, 91000020, 3),
(90000039, 1417, 0),
(90000039, 163704, 1),
(90000039, 1401, 2),
(90000039, 90000041, 3),
(90000039, 40503, 4),
(90000040, 163704, 0),
(90000040, 90000041, 1),
(90000041, 92000006, 0),
(90000041, 91000027, 1),
(90000041, 91000026, 2),
(90000041, 90000005, 3),
(90000041, 90000038, 4),
(90000042, 91000028, 0),
(90000042, 163806, 1),
(90000042, 90000041, 2),
(90000042, 90000043, 3),
(90000042, 90000005, 4),
(90000043, 163807, 0),
(90000043, 90000042, 1),
(90000043, 40600, 2),
(90000043, 40002, 3),
(90000044, 1722, 0),
(90000044, 1717, 1),
(90000044, 1410, 2),
(90000044, 21503, 3),
(90000045, 90000042, 0),
(90000045, 1715, 1),
(90000045, 1410, 2),
(90000045, 91000028, 3),
(90000045, 40500, 4),
(90000046, 91000029, 0),
(90000046, 91000030, 1),
(90000046, 90000047, 2),
(90000046, 90000048, 3),
(90000046, 165707, 4),
(90000047, 165707, 0),
(90000047, 90000046, 1),
(90000047, 14113, 2),
(90000047, 35721, 3),
(90000048, 165701, 0),
(90000048, 163808, 1),
(90000048, 165708, 2),
(90000048, 14109, 3),
(90000049, 14109, 0),
(90000049, 90000046, 1),
(90000049, 352410, 2),
(90000049, 33106, 3),
(90000050, 91000029, 0),
(90000050, 14105, 1),
(90000050, 14113, 2),
(90000051, 91000031, 0),
(90000051, 91000032, 1),
(90000051, 90000052, 2),
(90000051, 355705, 3),
(90000051, 90000021, 4),
(90000052, 90000051, 0),
(90000052, 355700, 1),
(90000052, 91000032, 2),
(90000052, 370301, 3),
(90000053, 352505, 0),
(90000053, 352407, 1),
(90000053, 90000051, 2),
(90000054, 352518, 0),
(90000054, 352400, 1),
(90000054, 92000002, 2),
(90000055, 91000029, 0),
(90000055, 352416, 1),
(90000055, 352507, 2),
(90000056, 33122, 0),
(90000056, 33117, 1),
(90000056, 90000041, 2),
(90000056, 92000006, 3),
(90000056, 91000030, 4),
(90000057, 91000029, 0),
(90000057, 91000024, 1),
(90000057, 90000055, 2),
(90000057, 90000050, 3),
(90000057, 14809, 4),
(90000057, 14805, 5),
(90000058, 14806, 0),
(90000058, 33101, 1),
(90000058, 90000057, 2),
(90000058, 90000050, 3),
(90000059, 40011, 0),
(90000059, 35706, 1),
(90000059, 44016, 2),
(90000059, 90000061, 3),
(90000060, 44007, 0),
(90000060, 14100, 1),
(90000060, 91000033, 2),
(90000061, 91000033, 0),
(90000061, 90000059, 1),
(90000061, 137714, 2),
(90000062, 36108, 0),
(90000062, 90000039, 1),
(90000062, 90000041, 2),
(90000063, 61808, 0),
(90000063, 90000024, 1),
(90000063, 1609, 2),
(90000064, 348305, 0),
(90000064, 90000066, 1),
(90000064, 90000004, 2),
(90000064, 90000041, 3),
(90000065, 91000029, 0),
(90000065, 91000030, 1),
(90000065, 90000062, 2),
(90000065, 348314, 3),
(90000066, 348318, 0),
(90000066, 92000006, 1),
(90000066, 90000064, 2),
(90000066, 351801, 3),
(90000066, 92000008, 4),
(90000067, 351923, 0),
(90000067, 351900, 1),
(90000068, 90000069, 0),
(90000068, 90000052, 1),
(90000068, 90000051, 2),
(90000069, 90000068, 0),
(90000069, 92000002, 1),
(90000069, 90000033, 2),
(90000069, 90000052, 3),
(90000070, 33103, 0),
(90000070, 351805, 1),
(90000070, 90000009, 2),
(90000071, 351810, 0),
(90000071, 352209, 1),
(90000072, 352212, 0),
(90000072, 90000026, 1),
(90000072, 352230, 2),
(90000073, 352017, 0),
(90000073, 90000011, 1),
(90000073, 90000024, 2),
(90000073, 352207, 3),
(90000074, 49520, 0),
(90000074, 353704, 1),
(90000074, 90000076, 2),
(90000075, 353716, 0),
(90000075, 90000042, 1),
(90000075, 90000041, 2),
(90000076, 49503, 0),
(90000076, 49516, 1),
(90000076, 91000034, 2),
(90000077, 90000012, 0),
(90000077, 49510, 1),
(90000078, 6509, 0),
(90000078, 6523, 1),
(90000078, 90000079, 2),
(90000078, 90000060, 3),
(90000078, 90000022, 4),
(90000079, 6523, 0),
(90000079, 91000011, 1),
(90000079, 90000011, 2),
(90000079, 90000078, 3),
(90000080, 90000006, 0),
(90000080, 90000075, 1),
(90000080, 6508, 2),
(90000081, 39406, 0),
(90000081, 39414, 1),
(90000081, 90000030, 2),
(90000081, 6615, 3),
(90000082, 6615, 0),
(90000082, 90000081, 1),
(90000082, 91000020, 2),
(90000083, 371106, 0),
(90000083, 90000084, 1),
(90000083, 6601, 2),
(90000084, 371107, 0),
(90000084, 90000083, 1),
(90000084, 371111, 2),
(90000085, 6713, 0),
(90000085, 6730, 1),
(90000085, 90000076, 2),
(90000086, 6709, 0),
(90000086, 90000077, 1),
(90000086, 91000036, 2),
(90000086, 90000012, 3),
(90000087, 439521, 0),
(90000087, 90000088, 1),
(90000087, 90000003, 2),
(90000088, 439522, 0),
(90000088, 90000087, 1),
(90000088, 90000033, 2),
(90000089, 44007, 0),
(90000089, 90000060, 1),
(90000089, 236700, 2),
(90000089, 236600, 3);

-- The Pit of Saron
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 481300 AND 481399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 481300 AND 481399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 481300 AND 481399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 481300 AND 481399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(481300, 0, 4813, 0, 0, 16, 'The Pit of Saron', 'The Pit of Saron is the great quarry beneath Icecrown Citadel''s walls, where soldiers of the Alliance and the Horde taken captive mine saronite for the Lich King under the lash of the Ymirjar. A frost giant works the forges, a gnome rides an abomination among the slaves, and frost wyrms watch from the cliffs over the long path up to the Scourgelord''s rise.', '', 'Pit of Saron spawns (map 658); Pit of Saron quests 24461, 24559, 24683; creature_text 36477, 36990, 36993'),
(481301, 2, 4813, 0, 0, 16, 'Scourgelord Tyrannus', 'Scourgelord Tyrannus commands the Pit of Saron for the Lich King, riding the frostwyrm Rimefang above the quarry, and the Lich King has placed an army of the undead at his command. When he is done with intruders, he promises, his master''s blade will feast upon their souls.', '', 'Pit of Saron quests 24710, 24712; creature_text 36658, 36794, 37580, 37581, 36993, 36990');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(481300, 1, 0, 255, 'When his abomination fell, Krick the gnome begged for his life: what they sought lay in the master''s lair beyond Tyrannus, in the Halls of Reflection, where Frostmourne held the truth. Then Tyrannus struck him down from above.', 'Pit of Saron spawns (map 658); Pit of Saron quests 24461, 24559, 24683; creature_text 36477, 36990, 36993'),
(481300, 2, 0, 255, 'Jaina blamed herself for the men the Scourgelord took: whenever she thinks her guilt over Arthas cannot go any deeper, he proves her wrong.', 'Pit of Saron spawns (map 658); Pit of Saron quests 24461, 24559, 24683; creature_text 36477, 36990, 36993'),
(481300, 3, 0, 255, 'Quel''Delar was reforged at the forgemaster''s anvil with the pit''s infused saronite, though the Blood-Queen Lana''thel had proclaimed it could not be done.', 'Pit of Saron spawns (map 658); Pit of Saron quests 24461, 24559, 24683; creature_text 36477, 36990, 36993'),
(481301, 1, 0, 255, 'The freed slaves'' leader began to swear that no foe could stand when Alliance and Horde set aside their differences, and the frost wyrm Sindragosa cut him and his people down before he could finish.', 'Pit of Saron quests 24710, 24712; creature_text 36658, 36794, 37580, 37581, 36993, 36990');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(481300, 1, 4813, 0),
(481301, 3, 36658, 0),
(481301, 4, 24710, 0),
(481301, 4, 24712, 0),
(481300, 3, 36476, 1),
(481300, 5, 24683, 2),
(481300, 5, 24461, 3),
(481300, 5, 24559, 3),
(481301, 3, 36658, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(481300, 21018, 0),
(481300, 481301, 1),
(481300, 408013, 2),
(481301, 481300, 0),
(481301, 92000005, 1),
(481301, 482000, 2);

-- Ragefire Chasm
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 243700 AND 243799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 243700 AND 243799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 243700 AND 243799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 243700 AND 243799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(243700, 0, 2437, 0, 0, 0, 'Ragefire Chasm', 'Ragefire Chasm is a network of volcanic caverns beneath Orgrimmar, entered from the Cleft of Shadow in the heart of the city. Lava lights its tunnels and molten elementals walk the burning paths. Troggs have come up from deep below and swarm the lower caves under their chieftain Oggleflint, and beyond them the halls belong to the Searing Blade, a cult of orc warlocks and enforcers with a demon among them.', '', 'warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic), official description (a network of volcanic caverns below the orcs'' capital of Orgrimmar); entrance in the Cleft of Shadow beside Neeru Fireblade''s tent; route: elementals, troggs, more elementals, then the Searing Blade; Taragaman in the middle of a lava lake, Jergosh ahead of him, Bazzalan up a side walkway directly above Jergosh; classic Oggleflint in his own cave off the main path (moved only in 4.0.3a); orgrimmar.json 163700 and 163704 (the caverns under the city, the entrance in the Cleft), pointed to in one phrase; areatrigger_teleport 2230 (entrance lands at 4,-15 z-18); zones/ragefire_chasm.txt (map 389: 2437 only); DB spawns map 389: Molten Elemental 11321 x13 (x -36 to -252) and Earthborer 11320 x11 (display 11010, Worm model at scale 0.5) along the way; Ragefire Trogg 11318 x29 and Ragefire Shaman 11319 x14 in the lower caves (z -39 to -64); Oggleflint 11517 at -148,39 z-39; Searing Blade Cultist 11322 x29, Enforcer 11323 x21 and Warlock 11324 x10 in the northern halls (y 86 to 265, OrcMale displays); Taragaman 11520 at -245,150 z-19 (FelGuard model at scale 1.5); Jergosh 11518 at -377,209 z-22; Bazzalan 11519 at -385,146 z8 (Satyr model); creature_equip_template 11323 Enforcer (spiked mace 3361, small metal shield 2052), 11322 Cultist (dagger 10619), 11324 Warlock (staff 12937); smart_scripts base and module (dungeon_ragefire_chasm.sql): Shaman Lightning Bolt 9532 and Healing Wave; Cultist Curse of Agony 18266; Enforcer Shield Slam 8242; Warlock Summon Voidwalker 12746 out of combat (flag 1, not repeatable) and Shadow Bolt; quests 5761 (Neeru), 5725 and 14356 (the Undercity), 5722 and 5723 (Thunder Bluff), as premises only; creature 11517 Oggleflint, subname Ragefire Chieftain, single spawn on map 389 at -148,39 z-39; display 11611, Troglodyte model at scale 1.0 (Ragefire Trogg 11609 at 0.85, Ragefire Shaman 11610 at 0.7); faction 59 like the troggs; creature_equip_template 11517 (3350 Monster - Item, Bone); warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic) (classic Oggleflint in his original cave, off the main path); quest 5725 description (a sect of the Shadow Council hidden in caverns below Orgrimmar known as the Searing Blade; members have come into possession of two powerful spell books) and log text (Spells of Shadow and Incantations from the Nether); module QuestCompletionLog: Varimathras at the Royal Quarter; AllowableRaces 690, QuestType 2, flags 16392 (8 sharable plus 16384 QUEST_FLAGS_UNAVAILABLE, a client flag the core does not check); quest 14356 description (deep in Ragefire Chasm, a sect of the Shadow Council called the Searing Blade; two books in their possession; bring them to me directly) and log text (the same two books); QuestCompletionLog: Bragor Bloodfist at the Royal Quarter; AllowableRaces 690, QuestType 2, flags 8; creature_loot_template 11322 Searing Blade Cultist and 11324 Searing Blade Warlock: items 14395 and 14396 (quest required); dropped by no other creature; Ragefire quests 5722, 5723, 5728'),
(243701, 2, 2437, 0, 0, 0, 'Taragaman the Hungerer', 'Taragaman the Hungerer is a felguard, a demon of the Burning Legion, who stands in the midst of a lake of lava in the Searing Blade''s halls. Neeru Fireblade names him the cult''s leader. The Warchief charged Neeru with rooting out whatever brings demonic taint into the city, and Neeru sends those he trusts down into the chasm to kill him.', '', 'creature 11520, single spawn on map 389 at -245,150 z-19 (Searing Blade spawns around him at z-25, e.g. -264,150; -284,144; -284,153); display 7970, FelGuard model at scale 1.5; faction 554 (the Searing Blade''s); creature_equip_template 11520 (11321 Monster - Sword2H, Horde Massive); warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic) (Taragaman, a felguard, in the middle of a lava lake); quest 5761 description (a Felguard named Taragaman the Hungerer)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(243700, 1, 0, 255, 'Magatha Grimtotem sought peace with the troggs, but they killed her diplomats. One of her servants, Maur, found something in the chasm and never came out with it.', 'warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic), official description (a network of volcanic caverns below the orcs'' capital of Orgrimmar); entrance in the Cleft of Shadow beside Neeru Fireblade''s tent; route: elementals, troggs, more elementals, then the Searing Blade; Taragaman in the middle of a lava lake, Jergosh ahead of him, Bazzalan up a side walkway directly above Jergosh; classic Oggleflint in his own cave off the main path (moved only in 4.0.3a)'),
(243700, 2, 0, 255, 'The Searing Blade keeps two books of spells, gifts of the Legion to its followers, and the Undercity wants them out of the cult''s hands and in its own.', 'warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic), official description (a network of volcanic caverns below the orcs'' capital of Orgrimmar); entrance in the Cleft of Shadow beside Neeru Fireblade''s tent; route: elementals, troggs, more elementals, then the Searing Blade; Taragaman in the middle of a lava lake, Jergosh ahead of him, Bazzalan up a side walkway directly above Jergosh; classic Oggleflint in his own cave off the main path (moved only in 4.0.3a)'),
(243700, 3, 0, 255, 'The Searing Blade is Neeru Fireblade''s own sect of the Shadow Council. Thrall had its leaders, the satyr Bazzalan and the warlock Jergosh, killed without Neeru learning who did it.', 'warcraft.wiki.gg/wiki/Ragefire_Chasm_(Classic), official description (a network of volcanic caverns below the orcs'' capital of Orgrimmar); entrance in the Cleft of Shadow beside Neeru Fireblade''s tent; route: elementals, troggs, more elementals, then the Searing Blade; Taragaman in the middle of a lava lake, Jergosh ahead of him, Bazzalan up a side walkway directly above Jergosh; classic Oggleflint in his own cave off the main path (moved only in 4.0.3a)'),
(243701, 1, 0, 255, 'Neeru took the felguard''s heart into his own keeping, promising it would be dealt with as it should be, and went to carry word of the victory to Thrall himself.', 'creature 11520, single spawn on map 389 at -245,150 z-19 (Searing Blade spawns around him at z-25, e.g. -264,150; -284,144; -284,153); display 7970, FelGuard model at scale 1.5; faction 554 (the Searing Blade''s)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(243700, 1, 2437, 0),
(243701, 3, 11520, 0),
(243701, 4, 5761, 0),
(243700, 4, 5722, 1),
(243700, 4, 5723, 1),
(243700, 5, 5725, 2),
(243700, 5, 14356, 2),
(243700, 5, 5728, 3),
(243701, 5, 5761, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(243700, 243701, 0),
(243700, 90000039, 1),
(243700, 163704, 2),
(243701, 243700, 0),
(243701, 90000039, 1),
(243701, 90000065, 2);

-- Razorfen Downs
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 72200 AND 72299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 72200 AND 72299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 72200 AND 72299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 72200 AND 72299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(72200, 0, 722, 0, 0, 0, 'Razorfen Downs', 'Razorfen Downs lies deep in the Razorfen at the southern edge of the Barrens, entered through the great maw the quilboar hold to be their boar god''s own. It was long the chief city of the quilboar. Now the dead hold it: withered quilboar risen from their own kind guard its bramble halls, skeletons and ghouls crowd the paths further in, and Death''s Head necromancers walk among them. Near the entrance fires burn at a great idol, and the deeper one goes the colder the air.', '', 'warcraft.wiki.gg/wiki/Razorfen_Downs_(Classic), official description (crafted from the same vines as the Kraul; the traditional capital city of the quilboar; their high priests the Death''s Head; the lich Amnennar the Coldbringer has taken control and turned the maze of thorns into a bastion of undead might); barrens.json 1722 (the Downs'' entrance as Agamaggan''s maw), pointed to in one phrase; areatrigger_teleport 442 (entrance lands at 2592,1107 z51); zones/razorfen_downs.txt (map 129: 722 only); DB spawns map 129 (faction 152 throughout): Withered Warrior 7327, Spearhide 7332, Withered Battle Boar 7333, Death''s Head Geomancer 7335 near the entrance and the idol (x 2550 to 2600, y 940 to 1070); Withered Reaver 7328 x11, Quilguard 7329 x18, Death''s Head Necromancer 7337 x10 in the middle reaches; Splinterbone skeletons 7343-7346, Skeletal Frostweaver 7341 and Summoner 7342, Boneflayer and Thorn Eater Ghouls 7347/7348, Frozen Soul 7352 and Freezing Spirit 7353 in the western reaches toward Amnennar 7358 at 2403,961 z55; creature_template type: Withered quilboar 6 (undead), Death''s Head Geomancer and Necromancer 7 (humanoid, the living); displays QuillBoarWarrior (Withered) and QuillBoarCaster (Death''s Head); smart_scripts base and module: Geomancer Fireball 9053 and Flame Spike; Necromancer Bone Armor 11445 and Shadow Bolt 9613 in both (the module adds an out-of-combat Summon Skeletal Servant, so servants are not claimed); gameobjects 151951 Idol Oven Fire, 151952 Idol Cup Fire x2, 151973 Idol Mouth Fire at 2582-2587,937-942; quest 3525 (an idol near the entrance); quests 3636 and 3341 (Stormwind and the Undercity send for Amnennar) and 3525 (captives from the Barrens), as premises only; quest 6522 description and quest 14352 description (the same letter: My Lady; the opportunity to take the Barrens and the lands beyond; aid meaning the freedom to take action in the area; great power, shared with those wise enough to join us; I will remain outside Razorfen Downs; Ambassador Malcin); both AllowableRaces 690, QuestType 2, flags 0; item 17008 Small Scroll starts 6522; item 49205 Small Scroll starts 14352; creature_loot_template 4421 (Charlga) drops 49205 for the Horde (conditions 1/4421/49205, team 67); mod-individual-progression zone_undercity.sql replaces it with 17008 (same condition); quest 6522 and 14352 log text (take the Small Scroll to the Undercity; module 6522 text: to Varimathras in the Undercity); razorfen_kraul.json 49103 notes (the scroll left to this file); quest 6626 description (the Forsaken do not pass on their illness; this diplomat seems to be granting undeath to would-be followers; I am beginning to think he is one of the Scourge; my concern is the growing ranks around him; they creep from the shadows daily; not powerful enough to fight them on my own) and log text (Razorfen Battleguard, Razorfen Thornweavers, Death''s Head Cultists; Myriam Moonsinger near the entrance to Razorfen Downs); AllowableRaces 0, QuestType 2, flags 8; creature 12866 Myriam Moonsinger on map 1 at -4802,-2344 (display 12964, NightElfFemale), outside the Downs; Ambassador Malcin 12865 stands about 70 yards away at -4847,-2294; barrens.json 1722 (the night elf watcher and the undead diplomat), pointed to in one phrase'),
(72203, 2, 722, 0, 0, 0, 'Amnennar the Coldbringer', 'Amnennar the Coldbringer is a lich, and he rules the Downs. The quilboar there have made a pact with the Scourge, and their boar god''s resting place, long held pure, has become a stronghold of the dead. He keeps his seat on a height deep within, a shell of frost about him, and names himself the hand of the Lich King.', '', 'creature 7358, single spawn on map 129 at 2403,961 z55 (Glutton 8567 patrols at z24 below); display 7971, Lich model; type 6; smart_scripts 7358 base and module: Frost Armor 12556 on reset; warcraft.wiki.gg/wiki/Razorfen_Downs_(Classic) official description (the lich Amnennar has taken control of the quilboar); quests 3636 and 3341 (he rules the quilboar of the Downs); stormwind.json 151907 (Benedictus names him), not retold; creature 7357, single spawn on map 129 at 2467,671 z63 (the pens at 2562-2605,693-765); display 8055, SkeletonNaked model at scale 2.0; type 6; creature_text 7357 groups 0 (We will enslave the quilboar), 1 (We will spread across this barren land), 2 (Soon, the Scourge will rule the world), type 12 say; smart_scripts 7357 (base; not touched by the module): out of combat every 36 seconds says lines 0, 1 and 2'),
(72204, 2, 722, 0, 0, 0, 'Belnistrasz', 'Belnistrasz was a prisoner of the quilboar, held in their pens deep in the Downs with a Stormwind cook and an ogre. He is not from these parts, he says, and among his kind an oathstone is a bond of agreement. He cares nothing for Horde or Alliance, only for threats to all the races, and the deal the Scourge has made with the quilboar is one.', '', 'quest 3523 description (thanks for rescuing me; given myself up for dead, or worse, as a meal for these Scourge-infested vermin; the Scourge have brokered some sort of deal with the quilboar, and this nightmare is a result; rather than flee, make a difference; it is probably dangerous) and log text (hand the Oathstone he gave you back to him); AllowableRaces 0, QuestType 2, flags 0; creature 8516, single spawn on map 129 at 2611,731 beside Holding Pen 157817; display 7851 (HumanMale); ScriptName npc_belnistrasz; gameobjects 157816-157820 Holding Pen (type 0, door) at 2562-2605, 693-765 z55; creature 8516 Belnistrasz at 2611,731 (display 7851, HumanMale), 8696 Henry Stern at 2603,706 (display 8029, HumanMale), 8767 Sah''rhee at 2567,686 (display 11573, OgreMage), each beside a pen; all faction 35; npc_text 2155 (Sah''rhee: Thank you, little $r; gossip menu 1490), not told: only the captive is shown; waypoint_data 871710 (Belnistrasz''s escort from the pens west and round past the gong hall at 2537-2548,874-894 to the idol at 2575,950): the pens lie beyond the gong and the idol from the entrance; Withered Reaver 7328 and Quilguard 7329 at 2534-2546,739-751; quest 3525 description (near the entrance is an idol that functions as a macabre oven; they literally consume their abductees from the Barrens; shut down the idol and bind them from using it again; escort me; I will barely be able to communicate, let alone defend myself; if they take me down it is all over) and log text; AllowableRaces 0, QuestType 2, flags 2, PrevQuestID 3523; gameobjects 151951 Idol Oven Fire, 151952 Idol Cup Fire, 151973 Idol Mouth Fire at 2582-2587,937-942; entrance at 2592,1107');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(72200, 1, 0, 255, 'Outside the maw a night elf, Myriam Moonsinger, watches an undead diplomat. The Forsaken do not pass on their illness, she reasons, so this one must be of the Scourge.', 'warcraft.wiki.gg/wiki/Razorfen_Downs_(Classic), official description (crafted from the same vines as the Kraul; the traditional capital city of the quilboar; their high priests the Death''s Head; the lich Amnennar the Coldbringer has taken control and turned the maze of thorns into a bastion of undead might)'),
(72200, 2, 0, 255, 'A letter on the crone Charlga''s body, signed by Ambassador Malcin, offered her the Barrens and the lands beyond in return for freedom to act there. It was carried to the Undercity.', 'warcraft.wiki.gg/wiki/Razorfen_Downs_(Classic), official description (crafted from the same vines as the Kraul; the traditional capital city of the quilboar; their high priests the Death''s Head; the lich Amnennar the Coldbringer has taken control and turned the maze of thorns into a bastion of undead might)'),
(72200, 3, 0, 255, 'Malcin, a plagued servant of the Lich King, was slain where he waited outside the Downs, and the Scourge''s bid for a foothold on Kalimdor was halted.', 'warcraft.wiki.gg/wiki/Razorfen_Downs_(Classic), official description (crafted from the same vines as the Kraul; the traditional capital city of the quilboar; their high priests the Death''s Head; the lich Amnennar the Coldbringer has taken control and turned the maze of thorns into a bastion of undead might)'),
(72203, 1, 0, 255, 'In the Undercity Andrew Brownell says the lich steers the quilboar''s every move by the power of his mind, and holds a direct link of thought to Ner''zhul himself.', 'creature 7358, single spawn on map 129 at 2403,961 z55 (Glutton 8567 patrols at z24 below); display 7971, Lich model; type 6'),
(72203, 2, 0, 255, 'Not all of the dead here call the quilboar allies. The skeleton Mordresh Fire Eye boasted that the Scourge would enslave them and spread across this barren land.', 'creature 7358, single spawn on map 129 at 2403,961 z55 (Glutton 8567 patrols at z24 below); display 7971, Lich model; type 6'),
(72204, 1, 0, 255, 'The idol near the entrance is an oven, where the quilboar consume the captives they carry off from the Barrens. Belnistrasz means to shut it down for good by a ritual.', 'quest 3523 description (thanks for rescuing me; given myself up for dead, or worse, as a meal for these Scourge-infested vermin; the Scourge have brokered some sort of deal with the quilboar, and this nightmare is a result; rather than flee, make a difference; it is probably dangerous) and log text (hand the Oathstone he gave you back to him); AllowableRaces 0, QuestType 2, flags 0'),
(72204, 2, 0, 255, 'When the idol''s fires went out, Belnistrasz was gone. In the brazier he left, a great red dragon filled the mind, and his voice said his faith in mortals had been renewed.', 'quest 3523 description (thanks for rescuing me; given myself up for dead, or worse, as a meal for these Scourge-infested vermin; the Scourge have brokered some sort of deal with the quilboar, and this nightmare is a result; rather than flee, make a difference; it is probably dangerous) and log text (hand the Oathstone he gave you back to him); AllowableRaces 0, QuestType 2, flags 0');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(72200, 1, 722, 0),
(72203, 4, 3636, 0),
(72203, 4, 3341, 0),
(72203, 3, 7358, 0),
(72204, 4, 3523, 0),
(72200, 4, 6626, 1),
(72200, 4, 6522, 2),
(72200, 4, 14352, 2),
(72200, 5, 6521, 3),
(72200, 5, 14353, 3),
(72203, 4, 3341, 1),
(72203, 3, 7357, 2),
(72204, 4, 3525, 1),
(72204, 5, 3525, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(72200, 90000044, 0),
(72200, 90000006, 1),
(72200, 1722, 2),
(72203, 90000006, 0),
(72203, 72200, 1),
(72203, 72204, 2),
(72204, 72200, 0),
(72204, 90000079, 1),
(72204, 72203, 2);

-- Razorfen Kraul
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 49100 AND 49199;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 49100 AND 49199;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 49100 AND 49199;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 49100 AND 49199;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(49100, 0, 491, 0, 0, 0, 'Razorfen Kraul', 'Razorfen Kraul is a warren of the quilboar burrowed deep into the Razorfen, the great thorn mass at the southern edge of the Barrens that they hold to be the body of their fallen boar god. Its tunnels wind through living bramble and down into a trench where great boars roam. The Razorfen tribe holds it under the crone Charlga Razorflank, and somewhere within they keep the captives they have dragged in from the plains.', '', 'warcraft.wiki.gg/wiki/Razorfen_Kraul_(Classic), the original official description (Agamaggan fell in the War of the Ancients; his blood raised the thorns; the quilboar hold these regions sacred; the Razorfen at their heart; Kraul conquered by the old crone Charlga Razorflank); the Scourge line of that description is left out (Razorfen Downs owns it); barrens.json 1722 (the Razorfen as the body of Agamaggan), pointed to in one phrase; areatrigger_teleport 244 (entrance at 1943,1545 z82); zones/razorfen_kraul.txt (map 47: 491 only); DB spawns map 47: Razorfen Quilguard 4436 x10, Defender 4442 x19, Handler 4530, Beast Trainer 4531, Beastmaster 4532, Geomancer 4520, Earthbreaker 4525 (faction 152); Agam''ar 4511 x15, Raging Agam''ar 4514 x15 at z 55 to 58; Kraul Bat 4538 x13, Greater Kraul Bat 4539 x6 around 2121,1964; Death''s Head Acolyte 4515, Adept 4516, Sage 4518, Seer 4519 (faction 154) with Aggem Thorncurse 4424 and Jargba 4428 around 2080 to 2190, 1410 to 1530; Death''s Head Ward Keeper 4625 x2 at the ward 21099; Death''s Head Priest 4517 x4 at 2178 to 2193, 1836 to 1862 z58-60, below Charlga 4421 at 2190,1864 z79; quests 1102, 1109, 1221 (premises only, as reasons to go in); creature 4508 Willix and 4510 Heralath at 2194,1792 and 2187,1789; page_text 1211 (Snufflenose Owner''s Manual: the trench area of Razorfen Kraul) and creature_text 4508 groups 3 and 7 (There''s blueleaf tuber in this trench; Glad to be out of that wretched trench), for the name; DB spawns map 47: Agam''ar 4511 x15 (avg 2111,1737 z55), Raging Agam''ar 4514 x15 (2077,1735 z58), Rotting Agam''ar 4512 at z55 to 64, Blood of Agamaggan 4541 x4 at z48 to 62; Charlga 4421 at z79 and the halls around at z72 to 86; smart_scripts 4512 (Cursed Blood 8267: lowers the Intellect of nearby enemies), 4514 (Frenzy 8269 at 40 percent), 4541 (Curse of Blood 8282); not touched by the module; CreatureDisplayInfo: 4541 uses the Slime model; Agam''ar the Boar model; Razorfen Handler 4530 (z80), Beast Trainer 4531 (z74), Beastmaster 4532 (z77)'),
(49102, 1, 491, 0, 0, 0, 'The Bat Roosts', 'Beyond the trench, at the far end of the warren, dim hollows open beneath the bramble where the Kraul bats roost. They hang in the dark in great numbers and drop on anything that stirs below, and the greater ones loose a shriek that chokes off any spell. They are a breed found nowhere else.', '', 'DB spawns map 47: Kraul Bat 4538 x13 (avg 2121,1964 z63), Greater Kraul Bat 4539 x6 (2116,1987 z64), Blind Hunter 4425 at 2201,1978 z57; display 1955/1954/4735, FelBat model; warcraft.wiki.gg/wiki/Razorfen_Kraul_(Classic) lists Blind Hunter as a rare spawn; smart_scripts 4538 (Shock 12553), 4539 (Sonic Burst 8281, Spell.dbc: damage to nearby enemies, preventing them from spellcasting), base and module; quest 1109 (QuestSortID 1717, AllowableRaces 690, QuestType 2, flags 8)'),
(49103, 2, 491, 0, 0, 0, 'Charlga Razorflank', 'Charlga Razorflank, the Crone, rules Razorfen Kraul. She is old and a caster of great power, and from her seat on a height near the heart of the warren she musters the army the Razorfen has been gathering. Her own tribe fills the halls around her, but the guards at the foot of her height are priests of the Death''s Head.', '', 'creature 4421 Charlga Razorflank, subname The Crone, single spawn on map 47 at 2190,1864 z79; display 4642, QuillBoarCaster model; faction 152 (Razorfen); warcraft.wiki.gg/wiki/Razorfen_Kraul_(Classic), the original official description (the Kraul conquered by the old crone Charlga Razorflank); Death''s Head Priest 4517 x4 at 2178 to 2193, 1836 to 1862, z58 to 60; smart_scripts 4517 (Heal, Power Word: Fortitude, Shadow Bolt); quest 1102 description (the crone, Charlga Razorflank, who musters a foul army from within Razorfen Kraul; bring me Razorflank''s heart); barrens.json 1722 and thunder_bluff.json 163814 tell Auld''s grievance, pointed to in a phrase'),
(49106, 2, 491, 0, 0, 0, 'The Death''s Head', 'Not every quilboar in the Kraul is of the Razorfen. Those who name themselves the Death''s Head keep halls of their own under the prophet Aggem Thorncurse and their captain, Death Speaker Jargba, and their priests strike with shadow and their adepts with frost, where the tribe''s shamans call on earth. They guard the crone''s height, and keep a monstrous boar, Agathelos, penned behind a ward. For whom they speak, the Kraul does not tell.', '', 'creature 4424 Aggem Thorncurse, subname Death''s Head Prophet, single spawn on map 47 at 2082,1464 z73; display 6097, QuilBoar model at scale 1.5 (Death''s Head Priest 1.0, Acolyte 1.15, Adept 1.3); smart_scripts 4517 Death''s Head Priest (Shadow Bolt 9613), 4516 Adept (Frostbolt 9672, Chains of Ice 113: locks the target in place), base and module; Razorfen Geomancer, Earthcaller Halmgar, Roogug (Lightning Bolt, Summon Earth Rumbler); creature 4428 Jargba at 2146,1411, about 85 yards away; Death''s Head Acolytes 4515 and Adepts 4516 around 2116 to 2192, 1414 to 1528; creature 4428 Death Speaker Jargba, subname Death''s Head Captain, single spawn on map 47 at 2146,1411 z74; display 4644, QuillBoarWarrior model at scale 1.5; Death''s Head Acolyte 4515 at 2141,1414; smart_scripts 4428 base and module: Shadow Bolt 9613, Dominate Mind 14515 (Spell.dbc: takes control of a humanoid enemy); creature 4422 Agathelos the Raging, single spawn on map 47 at 1994,1976 z63 with waypoint path 874860 (pacing to 2017,2003); display 2450, Boar model at scale 3.0 (Raging Agam''ar 2453 at 1.5, Agam''ar 1.3 to 1.5); gameobject 21099 ward (door, spawn state 1, closed) at 2060,2016 z62; Death''s Head Ward Keeper 4625 x2 at 2069,2015 and 2064,2009 (smart_scripts: Quillboar Channeling 7083 out of combat); Ward Guardian 4427 x2 (faction 152) at 2067,1999 and 2077,2009; warcraft.wiki.gg/wiki/Agathelos_the_Raging (boar penned by quilboar guards who maintained a field)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(49100, 1, 0, 255, 'Among the captives a night elf, Heralath Fallowbrook, lies dying. He sent the dwarf Lonebrow to warn Falfindel, and his last plea is for his wife in Darnassus.', 'warcraft.wiki.gg/wiki/Razorfen_Kraul_(Classic), the original official description (Agamaggan fell in the War of the Ancients; his blood raised the thorns; the quilboar hold these regions sacred; the Razorfen at their heart; Kraul conquered by the old crone Charlga Razorflank); the Scourge line of that description is left out (Razorfen Downs owns it)'),
(49102, 1, 0, 255, 'The Royal Apothecary Society wants their guano for one of its most ambitious works, and Master Apothecary Faranell was delighted to have it.', 'DB spawns map 47: Kraul Bat 4538 x13 (avg 2121,1964 z63), Greater Kraul Bat 4539 x6 (2116,1987 z64), Blind Hunter 4425 at 2201,1978 z57; display 1955/1954/4735, FelBat model; warcraft.wiki.gg/wiki/Razorfen_Kraul_(Classic) lists Blind Hunter as a rare spawn'),
(49103, 1, 0, 255, 'The southern Barrens were holy land to the tauren, who lived there for generations until the quilboar and others drove them off. Auld Stonespire of Thunder Bluff cannot forgive it, and wants her heart.', 'creature 4421 Charlga Razorflank, subname The Crone, single spawn on map 47 at 2190,1864 z79; display 4642, QuillBoarCaster model; faction 152 (Razorfen)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(49100, 1, 491, 0),
(49102, 3, 4538, 0),
(49102, 3, 4539, 0),
(49103, 3, 4421, 0),
(49103, 4, 1102, 0),
(49106, 3, 4424, 0),
(49106, 3, 4428, 0),
(49106, 3, 4422, 0),
(49100, 4, 1142, 1),
(49102, 4, 1109, 1),
(49102, 5, 1109, 1),
(49103, 4, 1102, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(49100, 90000044, 0),
(49100, 1722, 1),
(49100, 49103, 2),
(49102, 49100, 0),
(49102, 90000004, 1),
(49103, 49100, 0),
(49103, 49106, 1),
(49103, 90000042, 2),
(49106, 49103, 0),
(49106, 90000044, 1),
(49106, 49100, 2);

-- The Ruby Sanctum
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 498700 AND 498799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 498700 AND 498799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 498700 AND 498799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 498700 AND 498799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(498700, 0, 4987, 0, 0, 17, 'The Ruby Sanctum', 'The Ruby Sanctum is the red dragonflight''s sanctum beneath Wyrmrest Temple, the chamber where it keeps its eggs, and it has fallen. Its guardians lie slain, Charscale invokers, assaulters and elites of the black dragonkin hold its grounds, and from a bluff above, their general oversees the whole assault while fires burn across the sanctum''s sacred groves and the bodies of the slain red dragons.', '', 'Ruby Sanctum spawns (map 724); Ruby Sanctum quest 26013; creature_text 40429'),
(498701, 2, 4987, 0, 0, 17, 'Halion', 'Halion, the Twilight Destroyer, is the true leader of the assault on the Ruby Sanctum, a full-grown twilight dragon who fights in the physical realm and the twilight realm at once. He is the light and the darkness, he proclaims, and the herald of a new age of destruction.', '', 'Ruby Sanctum quest 26034; creature_text 39863, 40142');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(498700, 1, 0, 255, 'Xerestrasza, the last of its guardians, held out barred inside a tree. The black dragonkin appeared from thin air, she said, slaughtered her brethren with cold efficiency, and seemed most interested in the eggs.', 'Ruby Sanctum spawns (map 724); Ruby Sanctum quest 26013; creature_text 40429'),
(498701, 1, 0, 255, 'Not since Dargonax, Xerestrasza says, has a full-grown spawn of Sinestra''s twisted experiments been seen in the world. This was no reckless attack.', 'Ruby Sanctum quest 26034; creature_text 39863, 40142'),
(498701, 2, 0, 255, 'He named his master as he fought: he was the herald of Deathwing. Dying, he told his killers to relish their victory, for the world would burn with the master''s return.', 'Ruby Sanctum quest 26034; creature_text 39863, 40142'),
(498701, 3, 0, 255, 'At the name of Deathwing, Krasus''s eyes went wide. The news of the Destroyer was troubling beyond words, and he had much to discuss with the Accord.', 'Ruby Sanctum quest 26034; creature_text 39863, 40142');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(498700, 1, 4987, 0),
(498701, 3, 39863, 0),
(498701, 3, 40142, 0),
(498701, 4, 26034, 0),
(498700, 5, 26013, 1),
(498701, 4, 26034, 1),
(498701, 3, 39863, 2),
(498701, 3, 40142, 2),
(498701, 5, 26034, 3);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(498700, 6509, 0),
(498700, 90000079, 1),
(498700, 498701, 2),
(498701, 498700, 0),
(498701, 90000078, 1),
(498701, 90000024, 2);

-- Ruins of Ahn'Qiraj
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 342900 AND 342999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 342900 AND 342999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 342900 AND 342999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 342900 AND 342999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(342900, 0, 3429, 0, 0, 4, 'Ruins of Ahn''Qiraj', 'The Ruins of Ahn''Qiraj are the outer city behind the Scarab Wall, opened at last. Silithid swarm its terraces and the Hatchery, and the qiraji army musters on the General''s Terrace under its commanders. Soldiers of the Cenarion Circle and the night elves have followed the opening of the gates inside, and fight the insects among the ruins of the city their forebears sealed a thousand years ago.', '', 'creature_text 15341, 15471'),
(342901, 2, 3429, 0, 0, 4, 'General Rajaxx', 'General Rajaxx commands the qiraji army in the ruins, and he has waited a thousand years behind barred doors for his vengeance. Staghelm will whimper and beg for his life, he promises, just as his whelp of a son did. Lieutenant General Andorov''s kaldorei have orders from on high to destroy him.', '', 'creature_text 15341, 15471; Andorov gossip 7048'),
(342902, 2, 3429, 0, 0, 4, 'Ossirian the Unscarred', 'Ossirian the Unscarred is the guardian of the ruins, set to protect the city at all costs. He calls the sands of the desert to rise and blot out the sun, and the crystals of the ruins renew his powers whenever they fail. Commander Mar''alith of Cenarion Hold wants his head.', '', 'creature_text 15339; quest 8791');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(342901, 1, 0, 255, 'Dying, Rajaxx warned his killers that their meddling had a price: the master was nearly whole, and when he rose, their world would cease.', 'creature_text 15341, 15471; Andorov gossip 7048'),
(342902, 1, 0, 255, 'Ossirian died admitting that he had failed, and the people of Kalimdor were told that a terrible menace had been laid to rest.', 'creature_text 15339; quest 8791');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(342900, 1, 3429, 0),
(342901, 3, 15341, 0),
(342901, 2, 15471, 0),
(342902, 3, 15339, 0),
(342902, 4, 8791, 0),
(342901, 3, 15341, 1),
(342902, 3, 15339, 1),
(342902, 5, 8791, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(342900, 90000061, 0),
(342900, 137714, 1),
(342900, 91000033, 2),
(342901, 137708, 0),
(342901, 165708, 1),
(342901, 90000061, 2),
(342902, 342900, 0),
(342902, 137705, 1),
(342902, 90000061, 2);

-- Scarlet Monastery
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 79600 AND 79699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 79600 AND 79699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 79600 AND 79699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 79600 AND 79699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(79600, 0, 796, 0, 0, 0, 'Scarlet Monastery', 'The Scarlet Monastery stands in the hills of northeastern Tirisfal, above the gardens where the Scarlet Crusade keeps its watch. Before the plague it was a house of Lordaeron''s faithful, where paladins trained and scholars studied. The Crusade made it a fortress and its great seat in the glades. Four ways lead in from the vestibule: to the graveyard, the library, the armory and the cathedral. Commander Mograine leads its soldiers, but its true master is said to be High Inquisitor Whitemane.', '', 'warcraft.wiki.gg/wiki/Scarlet_Monastery_(original): northeast corner of Tirisfal Glades; a seminary taken by the Crusade after the Third War; the pre-Cataclysm official description (once a proud bastion of Lordaeron''s priesthood, a center for learning and enlightenment; converted into a stronghold of the Crusade; outsiders seen as potential carriers of the plague; Scarlet Commander Mograine commands a large garrison of fanatically devoted warriors; the true master is High Inquisitor Whitemane, a fearsome priestess); areatrigger_teleport 45, 610, 612, 614 (Graveyard, Cathedral, Armory, Library entrances on map 189) and 602-608 (exits to the Grand Vestibule at 2870-2914,-802 to -822 on map 0); WMOAreaTable 28971-28973 The Grand Vestibule (WMO 60, area 796); creature_text 4283-4303, 4540 (The Light condemns all who harbor evil. Now you will die!; You carry the taint of the Scourge), said on aggro (20 percent) by the Scarlet trash of every wing, base and module (the module gives the same lines to 4280-4285); tirisfal.json 8514 Whispering Gardens (the gardens and the Terrace of Repose up to the doors), pointed to in one clause; quest 1113 (the Forsaken''s Faranell), 1048/14355 (the Undercity''s order), 1050 and 1951 (books sought from Ironforge and Dustwallow) as premises only; quest 1052 description (strongholds from Hearthglen to Tirisfal Glades; bastions of cleansing throughout Lordaeron; proven against the undead in Desolace; the true threat of the plague lies in Lordaeron; Raleigh the Devout in Southshore; letter of commendation bearing my seal; escort you to a place of honor in our Scarlet Monastery); objectives (take Brother Anton''s Letter of Commendation to Raleigh); item 5539 Letter of Commendation (sealed by Brother Anton of the Scarlet Crusade); quest_template 1052: AllowableRaces 1101, QuestType 2, Flags 0, QuestSortID 405 (Desolace), PrevQuestID 261; creature_queststarter 1182 Brother Anton; desolace.json 40526 Brother Anton (TALK 1182), pointed to in the first clause; quest 1113 description (two diametrically opposed chemical substances combined with an ever-toxic agent; the most ghastly results; the Scarlet Monastery in the northeastern peaks of Tirisfal Glades; the crazed disciples congregate both inside and outside the halls; which you slay matters not) and objectives (20 Hearts of Zeal); AllowableRaces 690, QuestType 2, Flags 8, PrevQuestID 1109; creature_queststarter/questender 2055 Master Apothecary Faranell (base, guid 31900; the module puts him in phase III) and, with the module, 102055 (phase II, zone_undercity.sql creature_queststarter list includes 1113), so the quest is reachable in every state; razorfen_kraul.json 49102 (quest 1109, the guano), undercity.json 149705 Faranell, pointed to in a phrase; quest 1050 description (the future is inevitable; by studying the past we can know what to expect; before dire troubles fell upon Lordaeron, a bastion of knowledge tucked away in Tirisfal Glades; Mythology of the Titans rumored housed in the library of the old Monastery; together unlock the secrets of the past) and objectives (bring it to Librarian Mae Paledust in Ironforge); AllowableRaces 1101, QuestType 2, Flags 8; creature 3979 Librarian Mae Paledust (Explorers'' League), map 0 area 1537 Ironforge; quest_template 1050 completion log (the Hall of Explorers in Ironforge)'),
(79601, 1, 796, 0, 0, 0, 'The Graveyard', 'The Graveyard wing begins in the Chamber of Atonement, a cruel name. Scarlet torturers work there among undead captives, urging them to confess and be set free, though one admits he does not care what is said: he simply enjoys inflicting pain. Beyond lies the Forlorn Cloister, where restless spirits drift between the graves, and at its far end stairs lead down into the crypts of Honor''s Tomb.', '', 'WMOAreaTable 21379 Chamber of Atonement, 21385-21391 Honor''s Tomb, 21392 Forlorn Cloister (WMO 1629, the Graveyard), 3.3.5 DBC: shown as minimap subzone names; warcraft.wiki.gg/wiki/Scarlet_Monastery_(original) lists the same three for the Graveyard; creature 4306 Scarlet Torturer x12 at 1751-1808,1118-1170 next to the entrance (areatrigger 45 lands at 1689,1053); creature 6547 Suffering Victim x2 at 1757,1146 and 1794,1145 among them, display 1027 (ScourgeMale model), faction 68; creature_text 4306 (Confess and we shall set you free; You will talk eventually; What? Oh no, I don''t care what you have to say. I just enjoy inflicting pain): base smart_scripts 4306 say group 0 on aggro (20 percent); module dungeon_scarlet_monastery.sql says group 0 out of combat every 60 to 180 seconds and gives the same lines to the Scarlet Scryers 4293 it pools with the torturers (pools 601001-601007); creature 3983 Interrogator Vishas at 1787,1124 among the torturers; creature 4308 Unfettered Spirit x43 (Ghost model), 6426 Anguished Dead x13 (Zombie models), 6427 Haunting Phantasm x6 (Shade model) at 1739-1854,1244-1434'),
(79602, 1, 796, 0, 0, 0, 'The Library', 'The Library wing runs through the Huntsman''s Cloister, where Houndmaster Loksey keeps the hounds the Crusade uses to hunt its enemies, to the Gallery of Treasures and the Athenaeum. The books laid out there are histories of the world, from the War of the Ancients to the troll wars, and in the farthest hall Arcanist Doan, a mage of the Crusade, keeps the histories of the Scourge.', '', 'WMOAreaTable 21420/21425/21427 Gallery of Treasures, 21426/21435/21438 Athenaeum, 21444 Huntsman''s Cloister (WMO 1631, the Library); warcraft.wiki.gg/wiki/Scarlet_Monastery_(original) lists the same three for the Library; creature spawns on map 189: entrance (areatrigger 614) at 255,-209; Scarlet Gallant 4287 x21 at 154-271,-223 to -313; Beastmaster 4288 x4 and Tracking Hound 4304 x7 at 120-201,-230 to -276; Monk 4540 x17, Chaplain 4299 x8, Diviner 4291 x16 at 174-280,-302 to -445; gameobjects type 9 (readable books) on map 189: 175727 The War of the Ancients, 175730 The World Tree and the Emerald Dream, 175734 Arathor and the Troll Wars (239-275,-306 to -432); 175754 Kel''Thuzad and the Forming of the Scourge (146,-445), 175761 Civil War in the Plaguelands (148,-413), 175749 Icecrown and the Frozen Throne (161,-440), 175756 The Scourge of Lordaeron (219,-424); Arcanist Doan 6487 at 148,-429; chairs 176665-176693 at the tables; warcraft.wiki.gg/wiki/Houndmaster_Loksey (the captain in charge of training the hounds the Crusade used to track down its enemies); creature 3974 at 120,-261 with Scarlet Tracking Hounds 4304 at 121-124,-258 to -261 beside him, more hounds and Beastmasters 4288 at 167-201,-230 to -276; Library entrance at 255,-209 (areatrigger 614); Doan 6487 at 148,-429; creature_equip_template 3974 two one-handed axes 5286; warcraft.wiki.gg/wiki/Arcanist_Doan (human mage of the Crusade; keeper of the Scarlet Monastery''s library); creature 6487 at 148,-429, MovementType 2 (walks a path); books 175754, 175761, 175749 at 146-161,-413 to -445; gameobject 103821 Doan''s Strongbox at 132,-433 (lock 43); Monk 4540 and Chaplain 4299 spawns around; creature_equip_template 6487 staff 2177; display 5266 HumanMale'),
(79603, 1, 796, 0, 0, 0, 'The Armory', 'The Armory wing is where the Crusade drills and arms its soldiers, through the Training Grounds, the Footman''s Armory and the Crusader''s Armory, among crates of armor and weapons. At the far end a heavy door opens on the Hall of Champions, where plaques honor the order''s heroes and its living champion, Herod, waits with a great axe.', '', 'WMOAreaTable 21448/21449/32248 Hall of Champions, 21455 Footman''s Armory, 21457 Training Grounds, 21460 Crusader''s Armory (WMO 1632, the Armory); warcraft.wiki.gg/wiki/Scarlet_Monastery_(original) lists the same four; creature spawns on map 189 from the entrance (areatrigger 612, 1611,-323): Scarlet Soldier 4286 x17, Conjuror 4297, Guardsman 4290 x7, Protector 4292 x11, Evoker 4289 x4, Myrmidon 4295 x13, Defender 4298 x13 at 1630-1932,-334 to -440; gameobjects 3703 Armor Crate (1772,-377) and 3704 Weapon Crate (1745,-358); gameobject 101854 Herod''s Door at 1934,-432 (lock 299); Herod 3975 at 1965,-432; gameobjects 175771-175781 (type 9 plaques) at 1945-1988,-409 to -455 around Herod, page_text 2151-2178: Orman of Stromgarde, the first Captain General, lost at the mouth of Icecrown Glacier; Admiral Barean Westwind, Grand Admiral of the Scarlet Fleet, lost off the Frozen Coast of Northrend; Ferren Marcus, High Abbot of the Scarlet Monastery, killed defending it at the First Summertide Assault; Fellari Swiftarrow lost in the forests of Silverpine; Dorgar Stoenbrow last seen in the Mountains of Alterac; Valea Twinblades last seen deep in the Eastern Plaguelands; Harthal Truesight last seen entering Stratholme; others (Arellas Fireleaf, Holia Sunshield, Invar One-Arm, Yana Bloodspear); warcraft.wiki.gg/wiki/Herod (The Scarlet Champion; Hall of Champions in the Armory); creature_template 3975 subname The Scarlet Champion; creature 3975 at 1965,-432 among plaques 175771-175781; display 2041 HumanMale at scale 1.3; creature_equip_template 3975 two-handed axe 7612'),
(79604, 1, 796, 0, 0, 0, 'The Cathedral', 'The Cathedral wing is the heart of the monastery. Its way leads through the Chapel Gardens to the doors of the Crusader''s Chapel, and its guards are the order''s best, for this road leads to those who command the rest. Within the chapel abbots, monks and champions keep the nave, and at its far end Commander Mograine stands before the door of the High Inquisitor.', '', 'WMOAreaTable 21401-21417 Crusader''s Chapel, 21410/22063 Chapel Gardens (WMO 1630, the Cathedral); warcraft.wiki.gg/wiki/Scarlet_Monastery_(original) lists the same two; creature spawns on map 189 from the entrance (areatrigger 610, 856,1322): Sorcerer 4294, Myrmidon 4295, Defender 4298 at 865-1046; Wizard 4300 and Centurion 4301 at 909-1141; Chapel Door 104591 at 1070,1399; Abbot 4303, Monk 4540, Champion 4302, Chaplain 4299 at 1079-1167; Mograine 3976 at 1154,1398; gameobject 104600 High Inquisitor''s Door at 1173,1399; Whitemane 3977 at 1202,1399; gameobject 97700 Secret Door at 1168,1347 and 97701 Torch at 1169,1346; smart_scripts 97701 (source_type 1): on state change activate gameobject guid 11876 (the Secret Door); Fairbanks 4542 at 1159,1354; warcraft.wiki.gg/wiki/High_Inquisitor_Fairbanks (access through a torch on the wall)'),
(79605, 2, 796, 0, 0, 0, 'High Inquisitor Whitemane', 'High Inquisitor Whitemane is a priestess of the Light and, by every account, the true master of the Scarlet Monastery, a fearsome woman who directs the Crusade''s work from within its walls. She keeps to her chambers behind the Crusader''s Chapel. Scarlet Commander Mograine, who leads the monastery''s soldiers, guards her door, and no one reaches her except past him.', '', 'warcraft.wiki.gg/wiki/Sally_Whitemane (High Inquisitor, priestess of the Light, directed the Crusade''s activities from within the Cathedral); the pre-Cataclysm official description (the monastery''s true master, a fearsome priestess), quoted on warcraft.wiki.gg/wiki/Scarlet_Monastery_(original); creature 3977 at 1202,1399 behind gameobject 104600 High Inquisitor''s Door (1173,1399); Mograine 3976 at 1154,1398; display 2043 HumanFemale; creature_equip_template 3977 staff 28738; warcraft.wiki.gg/wiki/Scarlet_Commander_Mograine (Scarlet Commander, leads the Crusade''s forces in the monastery, Crusader''s Chapel); the pre-Cataclysm official description (commands a large garrison of fanatically devoted warriors); creature 3976 at 1154,1398; display 2042 HumanMale at scale 1.2; creature_equip_template 3976 two-handed mace 7706; gameobject 104600 High Inquisitor''s Door at 1173,1399; quest 1048 and 14355 descriptions and objectives (both: kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey); 1048: Tirisfal literally crawling with the little red ants; 14355: the Crusade a problem on the Forsaken''s borders; both AllowableRaces 690, QuestType 2 (1048 Flags 16392: 8 plus 0x4000 QUEST_FLAGS_UNAVAILABLE, which no core code reads; 14355 Flags 8); base world database: creature_queststarter/questender 2425 for 1048, but Varimathras 2425 has no creature spawn, so 1048 cannot be taken without the module; Bragor 36273 spawned (guid 31901, phaseMask 1) starts and ends 14355; mod-individual-progression zone_undercity.sql: removes 1048 from disables (it is not disabled in the base data); spawns Varimathras 2425 (guid 602425) in the Royal Quarter at phaseMask IPPPHASE_II and moves Bragor (31901) to IPPPHASE_III; adds 2425 and 36273 as enders of 14355 (no new starter for either quest); rewrites 14355''s log text to Varimathras and its description to the same Bragor text; IndividualProgression.cpp AREA_UNDERCITY: phase III once the Battle for the Undercity (Horde or Alliance) is rewarded, phase II before'),
(79610, 2, 796, 0, 0, 0, 'High Inquisitor Fairbanks', 'Behind a secret door off the Crusader''s Chapel, opened by a torch upon the wall, a hidden room keeps High Inquisitor Fairbanks from the chapel''s eyes. He bears the same title as the monastery''s mistress, but he is undead, one of the very dead the Crusade has sworn to destroy, and he fights for the Crusade still. Why he lingers in that hidden place, the monastery does not say.', '', 'creature 4542 at 1159,1354 z30, behind gameobject 97700 Secret Door (1168,1347) opened by 97701 Torch (smart_scripts 97701 activates guid 11876); creature_template 4542 type 6 (undead), faction 67 (the Scarlet Crusade''s, as for every Scarlet creature on map 189); display 2605 ScourgeMale model; creature_equip_template 4542 hammer 2182; warcraft.wiki.gg/wiki/High_Inquisitor_Fairbanks (in Classic and Wrath an undead hidden in a secret chamber in the Cathedral; access through a torch on the wall)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(79600, 1, 0, 255, 'Raleigh the Devout served the Crusade proudly until he watched the monastery''s zealots lose their hold on reality, counting anyone without the tabard as plagued and torturing innocents for it.', 'warcraft.wiki.gg/wiki/Scarlet_Monastery_(original): northeast corner of Tirisfal Glades; a seminary taken by the Crusade after the Third War; the pre-Cataclysm official description (once a proud bastion of Lordaeron''s priesthood, a center for learning and enlightenment; converted into a stronghold of the Crusade; outsiders seen as potential carriers of the plague; Scarlet Commander Mograine commands a large garrison of fanatically devoted warriors; the true master is High Inquisitor Whitemane, a fearsome priestess)'),
(79600, 2, 0, 255, 'Master Apothecary Faranell wants the hearts of the monastery''s zealots, to set against the guano of the Kraul bats, bound with a lasting poison. He expects horrific results.', 'warcraft.wiki.gg/wiki/Scarlet_Monastery_(original): northeast corner of Tirisfal Glades; a seminary taken by the Crusade after the Third War; the pre-Cataclysm official description (once a proud bastion of Lordaeron''s priesthood, a center for learning and enlightenment; converted into a stronghold of the Crusade; outsiders seen as potential carriers of the plague; Scarlet Commander Mograine commands a large garrison of fanatically devoted warriors; the true master is High Inquisitor Whitemane, a fearsome priestess)'),
(79602, 1, 0, 255, 'One of its books, Rituals of Power, came by a strange road: the Magus Tirth, a scholar ruined by ale and wagers, sold the last copy to one of the Scarlet clergy to pay his debts.', 'WMOAreaTable 21420/21425/21427 Gallery of Treasures, 21426/21435/21438 Athenaeum, 21444 Huntsman''s Cloister (WMO 1631, the Library); warcraft.wiki.gg/wiki/Scarlet_Monastery_(original) lists the same three for the Library'),
(79605, 1, 0, 255, 'When Mograine fell, Whitemane raised him from death with a word, and he rose at her side. The order sworn to purge the dead has a high inquisitor who calls them back.', 'warcraft.wiki.gg/wiki/Sally_Whitemane (High Inquisitor, priestess of the Light, directed the Crusade''s activities from within the Cathedral); the pre-Cataclysm official description (the monastery''s true master, a fearsome priestess), quoted on warcraft.wiki.gg/wiki/Scarlet_Monastery_(original)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(79600, 1, 796, 0),
(79601, 3, 4306, 0),
(79601, 3, 4308, 0),
(79601, 3, 6426, 0),
(79602, 3, 4287, 0),
(79602, 3, 4304, 0),
(79602, 3, 4291, 0),
(79603, 3, 4286, 0),
(79603, 3, 4292, 0),
(79603, 3, 4290, 0),
(79604, 3, 4294, 0),
(79604, 3, 4301, 0),
(79604, 3, 4303, 0),
(79605, 3, 3977, 0),
(79605, 3, 3976, 0),
(79610, 3, 4542, 0),
(79600, 4, 1053, 1),
(79600, 4, 1113, 2),
(79602, 4, 1951, 1),
(79605, 3, 3977, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(79600, 90000007, 0),
(79600, 8514, 1),
(79600, 79605, 2),
(79601, 79600, 0),
(79601, 90000007, 1),
(79602, 79600, 0),
(79602, 90000007, 1),
(79603, 79600, 0),
(79603, 90000007, 1),
(79604, 79605, 0),
(79604, 79610, 1),
(79604, 79600, 2),
(79605, 90000007, 0),
(79605, 79604, 1),
(79605, 79610, 2),
(79610, 79605, 0),
(79610, 90000007, 1),
(79610, 79604, 2);

-- Scholomance
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 205700 AND 205799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 205700 AND 205799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 205700 AND 205799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 205700 AND 205799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(205700, 0, 2057, 0, 0, 0, 'Scholomance', 'Scholomance lies in the vaults beneath Caer Darrow, once the seat of House Barov and now the school of necromancy where the Cult of the Damned was born, its capital in all but name. Instructors drill students in the dark arts, the dead of the island fill its halls, and the family that sold its house still haunts the rooms they lived in.', '', 'Scholomance quests 5529, 5531; creature_text 10432'),
(205701, 2, 2057, 0, 0, 0, 'Darkmaster Gandling', 'Darkmaster Gandling is the headmaster of Scholomance, master of its instructors and of every student in its halls. School is in session, he announces to intruders, and he moves them about the building at will, shutting them into rooms with the school''s restless dead.', '', 'creature_text 1853'),
(205702, 2, 2057, 0, 0, 0, 'Doctor Theolen Krastinov', 'Doctor Theolen Krastinov, the Butcher, is responsible for the deaths of thousands. When the Barovs turned, he took their servants for his experiments in devising a plague, kept them alive by magic for weeks of pain, and threw them at the last to his ghouls. The spirits of the butler and the head maid, Lucien and Eva Sarkhoff, want him destroyed.', '', 'Eva Sarkhoff gossip 3301-3310; quests 5382, 5515'),
(205703, 2, 2057, 0, 0, 0, 'Kirtonos the Herald', 'Kirtonos the Herald is the dark master the Butcher served, a winged horror appeased with the blood of innocents, the purest blood there is. He does not keep to the halls. Blood placed on the brazier on the school''s porch summons him, for he cannot resist it, and with that same blood he must be destroyed.', '', 'Scholomance quest 5384'),
(205704, 2, 2057, 0, 0, 0, 'Ras Frostwhisper', 'Ras Frostwhisper is a lich of Scholomance. As a human mage he pledged his undying soul to the Lich King, drew a dagger across his own throat inside a pentagram and smiled as he did it, and the Lich King raised him. A keepsake of his mortal life, the Argent Dawn says, can make him mortal again.', '', 'Scholomance quest 5466; Stratholme quest 5463; creature_text 10508'),
(205705, 2, 2057, 0, 0, 0, 'The Barovs', 'The Barovs ruled a far reaching empire from Caer Darrow, and to keep it beyond their own lifetimes they bargained with Kel''Thuzad. Their greed broke the dam. Lord Alexei, Lady Illucia and their daughter Jandice still walk the house, undead now, among the cult that took it from them.', '', 'Eva Sarkhoff gossip 3307, 3308; quests 5341, 5343');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(205700, 1, 0, 255, 'The Scourge breeds a plagued dragonflight here from black dragon eggs, and the instructor Vectus lectures his students on its care: torture the prisoner where the dragon can see.', 'Scholomance quests 5529, 5531; creature_text 10432'),
(205702, 1, 0, 255, 'Krastinov serves a master of his own, Kirtonos, and appeases him with the blood of innocents. Jandice Barov carries that blood from the Butcher to his master.', 'Eva Sarkhoff gossip 3301-3310; quests 5382, 5515'),
(205703, 1, 0, 255, 'With Kirtonos dead, the Sarkhoffs said, one chapter in the horrible tale of Scholomance came to a close, though there was more to be done.', 'Scholomance quest 5384'),
(205704, 1, 0, 255, 'When the ritual was done the lich cried that it could not be, and Ras died a mortal man. Ten thousand souls cry out in unison, Leonid Barthalomew said.', 'Scholomance quest 5466; Stratholme quest 5463; creature_text 10508'),
(205705, 1, 0, 255, 'Their sons, Alexi and Weldon, are the last heirs. Each sends adventurers after the family''s deeds, hidden in the ruins, before the other can claim the fortune.', 'Eva Sarkhoff gossip 3307, 3308; quests 5341, 5343');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(205700, 1, 2057, 0),
(205701, 3, 1853, 0),
(205702, 3, 11261, 0),
(205702, 4, 5382, 0),
(205703, 3, 10506, 0),
(205703, 4, 5384, 0),
(205704, 3, 10508, 0),
(205704, 4, 5466, 0),
(205705, 3, 10504, 0),
(205705, 3, 10502, 0),
(205705, 3, 10503, 0),
(205700, 4, 5529, 1),
(205700, 4, 5531, 1),
(205700, 3, 10432, 1),
(205702, 4, 5515, 1),
(205703, 5, 5384, 1),
(205704, 5, 5466, 1),
(205705, 4, 5341, 1),
(205705, 4, 5343, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(205700, 2804, 0),
(205700, 92000000, 1),
(205700, 90000006, 2),
(205701, 205700, 0),
(205701, 92000000, 1),
(205702, 2804, 0),
(205702, 205703, 1),
(205702, 205705, 2),
(205703, 205702, 0),
(205703, 205700, 1),
(205704, 201700, 0),
(205704, 90000006, 1),
(205705, 2804, 0),
(205705, 92000000, 1),
(205705, 205702, 2);

-- Serpentshrine Cavern
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 360700 AND 360799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 360700 AND 360799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 360700 AND 360799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 360700 AND 360799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(360700, 0, 3607, 0, 0, 9, 'Serpentshrine Cavern', 'Serpentshrine Cavern is the deepest hold of Coilfang Reservoir, a vast flooded cavern beneath Serpent Lake and the seat of Lady Vashj, matron of the Coilfang naga. Here the water drawn in from the bogs gathers, and honor guards drive the workers at the pumps, boasting that soon all of Draenor''s water will be theirs. Greyheart Broken serve the naga, Tidewalker murlocs crowd one shore, and Vashj''s lords hold the outer chambers.', '', 'zones/serpentshrine_cavern.txt (map 548: area 3607 only); DB spawns map 548: Vashj''ir Honor Guard 21218, Greyheart Technician 21263, Tidecaller 21229, Nether-Mage 21230 (Broken models), Coilfang Priestess 21220, Shatterer 21301, Serpentguard 21298, Fathom-Witch 21299, Tidewalker Warrior 21225, Shaman 21226, Harpooner 21227, Hydromancer 21228, Depth-Seer 21224 (murloc models), Underbog Colossus 21251, Serpentshrine Sporebat 21246, Coilfang Frenzy Corpse 21689; bosses 21216, 21215, 21214, 21213, 21212; gameobject 184956 Strange Pool; creature_text 21218 groups 1-3 (patrol lines: Steady the pumps; Keep those pumps working; The reservoir fills nicely; Soon all of Draenor''s water will be ours; Direct the flow from the western bog; Lady Vashj expects our work to be done soon), run by the honor guards'' patrol scripts; creature_template 21212 Lady Vashj, subname Coilfang Matron; instance_serpent_shrine.cpp (Coilfang Frenzies summoned around swimmers until the Lurker Below falls); creature_template 21216 (subname Duke of Currents, type 4, display 20162 WaterElemental); fixed spawn 153018, map 548 only; boss_hydross_the_unstable.cpp (out of combat he summons Tainted Water Elementals that walk to him, are purified and leave as Purified Water Elementals; Cleansing Field aura; leaving it applies Corruption); creature_text 21216 groups 0 (I cannot allow you to interfere!), 1 (Better, much better.), 4 (Aaghh, the poison...); gameobject 184956 Strange Pool (map 548), go_strange_pool in boss_lurker_below.cpp (fishing it summons The Lurker Below 21217); creature_template 21217 (display 20216, Krakken model); boss_lurker_below.cpp (Spout, Whirl, Geyser, Water Bolt; on submerging summons Coilfang Ambushers 21865 and Coilfang Guardians 21873); creature_text 21217 group 0 (takes a deep breath); creature_template 21214 (display 20662, Naga_Male); fixed spawn 153154, map 548 only; DB spawns map 548: Fathom-Guard Caribdis 21964 (female model), Tidalvess 21965, Sharkkis 21966 beside him; Seer Olum 22820 (display 21101, BrokenMale) and gameobject 185474 Cage at the same spot; boss_fathomlord_karathress.cpp (Cataclysmic Bolt, Sear Nova; Sharkkis summons a Fathom Lurker and Sporebat, Tidalvess drops totems and Frost Shock, Caribdis summons a cyclone, Water Bolt Volley and Healing Wave); creature_text 21214 group 0 (Guards, attention! We have visitors....); instance_serpent_shrine.cpp (Olum has no gossip or quests until freed); creature_template 21213 (type 5, display 20739 SeaGiant); fixed spawn 153169, map 548 only; DB spawns map 548: Tidewalker Warrior 21225, Shaman 21226, Harpooner 21227, Hydromancer 21228, Depth-Seer 21224 (murloc models); creature_text 21213 groups 0 (Flood of the deep, take you!), 1 (By the tides!; Destroy them, my subjects!), 6 (The violent earthquake has alerted nearby Murlocs!); boss_morogrim_tidewalker.cpp (Tidal Wave, Watery Grave, Earthquake followed by murloc summons with SAY_SUMMON)'),
(360703, 2, 3607, 0, 0, 9, 'Leotheras the Blind', 'Leotheras the Blind is a blood elf demon hunter held banished in Serpentshrine Cavern by three Greyheart spellbinders. He fights with twin blades, but he is not alone in his body: from time to time a demon takes him over, mocking the trifling elf it has cast aside. Near the end the elf cannot contain it, and it tears free as a shadow of its own.', '', 'creature_template 21215 (display 20514, BloodElfMale); fixed spawn 153139, map 548 only; smart_scripts 21806 (Greyheart Spellbinder: Green Beam out of combat, Banish in combat, on death checks the others; Leotheras wakes when none is left); boss_leotheras_the_blind.cpp (passive and kneeling until freed; SAY_AGGRO Finally, my banishment ends!; dual wield and Whirlwind; Metamorphosis with SAY_SWITCH_TO_DEMON Be gone, trifling elf. I am in control now!; Insidious Whisper with SAY_INNER_DEMONS We all have our demons....); warcraft.wiki.gg/wiki/Leotheras_the_Blind (blood elf demon hunter; kept banished by the Greyheart Spellbinders)'),
(360706, 2, 3607, 0, 0, 9, 'Lady Vashj', 'Lady Vashj is the matron of the Coilfang naga. Long ago she was one of the Highborne of ancient Kalimdor, a handmaiden to Queen Azshara, and she rose from the sea with her naga when Illidan Stormrage called on them; she has served him ever since. Water is life, she says, a rare thing in Outland that her people alone shall control, and the time has come for the Highborne to retake their rightful place in the world.', '', 'creature_template 21212 (subname Coilfang Matron, display 20748); fixed spawn 153195, map 548 only; creature_text 21212 group 0 (Water... is life. It has become a rare commodity here in Outland; a commodity that we alone shall control. We are the Highborne, and the time has come at last for us to retake our rightful place in the world!, said once when a player first comes into sight) and group 1 (Victory to Lord Illidan!); creature_text 17726, 17800 and others (Illidan reigns!); Warcraft III: The Frozen Throne (2003) and The Well of Eternity (2004): Vashj a Highborne handmaiden of Azshara, summoned with her naga by Illidan, his servant in Outland; warcraft.wiki.gg/wiki/Lady_Vashj');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(360700, 1, 0, 255, 'Hydross the Unstable, a lord of water, purifies the tainted spirits that come to him, but drawn out of his cleansing field the poison takes him at once.', 'zones/serpentshrine_cavern.txt (map 548: area 3607 only)'),
(360700, 2, 0, 255, 'Fathom-Lord Karathress kept a Broken, Seer Olum, caged at the edge of his chamber. When the fathom-lord died the cage swung open.', 'zones/serpentshrine_cavern.txt (map 548: area 3607 only)'),
(360700, 3, 0, 255, 'Morogrim Tidewalker, giant of the sea and lord of the murlocs here, died with words that meant nothing to those who heard them: great currents of Ageon.', 'zones/serpentshrine_cavern.txt (map 548: area 3607 only)'),
(360706, 1, 0, 255, 'She made her last stand at the heart of her platform behind a barrier fed by four shield generators, and died with an apology to her master: Lord Illidan, I am sorry.', 'creature_template 21212 (subname Coilfang Matron, display 20748); fixed spawn 153195, map 548 only');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(360700, 1, 3607, 0),
(360703, 3, 21215, 0),
(360706, 3, 21212, 0),
(360700, 3, 21216, 1),
(360700, 3, 21214, 2),
(360700, 3, 21213, 3),
(360706, 3, 21212, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(360700, 360706, 0),
(360700, 90000055, 1),
(360700, 352121, 2),
(360703, 360700, 0),
(360703, 92000009, 1),
(360706, 92000009, 0),
(360706, 90000055, 1),
(360706, 90000057, 2);

-- The Sethekk Halls
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 379100 AND 379199;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 379100 AND 379199;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 379100 AND 379199;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 379100 AND 379199;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(379100, 0, 3791, 0, 0, 8, 'The Sethekk Halls', 'The Sethekk Halls are the wing of Auchindoun held by the Sethekk, a sect of arakkoa who have made the draenei ruins their temple. Their priests, oracles and talon lords fill the vaulted halls, crying out in Terokk''s name and sworn to protect the Veil. Some of them seem faded, lost out of time, and dark hawks and cobalt serpents answer to their call.', '', 'Auchindoun quests 10097, 10098; item 32888 page 3029; creature_text 18318-18328'),
(379101, 2, 3791, 0, 0, 8, 'Darkweaver Syth', 'Darkweaver Syth is one of the leaders of the Sethekk, a caster who calls elementals of fire, frost, shadow and arcane to fight for him and cackles over his nice pets. In a cage in his halls he keeps his own sister, Lakka, who begs anyone passing to kill him so that she can go free.', '', 'Auchindoun quests 10097, 10098; Lakka gossip 7868; creature_text 18472, 18956'),
(379102, 2, 3791, 0, 0, 8, 'Talon King Ikiss', 'Talon King Ikiss rules the Sethekk from the innermost hall, an arakkoa lord whose eyes light up at trinkets: there is power in them, he cackles, great power, and woe to anyone who comes near his own. When pressed he gathers arcane force enough to fill his hall.', '', 'Auchindoun quest 10098; item 32888 page 3029; creature_text 18473'),
(379103, 2, 3791, 0, 0, 8, 'Anzu', 'Anzu is the raven god of arakkoa legend, a great dark bird. Called back into the world at the Raven''s Claw in the Sethekk Halls, he cries for his children to awaken and assist their master, and croaks that the spells cast at him are weak magics, easy to turn against their casters.', '', 'druid quests 10994, 11001; creature_text 23035');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(379100, 1, 0, 255, 'The exile Isfar says the Sethekk marched out of Skettis with great fanfare when Auchindoun exploded, sure it was an omen of their master''s arrival, and took up the ruins to face their god.', 'Auchindoun quests 10097, 10098; item 32888 page 3029; creature_text 18318-18328'),
(379100, 2, 0, 255, 'They carried away from Skettis the relics of Terokk, the ancient king who vanished long ago: his mask, his quill and his saga, cherished by every arakkoa.', 'Auchindoun quests 10097, 10098; item 32888 page 3029; creature_text 18318-18328'),
(379100, 3, 0, 255, 'Restored to Isfar, the relics will go home to Skettis. By returning them he hopes to begin to atone for his part in the crimes of the Sethekk.', 'Auchindoun quests 10097, 10098; item 32888 page 3029; creature_text 18318-18328'),
(379101, 1, 0, 255, 'His brother Isfar came to doubt Syth and his ally Ikiss. Syth had him cast out of the halls, but would not let Lakka go with him.', 'Auchindoun quests 10097, 10098; Lakka gossip 7868; creature_text 18472, 18956'),
(379101, 2, 0, 255, 'In the Sethekk rituals Syth wore the mask of Terokk himself, one of the relics his people carried away from Skettis.', 'Auchindoun quests 10097, 10098; Lakka gossip 7868; creature_text 18472, 18956'),
(379101, 3, 0, 255, 'Lakka is free and bound for Shattrath. Isfar cannot forgive himself his brother''s death, and will perform the death rites for him in Skettis, so that his spirit may atone.', 'Auchindoun quests 10097, 10098; Lakka gossip 7868; creature_text 18472, 18956'),
(379102, 1, 0, 255, 'Ikiss carries the quill of Terokk as a sign of his authority, and Isfar believes he does it to convince his followers that he is Terokk reborn.', 'Auchindoun quest 10098; item 32888 page 3029; creature_text 18473'),
(379103, 1, 0, 255, 'To the druids of the Cenarion Refuge he is an enemy in the Emerald Dream. A moonstone infused with the essences of three bird spirits can lure him out, if he believes his followers have gathered to welcome him back into the world.', 'druid quests 10994, 11001; creature_text 23035');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(379100, 1, 3791, 0),
(379101, 3, 18472, 0),
(379101, 4, 10097, 0),
(379101, 2, 18956, 0),
(379102, 3, 18473, 0),
(379102, 4, 10098, 0),
(379103, 3, 23035, 0),
(379103, 4, 11001, 0),
(379100, 4, 10097, 1),
(379100, 4, 10098, 2),
(379100, 5, 10098, 3),
(379101, 4, 10097, 1),
(379101, 4, 10098, 2),
(379101, 5, 10097, 3),
(379102, 4, 10098, 1),
(379103, 4, 11001, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(379100, 90000067, 0),
(379100, 351923, 1),
(379100, 351916, 2),
(379101, 379100, 0),
(379101, 379102, 1),
(379101, 90000067, 2),
(379102, 379100, 0),
(379102, 379101, 1),
(379102, 351923, 2),
(379103, 379100, 0),
(379103, 90000067, 1),
(379103, 90000048, 2);

-- The Shadow Labyrinth
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 378900 AND 378999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 378900 AND 378999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 378900 AND 378999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 378900 AND 378999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(378900, 0, 3789, 0, 0, 8, 'The Shadow Labyrinth', 'The Shadow Labyrinth is the deepest wing of Auchindoun, a maze of halls the Shadow Council has taken for its own. Cabal cultists, assassins and warlocks crowd its passages crying out in Sargeras'' name, fel overseers drive tortured skeletons at their labor, and at the labyrinth''s mouth ritualists stand chanting around a demon held in banishment. Somewhere deeper in, the cabal keeps watch over what it called.', '', 'Auchindoun quests 10177, 10178; Shadow Labyrinth quest 10091; creature_text 18631-18830, 18731; boss_ambassador_hellmaw.cpp (banished until the Cabal Ritualists die)'),
(378901, 2, 3789, 0, 0, 8, 'Blackheart the Inciter', 'Blackheart the Inciter is one of the Shadow Council''s lords in the Shadow Labyrinth, a preacher of ruin who swears that all flesh must burn and all creation be unmade. His voice is his weapon: with a burst of laughter he can set companions at one another''s throats.', '', 'Auchindoun quest 10649; creature_text 18667; boss_blackheart_the_inciter.cpp (Incite Chaos, Laughter)'),
(378902, 2, 3789, 0, 0, 8, 'Grandmaster Vorpil', 'Grandmaster Vorpil leads the Shadow Council in the labyrinth, and he keeps his followers'' minds on the days of reckoning: soon, he preaches, the destroyer of worlds will return to make good on his promise, and the destruction of all that is will begin. Void portals open around him at his call, and he gives his life gladly for the cause.', '', 'creature_text 18732; boss_grandmaster_vorpil.cpp (void portals, Void Travelers)'),
(378903, 2, 3789, 0, 0, 8, 'Murmur', 'Murmur waits at the heart of the Shadow Labyrinth, the being the Shadow Council called into Auchindoun: a vast shape of living sound, held in place by beams of containment and drawing energy out of the very air around it.', '', 'Auchindoun quests 10094, 10095; Codex of Blood gossip 7984-7990 (npc_text 9834-9840); creature_text 18708');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(378900, 1, 0, 255, 'The spymistress of the Lower City has agents inside. Their reports say the Shadow Council has gone onto a war footing, and that its preparations face inward, not out.', 'Auchindoun quests 10177, 10178; Shadow Labyrinth quest 10091; creature_text 18631-18830, 18731; boss_ambassador_hellmaw.cpp (banished until the Cabal Ritualists die)'),
(378900, 2, 0, 255, 'The bound demon was Ambassador Hellmaw. Freed when his wardens fell, he railed at the infidels who had invaded the sanctuary, and died warning his killers not to grow overconfident.', 'Auchindoun quests 10177, 10178; Shadow Labyrinth quest 10091; creature_text 18631-18830, 18731; boss_ambassador_hellmaw.cpp (banished until the Cabal Ritualists die)'),
(378900, 3, 0, 255, 'Spy To''gun, caged deep in the maze, says the cabal fed his fellow spies to Hellmaw. It is bent on summoning powers it cannot control, and makes its soul shards stronger with special devices.', 'Auchindoun quests 10177, 10178; Shadow Labyrinth quest 10091; creature_text 18631-18830, 18731; boss_ambassador_hellmaw.cpp (banished until the Cabal Ritualists die)'),
(378901, 1, 0, 255, 'The Book of Fel Names, the artifact that gave the demon hunter Varedis his power, is said to be in Blackheart''s keeping. Altruis the Sufferer calls it the only hope of standing against Varedis.', 'Auchindoun quest 10649; creature_text 18667; boss_blackheart_the_inciter.cpp (Incite Chaos, Laughter)'),
(378903, 1, 0, 255, 'The Codex of Blood names Murmur the essence of sound, born beyond mortal minds; to hear it speak is death eternal. Summoners on another world once bound it with souls caught in their soul devices, lost control, and only the book survived.', 'Auchindoun quests 10094, 10095; Codex of Blood gossip 7984-7990 (npc_text 9834-9840); creature_text 18708'),
(378903, 2, 0, 255, 'The Shadow Council has lost control of it. Its summoning caused the explosion of Auchindoun and the Bone Wastes, and with the grandmaster and the cabal''s leaders dead, it threatens to break free.', 'Auchindoun quests 10094, 10095; Codex of Blood gossip 7984-7990 (npc_text 9834-9840); creature_text 18708'),
(378903, 3, 0, 255, 'The Lower City''s spymistress could only wonder what the cabal did wrong after holding it for two years. Had it broken free, she said, all of Outland would have paid.', 'Auchindoun quests 10094, 10095; Codex of Blood gossip 7984-7990 (npc_text 9834-9840); creature_text 18708');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(378900, 1, 3789, 0),
(378901, 3, 18667, 0),
(378901, 4, 10649, 0),
(378902, 3, 18732, 0),
(378903, 3, 18708, 0),
(378903, 5, 10094, 0),
(378903, 4, 10095, 0),
(378900, 4, 10177, 1),
(378900, 3, 18731, 2),
(378900, 4, 10091, 3),
(378901, 4, 10649, 1),
(378903, 5, 10094, 1),
(378903, 4, 10095, 1),
(378903, 4, 10095, 2),
(378903, 5, 10095, 3);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(378900, 90000062, 0),
(378900, 351916, 1),
(378900, 378903, 2),
(378901, 378900, 0),
(378901, 352016, 1),
(378901, 90000062, 2),
(378902, 378900, 0),
(378902, 90000062, 1),
(378902, 90000065, 2),
(378903, 378900, 0),
(378903, 90000062, 1),
(378903, 351912, 2);

-- Shadowfang Keep
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 20900 AND 20999;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 20900 AND 20999;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 20900 AND 20999;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 20900 AND 20999;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(20900, 0, 209, 0, 0, 0, 'Shadowfang Keep', 'Shadowfang Keep crowns the heights above Pyrewood Village in southern Silverpine. It was the seat of Baron Silverlaine until the worgen loosed on the forest laid siege to it, and the keep fell into shadow and ruin. Now it belongs to the archmage Arugal, who brought them. He keeps to the top of its tower, the worgen he calls his sons prowl its halls, and the ghosts of its servants, guardsmen and officers still walk the rooms they kept in life.', '', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official World Dungeons description (the worgen besieged Baron Silverlaine''s keep above Pyrewood, which fell into shadow and ruin; Arugal adopted the worgen as his children and retreated there; protected by his massive pet Fenrus; haunted by the vengeful ghost of Baron Silverlaine); silverpine.json 13000 and 13025 (Arugal and the worgen, Shadowfang above Pyrewood), pointed to, not retold; creature_text 4275 group 0 (Who dares interfere with the Sons of Arugal?); DB spawns map 33: Son of Arugal 2529 x8 in the tower, Shadowfang Whitescalp 3851, Moonwalker 3853, Ragetooth 3859, Darksoul 3855, Glutton 3857; DB spawns map 33: Haunted Servitor 3875 x19, Wailing Guardsman 3877 x10, Tormented Officer 3873 x6 (all undead ghosts); Fenrus the Devourer 4274 at -136,2169 z129 in the tower; Archmage Arugal 4275 at -77,2152 z156; creature 3914 Rethilgore, The Cell Keeper, at -252,2123 z81 beside the cells, near the entrance (areatrigger_teleport 145 lands at -229,2109 z77); gameobject 18895 Courtyard Door; quest 1098 description (deathstalkers sent to the keep, not returned); quest 1013 description (the Book of Ur in Shadowfang Keep, great mage of Dalaran; Keeper Bel''dugur in the Undercity); zones/shadowfang_keep.txt (map 33: 209 only); quest 1098 description and log text (deathstalkers sent to gather intelligence for an assault on Shadowfang; not returned after many days; find Adamant and Vincent and aid them; as dangerous as it is critical); AllowableRaces 690, QuestType 2, Flags 8, QuestSortID 209; creature 1952 High Executor Hadrec starts 1098 (silverpine.json 13017, TALK 1952, tells him; this file takes only quest 1098); creature 4444 Deathstalker Vincent ends it'),
(20901, 1, 209, 0, 0, 0, 'The Cells', 'Just inside the keep''s gate a row of barred cells serves Arugal as a prison, kept by a worgen called Rethilgore. Three prisoners wait behind the bars. Ashcrombe is a sorcerer the Kirin Tor sent to learn how Arugal''s war on the undead was going, never guessing the wizard had lost his mind. Adamant is a Forsaken deathstalker, and Landen Stilwell begs to be left alone before his sickness takes him again.', '', 'DB spawns map 33: Rethilgore 3914 at -252,2123 z81 (display 524, worgen); Shadowfang Whitescalp 3851 at -247,2136, -243,2129, -247,2115; Sorcerer Ashcrombe 3850 at -241,2123 by Cell Door 18936; Deathstalker Adamant 3849 at -244,2114 by Cell Door 18934; Landen Stilwell 17822 at -239,2133 by Cell Door 18935; Levers 18900, 18901, 101811 at z83 beside them; areatrigger_teleport 145 (the entrance lands at -229,2109 z77, a few yards from the cells); gameobject 18895 Courtyard Door (guid 20835), opened only by the prisoners'' scripts 384900 and 385000 or by instance data TYPE_COURTYARD; warcraft.wiki.gg/wiki/Shadowfang_Keep_(original) (map caption Jail; Ashcrombe human, Adamant Forsaken, Landen Stilwell human); quest 9692 description and log text (the blood-tempered ranseur; a Crate of Bloodforged Ingots among the materials); StartItem 24223 Bloodvalor''s Notes; AllowableRaces 512 (blood elf), AllowableClasses 2 (paladin), QuestType 2, Flags 128, follows 9691; page_text 2932 (bloodforged ingots a superior material, a well-kept secret; rumor that any smith who handles the metal becomes cursed, proven false by our craftsmen; the Forsaken sent word of a supply in Shadowfang Keep; Landen Stilwell smuggled a crate in; not known where; held prisoner in the keep''s dungeon; use any means); creature 17822 Landen Stilwell, single spawn on map 33 by Cell Door 18935; gameobject 182011 Crate of Ingots, single spawn at -207,2245 z80 in the stables; gameobject_loot 18672 holds item 24224; warcraft.wiki.gg/wiki/Landen_Stilwell (added in 2.0.3 for the Blood-Tempered Ranseur chain; he hid the ingots in the stables)'),
(20902, 1, 209, 0, 0, 0, 'The Courtyard', 'Past the cells a door opens on the courtyard at the heart of the keep. Moonwalkers prowl the yard, the spirits of the keep''s servants drift through it, and fel steeds stand in the stables at its far end. Off the yard lies the kitchen, where a worgen butcher holds sway, and beyond it the great hall and the floors above.', '', 'DB spawns map 33: Shadowfang Moonwalker 3853 x14 at z80-87 between y 2159 and 2250; Haunted Servitor 3875 (ghost) in the yard at -204,2214 and -222,2160; Fel Steed 3864 x3 at -234,2236, -224,2246, -217,2247 (the stables); page_text 875 (Jordan''s Weapon Notes: I left it in the stables in the main courtyard of the keep); gameobject 91138 Jordan''s Hammer and 182011 Crate of Ingots at -218,2237 and -207,2245, beside the fel steeds; gameobject 35593-35598 Roaring Fire at -221 to -213, 2258 to 2273 z77 (the kitchen); creature 3886 Razorclaw the Butcher at -203,2258 z76 (display 524, worgen); Haunted Servitors, Shadowfang Gluttons 3857 and Baron Silverlaine 3887 at z75-76 beyond the kitchen (y 2273 to 2297); Wailing Guardsmen and Commander Springvale 4278 on the upper floor (z101-103); warcraft.wiki.gg/wiki/Shadowfang_Keep_(original) (map captions Courtyard; Kitchen and Reception Hall); quest 1654 description and log text (Jordan will craft a weapon; Jordan''s Weapon Notes; Jordan''s Smithing Hammer among the items); StartItem 6996 Jordan''s Weapon Notes; AllowableRaces 1101, AllowableClasses 2 (paladin), QuestType 2, Flags 0; page_text 871 (thanks for saving his wife) and 874-875 (lived in Pyrewood before the plague; the keep where I learned the secret of steel; escaped with my wife; the hammer my father gave me, said to be enchanted, the last reminder of him before he was killed by the Scourge; left in the stables in the main courtyard); gameobject 91138 Jordan''s Hammer, single spawn on map 33 at -218,2237 z81; gameobject_loot 4275 holds item 6895; westfall.json (Daphne Stilwell, wife of the smith Jordan Stilwell), pointed to only'),
(20903, 2, 209, 0, 0, 0, 'Baron Silverlaine', 'Baron Silverlaine was lord of Shadowfang Keep when the worgen came to Silverpine. They besieged his home until it fell, and he did not live through it. His ghost keeps to the great hall, where the shades of his servants still drift, and it is said that his vengeful spirit haunts Arugal himself.', '', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official description (the worgen besieged Baron Silverlaine''s keep; it fell into shadow and ruin; Arugal is haunted by the vengeful ghost of Baron Silverlaine); creature 3887 Baron Silverlaine, single spawn on map 33 at -275,2297 z76; type 6 undead, ghost model 3222; DB spawns z75: Haunted Servitor 3875 x6 and Shadowfang Glutton 3857 x4 at -226 to -262, 2273 to 2297; gameobject 3695 Food Crate and 3659 Barrel of Melon Juice at -257,2249 and -233,2268; creature 4278 Commander Springvale, single spawn on map 33 at -223,2259 z103; type 6 undead, ghost model 3223; DB spawns: Wailing Guardsman 3877 at z92-103 (five at -222 to -260, 2238 to 2256 on his floor); Tormented Officer 3873 x6 at z97 on the wall walk; smart_scripts 4278 (Hammer of Justice, Holy Light, Divine Shield; the module: Holy Light, Divine Protection): paladin spells; warcraft.wiki.gg/wiki/Commander_Springvale checked: its lore (commander of Silverlaine''s troops, ghost avenging his lord) is cited to Exploring Azeroth: The Eastern Kingdoms (2020) and the Adventure Guide, so it is not used'),
(20907, 2, 209, 0, 0, 0, 'Archmage Arugal', 'Arugal was an archmage of the Kirin Tor who summoned the worgen to fight the Scourge, and when they turned on the living his mind broke. He took Shadowfang Keep, calls the worgen his children, and keeps to the topmost chamber of its tower behind his great wolf Fenrus and the wolf master Nandos. Those who reach him find a madman, and his curse can make a worgen of anyone who faces him.', '', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official description (Arugal adopted the worgen as his children and retreated to the keep; protected by Fenrus); silverpine.json 13000 (the archmage who summoned the worgen; calls them his children) and 13025, pointed to; creature 2529 Son of Arugal x8 in the tower; smart_scripts 2529 (Arugal''s Gift 7124, Spell.dbc: shadow damage over time; kept by the module); Shadowfang Whitescalp, Moonwalker, Ragetooth, Darksoul, Glutton across the keep; creature 4275 Archmage Arugal, single spawn at -77,2152 z156, beyond gameobject 18971 Arugal''s Lair; creature_text 4275 groups 0-1 (Who dares interfere with the Sons of Arugal?; You, too, shall serve!); gossip npc_text 798 (Ashcrombe: the wizard had lost his grasp on sanity); warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official description (Arugal is protected by his massive pet, Fenrus); creature 4274 Fenrus the Devourer, single spawn on map 33 at -136,2169 z129; type 1 beast, display 20180; DB spawns: Son of Arugal 2529 x8 at z94-145 and Lupine Horror 3863 at z94-113 in the tower; gameobject 18973 Arugal''s Focus at -146,2173 z151, above his chamber; 18972 Sorcerer''s Gate at -129,2166 z129; instance_shadowfang_keep.cpp (GO_SORCERER_DOOR opens once TYPE_FENRUS_THE_DEVOURER is done); creature 3927 Wolf Master Nandos, single spawn on map 33 at -121,2162 z156; display 11179; DB spawns z156 around him: Lupine Horror 3863 (guid 16238), Bleak Worg 3861 (16239), Slavering Worg 3862 (16240), Wolfguard Worg 5058 (16241); gameobject 18971 Arugal''s Lair (guid 33241) at -118,2162 z156; instance_shadowfang_keep.cpp (GO_ARUGAL_DOOR opens once TYPE_WOLF_MASTER_NANDOS is done); quest 1013 description and log text (the Book of Ur in Shadowfang Keep; Ur a great mage of Dalaran before the coming of the Scourge; his studies in other worlds of much value to certain parties among the Forsaken; I will report your service to our Dark Lady; Keeper Bel''dugur at the Apothecarium); creature 2934 Keeper Bel''dugur starts and ends 1013 (AllowableRaces 690, QuestType 2, Flags 8, QuestSortID 209); gameobject 36738 The Book of Ur, single spawn on map 33 at -155,2186 z131 (beside Fenrus''s chamber); gameobject_loot 3623 holds item 6283');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(20900, 1, 0, 255, 'The Forsaken sent two deathstalkers in to spy out the keep ahead of an assault. A ward of Arugal''s gave them away: Adamant was thrown in a cell, and Vincent was found dead.', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official World Dungeons description (the worgen besieged Baron Silverlaine''s keep above Pyrewood, which fell into shadow and ruin; Arugal adopted the worgen as his children and retreated there; protected by his massive pet Fenrus; haunted by the vengeful ghost of Baron Silverlaine)'),
(20901, 1, 0, 255, 'Landen Stilwell is a smith, curious enough to have smuggled a crate of the Blood Knights'' bloodforged ingots into the keep before he was taken, and no one knows where he hid it.', 'DB spawns map 33: Rethilgore 3914 at -252,2123 z81 (display 524, worgen); Shadowfang Whitescalp 3851 at -247,2136, -243,2129, -247,2115; Sorcerer Ashcrombe 3850 at -241,2123 by Cell Door 18936; Deathstalker Adamant 3849 at -244,2114 by Cell Door 18934; Landen Stilwell 17822 at -239,2133 by Cell Door 18935; Levers 18900, 18901, 101811 at z83 beside them'),
(20902, 1, 0, 255, 'Jordan Stilwell, now a smith in Ironforge, lived in Pyrewood before the plague and learned the secret of steel in this keep. Fleeing, he left his father''s hammer in the stables.', 'DB spawns map 33: Shadowfang Moonwalker 3853 x14 at z80-87 between y 2159 and 2250; Haunted Servitor 3875 (ghost) in the yard at -204,2214 and -222,2160; Fel Steed 3864 x3 at -234,2236, -224,2246, -217,2247 (the stables)'),
(20903, 1, 0, 255, 'His garrison stands to its duty still. Its commander, Springvale, holds the upper floor among the ghosts of his guardsmen, and the Light still answers the dead paladin''s call.', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official description (the worgen besieged Baron Silverlaine''s keep; it fell into shadow and ruin; Arugal is haunted by the vengeful ghost of Baron Silverlaine)'),
(20907, 1, 0, 255, 'The Book of Ur, found in the keep, describes the worgen as beasts of a dark place of nightmare, drawn into this world only by powerful magic. Ur hoped no wizard of Dalaran would ever seek them out.', 'warcraft.wiki.gg/wiki/Shadowfang_Keep_(original), official description (Arugal adopted the worgen as his children and retreated to the keep; protected by Fenrus)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(20900, 1, 209, 0),
(20901, 3, 3851, 0),
(20901, 2, 17822, 0),
(20901, 2, 3850, 0),
(20901, 2, 3849, 0),
(20902, 3, 3853, 0),
(20902, 3, 3864, 0),
(20903, 3, 3887, 0),
(20907, 3, 4275, 0),
(20907, 4, 1014, 0),
(20900, 5, 1098, 1),
(20901, 4, 9692, 1),
(20902, 4, 1654, 1),
(20903, 3, 4278, 1),
(20907, 5, 1013, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(20900, 91000007, 0),
(20900, 13013, 1),
(20900, 20907, 2),
(20901, 20900, 0),
(20901, 20907, 1),
(20902, 20900, 0),
(20902, 20901, 1),
(20903, 20900, 0),
(20903, 20907, 1),
(20907, 91000007, 0),
(20907, 20900, 1),
(20907, 90000020, 2);

-- Shadowmoon Valley
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 352000 AND 352099;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 352000 AND 352099;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 352000 AND 352099;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 352000 AND 352099;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(352000, 0, 3520, 0, 0, 8, 'Shadowmoon Valley', 'Shadowmoon Valley lies in the far southeast of Outland, a land of ash, black rock and rivers of fel lava under a smoky sky. The orcs of the Shadowmoon clan once honored their ancestors here, and the draenei raised the Temple of Karabor, one of their holiest sites. Both were lost: Gul''dan''s warriors took Karabor, and the warlock raised the volcano at the valley''s center in a ritual that severed the orcs from the elements. The temple is now Illidan Stormrage''s throne, and his servants hold the valley in his name.', '', 'warcraft.wiki.gg/wiki/Shadowmoon_Valley (clan named after the valley, ancestor worship, Temple of Karabor as spiritual capital, Hand of Gul''dan raised to sever the link to the elements, Black Temple as Shadow Council base, Illidan''s headquarters, settlements); quest 10642 description (ancestral grounds of the Shadowmoon orcs); quest 10635 description (Gul''dan''s Horde defeated the draenei of Karabor); npc_text 10250 (Torlok: Gul''dan severed the tie between orcs and spirits); quest 10568 description (Gul''dan raised the volcano); creature_template subnames ''Servant of Illidan'' on Ashtongue, Coilskar, Shadowmoon fel orcs; Eclipsion blood elves; quests 10562, 10595 (infernals from Legion Hold); warcraft.wiki.gg/wiki/Black_Temple (sacred draenei site; no coastal setting in BC)'),
(352001, 1, 3520, 0, 0, 8, 'Wildhammer Stronghold', 'Wildhammer Stronghold stands in the southwest of the valley, the fortress of Kurdran Wildhammer, thane of the Wildhammer in Outland, credited in the Second War with slaying nine dragons and mourned on Azeroth as dead for twenty years. Infernals fall on its walls from Legion Hold, and the ground itself is restless: the stronghold was built over the ancestral grounds of the Shadowmoon orcs, whose spirits, dormant for nearly twenty years, now wander its courtyards.', '', 'npc_text 10349 (Nuainn: the Legion on one side and Illidan''s minions on the other); quest 10562 description (Legion Hold to the northwest, men ragged and exhausted); quest 10642 description (ancestral grounds, spirits dormant nearly twenty years); quest 10643 (Shadowmoon harbingers infesting the stronghold); quests 10661, 10672 (Gnomus, food that cooks itself and stays hot; inventor of the arcano-scorps); npc_text 9805 (Kurdran holds audiences in the stronghold); zone_areas: Kurdran 21330, Nuainn 21357, Zorus 21774, Gnomus 21777 stand in area 3745; warcraft.wiki.gg/wiki/Kurdran_Wildhammer (Second War, Sky''ree, nine dragons, Gryphon Rider Division, stayed to ensure the Portal was sealed, presumed dead twenty years, Thane of Wildhammer Stronghold); npc_text 9805 (Eli Thunderstrike on Sky''ree and Kurdran''s audiences); quest 10744 reward text'),
(352002, 1, 3520, 0, 0, 8, 'Shadowmoon Village', 'Shadowmoon Village is the Horde''s outpost in the northwest of the valley, held by Overlord Or''barokh and the elite Kor''kron guard. It lives under the Legion''s guns, infernals raining on its walls from Legion Hold, and it is haunted as well: the chief apothecary warns that the land is full of ghosts, and crafts goggles to reveal the spirits drifting among the buildings.', '', 'quest 10595 description (Legion Hold to the southwest, the elite Kor''kron guard, every able-bodied fighter drafted); quests 10624, 10625 (Spectrecles, Shadowmoon Zealots in the village, Hildagard''s shock at Gorefiend''s name); quests 10660, 10672 (Tiorus, diemetradons, arcano control units crafted by Gnomus); quest 10678 description (Gnomus: Tiorus continued their research using MY inventions); zone_areas: Or''barokh 21769, Gulmok 21359, Hildagard 21772, Tiorus 21770, Kor''kron Defender, Shadowmoon Zealot 21788 in area 3744; quest 10624 description (the land is haunted; would you like to see them); quest 10595 description (elite Kor''kron guard); creature_text 21769 (What is it that you want from me, shaman? ... I do not have the soldiers to spare ... Pray to your gods); quests 10702, 10769 (grunt work; Tiorus''s concoction, Eclipsion Fields); quest 10750 description (word from his wind riders); quest 10745 reward text'),
(352003, 1, 3520, 0, 0, 8, 'Legion Hold', 'Legion Hold is the Burning Legion''s fortress in western Shadowmoon, where it stocks and prepares the infernals that pound both outposts. Between the outposts the Shadow Council works the Deathforge, a foundry where infernals are made as fast as the Legion can hurl them, and the hold''s mo''arg labor over a rare ore etched with glowing runes.', '', 'creature_text 21502 (Image of Warbringer Razuun: Kazzak will be pleased, destroy the orcish and dwarven strongholds) and 21633 (Deathbringer Jovaan); quest 10563 description (the Legion stocks its infernals at the hold); quest 10626 description (Makazradon and Morgroron equipped with anti-demon weapons); quests 10564, 10572 (fel reaver power core and wreckage at the Fetid Pool); quests 10589, 10604 (Invasion Point: Cataclysm, infernal staging area in the northern mountains, reached by a teleporter at Legion Hold); zone_areas: Terrormaster 21314, Shadow Council Warlock 21302, Morgroron 21500, Makazradon 21501 in 3743; Mutant Horror in 3940; Fel Reaver Sentinel 21949 in 3943; quests 10573, 10599 (Shadow Council producing infernals in the Deathforge; Deathforge Tower northwest of Wildhammer, Slag Watch southeast of the village); quests 10585, 10602 (summoning chamber below ground, elementals that form the core of the infernals; mo''arg smiths and tinkerers); quests 10582, 10600 (orders to observe, not engage); quests 10583, 10601; npc_text 10427 and 10446 (Flanis''s and Kagrosh''s corpses); quests 10562-10589, 10766, 10606, 10612, 10744 (Alliance chain); quests 10595-10604, 10767, 10611, 10613, 10745 (Horde chain); creature_text 21502, 21633 (Razuun and Jovaan at the communication device); quests 10621, 10626, 10662 (Alliance) and 10623, 10627, 10663 (Horde); quests 10664, 10665, 10666, 10667, 10670, 10676, 10679 (David Wayne''s materials, quenching at the Scalding Pools); npc_text 10500 (David Wayne and the Sons of Lothar)'),
(352007, 1, 3520, 0, 0, 8, 'The Hand of Gul''dan', 'The Hand of Gul''dan is the great volcano at the center of the valley, raised by the warlock in the ritual that tore the orcs away from the elements. On its western outskirts stands the Altar of Damnation, where Gul''dan spoke the words that shattered this land, and a memory of him still stands there among the kneeling spirits of the damned, while shaman of the Earthen Ring try to commune with the tortured elements.', '', 'quest 10568 description (Gul''dan raised the volcano, Baa''ri buried under lava); warcraft.wiki.gg/wiki/Shadowmoon_Valley (Hand of Gul''dan raised to sever the orcs'' link to the elements); quests 10574, 10458 (Eykenen and Uylaru at the Fel Pits; enraged fire and earth spirits); quest 10679 (Scalding Pools near the top of the Hand); quest 10636 description (Ghostriders of Karabor ride the roads encircling the Hand); quests 10647, 10648 (Uvuros last seen at the Hand of Gul''dan); quest 10451 log text (Altar of Damnation on the western outskirts of the Hand of Gul''dan); quest 10588 description (the memory of Gul''dan stands at the altar); npc_text 10315 (Oronok: spirits of the damned kneeling in prayer); creature_template 22094, 22437, 22438, 22439, 22440 (Remnants of Hate, Malice, Greed, Corruption, Pride, Aspect of Gul''dan); creature_text 17008 (Gul''dan''s vision lines); npc_text 10250 (Torlok); zone_areas: Torlok 21024, Gorboto 21026, Gul''dan 17008 in 3928; npc_text 10250 (Gul''dan severed the tie; razed Draenor); creature_text 21024 (It was my people that did this to you; Cyrukh; the fire lord); quests 10458, 10680 (the spirits are enraged and unwilling to commune with the Earthen Ring; totem of spirits); quest 10513 description (Torlok turns to Oronok, a long shot); quests 10680/10681 (breadcrumbs to Torlok), 10458, 10480, 10481 and creature_text 21024 (spirits name Cyrukh, an elemental lord unearthed); quests 10513-10519, npc_text 10313-10318 (Oronok''s story); quests 10521-10523 (Grom''tor), 10527-10541 (Ar''tor, Lohn''goron, Veneratus), 10546-10579 (Borak, bloodthistle, Icarius, Ruusk, Ruul); quest 10588 (reading the cipher at the Altar of Damnation, Cyrukh)'),
(352010, 1, 3520, 0, 0, 8, 'Oronok''s Farm', 'High on the Shattered Shelf above Coilskar Cistern, a weathered orc keeps a campfire and a herd of trained felboars that root tubers out of the hard earth of the plains below. He calls himself Oronok Torn-heart, hermit and farmer, invites travelers to warm themselves by his fire, and advises those who ask after words of damnation to let the dead rest.', '', 'quest 10513 log text (Shattered Shelf, north of Coilskar Cistern); quest 10514 description (felboars dig tubers on the Shattered Plains, flayers from a nest to the northeast); quest 10515 (flayer eggs); npc_text 10280 (sit by my fire, beware the ravenous beasts of the shattered shelf); quest 10519 description; npc_text 10315 (the farmer is a masquerade; lieutenant of Gul''dan); zone_areas: Oronok 21183 in 3927; Ravenous Flayer, Domesticated Felboar in 3926; quest 10514 description (I''ve been a lot of things); npc_text 10315, 10316, 10317, 10318 (lieutenant of Gul''dan, abandoned shamanism for shadow magic, felt the cut, fled with his boys, twenty years, sent his sons); quests 10521, 10527, 10546 (the three sons); warcraft.wiki.gg/wiki/Oronok_Torn-heart; quest 10513 reward text (words of damnation, never heard of them, let the dead rest); quest 10515 (no mercy for the flayers); quest 10527 description (location; proving grounds for demons that left the Legion to join the Betrayer); quest 10668 description (Lothros, Illidan''s lieutenant at Illidari Point); quests 10528, 10540 (crystals, succubi rituals, Gabrissa, Veneratus hidden in the ether); quest 10527 reward text, npc_text 10323 (Ar''tor''s body suspended); zone_areas: Illidari Satyr, Shadowstalker, Painmistress Gabrissa 21309 in 3752; Lothros 21928 position in 3752'),
(352016, 1, 3520, 0, 0, 8, 'The Black Temple', 'The Black Temple was once the Temple of Karabor, the great sanctuary of the draenei. Gul''dan''s Horde took it, the Shadow Council made it their seat, and later the pit lord Magtheridon ruled from it, until Illidan drove him out with the help of Akama''s Broken. Before its walls Illidan trains blood elf demon hunters in the Ruins of Karabor, and the naaru Xi''ri gathers the Aldor and the Scryers on the approach.', '', 'warcraft.wiki.gg/wiki/Black_Temple (draenei Temple of Karabor, Shadow Council seat, Magtheridon ousted by Illidan); warcraft.wiki.gg/wiki/Akama (helped destroy Magtheridon''s defenses at the Black Temple, Warcraft III); npc_text 10314 (cipher kept in Gul''dan''s private quarters inside Karabor); quest 10635 description (clerics of Karabor murdered by Gorefiend, roam in front of the Black Temple); creature_text 22862, 22864 and spawns of Lightsworn Vindicator/Seasoned Magister near Xi''ri 18528; warcraft.wiki.gg/wiki/Doomwalker (sent by Kil''jaeden to assault the gates); posarea: 3840 covers the temple grounds south of Doomwalker''s spawn (-3563, 234); warcraft.wiki.gg/wiki/Akama (Frozen Throne: helped Illidan, Kael and Vashj against Magtheridon); posarea grid around x -3400 to -3900, y 0 to 800 on map 530; areatrigger 4598 Black Temple entrance at (-3672, 318); quests 10587, 10687 (influx of Sunfury recruits, attire and fighting style like Illidan''s); quests 10637, 10688 (warlocks summon and subdue demons; Azaloth too strong, kept banished); npc_text 10492-10495 (Altruis: Kael''s five warriors, Varedis the one who succeeded, the three masters); quests 10651, 10692 (Alandien, Theras, Netharel); creature_text 21506 (Azaloth); zone_areas: Demon Hunter Supplicant/Initiate, Sunfury Warlock, Varedis 21178, Azaloth 21506 in 3756; quest 10816 description (holy site, ata''mal crystals in spiritual ceremonies, Illidan''s most feared army); quest 10707 description (Heart of Fury guarded by fel orcs, clouded from the Sha''tar; Deathwail circles beyond reach); creature_text 22006 (Deathwail: its power belongs to Illidan); quest 11544 description (fel orcs dug special ore from the terrace and made corrupted weapons; text only, quest belongs to Quel''Danas and is not a trigger); zone_areas: Shadowmoon Slayer/Chosen/Darkweaver, Shadowsworn Drakonid 22072 in 3757; quest 10816 description (the Aldor believed a crystal was hidden nearby, scrying revealed nothing); warcraft.wiki.gg/wiki/Doomwalker (fel reaver sent by Kil''jaeden to assault the gates of the Black Temple, built with captured draenei souls); creature_text 17711 (Do not proceed; tectonic disruption; threat level zero; directive accomplished); DB spawn 84633 at (-3563, 234), area 3520 north of the Black Temple grounds; warcraft.wiki.gg/wiki/Doomwalker (infused with the captured souls of martyred draenei); quests 10587, 10637, 10640, 10650, 10651 (Aldor) and 10687, 10688, 10689, 10691, 10692 (Scryers); npc_text 10492-10497 (Altruis''s account of Varedis); quests 10641, 10646, 10649, 10668, 10669 (Altruis''s trials and the Book of Fel Names)'),
(352017, 1, 3520, 0, 0, 8, 'Netherwing Fields', 'East of the Hand of Gul''dan, fields of enormous blue crystals jut from the earth and nether drakes wheel above them, too afraid of the Dragonmaw to come down even to feed. On the fields'' eastern edge rises Dragonmaw Fortress, where the clan tortures captured drakes until they bend. Past the fields, a lonely shrine called the Altar of Shadows is said to hold the spirit of an ancient Shadowmoon orc.', '', 'quest 10481 description (fields of gigantic blue crystals); warcraft.wiki.gg/wiki/Netherwing (spawned from eggs of Deathwing''s black dragonflight infused with nether energies); quest 10804 description (drakes won''t come down to feed, fall dead from exhaustion; Rocknail flayers their natural prey); quest 10870 reward text (Mordenai: my mother is free, my brothers and sisters are saved); quest 10633 description (Altar of Shadows across the fields and through Netherwing Pass); quest 10639 description and creature_text 21877 (the altar was the spirit''s prison, Karsius); quest 10633 description (an ancient orc spirit resides at the Altar of Shadows); quest 10836 description (fortress on the eastern edge of the Netherwing Fields; some drakes corrupted by the Dragonmaw); npc_text 10614, 10615, 10616 (torture of captured drakes, Zuluhed and the capture of Alexstrasza, Karynaku held atop the fortress); warcraft.wiki.gg/wiki/Zuluhed_the_Whacked (Dragonmaw enslaved the red dragonflight in the Second War); quests 10858 reward text and 10866 description (chains sap her power; Zuluhed hides in her thoughts); zone_areas: Dragonmaw Wrangler, Subjugator, Drake-Rider, Enslaved Netherwing Drake, Karynaku 22112 in 3939; quests 10642, 10643, 10644, 10645 (Alliance, Zorus) and 10624, 10625, 10633, 10639 (Horde, Hildagard); quest 10625 reward text (Gorefiend slain by Doomhammer, soul placed in a slain knight of Stormwind, first death knight); quests 10633, 10634, 10635, 10636 (the spirit''s account, Vhel''kur, clerics of Karabor, Ghostriders); quest 10639 description; creature_text 21797, 21872, 21877 (possession, Karsius, Gorefiend has returned); quests 10804, 10811, 10814, 10836, 10837, 10854, 10858, 10866, 10870/10871; npc_text 10614-10616 (Neltharaku''s tale); creature_text 11980 (Zuluhed)'),
(352019, 1, 3520, 0, 0, 8, 'Eclipse Point', 'Eclipse Point is a terraced ruin in the south of the valley, held by the Eclipsion, blood elves in Illidan''s service, and on the Path of Conquest to its east they muster soldiers and cavaliers for a great advance, courting the giants of Shadowmoon to their side. At the path''s southern end stands Crimson Watch, where the High General of the Sha''tar floats inside a crystal prison.', '', 'quest 10778 description (Rod of Lianthe in a pavilion on the top tier of the ruins); quest 10577 description (disguise; Ruusk; dragonhawks see through the disguise); quest 10546 reward text and quest 10570 reward text (the third part hidden by the blood elves, kept moving by Illidan''s directive; daily envoy from the Black Temple; weeks of watching); creature_text 21409 (Envoy Icarius); zone_areas: Grand Commander Ruusk 20563, Eclipsion Dragonhawk in 3822; quest 10547 log text (the bridge north of Eclipse Point); quest 10824 description (Sunfury signets at Eclipse Point); quest 10778 description (heavily guarded); quests 10750, 10772 (Eclipsion armies forming at the Path of Conquest, adjacent to Eclipse Point); quests 10765, 10774 (meeting of a giant and a blood elf chancellor at the southern end near a stationary caravan); creature_text 22012, 22011 (Bloodleaf and Corok); creature_text 22054 (Behemothon: you have attacked my children, the pact is broken); quests 10769, 10776 (Eclipsion Fields, crazed colossi); quests 10793, 10815 descriptions and 10793 reward text (Crimson Watch at the southern end, Crimson Sigil, Val''zareq captured the high general, crystalline prison); zone_areas: Corok 22011, Bloodleaf 22012, Val''zareq 21979 in 3929; Crazed Colossus in 3930; Marcus Auralion 22073 in 3950; DB spawns: Ruusk (-4585, 1670), Val''zareq (-4328, 1386), Bloodleaf (-4497, 1307), Auralion (-4617, 1399)'),
(352022, 1, 3520, 0, 0, 8, 'Netherwing Ledge', 'Netherwing Ledge was once part of the Shadowmoon mainland; now it floats in the sky off the valley''s southeastern shelf. It was the Netherwing''s sanctuary until the Dragonmaw took it, and Overlord Mor''ghor drives peons and Murkblood Broken to strip its crystals and ore for Illidan''s armies. Above it the drake Vhel''kur, spawn of Deathwing, flies an endless circle around the island that was his home and is now his grave.', '', 'quest 10634 description (once part of the mainland, now a floating island; Vhel''kur, spawn of Deathwing, defeated by Gorefiend); quest 10837 description (island off the broken shelf to the southeast); quest 11013 description (Netherwing sanctuary now home to the Dragonmaw); quests 11015-11018 (crystals, hides, pollen, ore), 11035 (Skyway transporters to Dragonmaw Fortress); npc_text 10944 (Murkblood overseer: stripping the island to supply Illidan''s armies); zone_areas: Dragonmaw Peon, Murkblood Miner in 3759; Mor''ghor 23139 in 3966; Dragonmaw Transporter in 3967; quest 11075 description (miner struck a crystal formation attached to a sleeping nether dragon; workers annihilated); quests 11077, 11083 (creatures riled up; crazed Murkblood cut off from the exit); npc_text 10941-10946 (Murkblood overseer: the Netherwing offered peace and protection, the Murkblood helped rouse Toranaku to force the Dragonmaw off the island); zone_areas: Toranaku 23164 in 3759 near the mines; Mistress of the Mines 23149; npc_text 10943 (assisted Toranaku in rousing the creatures of this mine); quest 11075 reward text (the miners choose death rather than mine deeper); quest 11013 description and reward text (service papers, peon); creature_text 23284 (Lady Sinestra: chief lieutenant at Grim Batol; the Netherwing eggs; my master) and 23139 (The master? He lives?); quests 11086, 11094, 11099 (Twilight Ridge, sacking the Scryer and Aldor outposts); npc_text 10944 (the Dragonmaw strip the island and supply Illidan''s armies); warcraft.wiki.gg/wiki/Overlord_Mor''ghor (BC section); quests 11012, 11013, 11014, 11019, 11020, 11035, 11049, 11053, 11084, 11092, 11094/11099, 11095/11100, 11097/11101, 11107, 11108; creature_text 23139, 22083, 23141 (Mor''ghor, Illidan, Yarzill at the highlord ceremony); quest 11019 reward text (Yarzill''s eyes flicker blue: we are here with you)'),
(352028, 2, 3520, 0, 0, 8, 'Akama', 'Akama leads the Ashtongue, the most feared tribe of the Broken. At Illidan''s command his people dig in the Ruins of Baa''ri for the relics buried there, and his Deathsworn hold the Warden''s Cage, a prison rumored to be a torture chamber. To the Aldor and the Scryers he is evil and cunning; to many of his own people he is a traitor and Illidan''s lapdog, and Akama says it is best that they go on thinking so, for now.', '', 'npc_text 10447 (known as a traitor, Illidan''s lapdog); quest 10619 description (Ashtongue feared among all Broken); quest 10628 reward text (visions, Velen''s exodus, the Dark Portal, your arrival); quest 10622 description (Baa''ri Ashtongue hand-picked to maintain the facade; Deathsworn know his intentions); quest 10948 description (his soul held prisoner inside the Black Temple); creature_text 21700 (keeping the secret, Maiev); quests 10619, 10807 descriptions (handpicked by Akama); quest 10571 description and reward text (daily orders; one as wise and beloved as he); quests 10575, 10686 descriptions (evil and cunning); creature_text 21699 (release me; if Illidan is to die it shall be by my hand; not a pawn in your game; cell won''t hold me); creature_text 21700 (In due time, Maiev; years preparing); warcraft.wiki.gg/wiki/Akama (Akama became Maiev''s jailer); Warcraft III: The Frozen Throne (Maiev as Illidan''s jailer for ten thousand years, pursued him to Outland); warcraft.wiki.gg/wiki/Maiev_Shadowsong (guarded Illidan ten thousand years; pursued him to Outland; held in the Warden''s Cage); quests 10568, 10683 descriptions (village buried with its inhabitants and artifacts; Ashtongue ordered by Illidan to excavate; tablets); quests 10571, 10684 (Medallion of Karabor, Oronu the Elder as Akama''s lieutenant at Baa''ri); zone_areas: 94 Ashtongue Workers, Illidari Overseer 21808, Ashtongue Handler 21803, Elekk Demolisher 21802 in 3753; quests 10575, 10686 (location south of Baa''ri; rumored torture chamber run by Akama and the Deathsworn); creature_text 21699 (Maiev: this cell won''t hold me for long); quest 10622 description (Zandras watches from above the prison walls on Illidan''s behalf); creature_text 21768 (Vagath: specific orders to keep a close watch on the Warden); quest 10628 description (hidden passage behind stagnant water); zone_areas: Akama 21700, Maiev 21699, Ashtongue Deathsworn 21701 in 3821; quests 10575, 10686 descriptions (Deathsworn the vilest and most brutal; Akama evil and cunning; Sanoru); quests 10568, 10571, 10574, 10575 (Aldor) and 10683, 10684, 10685, 10686 (Scryers); quests 10622, 10628 (Sanoru, Zandras, Akama); quests 10705, 10706, 10707, 10708 (replicas, Udalo in the Arcatraz, Heart of Fury, A''dal); creature_text 21700 (Heart of Fury, take it to A''dal); Shadowmoon quests 10708, 10944; Black Temple quest 10959; creature_text 22820');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(352003, 1, 0, 255, 'Spies at the hold''s communication device heard the war''s direction: an image of Warbringer Razuun, speaking for Doom Lord Kazzak, ordering both strongholds destroyed.', 'creature_text 21502 (Image of Warbringer Razuun: Kazzak will be pleased, destroy the orcish and dwarven strongholds) and 21633 (Deathbringer Jovaan)'),
(352003, 2, 0, 255, 'The runed ore is enchanted to destroy demons: a secret weapon the Legion means to turn against the demons of Illidan''s forces.', 'creature_text 21502 (Image of Warbringer Razuun: Kazzak will be pleased, destroy the orcish and dwarven strongholds) and 21633 (Deathbringer Jovaan)'),
(352007, 1, 0, 255, 'The spirits name Cyrukh the Firelord, an elemental lord unearthed by Gul''dan''s ritual, who can be called forth only by the ritual''s own words.', 'quest 10568 description (Gul''dan raised the volcano, Baa''ri buried under lava)'),
(352007, 2, 0, 255, 'Those words are the Cipher of Damnation. Kept for twenty years in Gul''dan''s quarters inside Karabor, they were found by Illidan when he took the temple and split among his servants.', 'quest 10568 description (Gul''dan raised the volcano, Baa''ri buried under lava)'),
(352010, 1, 0, 255, 'Oronok was a lieutenant of Gul''dan and stood at the Altar of Damnation when the land was shattered. Sick at heart, he fled to the hills with his three sons, and it took him twenty years to reach the elements again.', 'quest 10513 log text (Shattered Shelf, north of Coilskar Cistern)'),
(352010, 2, 0, 255, 'His youngest, Ar''tor, died at Illidari Point hunting a piece of the cipher, and sent word from beyond that he died free and waits for his father in the hunting grounds.', 'quest 10513 log text (Shattered Shelf, north of Coilskar Cistern)'),
(352016, 1, 0, 255, 'The ghosts of Karabor''s clerics, murdered by Teron Gorefiend after the city fell, still roam before its walls, where the fel orcs of the Shadowmoon clan hold the holy Ata''mal Terrace.', 'warcraft.wiki.gg/wiki/Black_Temple (draenei Temple of Karabor, Shadow Council seat, Magtheridon ousted by Illidan)'),
(352016, 2, 0, 255, 'Varedis, who runs the training grounds, was one of five blood elves Kael''thas sent to Illidan. He alone survived, surpassed his masters within a year and learned by heart the Book of Fel Names.', 'warcraft.wiki.gg/wiki/Black_Temple (draenei Temple of Karabor, Shadow Council seat, Magtheridon ousted by Illidan)'),
(352017, 1, 0, 255, 'The restless spirits of Shadowmoon whisper one name: Teron Gorefiend, the warlock whose soul Gul''dan placed in the body of a slain Stormwind knight, the first death knight of the Horde.', 'quest 10481 description (fields of gigantic blue crystals)'),
(352017, 2, 0, 255, 'The Altar of Shadows is no shrine but a prison, and the ancient spirit within it is Teron Gorefiend himself.', 'quest 10481 description (fields of gigantic blue crystals)'),
(352019, 1, 0, 255, 'His jailers are the Crimson Sigil, Illidan''s elite, at the top of the chain of command for every Illidari force outside the Black Temple, who speak directly with the Betrayer.', 'quest 10778 description (Rod of Lianthe in a pavilion on the top tier of the ruins)'),
(352022, 1, 0, 255, 'The waking of the sleeping dragon in its mines was no accident: the Netherwing offered the Murkblood peace, and the Broken helped make the mine unlivable for the Dragonmaw.', 'quest 10634 description (once part of the mainland, now a floating island; Vhel''kur, spawn of Deathwing, defeated by Gorefiend)'),
(352028, 1, 0, 255, 'He serves Illidan only in appearance, bound by visions that foretold his race''s destruction otherwise, and in a hidden chamber of the Warden''s Cage he keeps Maiev Shadowsong, the Warden who hunted Illidan to Outland.', 'npc_text 10447 (known as a traitor, Illidan''s lapdog)'),
(352028, 2, 0, 255, 'Holding the Heart of Fury, an ata''mal crystal, he felt the power he once saw Velen wield and was tempted to rule Outland with it. That was not his vision, and he sent it to A''dal.', 'npc_text 10447 (known as a traitor, Illidan''s lapdog)'),
(352028, 3, 0, 255, 'Akama gave the Medallion of Karabor into the keeping of A''dal as his promise to stand with his allies against Illidan. Through it A''dal showed a glimpse of what may come: Akama and Maiev fighting their way from the Warden''s Cage to the temple.', 'npc_text 10447 (known as a traitor, Illidan''s lapdog)'),
(352028, 4, 0, 255, 'Seer Olum, his spy among the naga, was found out. Rather than let Illidan pry the Ashtongue secret from him, he chose to go into the spirit world among his brothers.', 'npc_text 10447 (known as a traitor, Illidan''s lapdog)'),
(352028, 5, 0, 255, 'Illidan is dead and the Broken are free. Every decision Akama made since the Betrayer came, Seer Kanai says, was made for this moment.', 'npc_text 10447 (known as a traitor, Illidan''s lapdog)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(352000, 1, 3520, 0),
(352001, 1, 3745, 0),
(352001, 2, 21330, 0),
(352002, 1, 3744, 0),
(352002, 2, 21769, 0),
(352003, 1, 3743, 0),
(352003, 1, 3940, 0),
(352003, 1, 3943, 0),
(352003, 1, 3748, 0),
(352003, 1, 3936, 0),
(352003, 1, 3937, 0),
(352007, 1, 3746, 0),
(352007, 1, 3747, 0),
(352007, 1, 3947, 0),
(352007, 1, 3928, 0),
(352010, 1, 3927, 0),
(352010, 1, 3926, 0),
(352010, 2, 21183, 0),
(352016, 1, 3840, 0),
(352016, 1, 3756, 0),
(352016, 1, 3757, 0),
(352017, 1, 3758, 0),
(352017, 1, 3945, 0),
(352017, 1, 3944, 0),
(352017, 1, 3939, 0),
(352019, 1, 3822, 0),
(352019, 1, 3929, 0),
(352019, 1, 3930, 0),
(352019, 1, 3950, 0),
(352022, 1, 3759, 0),
(352022, 1, 3966, 0),
(352022, 1, 3967, 0),
(352022, 1, 3965, 0),
(352028, 2, 21700, 0),
(352028, 1, 3753, 0),
(352028, 1, 3821, 0),
(352003, 5, 10563, 1),
(352003, 5, 10596, 1),
(352003, 5, 10621, 2),
(352003, 5, 10623, 2),
(352007, 5, 10481, 1),
(352007, 5, 10519, 2),
(352010, 5, 10519, 1),
(352010, 5, 10541, 2),
(352016, 1, 3840, 1),
(352016, 5, 10646, 2),
(352017, 5, 10643, 1),
(352017, 5, 10625, 1),
(352017, 4, 10639, 2),
(352017, 4, 10645, 2),
(352019, 5, 10793, 1),
(352022, 5, 11082, 1),
(352028, 5, 10628, 1),
(352028, 5, 10707, 2),
(352028, 5, 10708, 3),
(352028, 5, 10944, 4),
(352028, 5, 10959, 5);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(352000, 92000009, 0),
(352000, 352016, 1),
(352000, 90000062, 2),
(352001, 90000029, 0),
(352001, 91000014, 1),
(352001, 352002, 2),
(352002, 90000041, 0),
(352002, 352001, 1),
(352003, 90000065, 0),
(352003, 90000062, 1),
(352003, 92000009, 2),
(352007, 90000070, 0),
(352007, 352010, 1),
(352007, 92000009, 2),
(352010, 352007, 0),
(352010, 90000070, 1),
(352016, 92000009, 0),
(352016, 352028, 1),
(352016, 90000068, 2),
(352016, 90000069, 3),
(352017, 90000073, 0),
(352017, 90000011, 1),
(352017, 352022, 2),
(352019, 92000009, 0),
(352019, 90000033, 1),
(352022, 90000073, 0),
(352022, 90000011, 1),
(352028, 92000009, 0),
(352028, 90000021, 1),
(352028, 352016, 2),
(352028, 395900, 3);

-- The Shattered Halls
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 371400 AND 371499;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 371400 AND 371499;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 371400 AND 371499;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 371400 AND 371499;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(371400, 0, 3714, 0, 0, 8, 'The Shattered Halls', 'The Shattered Halls lie at the heart of Hellfire Citadel behind a door the fel orcs keep locked, and they belong to the Shattered Hand clan and its chieftain, Kargath Bladefist. The halls are given over to war: gladiators spar under the eyes of centurions, houndmasters keep rabid warhounds, archers drill to loose burning arrows on command, and everywhere the same cries ring out: the blood is our power, ours is the true Horde, for Kargath and for victory.', '', 'zones/shattered_halls.txt (map 540: 3714, and 3535 Hellfire Citadel, the citadel-wide quest sort, not reachable); gameobject 184912 The Shattered Halls (door, lock 1804; the Shattered Halls Key 28395 from quests 10758/10764); DB spawns map 540: Shattered Hand Gladiator 17464, Centurion 17465, Houndmaster 17670 with Rabid Warhound 17669, Assassin 17695, Archer 17427, Blood Guard 17461, Flame Arrow 17687, Legionnaire 16700, Champion 17671, Heathen 17420, Reaver 16699; Shadowmoon Acolyte 16594, Darkcaster 17694; bosses 16807, 16809, 16808; creature_text 17465 groups 0 and 2 (Fight!; That''s enough. Now back off!), 17461 groups 0-3 (Archers, form ranks! On my mark! Ready! Aim! Fire!), shared yells group 1 (For Kargath! For Victory!; The blood is our power!; We are the true Horde!); quests 9492 and 9495 descriptions (Kargath''s self-styled title; both outposts want him defeated); creature_text 19523 (left head: Me hungry!; If you nice me let you live; Me get bored; We kill someone else!) and 19524 (right head: Why don''t you let me do the talking?; You''re always hungry, that''s why we so fat!; That''s because I do all the hard work!; I''m tired. You kill next one!); boss_warbringer_omrogg.cpp (O''mrogg''s Left Head 19523 and Right Head 19524 speak for him; he switches targets); warcraft.wiki.gg/wiki/Warbringer_O''mrogg (two-headed ogre of the Fel Horde); quests 10754 and 10755 descriptions (started by Primed Key Mold 31239/31241, dropped by Smith Gorlunk 22037, spawned at the Ata''mal Terrace, posarea 3757 in Shadowmoon Valley); quests 10762-10764 (Alliance) and 10756-10758 (Horde) descriptions and reward text; gameobject 184912 The Shattered Halls (lock 1804); hellfire.json 348331 notes (the key mold chain left unused for a Shattered Halls file); quests 9493 (Romus 16830, Alliance) and 9496 (Ty''jin 16575, Horde) descriptions, completion and reward text; creature_template 16700, 17465, 17671 (the quests'' kill targets, spawned on map 540 only); quests 9524 (Randy Whizzlesprocket 17288, Alliance) and 9525 (Drisella 17294, Horde) descriptions and reward text; quest 10884 description and reward text (A''dal); creature_text 16808 groups 3 and 4 (Bring out the Honor Hold / Thrallmar prisoners and call for the executioner! They''ll pay with their lives for this trespass!); instance_shattered_halls.cpp (on entering the hall, Kargath''s yell to the whole map; prisoners 17289/17290/17292, or for a Horde group 17295/17296/17297, are killed at 55, 65 and 80 minutes; prisoner givers 17288/17294 swap by team); shattrath.json 370320 part 6 (the trials named on DONE 10883)'),
(371401, 2, 3714, 0, 0, 8, 'Grand Warlock Nethekurse', 'Grand Warlock Nethekurse holds a chamber in the Shattered Halls where he amuses himself by tormenting his own kind, trying his spells on the fel orc converts who wail that their skin is on fire. Two strange braziers burn beside him, and the fel embers in them lend his magic its power.', '', 'boss_nethekurse.cpp (Fel Orc Converts 17083 struck by Shadow Sear, Death Coil and Shadow Fissure for roleplay; he taunts as they are attacked and die); creature_text 17083 (It hurt!; Skin on fire!; Mommy!; No more!); creature_text 16807 groups 2-3; gameobject 181679 Fel Brazier (map 540); quest 9494 description (Nethekurse performs unrivaled magical feats augmented by the powers of a pair of strange braziers; fel embers); warcraft.wiki.gg/wiki/Grand_Warlock_Nethekurse (fel orc warlock; tortures young fel orcs)'),
(371403, 2, 3714, 0, 0, 8, 'Warchief Kargath Bladefist', 'Kargath Bladefist, chieftain of the Shattered Hand, wears a blade where one hand should be. Long ago, while Ner''zhul worked to open the rifts that tore Draenor apart, Kargath was left to hold Hellfire Citadel against the Alliance. The fortress fell, and he escaped swearing he would take it back. He has, and he calls himself warchief of the true Horde. Thrall has ordered him defeated at all costs.', '', 'quests 9492 (Danath, Alliance) and 9495 (Nazgrel, Horde) descriptions and reward text (self-styled Warchief; Thrall''s command; won''t rest until Thrallmar is destroyed; Warchief Kargath''s Fist); creature_text 16808; quest 11363 completion text (weapons in place of his hands); creature_template 16808 display 19799 (bladed left arm); warcraft.wiki.gg/wiki/Kargath_Bladefist (Beyond the Dark Portal, 2008: left at Hellfire Citadel with Dentarg to hold off the Alliance; vowed to reclaim it; became warchief of the Fel Horde); hellfire.json 348305 (self-styled warchief)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(371400, 1, 0, 255, 'Its key was cast from a mold taken in Shadowmoon Valley, marked with the Shattered Hand''s symbol, and tempered in the fel fire at the heart of a fallen fel reaver.', 'zones/shattered_halls.txt (map 540: 3714, and 3535 Hellfire Citadel, the citadel-wide quest sort, not reachable)'),
(371400, 2, 0, 255, 'Kargath keeps prisoners here to be executed, soldiers of Honor Hold or Thrallmar, and among them a captain of the Alliance or of the Horde.', 'zones/shattered_halls.txt (map 540: 3714, and 3535 Hellfire Citadel, the citadel-wide quest sort, not reachable)'),
(371401, 1, 0, 255, 'One of his embers went to a magus at Honor Hold, who means to study it in secret, for there are those who would forbid such research.', 'boss_nethekurse.cpp (Fel Orc Converts 17083 struck by Shadow Sear, Death Coil and Shadow Fissure for roleplay; he taunts as they are attacked and die)'),
(371403, 1, 0, 255, 'Nazgrel took his death without triumph. In his prime, he said, Kargath was a hero and an example to his people, and the orcs should remember the one he once was, and the lessons of his fall.', 'quests 9492 (Danath, Alliance) and 9495 (Nazgrel, Horde) descriptions and reward text (self-styled Warchief; Thrall''s command; won''t rest until Thrallmar is destroyed; Warchief Kargath''s Fist)'),
(371403, 2, 0, 255, 'Danath Trollbane took Kargath''s fist as proof of a major blow, and meant the Sons of Lothar to do far more now than defend Honor Hold.', 'quests 9492 (Danath, Alliance) and 9495 (Nazgrel, Horde) descriptions and reward text (self-styled Warchief; Thrall''s command; won''t rest until Thrallmar is destroyed; Warchief Kargath''s Fist)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(371400, 1, 3714, 0),
(371401, 3, 16807, 0),
(371401, 4, 9494, 0),
(371403, 4, 9492, 0),
(371403, 4, 9495, 0),
(371403, 3, 16808, 0),
(371400, 5, 10764, 1),
(371400, 5, 10758, 1),
(371400, 4, 9524, 2),
(371400, 4, 9525, 2),
(371401, 5, 9494, 1),
(371403, 5, 9495, 1),
(371403, 5, 9492, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(371400, 371403, 0),
(371400, 90000064, 1),
(371400, 348305, 2),
(371401, 371400, 0),
(371401, 90000064, 1),
(371403, 90000064, 0),
(371403, 371400, 1),
(371403, 348305, 2);

-- The Slave Pens
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 371700 AND 371799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 371700 AND 371799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 371700 AND 371799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 371700 AND 371799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(371700, 0, 3717, 0, 0, 8, 'The Slave Pens', 'The Slave Pens lie beneath Serpent Lake in Coilfang Reservoir, a maze of flooded tunnels where the naga keep their slaves. Wastewalker Broken toil under Coilfang slavehandlers, captives call from the pens for help, and not every Broken here is a slave: some stand armed among the naga, and a Broken shaman, Mennu the Betrayer, fights for them. Bogstroks swarm the shallows, and deep in the pens a fungal giant keeps its lair.', '', 'zones/slave_pens.txt (map 547: area 3717 only); DB spawns map 547: Wastewalker Slave 17963, Worker 17964, Captive 18206 (Broken models); Coilfang Slavehandler 17959, Collaborator 17962 (Broken model, faction 51), Technician 17940, Defender 17958, Enchantress 17961, Soothsayer 17960, Observer 17938 with Coilfang Ray 21128 (Observer''s Pet); Bogstrok 17816, Greater Bogstrok 17817; bosses 17941, 17991 (lobstrok model), 17942 (fungal giant model); smart_scripts 17959 (out of combat: Slap! on the workers and creature_text group 0: Too soon! You are slacking off too soon!; Wake up! Now get up and back to work!), 18206 (out of combat: Help me! Please help me!; How can you just leave me here?); zangarmarsh.json 352122 (Watcher Jhang waits at the entrance for four companions who went on inside); creature_template 17941 (faction 74, the Coilfang naga''s faction) and display 17728 (BrokenMale); boss_mennu_the_betrayer.cpp (Lightning Bolt; Earthgrab, Stoneskin and Nova totems; Healing Ward at 60 percent health); warcraft.wiki.gg/wiki/Mennu_the_Betrayer (Broken shaman); creature_template 17942 (display 18224, FungalGiant model); the_slave_pens.cpp (at_quagmirran_lair: entering the lair sends Quagmirran along its waypoint path); boss_quagmirran.cpp (Cleave, Uppercut, Acid Spray, Poison Bolt Volley); quest 9738 description and log text (Watcher Jhang 17884 starts and ends it at the entrance on map 530; QuestType 2, Flags 136; QuestSortID 3905; credits 17885, 17893, 17890, 17894); creature_model_info 17294 (Jhang''s display, female); smart_scripts 17827 (Claw gives the 17894 credit) and 17885 (Rayge''s credit); zangarmarsh.json 352122 and 352135 (Jhang at the entrance; 9876 leaves 9738 for the Coilfang files)'),
(371704, 2, 3717, 0, 0, 8, 'Skar''this the Heretic', 'In a cell in the Slave Pens the naga keep a prisoner of their own kind, Skar''this the Heretic, and he has nothing but hatred for his jailers. They must pay for what they have done and what they still do, he rages, and he would kill Lady Vashj himself if he could break his bindings. Perhaps, he suggests, his visitors do the work of Neptulon.', '', 'quest 10900 The Mark of Vashj reward text (Burn it down, $R ... I would kill Vashj myself if I could break free of these damned bindings. Or maybe you seek to do the work of Neptulon? Her death serves both of us, soft-skin. Will you assist me in forming the sacred cudgel.); creature_template 22421 Skar''this the Heretic (display 20990, Naga_Male; faction 1194; spawnMask 2, map 547 only), gameobject 185292 Skar''this''s Prison beside him; creature_queststarter/questender 22421: 10900 and 13431 (base); mod-individual-progression dungeon_attunements.sql gives 22421 quest 10901 instead of 13431 and lifts its disable; warcraft.wiki.gg/wiki/Skar''this_the_Heretic (naga, servant of Neptulon)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(371700, 1, 0, 255, 'Ysiel Windsinger sent Watcher Jhang and four druids of the Cenarion Expedition to learn why the steam pumps drain the marsh. The four went on without her, and she fears the worst.', 'zones/slave_pens.txt (map 547: area 3717 only)'),
(371700, 2, 0, 255, 'One of them, Naturalist Bite, came to prove that the fungal giant Quagmirran exists. He got his wish, sort of, and ended up in a naga cage not far from its lair.', 'zones/slave_pens.txt (map 547: area 3717 only)'),
(371704, 1, 0, 255, 'The cudgel of Kar''desh that could free him needs two elemental signets: the earthen one held by Gruul the Dragonkiller, and the blazing heart of Nightbane, said to dwell in Medivh''s halls.', 'quest 10900 The Mark of Vashj reward text (Burn it down, $R ... I would kill Vashj myself if I could break free of these damned bindings. Or maybe you seek to do the work of Neptulon? Her death serves both of us, soft-skin. Will you assist me in forming the sacred cudgel.)'),
(371704, 2, 0, 255, 'With both signets in hand, Skar''this swore the reformed cudgel would break his bonds, and that he would return to Serpentshrine to take his vengeance on Vashj.', 'quest 10900 The Mark of Vashj reward text (Burn it down, $R ... I would kill Vashj myself if I could break free of these damned bindings. Or maybe you seek to do the work of Neptulon? Her death serves both of us, soft-skin. Will you assist me in forming the sacred cudgel.)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(371700, 1, 3717, 0),
(371704, 5, 10900, 0),
(371704, 4, 10901, 0),
(371704, 4, 13431, 0),
(371700, 4, 9738, 1),
(371700, 2, 17893, 2),
(371704, 4, 10901, 1),
(371704, 4, 13431, 1),
(371704, 5, 10901, 2),
(371704, 5, 13431, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(371700, 90000055, 0),
(371700, 90000021, 1),
(371700, 352121, 2),
(371704, 360706, 0),
(371704, 90000055, 1);

-- The Steamvault
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 371500 AND 371599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 371500 AND 371599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 371500 AND 371599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 371500 AND 371599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(371500, 0, 3715, 0, 0, 8, 'The Steamvault', 'The Steamvault is the working heart of Coilfang Reservoir, a warren of flooded halls beneath Serpent Lake where the naga keep great machinery running. The air hangs thick with steam and the thrum of the pumps never stops. Naga engineers, sorceresses and slavemasters drive gangs of Dreghood Broken at the work, leper gnomes tend a towering machine, and beyond a great door Warlord Kalithresh commands the vault among his distillers.', '', 'zones/steamvault.txt (map 545: area 3715 only); DB spawns map 545: Coilfang Engineer 17721, Sorceress 17722, Siren 17801, Oracle 17803, Myrmidon 17800, Warrior 17802, Slavemaster 17805, Dreghood Slave 17799 (Broken model), Coilfang Leper 21338 (gnome models), Bog Overlord 21694, Tidal Surger 21695, Steam Surger 21696, Coilfang Water Elemental 17917, Naga Distiller 17954; bosses 17797, 17796, 17798; smart_scripts 17805 (on aggro: Assist me slaves!, and the nearby Dreghood slaves turn on the intruders; on death the slaves are freed); gameobject 183049 Main Chambers Door, 184125 and 184126 Main Chambers Access Panel (instance_steam_vault.cpp: the door opens once both panels are used after Thespia and Steamrigger die); creature_template 17797 (display 11268, Siren model; faction 16); fixed spawn 142044, map 545 only; creature_text 17797 groups 1 (The depths will consume you!; Meet your doom, surface dwellers!; You will drown in blood!) and 4 (Enjoy the storm warm bloods!, said with every Lightning Cloud); boss_hydromancer_thespia.cpp (Lightning Cloud, Lung Burst, Enveloping Winds; text groups as in the DB); creature_template 17796 (type 9 mechanical, display 18638 GnomePounder model); fixed spawn 142043, map 545 only; creature_text 17796 groups 0 (I''m bringin'' the pain!) and 1 (You''re in for a world o'' hurt!; Eat hot metal, scumbag!; I''ll come over there!); boss_mekgineer_steamrigger.cpp (Super Shrink Ray, Saw Blade, Electrified Net; Steamrigger Mechanics 17951 summoned at 75, 50 and 25 percent, or on a timer in heroic, with SAY_MECHANICS); smart_scripts 17951 (Steamrigger Mechanic casts Repair); creature_template_model 17951 (gnome models 6936/6937); warcraft.wiki.gg/wiki/Mekgineer_Steamrigger (a large bipedal robot run by leper gnomes); quest 9764 description and reward text (started by item 24367 Orders from Lady Vashj, dropped by the Steamvault naga 17721, 17800, 17801, 17802, 17803, 17805; QuestType 2, Flags 128; QuestSortID 3715; ended by Ysiel 17841); quest 9765 (Ysiel 17841; PrevQuestID 9764; QuestSortID 3715); zangarmarsh.json 352100, 352124 and 352135 notes (Vashj''s hand and the doubled draining kept for this file)'),
(371503, 2, 3715, 0, 0, 8, 'Warlord Kalithresh', 'Warlord Kalithresh commands the Steamvault from its main chambers, a naga war leader among the great distillers, his warriors and sorceresses about him. He despises surface dwellers, and swears to those who reach him that the work here will not be compromised. Watcher Jhang heard his name spoken by naga passing through the reservoir''s tunnels, and wants him stopped.', '', 'creature_template 17798 (display 20235 Naga_Male); fixed spawn 142045, map 545 only; creature_text 17798 groups 0 (You deem yourselves worthy simply because you bested my guards? Our work here will not be compromised!, said once when a player first comes within 35 yards) and 2 (I despise all of your kind!, one of the aggro variants); boss_warlord_kalithresh.cpp (Impale, Spell Reflection, Head Crack); DB spawns map 545: Naga Distiller 17954 (nine, about his chamber); quest 9763 (Watcher Jhang 17884; QuestSortID 3715); quest 10885 (A''dal 18481; QuestSortID 3703; PrevQuestID 10883); zangarmarsh.json 352102 and 352122 (Kalithresh as hearsay outside)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(371500, 1, 0, 255, 'Orders sealed by Lady Vashj command that the water drawn from the other lakes into the reservoir be doubled, and that the Cenarion druids in the region be slain on sight.', 'zones/steamvault.txt (map 545: area 3715 only)'),
(371500, 2, 0, 255, 'If Vashj is involved, Ysiel Windsinger says, the Expedition''s small victories mean nothing. The druids who came to Outland to study a marsh are arming for war with the naga.', 'zones/steamvault.txt (map 545: area 3715 only)'),
(371503, 1, 0, 255, 'He died crying out for her Excellency, for Vashj. To the Cenarion Expedition he was its biggest enemy in the region.', 'creature_template 17798 (display 20235 Naga_Male); fixed spawn 142045, map 545 only');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(371500, 1, 3715, 0),
(371503, 3, 17798, 0),
(371503, 4, 9763, 0),
(371500, 4, 9764, 1),
(371500, 5, 9764, 2),
(371500, 4, 9765, 2),
(371503, 3, 17798, 1),
(371503, 5, 9763, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(371500, 90000055, 0),
(371500, 360706, 1),
(371500, 371503, 2),
(371503, 371500, 0),
(371503, 360706, 1),
(371503, 90000055, 2);

-- The Stockade
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 71700 AND 71799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 71700 AND 71799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 71700 AND 71799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 71700 AND 71799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(71700, 0, 717, 0, 0, 0, 'The Stockade', 'The Stockade is Stormwind''s prison, hidden beneath the canal district, where thieves, agitators and killers are held. The guards no longer hold it. The Defias among the inmates rose in revolt and drove them out, and prisoners in red bandanas roam free through the cell blocks. The warden, pacing outside the gate, cannot understand how his prison was lost so suddenly, and is sure someone helped.', '', 'warcraft.wiki.gg/wiki/The_Stockade, original World of Warcraft community site text (a high-security prison complex hidden beneath the canal district of Stormwind; its inmates; a prisoner-led revolt, the guards driven out); Geography: entrance on the northernmost section of the canal surrounding the Mage Quarter; areatrigger 101 (entrance at -8762,849 on map 0) and areatrigger_teleport 503 (exit at -8764,846); creature 1719 Warden Thelwater on map 0 at -8800,828, on the way down to the gate; creature spawns on map 34: entrance at 54,0,-18; upper hall z -26 from x 74 to 166; northern block (y 40 to 150) and southern block (y -40 to -137) at z -35; creature_template 1707, 1708, 1711, 1715 (Defias Captive, Inmate, Convict, Insurgent, faction 17) and 1706 (Defias Prisoner, faction 290; the module''s switch to 17 is debug-only); Red Wool Bandana 2909 drops from all of them (quest 388: the gang''s wool scarves, the color of blood); creature 1696 Targorr (display 517, orc) at 160,1, east end of the upper hall; creature 1716 Bazil Thredd at 90,-137 in the southern block among Defias Insurgents 1715; creature_text 1719 Warden Thelwater (All of a sudden they were everywhere; How could this happen?; If the Captain finds out, it''ll be the end of me), said out of combat every 20 to 43 seconds, base and module; quest 387 description (uprising; lose my job if word gets out the prison is overrun; foul play; force the prisoners into submission for the safety of Stormwind; punishment for insurgency is death); creature_text 1719 Warden Thelwater (All of a sudden they were everywhere; They must have had someone helping them; If the Captain finds out, it''ll be the end of me), said out of combat every 20 to 43 seconds (smart_scripts 1719 event 1, flags 0); creature 1719 on map 0 at -8800,828 (Stormwind, outside the Stockade gate; the gate''s exit point is -8764,846); creature_queststarter/questender 1719 for 387; quest_template 387 AllowableRaces 1101, QuestType 2, Flags 8; quest 388 description (grandson Mac, 14; took up arms when the army went to the front; guard in the Stockade where the Defias gang is locked up; reprimanded prisoners for tearing wool blankets into scarves, the gang''s symbol; stabbed in the back; 10 wool bandanas, the color of blood); creature 1721 Nikova Raskol, map 0 at -8696,391 (Old Town), faction 12; creature_queststarter/questender 1721 for 388; quest_template 388 AllowableRaces 1101, QuestType 2, Flags 8'),
(71701, 2, 717, 0, 0, 0, 'Targorr the Dread', 'Targorr the Dread was supreme executioner to Gath''Ilzogg, warlord of the Blackrock Clan, and tortured captured defenders of the kingdom at his whim. Taken at last, he was locked in the Stockade under sentence of death, but one of the nobles in the capital put a hold on his execution, and in Lakeshire they are sure of foul play.', '', 'redridge.json 4417 (Gath''Ilzogg''s supreme executioner, tortured captured defenders, locked in the Stockade); quest 386 description (served under Gath''Ilzogg as supreme executioner; men who fought to defend the kingdom tortured on his whim; held in the Stockade, sentenced to die); warcraft.wiki.gg/wiki/Targorr_the_Dread (orc, Blackrock executioner, pre-Cataclysm Stockade); creature 1696 spawn and equipment as in part 1; quest 386 description and objectives (Guard Berton, Lakeshire; supreme executioner under Gath''Ilzogg; men who defended the kingdom tortured on his whim; held in the Stockade, sentenced to die; a noble put a hold on the execution; foul play; behead him before trickery); creature_queststarter/questender 859 Guard Berton (map 0, area 69 Lakeshire, faction 11); quest_template 386 AllowableRaces 1101, QuestType 2, Flags 8; redridge.json 4417 (names Targorr as the premise of 386, uses no 386 trigger)'),
(71706, 2, 717, 0, 0, 0, 'Bazil Thredd', 'Bazil Thredd was Edwin VanCleef''s lieutenant in the Stonemasons'' Guild and followed him out of Stormwind, until he was caught and locked in the Stockade. For years he had no visitors, and the warden took him for a man the Brotherhood had abandoned. The riot proved otherwise: it is Thredd''s.', '', 'Stockade quests 389, 391, 392');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(71700, 1, 0, 255, 'The bandanas are torn from the prison''s wool blankets. Nikova Raskol''s grandson Mac, a guard only fourteen years old, scolded the prisoners for it, and they stabbed him in the back.', 'warcraft.wiki.gg/wiki/The_Stockade, original World of Warcraft community site text (a high-security prison complex hidden beneath the canal district of Stormwind; its inmates; a prisoner-led revolt, the guards driven out); Geography: entrance on the northernmost section of the canal surrounding the Mage Quarter'),
(71700, 2, 0, 255, 'Darkshire sentenced Dextren Ward to die for selling Duskwood''s dead to the necromancer Morbent Fel. The House of Nobles claimed him as Stormwind''s prisoner instead, and he sits here still.', 'warcraft.wiki.gg/wiki/The_Stockade, original World of Warcraft community site text (a high-security prison complex hidden beneath the canal district of Stormwind; its inmates; a prisoner-led revolt, the guards driven out); Geography: entrance on the northernmost section of the canal surrounding the Mage Quarter'),
(71700, 3, 0, 255, 'Kam Deepfury, the Dark Iron who planned the attack on Thandol Span, is held here for political reasons rather than executed.', 'warcraft.wiki.gg/wiki/The_Stockade, original World of Warcraft community site text (a high-security prison complex hidden beneath the canal district of Stormwind; its inmates; a prisoner-led revolt, the guards driven out); Geography: entrance on the northernmost section of the canal surrounding the Mage Quarter'),
(71706, 1, 0, 255, 'A few months before the riot a quiet man began to visit Thredd once or twice a week, his papers in order, his name given as Maelik.', 'Stockade quests 389, 391, 392');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(71700, 1, 717, 0),
(71701, 3, 1696, 0),
(71701, 4, 386, 0),
(71706, 5, 389, 0),
(71706, 4, 391, 0),
(71700, 4, 388, 1),
(71700, 4, 377, 2),
(71700, 4, 378, 3),
(71706, 5, 391, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(71700, 90000015, 0),
(71700, 71701, 1),
(71700, 71706, 2),
(71701, 4417, 0),
(71701, 90000017, 1),
(71701, 71700, 2),
(71706, 4017, 0),
(71706, 90000015, 1),
(71706, 91000015, 2);

-- Stratholme
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 201700 AND 201799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 201700 AND 201799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 201700 AND 201799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 201700 AND 201799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(201700, 0, 2017, 0, 0, 0, 'Stratholme', 'Inside its walls Stratholme is still the burned city of that terrible night. The Scourge holds its eastern streets and has raised ziggurats and a slaughterhouse among the ruins, while the Scarlet Crusade has walled itself into the western quarter. Between them the ghosts of the citizens walk the scorched streets, and the dead and the zealots kill anyone who comes in.', '', 'Stratholme quests 5212, 5282, 5463'),
(201701, 1, 2017, 0, 0, 0, 'The Scarlet Bastion', 'The Scarlet Bastion is the walled quarter where the Scarlet Crusade holds out in Stratholme, the seat of its command under the Grand Crusader. Its gallants and guardsmen kill anything that comes near, and its archivist, Galford, keeps the Crusade''s most valued documents behind the walls.', '', 'Stratholme quests 5251, 5848'),
(201702, 2, 2017, 0, 0, 0, 'Grand Crusader Dathrohan', 'Grand Crusader Dathrohan commands the Scarlet Crusade from the Scarlet Bastion of Stratholme, the leader whose word its captains and highlords obey. Those who break into his quarter of the city find him waiting, and he swears that they have unmade what took him years to create.', '', 'Stratholme quest 5262; creature_text 10812, 10813'),
(201703, 1, 2017, 0, 0, 0, 'The Ziggurats', 'Beyond the first gates of the Scourge''s half of Stratholme rise three ziggurats, each guarded by a servant of the baron, and Ash''ari crystals bound to them ward the slaughterhouse where he waits. The Argent Dawn believes the Scourge draws great power from these towers.', '', 'Stratholme quest 5213; creature_text 10440'),
(201704, 2, 2017, 0, 0, 0, 'Baron Rivendare', 'Baron Rivendare rules Stratholme for the Scourge, Kel''Thuzad''s errand boy as the Argent Dawn calls him, from the slaughterhouse behind the ziggurats. He keeps a prisoner of the Argent Dawn there, and he warns intruders that she will be executed unless they turn back. He raises his servants from death as he fights.', '', 'Stratholme quests 5263, 6163, 8945; creature_text 10440'),
(201705, 2, 2017, 0, 0, 0, 'Aurius', 'Aurius was once a paladin of the Silver Hand whose faith wavered. The Scourge seduced him and nearly made him a death knight, until he sensed his peril and fled to a chapel in Stratholme, the sacred place where Uther the Lightbringer was ordained into the order. There he waits, wounded, for a chance to redeem himself.', '', 'Aurius gossip 3043; quests 5122, 5125');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(201700, 1, 0, 255, 'The Argent Dawn has found that the plague is growing stronger, not weaker, and the most potent samples come from the freshly infected flesh of Stratholme.', 'Stratholme quests 5212, 5282, 5463'),
(201700, 2, 0, 255, 'Somewhere in the city lies Menethil''s Gift, ground blessed by the Lich King and holy to the Scourge. There the lich Ras Frostwhisper was made.', 'Stratholme quests 5212, 5282, 5463'),
(201700, 3, 0, 255, 'A survivor at Light''s Hope made a blaster that frees the tortured ghosts of the city, and he hopes his mother is among those set free.', 'Stratholme quests 5212, 5282, 5463'),
(201701, 1, 0, 255, 'Behind a painting of the twin moons hangs a master work painted over and hidden after Tirion Fordring''s trial: Of Love and Family. Shown it, Tirion nearly collapsed and wept.', 'Stratholme quests 5251, 5848'),
(201702, 1, 0, 255, 'Pressed, the Grand Crusader showed his true form: the dreadlord Balnazzar, brother to Varimathras of the Undercity. Duke Zverenhoff of the Argent Dawn fears the Crusade has served a demon unknowing.', 'Stratholme quest 5262; creature_text 10812, 10813'),
(201704, 1, 0, 255, 'The prisoner is Ysida Harmon of the Argent Dawn. Her husband Anthion tried to free her and failed, and he begs others to finish what he began.', 'Stratholme quests 5263, 6163, 8945; creature_text 10440'),
(201704, 2, 0, 255, 'Freed, Ysida thanked her rescuers, and then understood what had become of the husband who sent them: Anthion had not survived his attempt.', 'Stratholme quests 5263, 6163, 8945; creature_text 10440'),
(201704, 3, 0, 255, 'The abomination Ramstein, which guards his slaughterhouse, is the beast that slew Nathanos Marris on his own stead. Freed by Sylvanas, Nathanos wants its head.', 'Stratholme quests 5263, 6163, 8945; creature_text 10440'),
(201705, 1, 0, 255, 'With his medallion of faith restored he could leave the chapel to do his duty: kill Baron Rivendare, who had helped corrupt him and so many of his brothers and sisters.', 'Aurius gossip 3043; quests 5122, 5125'),
(201705, 2, 0, 255, 'Aurius fought beside those who faced the baron. Dying of his wounds, he said his soul was saved, and that he would die in peace.', 'Aurius gossip 3043; quests 5122, 5125');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(201700, 1, 2017, 0),
(201701, 3, 10424, 0),
(201701, 3, 10418, 0),
(201701, 4, 5251, 0),
(201702, 3, 10812, 0),
(201702, 4, 5262, 0),
(201703, 3, 10399, 0),
(201703, 3, 10436, 0),
(201703, 3, 10437, 0),
(201703, 3, 10438, 0),
(201703, 4, 5213, 0),
(201704, 3, 10440, 0),
(201704, 4, 5263, 0),
(201704, 4, 8945, 0),
(201705, 2, 10917, 0),
(201705, 5, 5122, 0),
(201700, 4, 5212, 1),
(201700, 4, 5463, 2),
(201700, 4, 5282, 3),
(201701, 4, 5848, 1),
(201701, 5, 5848, 1),
(201702, 3, 10812, 1),
(201702, 4, 5262, 1),
(201702, 5, 5262, 1),
(201704, 4, 8945, 1),
(201704, 5, 8945, 2),
(201704, 4, 6163, 3),
(201705, 5, 5122, 1),
(201705, 5, 5125, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(201700, 13917, 0),
(201700, 90000006, 1),
(201700, 90000007, 2),
(201701, 90000007, 0),
(201701, 201702, 1),
(201701, 92000001, 2),
(201702, 90000007, 0),
(201702, 201701, 1),
(201702, 2816, 2),
(201703, 201704, 0),
(201703, 90000006, 1),
(201703, 201700, 2),
(201704, 92000000, 0),
(201704, 90000006, 1),
(201704, 201705, 2),
(201705, 90000032, 0),
(201705, 201704, 1);

-- Sunwell Plateau
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 407500 AND 407599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 407500 AND 407599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 407500 AND 407599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 407500 AND 407599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(407500, 0, 4075, 0, 0, 12, 'Sunwell Plateau', 'The Sunwell Plateau crowns the Isle of Quel''Danas, and at its heart lies the Sunwell, the fount of the high elves'' power, defiled by Arthas and now in the hands of the Burning Legion. Sunblade elves and Shadowsword eredar hold its courtyards and halls, demons of every kind guard the approaches, and in the well''s chamber the Legion''s servants work to open the way for their master.', '', 'Sunwell Plateau spawns (map 580); Sunwell Plateau quests 24553, 24564, 24594-24598; creature_text 37763, 37764'),
(407501, 2, 4075, 0, 0, 12, 'Madrigosa', 'Madrigosa was a dragon of the blue flight who came to the Sunwell and found the pit lord Brutallus guarding the way in. She held the demon to make him tell where Anveena was and what had become of Kalec, and he killed her. Dying, she told her lord Malygos that she had done her best.', '', 'creature_text 24882, 24895, 25038, 24844'),
(407502, 2, 4075, 0, 0, 12, 'Sathrovarr the Corruptor', 'Sathrovarr the Corruptor is the demon that has taken hold of Kalecgos of the blue flight at the edge of the Sunwell. Over the terrace the maddened dragon rages in Kil''jaeden''s name, while in a realm beyond the waking world his true self, Kalec, begs for help before he loses his mind. Sathrovarr always wins, he boasts; he is never on the losing side.', '', 'creature_text 24850, 24891, 24892'),
(407503, 2, 4075, 0, 0, 12, 'M''uru', 'M''uru is the naaru that Kael''thas''s followers took from Tempest Keep and brought to the Sunwell, where its light has been drained to feed the well. What is left of it still fights, and when its light finally fails it collapses into darkness and rises again as Entropius, a thing of the void.', '', 'creature_text 26246, 26247; M''uru 25741 and Entropius 25840 (summoned on M''uru''s fall)'),
(407504, 2, 4075, 0, 0, 12, 'Kil''jaeden', 'Kil''jaeden the Deceiver, eredar lord of the Burning Legion, comes through the Sunwell at last. With the expendable perished, he means to succeed where Sargeras could not: to bleed this world and secure his place as the true master of the Legion. His servants drain a girl in the well''s chamber to open his way.', '', 'creature_text 25315, 25608, 25319, 26046, 26246');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(407500, 1, 0, 255, 'Immersed in the Sunwell, Quel''Delar was made whole and bonded to its bearer. Lor''themar had not thought he would live to see Thalorien''s sword restored; Rommath called it a sign that his people will never give up.', 'Sunwell Plateau spawns (map 580); Sunwell Plateau quests 24553, 24564, 24594-24598; creature_text 37763, 37764'),
(407501, 1, 0, 255, 'Her body did not rest. When Brutallus fell, the Legion raised it as Felmyst, a fel dragon crying glory to Kil''jaeden. When Felmyst fell in turn, Kalecgos said that Madrigosa had deserved a far better fate.', 'creature_text 24882, 24895, 25038, 24844'),
(407502, 1, 0, 255, 'Freed, Kalecgos swore that he was forever in his rescuers'' debt, and that once Kil''jaeden was beaten the whole world would be in their debt as well.', 'creature_text 24850, 24891, 24892'),
(407503, 1, 0, 255, 'After the Deceiver''s defeat, Lady Liadrin grieved that her people''s arrogance had damned one of the most noble beings of all. Velen showed her M''uru''s heart, its spark reclaimed and unblemished: in time, he said, its light might rebirth the soul of a nation.', 'creature_text 26246, 26247; M''uru 25741 and Entropius 25840 (summoned on M''uru''s fall)'),
(407504, 1, 0, 255, 'The girl was Anveena, whom Kalecgos loved. He begged her to wake and become what she was always meant to be, for only she could cleanse the Sunwell. She let go, the spell broke, and the Sunwell''s power turned against the Deceiver.', 'creature_text 25315, 25608, 25319, 26046, 26246'),
(407504, 2, 0, 255, 'Prophet Velen, who called the Deceiver his brother, said that his anguished cry of defeat would echo across the universe and bring new hope to all who still stand against the Legion.', 'creature_text 25315, 25608, 25319, 26046, 26246');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(407500, 1, 4075, 0),
(407501, 3, 24882, 0),
(407501, 3, 25038, 0),
(407502, 3, 24892, 0),
(407503, 3, 25840, 0),
(407504, 3, 25315, 0),
(407500, 5, 24553, 1),
(407500, 5, 24564, 1),
(407500, 5, 24594, 1),
(407500, 5, 24595, 1),
(407500, 5, 24596, 1),
(407500, 5, 24598, 1),
(407501, 3, 25038, 1),
(407502, 3, 24892, 1),
(407503, 3, 25315, 1),
(407504, 3, 25315, 1),
(407504, 3, 25315, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(407500, 408000, 0),
(407500, 90000036, 1),
(407500, 407504, 2),
(407500, 408013, 3),
(407501, 407500, 0),
(407501, 90000063, 1),
(407501, 413101, 2),
(407502, 413101, 0),
(407502, 90000063, 1),
(407502, 407500, 2),
(407503, 90000052, 0),
(407503, 384500, 1),
(407503, 407504, 2),
(407503, 92000003, 3),
(407504, 90000065, 0),
(407504, 91000031, 1),
(407504, 355705, 2),
(407504, 407503, 3);

-- The Eye
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 384500 AND 384599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 384500 AND 384599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 384500 AND 384599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 384500 AND 384599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(384500, 0, 3845, 0, 0, 9, 'The Eye', 'The Eye is the heart of Tempest Keep, the naaru vessel Kael''thas Sunstrider took for his seat, and here the prince holds court. Bloodwarders and the knights and battle mages of the Crimson Hand guard its bridges, astromancers and star scryers work beneath the open sky of the Nether, crystalcore constructs and tempest-smiths keep its machines, and phoenix-hawks wheel through its halls.', '', 'The Eye spawns (map 550); Shattrath quest 10883; Hellfire quests 10888, 13430; Tempest Keep quest 11007'),
(384501, 2, 3845, 0, 0, 9, 'High Astromancer Solarian', 'High Astromancer Solarian leads the astromancers of the Eye for Kael''thas, crying for the Sunwell and by the blood of the Highborne as she fights, and calling her astromancers to her side. Pressed hard, she calls on the fury of the cosmos itself and becomes one with the Void.', '', 'creature_text 18805'),
(384502, 2, 3845, 0, 0, 9, 'Al''ar', 'Al''ar is the phoenix god, the great firebird of Kael''thas, kept in the Eye where it flies between the platforms of its chamber. Like any phoenix it does not stay dead: struck down, it is reborn from its own flames, and it comes back stronger than before.', '', 'Al''ar (subname Phoenix God); Tempest Keep quest 10946');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(384500, 1, 0, 255, 'Tempest Keep is a naaru creation, A''dal says, and the way in has always been theirs to grant. They go back now only because they must: Kael''thas cannot be allowed to speak the words of damnation.', 'The Eye spawns (map 550); Shattrath quest 10883; Hellfire quests 10888, 13430; Tempest Keep quest 11007'),
(384500, 2, 0, 255, 'A''dal set four trials for those who would go in, and the last was the death of Magtheridon. To those who passed them all, the naaru granted the way into Tempest Keep.', 'The Eye spawns (map 550); Shattrath quest 10883; Hellfire quests 10888, 13430; Tempest Keep quest 11007'),
(384500, 3, 0, 255, 'The Verdant Sphere taken from Kael''thas''s body told A''dal that the prince still lived, maimed, calling now to a higher power than Illidan: Kil''jaeden the Deceiver, who is coming to Azeroth.', 'The Eye spawns (map 550); Shattrath quest 10883; Hellfire quests 10888, 13430; Tempest Keep quest 11007'),
(384502, 1, 0, 255, 'Illidan demanded Al''ar''s death of Akama. Akama sent an ally in a magic cowl, to look like one of his own Ashtongue, so that doing the Betrayer''s bidding would lull him into a false sense of security.', 'Al''ar (subname Phoenix God); Tempest Keep quest 10946'),
(384502, 2, 0, 255, 'The deed was done, and Akama was a step closer to shifting Illidan''s attention away from the Ashtongue, and from the prisoner he keeps in the Warden''s Cage.', 'Al''ar (subname Phoenix God); Tempest Keep quest 10946');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(384500, 1, 3845, 0),
(384501, 3, 18805, 0),
(384502, 3, 19514, 0),
(384502, 4, 10946, 0),
(384500, 5, 10883, 1),
(384500, 5, 10888, 2),
(384500, 5, 13430, 2),
(384500, 5, 11007, 3),
(384502, 4, 10946, 1),
(384502, 5, 10946, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(384500, 352315, 0),
(384500, 92000002, 1),
(384500, 90000052, 2),
(384500, 370301, 3),
(384501, 384500, 0),
(384501, 92000002, 1),
(384502, 384500, 0),
(384502, 92000002, 1),
(384502, 352028, 2);

-- The Temple of Atal'Hakkar
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 147700 AND 147799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 147700 AND 147799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 147700 AND 147799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 147700 AND 147799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(147700, 0, 1477, 0, 0, 0, 'The Temple of Atal''Hakkar', 'The Temple of Atal''Hakkar is the great shrine the Atal''ai trolls raised to their blood god Hakkar, the temple the green dragonflight drowned beneath the Pool of Tears. Its halls still stand under the water, ring upon ring, sinking toward a deep round pit at the bottom. The Atal''ai, living and dead, still hold the upper rings, dragonkin of the green flight keep watch in the middle halls against all comers, and the lowest halls lie flooded with ooze.', '', 'tools/research/zones/temple_of_atalhakkar.txt (map 109: areas 1477 and 1417); reachable_areas.json lists 1477 only; WMOAreaTable root 1330 Az_Sunkentemple_Instance.wmo, root label The Temple of Atal''Hakkar; swamp_of_sorrows.json 800, 808 (the Atal''ai, the sinking beneath the Pool of Tears by the green flight), pointed to in one clause; DB spawns on map 109: Atal''ai Warrior 5256, Witch Doctor 5259, Corpse Eater 5270, Unliving Atal''ai 5267, Atal''ai Slave 8318 at z -54 (Hall of the Cursed); Atal''ai Deathwalker 5271, Priest 5269, High Priest 5273, Mummified Atal''ai 5263 at z -91; Nightmare Scalebane 5277, Wyrmkin 5280, Wanderer 5283, Whelp 8319 (faction 50, dragonkin) at z -91; Saturated Ooze 5228, Murk Worm 5226, Slime Maggot 8311, Deep Lurker 8384 at z -190 to -147; quests 3446, 3447 (Marvon: the circle of statues), 1475 (Atal''ai tablets), 8253, 8257 (Morphaz), 3528 (the avatar''s essence), 4146 (Atal''ai haze), named here only by kind; WMOAreaTable root 1330: groups 5227-5234, 5238, 5243, 5257, 5258 labelled Hall of the Cursed; all eleven Atal''ai Warrior 5256 spawns at z -54 fall in them (wmoarea.py over every map 109 spawn); DB spawns at z -54 in the same chambers: Atal''ai Witch Doctor 5259, Atal''ai Corpse Eater 5270, Unliving Atal''ai 5267, Atal''ai Slave 8318 (no script) in small groups of warriors, doctors and slaves; smart_scripts 5256 (Strike, Rend), 5259 (Lightning Bolt, Chain Lightning, Hex, Healing Wave, flee for assist at 15 percent), 5267 (Frenzy and its emote at 30 percent; undead), base and module alike; creature 5256: 11 spawns, all on map 109; WMOAreaTable root 1330: group 5209 Lair of the Chosen (x -526 to -417, y -134 to -38, z -91); all eighteen Atal''ai Deathwalker 5271 spawns fall in it, with Mummified Atal''ai 5263 x6, Atal''ai Priest 5269, Atal''ai High Priest 5273 x2, Jammal''an 5710 and Ogom 5711 at its east end (x -426); smart_scripts 5271 (Shadow Word: Pain, Fear; on death Summon Atal''ai Deathwalker''s Spirit 8317), 5263 (Fevered Plague), 5269 (Heal, Shadow Bolt), 5273 (Renew, Heal, Shadow Bolt, Shadow Shield, Summon Atal''ai Skeleton), base and module; creature 5271: 18 spawns, all on map 109; creature_template 5277 Nightmare Scalebane, 5280 Nightmare Wyrmkin, 5283 Nightmare Wanderer, 8319 Nightmare Whelp (type 2 dragonkin, faction 50, the green dragonkin faction of Somnus and his kin), all spawns on map 109, at z -91 in and around the Pit of Sacrifice; smart_scripts 5277 (Improved Blocking), 5283 (Strike, Pierce Armor), 5280 (Acid Spit, Sleep); the module gives 5277, 5283 their spells and removes 8319''s AI (5280 untouched); faction 50 on 5709, 5719-5722 as well'),
(147702, 1, 1477, 0, 0, 0, 'The Pit of Refuse', 'At the very bottom of the temple lies the Pit of Refuse, a deep round chamber whose floor is drowned in ooze. Six balconies rise around its rim, each holding a great serpent statue, and near the way in stands a silent altar of Hakkar whose carved serpents look much like the statues above.', '', 'WMOAreaTable root 1330: group 5261 The Pit of Refuse (x -536 to -400, y 27 to 168, z -190 to -91); all seven Saturated Ooze 5228 spawns fall in it, with Murk Worm 5226, Slime Maggot 8311 and Deep Lurker 8384 (these also in the Hall of Serpents around it); gameobjects 148830-148835 Atal''ai Statue (z -149, around the pit) and 148836 Altar of Hakkar (z -174), all in group 5261; npc_text 1923 (gossip_menu 1288 of the altar, shown to anyone: the altar stands near the entrance to the room; a large serpent-like statue on each balcony; they look like the ones on the altar); smart_scripts 5228 (Summon Oozelin: in combat in base, once at 50 percent in the module); quests 3446 and 3447 descriptions (Marvon, Tanaris; PrevQuestID 3444 each; QuestType 2, flags 0 and 8; AllowableRaces 0); tanaris.json 44024 (Marvon, his escape, his memory of the room on DONE 3444), pointed to in a phrase'),
(147703, 1, 1477, 0, 0, 0, 'The Pit of Sacrifice', 'At the heart of the temple a great well drops through its middle halls, the Pit of Sacrifice, where the green dragonkin keep watch among their whelps. On six ledges above it stand six champions of the Atal''ai, dead trolls who still fight for their tribe, each alone on his ledge. While they stand, a shield of force bars the way to the tribe''s prophet.', '', 'WMOAreaTable root 1330: group 5211 The Pit of Sacrifice (x -547 to -379, y 9 to 181, z -100 to -11), the central well; the six at z -67 on its rim (Zolo -529,130; Gasher -528,59; Loro -467,24; Hukku -406,60; Zul''Lor -467,166; Mijan -406,131); Nightmare Scalebane 5277, Wanderer 5283, Wyrmkin 5280 and 24 of the 38 Nightmare Whelps 8319 on its floor at z -91; creature_template 5712-5717 (type 6 undead, faction 37 with the Atal''ai), single spawns on map 109; smart_scripts 5712-5717 (each: on death, set instance data 11); warcraft.wiki.gg/wiki/Sunken_Temple notes (original version: six mobs on six ledges overlooking the Pit of Sacrifice)'),
(147704, 2, 1477, 0, 0, 0, 'Jammal''an the Prophet', 'Jammal''an the Prophet is the spiritual leader of the Atal''ai, and he has had a vision: the summoning of Hakkar will bring his tribe immortality. He waits in the Lair of the Chosen with green power streaming about him, among the tribe''s mummified dead and high priests, and the dead troll Ogom the Wretched stands at his side.', '', 'creature 5710 single spawn on map 109 at -426,-86 in WMO group 5209 Lair of the Chosen, with Atal''ai Deathwalker 5271 x18, Mummified Atal''ai 5263 x6, Atal''ai High Priest 5273 x2, Atal''ai Priest 5269 and Ogom 5711; smart_scripts 5710 (Green Channeling on spawn and on reaching home); instance_sunken_temple.cpp SetData DATA_DEFENDER_KILLED (at the sixth: Jammal''an says group 0, forcefield 149431 opened); smart_scripts 5712-5717 set data 11 on death; warcraft.wiki.gg/wiki/Sunken_Temple notes (killing all six removed the shield protecting Jammal''an); hinterlands.json 4723 (his prophecy and the exile), pointed to in one phrase; WMOAreaTable root 1330: group 5209 Lair of the Chosen (x -526 to -417, y -134 to -38, z -91); all eighteen Atal''ai Deathwalker 5271 spawns fall in it, with Mummified Atal''ai 5263 x6, Atal''ai Priest 5269, Atal''ai High Priest 5273 x2, Jammal''an 5710 and Ogom 5711 at its east end (x -426); smart_scripts 5271 (Shadow Word: Pain, Fear; on death Summon Atal''ai Deathwalker''s Spirit 8317), 5263 (Fevered Plague), 5269 (Heal, Shadow Bolt), 5273 (Renew, Heal, Shadow Bolt, Shadow Shield, Summon Atal''ai Skeleton), base and module; creature 5271: 18 spawns, all on map 109'),
(147706, 2, 1477, 0, 0, 0, 'The Shade of Eranikus', 'In the Chamber of the Dreamer lies the shade of Eranikus, a great dragon of the green flight, out of reach of every blade and spell while the prophet of the Atal''ai lives, as if not wholly in this world. The green dragonkin of the temple answer to him, and when the prophet falls his drakes come crying: do not wake the dreamer.', '', 'creature 5709 single spawn at -658,-36 in WMO group 5260 Chamber of the Dreamer; gameobject 148512 Essence Font at -634,-52 in the same group; instance_sunken_temple.cpp OnCreatureCreate (5709 made not selectable) and OnUnitDeath (Jammal''an''s death removes the flag); creature 5719 Morphaz and 5722 Hazzas at -668,103 and -667,81 in group 5259, the passage north of the chamber; warcraft.wiki.gg/wiki/Sunken_Temple (Hazzas and Morphaz guard the final boss through the southern hallway); creature_template 5277 Nightmare Scalebane, 5280 Nightmare Wyrmkin, 5283 Nightmare Wanderer, 8319 Nightmare Whelp (type 2 dragonkin, faction 50, the green dragonkin faction of Somnus and his kin), all spawns on map 109, at z -91 in and around the Pit of Sacrifice; smart_scripts 5277 (Improved Blocking), 5283 (Strike, Pierce Armor), 5280 (Acid Spit, Sleep); the module gives 5277, 5283 their spells and removes 8319''s AI (5280 untouched); faction 50 on 5709, 5719-5722 as well; instance_sunken_temple.cpp at_malfurion_stormrage (areatrigger 4016 at -662,4 on map 109, radius 20, in WMO group 5260 Chamber of the Dreamer: summons 15362 for a player who has 8555 rewarded and 8733 not rewarded); smart_scripts 15362 and 1536200 (on summon remove the questgiver flag, then say groups 0-4 and give the flag back); creature_text 15362 groups 0-2 (The walls of the chamber tremble. Something is happening...; Be steadfast, champion. I know why it is that you are here and I know what it is that you seek. Eranikus will not give up the shard freely. He has been twisted by the same force that you seek to destroy; Is it hard to believe that the power of an Old God could reach even inside the Dream?); quest 8733 (starter 15362, ender 15624; PrevQuestID 8555; QuestType 2, flags 64; AllowableRaces 0); moonglade.json 49316 (his warning recalled, the wisp, Remulos and the redemption on 8734-8736)'),
(147708, 2, 1477, 0, 0, 0, 'The Avatar of Hakkar', 'The Avatar of Hakkar is the form in which the blood god can enter the world, and the Sanctum of the Fallen God, deep in the temple, is where it can be called forth. Stirred, the dead god sends his minions against whoever wakes him. His bloodkeepers carry Hakkari blood, which douses the eternal flames that hold his spirit, and when the last flame goes out the avatar comes.', '', 'quest 3528 description (the Sanctum of the Fallen God; invoke the egg''s power to stir the dead god; minions; bloodrinkers and their Hakkari blood; douse the eternal flames that hold Hakkar''s spirit; the avatar will enter our world; defeat him and place his essence in the egg); WMOAreaTable root 1330 group 5206 Sanctum of the Fallen God (x -526 to -408, y 228 to 324): Eternal Flames 148418-148421, Evil God Spell Focus 148422, the shade''s spawn point; creature 8443 has no spawn: summoned only by 8440, itself summoned only by the egg''s spell');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(147702, 1, 0, 255, 'The goblin Marvon Rivetseeker nearly died here when a statue he pushed exploded. From the altar he once set off a series of lights, and he is sure the circle hides a treasure.', 'WMOAreaTable root 1330: group 5261 The Pit of Refuse (x -536 to -400, y 27 to 168, z -190 to -91); all seven Saturated Ooze 5228 spawns fall in it, with Murk Worm 5226, Slime Maggot 8311 and Deep Lurker 8384 (these also in the Hall of Serpents around it)'),
(147702, 2, 0, 255, 'Woken in the right order, the six statues raised an idol of Hakkar in the pit, and with it its guardian Atal''alarion, crying that his banishment was ended. Behind the idol''s eye lay the Atal''ai treasure.', 'WMOAreaTable root 1330: group 5261 The Pit of Refuse (x -536 to -400, y 27 to 168, z -190 to -91); all seven Saturated Ooze 5228 spawns fall in it, with Murk Worm 5226, Slime Maggot 8311 and Deep Lurker 8384 (these also in the Hall of Serpents around it)'),
(147704, 1, 0, 255, 'An Atal''ai priest who urged caution was exiled for it. Jammal''an''s reckless trust in false visions, he says, has led his people to their eternal doom.', 'creature 5710 single spawn on map 109 at -426,-86 in WMO group 5209 Lair of the Chosen, with Atal''ai Deathwalker 5271 x18, Mummified Atal''ai 5263 x6, Atal''ai High Priest 5273 x2, Atal''ai Priest 5269 and Ogom 5711'),
(147706, 1, 0, 255, 'Eranikus was keeper of this temple, charged to see that the trolls never again bring forth their god. He failed, and asked that a gem holding his essence be purged in the font of his lair.', 'creature 5709 single spawn at -658,-36 in WMO group 5260 Chamber of the Dreamer; gameobject 148512 Essence Font at -634,-52 in the same group'),
(147706, 2, 0, 255, 'The god''s corruption had tainted even the font. As it tore his essence from him, Eranikus felt an eternal nightmare take hold.', 'creature 5709 single spawn at -658,-36 in WMO group 5260 Chamber of the Dreamer; gameobject 148512 Essence Font at -634,-52 in the same group'),
(147706, 3, 0, 255, 'Malfurion Stormrage appeared in his chamber to one seeking the green shard of a scepter. An Old God''s power had twisted Eranikus even within the Dream, he said, and only drawn into Azeroth could he be cleansed.', 'creature 5709 single spawn at -658,-36 in WMO group 5260 Chamber of the Dreamer; gameobject 148512 Essence Font at -634,-52 in the same group'),
(147708, 1, 0, 255, 'Green dragonkin came to the sanctum to smother the shade as it rose, but as each flame went out its voice grew, until it roared that Hakkar lives, and the avatar came forth.', 'quest 3528 description (the Sanctum of the Fallen God; invoke the egg''s power to stir the dead god; minions; bloodrinkers and their Hakkari blood; douse the eternal flames that hold Hakkar''s spirit; the avatar will enter our world; defeat him and place his essence in the egg)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(147700, 1, 1477, 0),
(147702, 3, 5228, 0),
(147703, 3, 5712, 0),
(147703, 3, 5713, 0),
(147703, 3, 5714, 0),
(147703, 3, 5715, 0),
(147703, 3, 5716, 0),
(147703, 3, 5717, 0),
(147704, 3, 5710, 0),
(147704, 4, 1446, 0),
(147706, 3, 5709, 0),
(147706, 3, 5721, 0),
(147706, 3, 5720, 0),
(147708, 4, 3528, 0),
(147708, 3, 8443, 0),
(147702, 4, 3446, 1),
(147702, 4, 3447, 1),
(147702, 3, 8580, 2),
(147702, 5, 3447, 2),
(147704, 5, 1446, 1),
(147706, 4, 3373, 1),
(147706, 5, 3373, 2),
(147706, 4, 8733, 3),
(147708, 3, 8443, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(147700, 808, 0),
(147700, 90000022, 1),
(147700, 91000020, 2),
(147702, 147700, 0),
(147702, 147708, 1),
(147703, 147704, 0),
(147703, 147700, 1),
(147704, 147700, 0),
(147704, 808, 1),
(147704, 147706, 2),
(147706, 90000022, 0),
(147706, 813, 1),
(147706, 147700, 2),
(147708, 147700, 0),
(147708, 91000020, 1),
(147708, 44002, 2);

-- Trial of the Champion
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 472300 AND 472399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 472300 AND 472399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 472300 AND 472399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 472300 AND 472399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(472300, 0, 4723, 0, 0, 15, 'Trial of the Champion', 'The Trial of the Champion is fought in the arena of the Argent Coliseum beside the tournament grounds, before the leaders of the Alliance and the Horde and a crowd of every people cheering its own. The tournament''s champions ride first against its grand champions in the joust, and then face the Crusade''s own best, a paladin who will not hold back and a confessor of the Light who makes them face their past deeds.', '', 'Trial of the Champion spawns (map 650); creature_text 33628, 34928, 35004, 35005, 35119'),
(472301, 2, 4723, 0, 0, 15, 'The Black Knight', 'The Black Knight came back in the middle of the trial, killing the herald where he stood. Did they honestly think, he asked, that an agent of the Lich King would be bested on the field of their pathetic little tournament? He had come to finish his task, and when his rotting flesh fell away he fought on as bone, and then without even that.', '', 'creature_text 35451, 35004, 35005, 35545; Trial of the Champion quest 14199');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(472301, 1, 0, 255, 'Dying at last, the knight cried out that he must not fail again, as though a second failure frightened him more than death.', 'creature_text 35451, 35004, 35005, 35545; Trial of the Champion quest 14199');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(472300, 1, 4723, 0),
(472301, 3, 35451, 0),
(472301, 3, 35451, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(472300, 21019, 0),
(472300, 90000031, 1),
(472300, 472301, 2),
(472301, 21019, 0),
(472301, 472300, 1),
(472301, 92000005, 2);

-- Trial of the Crusader
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 472200 AND 472299;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 472200 AND 472299;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 472200 AND 472299;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 472200 AND 472299;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(472200, 0, 4722, 0, 0, 15, 'Trial of the Crusader', 'The Trial of the Crusader is the Argent Crusade''s great test in the Crusaders'' Coliseum. Highlord Tirion Fordring sets the champions who answered his call against the worst Northrend can offer, before the eyes of King Varian Wrynn, Lady Jaina Proudmoore, Thrall and Garrosh Hellscream, and those who survive, he promises, will march with the Crusade on Icecrown Citadel and the Lich King himself.', '', 'Trial of the Crusader quest 24589; creature_text 34564, 34780, 34990, 34995, 34996, 35458, 35877');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(472200, 1, 0, 255, 'Grand Warlock Wilfred Fizzlebang, a gnome, meant to summon a doomguard for the trial and called up Lord Jaraxxus, an eredar lord of the Burning Legion, who killed him on the spot. Dying, the demon warned that another would take his place.', 'Trial of the Crusader quest 24589; creature_text 34564, 34780, 34990, 34995, 34996, 35458, 35877'),
(472200, 2, 0, 255, 'The summoner was of the Alliance, and Garrosh cried treachery. Varian demanded justice in turn, and Tirion, who swore there was no conspiracy, let the champions of the Alliance and the Horde fight each other in place of his knights.', 'Trial of the Crusader quest 24589; creature_text 34564, 34780, 34990, 34995, 34996, 35458, 35877'),
(472200, 3, 0, 255, 'When the last trial was won, the Lich King himself came. The Nerubians had built an empire beneath the frozen wastes, he told Tirion, and the Crusade had built upon it: his empire. Then he broke the arena floor.', 'Trial of the Crusader quest 24589; creature_text 34564, 34780, 34990, 34995, 34996, 35458, 35877'),
(472200, 4, 0, 255, 'Below waited Anub''arak, risen again, who had expected his guests just as the master promised. Dying, the crypt lord confessed that he had failed his master.', 'Trial of the Crusader quest 24589; creature_text 34564, 34780, 34990, 34995, 34996, 35458, 35877');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(472200, 1, 4722, 0),
(472200, 3, 34780, 1),
(472200, 3, 34780, 2),
(472200, 3, 34564, 3),
(472200, 3, 34564, 4);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(472200, 21019, 0),
(472200, 92000001, 1),
(472200, 92000005, 2),
(472200, 427701, 3);

-- Uldaman
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 133700 AND 133799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 133700 AND 133799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 133700 AND 133799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 133700 AND 133799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(133700, 0, 1337, 0, 0, 0, 'Uldaman', 'Uldaman lies buried beneath the northern Badlands, a vault of the titans far older than any dwarven hold, cut from the living rock on a scale no mortal mason ever attempted. The dwarves of Ironforge broke into it looking for the origins of their people, and lost it when the Stonevault troggs boiled up from the depths. The Shadowforge clan of the Dark Iron dwarves digs behind barricades of its own, and deeper in the vault keeps guardians of living stone.', '', 'warcraft.wiki.gg/wiki/Uldaman (pre-Cataclysm official description: an ancient titan vault buried deep within the earth; dwarven digs penetrated it and released the troggs; Dark Iron incursions; guardians of living stone); its disc and creation lore is left out; AreaTable 1337 Uldaman (map 70); on map 0 the outer halls are WMO 1218 (Kz_Uldaman_A, name set 1), whose WMOAreaTable rows all report area 1337, so the overview also fires in the excavated outer halls; creature 2909 there has areaId 1337; badlands.json 300 (Stonevault troggs woken from long slumber; the Shadowforge clan; the vault of the titans), pointed to, not retold; quests 1360 and 2342 (diggers fled the troggs and left their chests in the Common Halls), 2398 (troggs came so fast and in such numbers), 2201 (Shadowforge and troggs vie for control of the dig site); DB spawns map 70: Stonevault troggs (4850-4855, 7175, 7320, 7321), Shadowforge (4847-4849, 7030, 7290, 7291), stone guardians (4857, 4860, 7011, 7012, 7206, 7309, 7396, 7397) with spell 10255 Stoned on the vault''s sleepers; quests 1360 and 2342 descriptions (diggers at the excavation; left their chests when the troggs came; North and South Common Hall); gameobjects 126049 and 128293 Magenta Cap Clusters on map 0 (outer halls, x -6295 to -6062) and map 70; WMOAreaTable WMO 1218: North Common Hall, South Common Hall, Excavation Center, Dig One (area 1337); DB spawns map 0, outer halls (x -6280 to -6020, z 204 to 282): Shadowforge Digger 4846, Surveyor 4844, Ruffian 4845, Obsidian Golem 4872, Stonevault Cave Hunter 4856 (smart_scripts 4856: Net, Throw); creature 4856 Stonevault Cave Hunter: 17 spawns, all on map 0 inside WMO 1218 (Kz_Uldaman_A, name set 1): North Common Hall 8, South Common Hall 2, unnamed groups 1253 and 1236 beside them 7 (vmap group lookup); WMOAreaTable gives area 1337 for every group of that name set, so the server reports Uldaman there; quests 17 and 2202 descriptions (magenta fungus caps grow in clusters in the early tunnels; poison spores if jostled); WMOAreaTable WMO 1219 group 1296 Echomok Cavern (map 70); the exit (areatrigger_teleport 902) and the Echomok Door lie in unnamed group 8105 at its edge; gameobject 124370 Echomok Door at -185,390; areatrigger_teleport 902 Uldaman Exit (map 70, -214,383) to map 0 at -6606,-3762; badlands.json 314 (a rear passage opens into Uldaman at Dustwind Gulch), pointed to; DB spawns map 70: Shadowforge Relic Hunter 4847 x5 (x -161 to -137, y 364 to 389), Shadowforge Geologist 7030; smart_scripts 4847 (Shadow Word: Pain, Silence, Heal), 7030 (Flame Spike, Flame Lash); vmap group lookup, map 70: all 5 Shadowforge Relic Hunters 4847 and the Obsidian Sentinel 7023 in group 1296; no troggs there; creature 7291 single spawn on map 70 at -10,415; DB spawns near him: Shadowforge Sharpshooter 7290, Darkcaster 4848, Archaeologist 4849, Geologist 7030 (x -5 to 15, y 384 to 418); gameobject 142088 Tablet of Will at -2,422; gameobject 113757 Shadowforge Cache at 21,414 (quest 2201: the ruby in a barricaded Shadowforge area); ironforge.json 153706 part 4 (the Tablet of Will), pointed to only as an ancient tablet; WMOAreaTable WMO 1219 group 1295 Dig Three; vmap group lookup: Galgann, his sharpshooters, darkcasters, archaeologists, two geologists, the Tablet of Will and the Shadowforge Cache stand in it; creature 4854 Grimlok, subname Stonevault Chieftain, single spawn on map 70 at 57,455; DB spawns near him: Stonevault Brawler 4855, Geomancer 4853 (Fireball, Flame Buffet), Jadespine Basilisk 4863 (x 9 to 85, y 305 to 455); quests 2201 and 2339 (Grimlok, the trogg leader, claimed the sapphire), told in 133712 and 133713; WMOAreaTable WMO 1219 groups 1286, 1294, 1297 The Stone Vault; Grimlok in 1294; Shrink 11892 targets a single foe'),
(133702, 1, 1337, 0, 0, 0, 'The Hall of the Keepers', 'Past the gate of the vault proper opens its first great hall, the Hall of the Keepers, and the Stonevault troggs hold it in force, their oracles raising shields of lightning and spouts of lava. Side digs lead off it, and in one corner, where the troggs pay them no mind, lie the remains of a paladin, left where he fell.', '', 'WMOAreaTable WMO 1219 (Kz_Uldaman_B, the map 70 model) groups 1259, 1281, 1282, 1285, 1289, 1291, 1292 Hall of the Keepers; the entrance (areatrigger_teleport 286, -226,49) lies in group 1281; warcraft.wiki.gg/wiki/Hall_of_the_Keepers (the first hall of the dungeon, past the portal; Stonevault troggs; Revelosh; Remains of a Paladin); vmap group lookup, map 70: Remains of a Paladin 6912 (-176,169) in group 1285, Revelosh 6910 in 1282; Stonevault Rockchewer 4851 (19 on map 70) all in Hall of the Keepers groups; Stonevault Oracle 4852 in the hall and beyond; smart_scripts 4851 (Frenzy at 30 percent base, Enrage at 50 percent module, both with the emote goes into a frenzy), 4852 (Lightning Shield, Healing Ward, Lava Spout Totem, Healing Wave); quest 2198 description (a tarnished necklace; intricate and magical craftsmanship; missing three gems; the faint imprint of the city seal of Ironforge; the letters TdK); item 7666 Shattered Necklace starts it; creature_loot_template 7666: Shadowforge Surveyor, Ruffian, Digger (outer halls), Stonevault Rockchewer, Oracle, Cave Hunter; ironforge.json 153709 (Talvash del Kissel: TALK 6826, ACCEPT 2200, DONE 2361), not retold; quest 2283 description (an idiot paladin who died at the Uldaman dig site; a very valuable necklace with a ruby, a sapphire and a topaz; top silver; we''ll fix whatever scratches); creature 6986 Dran Droffers, Droffers and Son Salvage, in Orgrimmar (faction 29); 6868 Jarkal Mossmeld in Kargath (faction 126); 6912 Remains of a Paladin on map 70; quest_template_addon chain 2283-2284-2318-2338-2339-2340-2341; creatures 6906 Baelog, 6907 Eric The Swift, 6908 Olaf: single spawns on map 70 at -353,117, -358,119 and -357,132; faction template 122 (Ironforge: friendly to the Alliance, enemy group Horde); gameobjects 123329 Baelog''s Chest (-356,113), 123463 Baelog''s Journal (-355,115), 103011 Dwarven Campfire (-358,121); quest 2398 description (Baelog led a small band of dwarves deep within the site just before the troggs showed up); ironforge.json 153707 and 153714 (Stormpike''s search, the wager over Olaf''s beard, the journal''s way into the Chamber of Khaz''mul), not retold; vmap group lookup, map 70: the camp is WMO 1219 group 1303 Dig Two, off the Hall of the Keepers'),
(133703, 1, 1337, 0, 0, 0, 'The Halls of Living Stone', 'Beyond the halls the troggs hold, the vault is kept by earthen, figures of living stone that do not speak and do not let anyone pass. They guard the Temple Hall and, further east, the grander Hall of the Crafters, where four stone keepers stand as still as statues around an altar before a closed temple door.', '', 'DB spawns map 70: Earthen Rocksmasher 7011 x24 and Earthen Sculptor 7012 x8 (x -111 to -2, y 197 to 332), Stone Steward 4860, Shrike Bat 4861, Jadespine Basilisk 4863, Cleft Scorpid 7078, Venomlash Scorpid 7022; smart_scripts 7011 (Battle Stance, Strike), 7012 (Fire Shield IV, Flame Buffet), 4860 (Ground Tremor); the module''s versions keep the same spells; creature_template 7011, 7012 type 7, faction 415; vmap group lookup, map 70: Earthen Rocksmasher 7011 and Sculptor 7012 stand in Temple Hall groups 1266, 1283, 1293 (22 of 32) and the unnamed passages 1262 and 1274 beside it; Ancient Stone Keeper 7206 in 1293; Annora 11073 in unnamed cave 1277 among Cleft Scorpids 7078 (groups 1272, 1276, 1277), joined to the Temple Hall through 1298; DB spawns map 70: Earthen Stonebreaker 7396 x24 and Stonecarver 7397 x7 (x 49 to 154, z -52 to -26), Stone Keeper 4857 x4 at z -26, Earthen Custodian 7309, Hallshaper 7077, Guardian 7076 and Vault Warder 10120 on the floor below (z -52), all with Stoned; gameobjects 130511 Altar of The Keepers (105,272,-26), 124367 Temple Door (138,288,-26); smart_scripts 7396 (Battle Stance, Strike), 7397 (Fire Shield IV, Flame Buffet); WMOAreaTable WMO 1219 groups 1261, 1264, 1269, 1270, 1284, 1287, 1288, 1290, 1299 Hall of the Crafters; vmap group lookup: every Earthen Stonebreaker 7396 (24) and Stonecarver 7397 (7), the four Stone Keepers and the Altar of The Keepers stand in them; the chamber below is Khaz''goroth''s Seat (group 1267)'),
(133706, 2, 1337, 0, 0, 0, 'Ironaya', 'Ironaya is a guardian of Uldaman, a towering figure of iron sealed in the Chamber of Khaz''mul behind a great carved seal that only the right key will open. When the way is opened she strides out with a warning: none may steal the secrets of the Makers.', '', 'creature 7228 Ironaya, single spawn on map 70 at -236,310, female text, type 10; gameobjects 124371 Keystone (-235,240; lock 359 needs item 7733 Staff of Prehistoria) and 124372 Seal of Khaz''Mul (-235,295); quest 2240 description and areatrigger_involvedrelation 822 (explore the Chamber of Khaz''mul; AreaTrigger.dbc 822 at -234,319 on map 70, Ironaya''s hall); ironforge.json 153714 part 1 (Baelog''s journal shows the way into the Chamber of Khaz''mul), pointed to'),
(133707, 2, 1337, 0, 0, 0, 'Archaedas', 'Archaedas, the Ancient Stone Watcher, sits in Khaz''goroth''s Seat, the great chamber beneath the Hall of the Crafters, a giant of living stone among rows of stone dwarves as still as he is. Behind him the door of the Ancient Vault stays shut, and calling upon the altar before him wakes him to the wrath of the Makers. Whatever lies in the vault, he is its last guard.', '', 'creature 2748 Archaedas, subname Ancient Stone Watcher, type 5 giant, single spawn on map 70 at 104,272,-52; gameobject 133234 Altar of Archaedas (96,269,-52; type 18, spell 10340 Uldaman Boss Agro; spell_uldaman_boss_agro_archaedas wakes him); DB spawns: Earthen Custodian 7309 x32, Hallshaper 7077 x12, Guardian 7076 x6, Vault Warder 10120 x4 around him, all Stoned; gameobject 124369 The Ancient Vault (138,288,-52); warcraft.wiki.gg/wiki/Uldaman (official description: the Discs guarded by a massive, sapient Stonekeeper called Archaedas); WMOAreaTable WMO 1219 group 1267 Khaz''goroth''s Seat; vmap group lookup: Archaedas, the Altar of Archaedas, The Ancient Vault door and every custodian, hallshaper and guardian stand in it'),
(133711, 1, 1337, 0, 0, 0, 'The Discs of Norgannon', 'Beyond Archaedas lies the Ancient Vault, and at its heart four huge platinum discs adorned with sigils of no known origin. At a touch the image of a great stone watcher springs up beside them, the Lore Keeper of Norgannon. The Creators'' making of the earthen is recorded here, it says, and it waits to be asked.', '', 'quest 2278 description (four huge platinum discs; sigils of unknown origin; your hand tingles; the visage of a large stone watcher springs forth; Salutations, I am a keeper of knowledge; stored here for this world in the Discs of Norgannon); gameobject 131474 The Discs of Norgannon, single spawn at 162,298,-51 behind The Ancient Vault 124369 (opened only on Archaedas''s death, instance_uldaman.cpp); smart_scripts 131474 (on accepting 2278, summon 7172 Lore Keeper of Norgannon); creature 7172 gossip 562 (npc_text 1079: offers insight into the Creators'' synthesis of the Earthen at your leisure); ironforge.json 153705 part 1 and 153714 part 2, thunder_bluff.json 163811 part 1 and 163817 (what the discs say and where they lead), pointed to only');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(133700, 1, 0, 255, 'The Shadowforge dig for strange stones that, treated rightly, are stable sources of power. They learned the secret from a goblin they took to Angor Fortress, then threw him out.', 'warcraft.wiki.gg/wiki/Uldaman (pre-Cataclysm official description: an ancient titan vault buried deep within the earth; dwarven digs penetrated it and released the troggs; Dark Iron incursions; guardians of living stone); its disc and creation lore is left out'),
(133700, 2, 0, 255, 'Hammertoe Grez, their prisoner, begs for the amulet Magregan Deepshadow took from him, before it leads the Shadowforge to what they are looking for.', 'warcraft.wiki.gg/wiki/Uldaman (pre-Cataclysm official description: an ancient titan vault buried deep within the earth; dwarven digs penetrated it and released the troggs; Dark Iron incursions; guardians of living stone); its disc and creation lore is left out'),
(133702, 1, 0, 255, 'The paladin carried a necklace made by Talvash del Kissel of Ironforge. His journal tells where its three gems went: the Shadowforge, the troggs and their king Grimlok each took one.', 'WMOAreaTable WMO 1219 (Kz_Uldaman_B, the map 70 model) groups 1259, 1281, 1282, 1285, 1289, 1291, 1292 Hall of the Keepers; the entrance (areatrigger_teleport 286, -226,49) lies in group 1281'),
(133702, 2, 0, 255, 'In a side dig off the hall Baelog and his band of Ironforge dwarves have held out since the troggs came, cut off behind the lines, betting on whose beard would grow longest before help arrived.', 'WMOAreaTable WMO 1219 (Kz_Uldaman_B, the map 70 model) groups 1259, 1281, 1282, 1285, 1289, 1291, 1292 Hall of the Keepers; the entrance (areatrigger_teleport 286, -226,49) lies in group 1281'),
(133703, 1, 0, 255, 'In a side cave crawling with scorpids hides Annora, an enchanter, who had begun to think she would have to hide out forever. What brought her so deep she does not say.', 'DB spawns map 70: Earthen Rocksmasher 7011 x24 and Earthen Sculptor 7012 x8 (x -111 to -2, y 197 to 332), Stone Steward 4860, Shrike Bat 4861, Jadespine Basilisk 4863, Cleft Scorpid 7078, Venomlash Scorpid 7022'),
(133706, 1, 0, 255, 'Baelog of the Explorers'' League was sure the chamber existed and knew how to open it. If Ironforge ever takes Uldaman back, the League means its secrets to be theirs.', 'creature 7228 Ironaya, single spawn on map 70 at -236,310, female text, type 10'),
(133711, 1, 0, 255, 'The titans made the earthen from the stone of Azeroth to shape its deep places. Under strain their making came undone in two ways: the troggs, who lost their minds, and the dwarves, who turned to flesh.', 'quest 2278 description (four huge platinum discs; sigils of unknown origin; your hand tingles; the visage of a large stone watcher springs forth; Salutations, I am a keeper of knowledge; stored here for this world in the Discs of Norgannon)'),
(133711, 2, 0, 255, 'The Creators judged the dwarf an acceptable variant, worthy of genesis in its own right. It is the proof the Explorers'' League has been digging for.', 'quest 2278 description (four huge platinum discs; sigils of unknown origin; your hand tingles; the visage of a large stone watcher springs forth; Salutations, I am a keeper of knowledge; stored here for this world in the Discs of Norgannon)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(133700, 1, 1337, 0),
(133702, 2, 6912, 0),
(133703, 3, 7011, 0),
(133703, 3, 7012, 0),
(133703, 3, 7396, 0),
(133703, 3, 7397, 0),
(133706, 3, 7228, 0),
(133706, 4, 2240, 0),
(133707, 3, 2748, 0),
(133711, 4, 2278, 0),
(133700, 4, 2418, 1),
(133700, 4, 722, 2),
(133702, 4, 2201, 1),
(133702, 4, 2339, 1),
(133702, 5, 2398, 2),
(133703, 2, 11073, 1),
(133706, 4, 2240, 1),
(133706, 5, 2240, 1),
(133711, 5, 2278, 1),
(133711, 5, 2278, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(133700, 90000012, 0),
(133700, 90000010, 1),
(133700, 90000013, 2),
(133702, 133700, 0),
(133702, 90000012, 1),
(133702, 133706, 2),
(133703, 133707, 0),
(133703, 90000086, 1),
(133703, 133700, 2),
(133706, 133700, 0),
(133706, 90000012, 1),
(133706, 133707, 2),
(133707, 133711, 0),
(133707, 133703, 1),
(133707, 90000086, 2),
(133711, 90000012, 0),
(133711, 90000013, 1),
(133711, 90000086, 2);

-- Ulduar
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 427300 AND 427399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 427300 AND 427399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 427300 AND 427399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 427300 AND 427399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(427300, 0, 4273, 0, 0, 14, 'Ulduar', 'Behind its gates Ulduar opens on vast formation grounds, where Brann Bronzebeard''s expedition and the Kirin Tor have brought siege engines against iron constructs and storm beacons that keep the city''s defenses alive. Beyond lie a colossal forge, a scrapyard and halls built for giants, and the deeper anyone goes the less Ulduar seems like a city of the titans at all.', '', 'Ulduar spawns (map 603); Lore Keeper of Norgannon gossip 10366, creature_text 33686, 33701; creature_text 33118, 33293, 32857, 32867, 32927, 33235'),
(427301, 1, 4273, 0, 0, 14, 'The Archivum', 'The Archivum is Ulduar''s great titan archive, and in it Brann Bronzebeard found something worse than he feared: the Algalon signal. When a world''s Prime Designate dies, an emergency signal calls the Observer, Algalon, to judge it. Loken was Azeroth''s Prime Designate, and his death set the signal off.', '', 'Ulduar quests 13604, 13607, 13622, 13816, 13817; creature_text 33874, 33235'),
(427302, 2, 4273, 0, 0, 14, 'The Keepers of Ulduar', 'Four keepers of the titans remain in Ulduar, Freya, Hodir, Thorim and Mimiron, and the thing in the prison has its hold on all of them. Freya guards her conservatory against any intruder, Hodir offers only endless winter, Thorim makes sport of his captives in his arena, and Mimiron is delighted to have guests for his latest tests.', '', 'Ulduar quests 13606, 13609, 13610, 13611, 13821-13824; creature_text 32845, 32865, 32906, 33196, 33350'),
(427303, 2, 4273, 0, 0, 14, 'General Vezax', 'General Vezax guards the Descent into Madness for his master, a faceless lord in whom the black blood of Yogg-Saron courses. He welcomes those who stand before the legions of death with promises of a new age of suffering, and the saronite vapors around him gather into a monstrous form.', '', 'creature_text 33271'),
(427304, 2, 4273, 0, 0, 14, 'Yogg-Saron', 'Yogg-Saron is the Old God imprisoned beneath Ulduar, the god of death, as he names himself, whose whispers turned Loken and reached into the keepers. A young woman, Sara, cries for help at his prison, then urges his attackers on, then shows herself for what she is: the lucid dream, the monster in their nightmares, the fiend of a thousand faces.', '', 'creature_text 33134, 33288, 33552, 33436, 33437, 33441, 33523; boss_yoggsaron.cpp'),
(427305, 2, 4273, 0, 0, 14, 'Algalon the Observer', 'Algalon the Observer is the herald of the titans'' Pantheon, come down to Azeroth when its Prime Designate died, to analyze the world and send back his reply. He has not come to fight, he says: should he find systemic corruption, it is in the universe''s best interest to re-originate the planet.', '', 'Ulduar quests 13614, 13631, 13818, 13819; creature_text 32871, 34064');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(427300, 1, 0, 255, 'The Lore Keeper of Norgannon at the gates told the expedition what the complex was built for: to imprison an entity designated Yogg-Saron. Its security has been compromised, and the prison''s status is unknown.', 'Ulduar spawns (map 603); Lore Keeper of Norgannon gossip 10366, creature_text 33686, 33701; creature_text 33118, 33293, 32857, 32867, 32927, 33235'),
(427300, 2, 0, 255, 'Ignis the Furnace Master tempered weapons in the colossal forge for Loken, swearing they would be used to reclaim the world. Dying, the fire giant said only: I have failed.', 'Ulduar spawns (map 603); Lore Keeper of Norgannon gossip 10366, creature_text 33686, 33701; creature_text 33118, 33293, 32857, 32867, 32927, 33235'),
(427300, 3, 0, 255, 'In the scrapyard the XT-002 Deconstructor, a construct of Mimiron''s that thinks of itself as the keeper''s son, begged for new toys and promised not to break them this time.', 'Ulduar spawns (map 603); Lore Keeper of Norgannon gossip 10366, creature_text 33686, 33701; creature_text 33118, 33293, 32857, 32867, 32927, 33235'),
(427300, 4, 0, 255, 'The Assembly of Iron, Steelbreaker, Runemaster Molgeim and Stormcaller Brundir, sat in judgment over the way inward. Their fall opened the Archivum.', 'Ulduar spawns (map 603); Lore Keeper of Norgannon gossip 10366, creature_text 33686, 33701; creature_text 33118, 33293, 32857, 32867, 32927, 33235'),
(427301, 1, 0, 255, 'Algalon''s analysis ends in one of two replies: Alpha, all is well, or Omega, re-origination, the world broken down into rock, metal and gas and rebuilt to its original blueprint. The replies are built into Algalon; he is both messenger and message.', 'Ulduar quests 13604, 13607, 13622, 13816, 13817; creature_text 33874, 33235'),
(427301, 2, 0, 255, 'The way to the Celestial Planetarium needs the sigils of the four watchers, Freya, Thorim, Hodir and Mimiron, and an outside influence is gaining control of all four. Only enough force will free them.', 'Ulduar quests 13604, 13607, 13622, 13816, 13817; creature_text 33874, 33235'),
(427301, 3, 0, 255, 'The hammer Val''anyr was made by the titans for Urel Stoneheart, the first earthen king, to give life to his brethren. It was shattered in the first war between the earthen and the iron dwarves.', 'Ulduar quests 13604, 13607, 13622, 13816, 13817; creature_text 33874, 33235'),
(427302, 1, 0, 255, 'Thorim had been listening to an illusion of his wife Sif, who died by his brother''s hand. Freed, he felt as though he were waking from a nightmare whose shadows still lingered.', 'Ulduar quests 13606, 13609, 13610, 13611, 13821-13824; creature_text 32845, 32865, 32906, 33196, 33350'),
(427302, 2, 0, 255, 'Mimiron admitted a slight miscalculation: he had let the fiend in the prison corrupt his mind and override his primary directive.', 'Ulduar quests 13606, 13609, 13610, 13611, 13821-13824; creature_text 32845, 32865, 32906, 33196, 33350'),
(427302, 3, 0, 255, 'Freya felt his hold on her dissipate and saw clearly once more, and Hodir said he was released from his grasp at last.', 'Ulduar quests 13606, 13609, 13610, 13611, 13821-13824; creature_text 32845, 32865, 32906, 33196, 33350'),
(427304, 1, 0, 255, 'In his mind lie visions of what he has touched: the forging of the Dragon Soul, the night the orcs came for King Llane, the Lich King on his throne. A thousand deaths, he whispers, or one murder.', 'creature_text 33134, 33288, 33552, 33436, 33437, 33441, 33523; boss_yoggsaron.cpp'),
(427304, 2, 0, 255, 'Dying, he promised that his fate was sealed for them too: the end of days was upon all who inhabit this miserable little seedling.', 'creature_text 33134, 33288, 33552, 33436, 33437, 33441, 33523; boss_yoggsaron.cpp'),
(427305, 1, 0, 255, 'Beaten, he spoke of worlds razed while his heart felt nothing, and wondered whether mortals'' imperfections, which grant them free will, let them prevail where the titans'' perfect creations failed. He rearranged the reply code so the world would be spared.', 'Ulduar quests 13614, 13631, 13818, 13819; creature_text 32871, 34064'),
(427305, 2, 0, 255, 'Too weak to send the signal himself, he left it to the mortals. Brann carried it to Rhonin in Dalaran, a place of power close to the skies, and Rhonin said: let us hope this works, for all our sakes.', 'Ulduar quests 13614, 13631, 13818, 13819; creature_text 32871, 34064');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(427300, 1, 4273, 0),
(427301, 5, 13604, 0),
(427301, 5, 13817, 0),
(427301, 4, 13607, 0),
(427301, 4, 13816, 0),
(427302, 5, 13606, 0),
(427302, 5, 13609, 0),
(427302, 5, 13610, 0),
(427302, 5, 13611, 0),
(427302, 5, 13821, 0),
(427302, 5, 13822, 0),
(427302, 5, 13823, 0),
(427302, 5, 13824, 0),
(427303, 3, 33271, 0),
(427304, 3, 33288, 0),
(427305, 5, 13614, 0),
(427305, 5, 13818, 0),
(427305, 4, 13631, 0),
(427305, 4, 13819, 0),
(427300, 2, 33686, 1),
(427300, 3, 33118, 2),
(427300, 3, 33293, 3),
(427300, 3, 32867, 4),
(427300, 3, 32927, 4),
(427300, 3, 32857, 4),
(427301, 5, 13604, 1),
(427301, 5, 13817, 1),
(427301, 5, 13607, 2),
(427301, 5, 13816, 2),
(427301, 5, 13622, 3),
(427302, 5, 13610, 1),
(427302, 5, 13823, 1),
(427302, 5, 13611, 2),
(427302, 5, 13824, 2),
(427302, 5, 13606, 3),
(427302, 5, 13821, 3),
(427302, 5, 13609, 3),
(427302, 5, 13822, 3),
(427304, 3, 33288, 1),
(427304, 3, 33288, 2),
(427305, 4, 13631, 1),
(427305, 4, 13819, 1),
(427305, 5, 13631, 2),
(427305, 5, 13819, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(427300, 6718, 0),
(427300, 6732, 1),
(427300, 90000012, 2),
(427300, 427301, 3),
(427301, 427300, 0),
(427301, 6731, 1),
(427301, 91000036, 2),
(427301, 427305, 3),
(427302, 427301, 0),
(427302, 6730, 1),
(427302, 91000036, 2),
(427302, 427304, 3),
(427303, 427304, 0),
(427303, 427300, 1),
(427304, 427302, 0),
(427304, 427303, 1),
(427304, 91000036, 2),
(427304, 6731, 3),
(427305, 427301, 0),
(427305, 91000036, 1),
(427305, 427300, 2);

-- The Underbog
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 371600 AND 371699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 371600 AND 371699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 371600 AND 371699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 371600 AND 371699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(371600, 0, 3716, 0, 0, 8, 'The Underbog', 'The Underbog lies beneath Serpent Lake in Coilfang Reservoir, a drowned cavern where the fungus of the marsh grows unchecked and the glowing caps give most of the light. Bog giants and shamblers wade its pools and underbats hang in the gloom. The naga hold part of it, crying out for Illidan, Murkblood Broken fight beside them, and the deepest pools hide worse than the bog giants.', '', 'zones/underbog.txt (map 546: area 3716 only); DB spawns map 546: Bog Giant 17723, Underbog Shambler 17871, Underbat 17724, Fen Ray 17731, Lykul Wasp 17732, Underbog Lord 17734, Underbog Lurker 17725, Wrathfin Myrmidon 17726, Sentry 17727, Warrior 17735, Murkblood Tribesman 17728, Spearman 17729, Healer 17730, Oracle 17771; bosses 17770, 18105, 17826 with Claw 17827, 17882; creature_text 17726, 17727, 17735 group 0 (For the Master!; Illidan reigns!; said on aggro by chance); creature_template 17826 display 18570 (BrokenMale); 17827 subname Swamplord Musel''ek''s Pet, display 2289 (DruidBearTauren); 18105 display 17528 (HydraOutland); 17770 display 17228 (FungalGiant); gameobject 182054 The Underspore beside Hungarfen; quests 9715, 9717, 9719 (Sporeggar''s errands); 9738 (the druids, told in the Slave Pens file); creature_template 17770 (type 5, display 17228 FungalGiant); fixed spawn 138367, map 546 only; gameobject 182054 The Underspore (map 546, beside Hungarfen; source of the Underspore Frond 24247); boss_hungarfen.cpp (Underbog Mushrooms spawn at random targets, grow and release Spore Cloud); quest 9717 (T''shu 17857, Sporeggar; QuestType 2, Flags 136; QuestSortID 3716); creature_template 17882 (type 1, display 18194 Tripod model); boss_the_black_stalker.cpp; quest 9719 (Khn''nix 17866, Sporeggar; QuestType 2, Flags 136; QuestSortID 3716); quest 9715 description (Gzhun''tt 17856, Sporeggar; QuestType 2, Flags 136; QuestSortID 3716: they used to grow thick as shrubs, but the lowering of the marsh''s water levels means that they can only be found now in the Underbog); quest 9714 (repeatable, QuestType 0, after 9715); creature_loot Sanguine Hibiscus 24246 (Bog Giant 17723, Underbat 17724, Underbog Shambler 17871 and others); gameobject 183385 Sanguine Hibiscus (map 546)'),
(371602, 2, 3716, 0, 0, 8, 'Swamplord Musel''ek', 'Swamplord Musel''ek is a Broken who hunts for the naga in the Underbog, deadly with a bow and quick with a trap, with a great bear called Claw at his side. When the bear works itself into a frenzy he shouts at it to obey him and kill the intruders at once.', '', 'creature_template 17826 (faction 74, display 18570 BrokenMale); fixed spawn 138500, map 546 only; boss_swamplord_muselek.cpp (Shoot, Multi-Shot, Freezing Trap, Hunter''s Mark, Aimed Shot, Knock Away; aggro group 1, kill group 2, death group 3, matching creature_text); creature_text 17826 groups 0 (Beast! Obey me! Kill them at once!, said through Claw''s Frenzy link, smart_scripts 17827 id 2 and 6) and 1 (We fight to the death!; I will end this quickly....); creature_template 17827 Claw, subname Swamplord Musel''ek''s Pet');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(371600, 1, 0, 255, 'To the sporelings of Sporeggar the fungal giant Hungarfen is a leader of the spore giants they are at war with. It has tended the great plant called the Underspore to perfection for millennia.', 'zones/underbog.txt (map 546: area 3716 only)'),
(371600, 2, 0, 255, 'The Black Stalker at the far end of the bog is the great mother of the marsh walkers, the sporelings'' greatest danger through all their history, and Sporeggar cannot afford another attack from them.', 'zones/underbog.txt (map 546: area 3716 only)'),
(371600, 3, 0, 255, 'With the great mother dead another of her brood will transform to replace her, but that takes time, and Sporeggar has some breathing room.', 'zones/underbog.txt (map 546: area 3716 only)'),
(371602, 1, 0, 255, 'Earthbinder Rayge of the Cenarion Expedition knows the truth: the swamplord can control animals, even druids. Windcaller Claw was caught in bear form and is now his pet.', 'creature_template 17826 (faction 74, display 18570 BrokenMale); fixed spawn 138500, map 546 only'),
(371602, 2, 0, 255, 'Beaten down, the bear became Windcaller Claw again, a tauren druid, embarrassed to have been taken as a pet by a hunter.', 'creature_template 17826 (faction 74, display 18570 BrokenMale); fixed spawn 138500, map 546 only');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(371600, 1, 3716, 0),
(371602, 3, 17826, 0),
(371602, 2, 17885, 0),
(371600, 4, 9717, 1),
(371600, 4, 9719, 2),
(371600, 5, 9719, 3),
(371602, 2, 17885, 1),
(371602, 2, 17827, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(371600, 90000055, 0),
(371600, 352114, 1),
(371600, 371602, 2),
(371602, 351802, 0),
(371602, 90000021, 1),
(371602, 371600, 2);

-- Utgarde Keep
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 20600 AND 20699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 20600 AND 20699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 20600 AND 20699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 20600 AND 20699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(20600, 0, 206, 0, 0, 13, 'Utgarde Keep', 'Inside, Utgarde Keep is the Dragonflayer stronghold at work. Its forges ring as metalworkers and weaponsmiths turn out the vrykul''s arms, handlers drive enslaved proto-drakes in chains while their riders wait to mount, and strategists, runecasters and ironhelms hold the halls. The Scourge is here too, among the living giants, and its dead rise out of the frost to fight beside the giants.', '', 'Utgarde Keep spawns (map 574); Utgarde Keep quests 11262, 13205, 13206; creature_text 24200, 24201'),
(20601, 2, 206, 0, 0, 13, 'Prince Keleseth', 'Prince Keleseth of the San''layn, the blood princes of the Scourge, keeps a chamber in Utgarde Keep among the vrykul. He entombs his foes in frost, raises the dead to fight beside him, and promises that the darkness waits for them.', '', 'Utgarde Keep quest 11272; creature_text 23953'),
(20602, 2, 206, 0, 0, 13, 'Ingvar the Plunderer', 'Ingvar the Plunderer is the master of Utgarde Keep, the champion the Dragonflayer esteem above all, a warrior born who means to paint his face with his enemies'' blood. Valgarde and Vengeance Landing both believe that bringing him down will break the vrykul''s spirit, and perhaps give them a chance.', '', 'Utgarde Keep quests 11252, 11262; creature_text 23954, 24068');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(20600, 1, 0, 255, 'Dark Ranger Marrah is the last of a Forsaken recon party sent into the keep. What she learned did not come cheaply.', 'Utgarde Keep spawns (map 574); Utgarde Keep quests 11262, 13205, 13206; creature_text 24200, 24201'),
(20600, 2, 0, 255, 'The Dragonflayer''s weapons are deceptively well balanced and wickedly sharp, with something unnatural about them. Valgarde and Vengeance Landing both want to learn their secret.', 'Utgarde Keep spawns (map 574); Utgarde Keep quests 11262, 13205, 13206; creature_text 24200, 24201'),
(20600, 3, 0, 255, 'Skarvald the Constructor and Dalronn the Controller held a hall together and despised each other: the warrior scorned the necromancer for hanging back, the necromancer the warrior for charging in. Whichever fell first came back as a ghost to fight on.', 'Utgarde Keep spawns (map 574); Utgarde Keep quests 11262, 13205, 13206; creature_text 24200, 24201'),
(20601, 1, 0, 255, 'High Executor Anselm wants him dead in front of any vrykul watching: the prince came to Vengeance Landing, insulted the Banshee Queen and killed Anselm''s men, and Arthas should know the Forsaken are playing for keeps.', 'Utgarde Keep quest 11272; creature_text 23953'),
(20602, 1, 0, 255, 'He fell crying out his life for the death god, and did not stay down. The val''kyr Annhylde the Caller raised him, damned for his failure as a warning to all, to carry out the master''s will.', 'Utgarde Keep quests 11252, 11262; creature_text 23954, 24068');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(20600, 1, 206, 0),
(20601, 3, 23953, 0),
(20601, 4, 11272, 0),
(20602, 3, 23954, 0),
(20602, 4, 11252, 0),
(20602, 4, 11262, 0),
(20600, 4, 11262, 1),
(20600, 4, 13205, 2),
(20600, 4, 13206, 2),
(20600, 3, 24200, 3),
(20600, 3, 24201, 3),
(20601, 4, 11272, 1),
(20602, 3, 23954, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(20600, 49503, 0),
(20600, 90000076, 1),
(20600, 20602, 2),
(20601, 49505, 0),
(20601, 20600, 1),
(20601, 90000006, 2),
(20602, 20600, 0),
(20602, 49503, 1),
(20602, 90000076, 2);

-- Utgarde Pinnacle
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 119600 AND 119699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 119600 AND 119699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 119600 AND 119699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 119600 AND 119699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(119600, 0, 1196, 0, 0, 13, 'Utgarde Pinnacle', 'Utgarde Pinnacle is the higher hall of the vrykul at the top of the crag above Utgarde Keep, the seat of their king. The Ymirjar, the vrykul the Lich King has chosen, hold it now with Dragonflayer fanatics and seers, Scourge hulks lumber through its halls, and treasure lies heaped in its chambers, guarded by those who could not leave it alone.', '', 'Utgarde Pinnacle spawns (map 575); Utgarde Pinnacle quest 13132; creature_text 26693, 26893'),
(119601, 2, 1196, 0, 0, 13, 'Svala Sorrowgrave', 'Svala was a vrykul who knelt before an image of the Lich King in the Pinnacle and begged for his blessing. He took her sacrifice as proof of her obedience and raised her as a val''kyr, Svala Sorrowgrave, beyond anything she had imagined, and set her a first test: to destroy the uninvited guests.', '', 'creature_text 26668, 29280, 29281'),
(119602, 2, 1196, 0, 0, 13, 'King Ymiron', 'King Ymiron rules the vrykul from the throne of Utgarde Pinnacle, woken from an ancient sleep to serve the Lich King, the death god of his people. He promises to tear the hearts from intruders'' chests as gifts for that god, and calls on the spirits of the old kings, Bjorn, Haldor, Ranulf and Tor, to lend him their might.', '', 'Utgarde Pinnacle quest 13132; creature_text 26861');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(119600, 1, 0, 255, 'Brigg Smallshanks came with his pirate mates for that treasure. They hurled themselves at the gold and turned to rattling bones, cursed; Brigg was only spared because he was knocked down, a wee bit tipsy.', 'Utgarde Pinnacle spawns (map 575); Utgarde Pinnacle quest 13132; creature_text 26693, 26893'),
(119600, 2, 0, 255, 'Skadi the Ruthless rode his drake Grauf over the ramparts, promising a feast to whoever brought him the intruders'' heads, until the harpoon launchers on the walls brought the drake down.', 'Utgarde Pinnacle spawns (map 575); Utgarde Pinnacle quest 13132; creature_text 26693, 26893'),
(119602, 1, 0, 255, 'Dying, the ancient king who had sent so many to the death god asked only one thing: what awaited him now.', 'Utgarde Pinnacle quest 13132; creature_text 26861');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(119600, 1, 1196, 0),
(119601, 3, 26668, 0),
(119602, 3, 26861, 0),
(119602, 4, 13132, 0),
(119600, 4, 13132, 1),
(119600, 3, 26693, 2),
(119602, 3, 26861, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(119600, 49503, 0),
(119600, 90000076, 1),
(119600, 119602, 2),
(119601, 119600, 0),
(119601, 90000076, 1),
(119601, 92000005, 2),
(119602, 91000034, 0),
(119602, 49516, 1),
(119602, 119600, 2);

-- The Vault of Archavon
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 460300 AND 460399;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 460300 AND 460399;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 460300 AND 460399;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 460300 AND 460399;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(460300, 0, 4603, 0, 0, 13, 'The Vault of Archavon', 'The Vault of Archavon lies beneath Wintergrasp Fortress, a titan vault that opens only to whoever holds the fortress, and its guardians are colossal. In its first chamber Archavon the Stone Watcher stands among his warders, and in the deeper halls wait other watchers of the same make, bound to storm, to flame and to ice, as though the vault were built to keep something in or keep everyone out.', '', 'Vault of Archavon spawns (map 624): Archavon, Emalon, Koralon, Toravon and their warders');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(460300, 1, 4603, 0);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(460300, 419700, 0),
(460300, 419701, 1);

-- The Violet Hold
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 441500 AND 441599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 441500 AND 441599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 441500 AND 441599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 441500 AND 441599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(441500, 0, 4415, 0, 0, 13, 'The Violet Hold', 'The Violet Hold is the prison of Dalaran, where the Kirin Tor keep the most dangerous beings they have taken, each sealed in a cell of its own. The blue dragonflight has broken in. Portals open in the hall one after another, azure invaders pour out of them to batter at the great door that keeps them from the city, and Lieutenant Sinclari''s guards cannot hold much longer.', '', 'Violet Hold quests 13158, 13159; Sinclari gossip 9997; creature_text 30658, 32204'),
(441501, 2, 4415, 0, 0, 13, 'The Prisoners of the Violet Hold', 'The Hold''s cells keep creatures the Kirin Tor could not leave free: Xevozz, an ethereal who sees every room as resources primed for acquisition; Erekem, an arakkoa who wants only to fly; Ichoron, a fury of water that will not be contained; Zuramat the Obliterator, a thing of the void; and the beasts Lavanthor and Moragg. As the blues break in, the cells open one by one, whether by accident or by design.', '', 'creature_text 29266, 29313, 29314, 29315; Violet Hold quest 13256 (prisoners freed, perhaps on purpose)'),
(441502, 2, 4415, 0, 0, 13, 'Cyanigosa', 'Cyanigosa leads the blue dragonflight''s invasion of Dalaran through the Violet Hold. If her forces cannot break through, she will fulfill Malygos''s wishes herself: the city must be razed and the Kirin Tor ended, for the world has forgotten what true magic is, and Dalaran will serve as the reminder.', '', 'Violet Hold quest 13159; creature_text 31134');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(441500, 1, 0, 255, 'Rhonin wants the invasion handled with the utmost discretion: the citizens of Dalaran must not be alarmed if it can possibly be avoided.', 'Violet Hold quests 13158, 13159; Sinclari gossip 9997; creature_text 30658, 32204'),
(441502, 1, 0, 255, 'Dying, the dragon allowed that the blue flight had perhaps underestimated the defenders of Dalaran, and in the end the prison held.', 'Violet Hold quest 13159; creature_text 31134');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(441500, 1, 4415, 0),
(441501, 3, 29266, 0),
(441501, 3, 29315, 0),
(441501, 3, 29313, 0),
(441501, 3, 29314, 0),
(441501, 3, 29312, 0),
(441501, 3, 29316, 0),
(441502, 3, 31134, 0),
(441502, 4, 13159, 0),
(441500, 4, 13158, 1),
(441502, 3, 31134, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(441500, 439500, 0),
(441500, 90000063, 1),
(441500, 90000003, 2),
(441500, 441502, 3),
(441501, 441500, 0),
(441501, 441502, 1),
(441502, 441500, 0),
(441502, 90000063, 1),
(441502, 353723, 2);

-- Wailing Caverns
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 71800 AND 71899;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 71800 AND 71899;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 71800 AND 71899;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 71800 AND 71899;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(71800, 0, 718, 0, 0, 0, 'Wailing Caverns', 'The Wailing Caverns run deep beneath Lushwater Oasis, where the druid Naralex went down to dream the Barrens green and found a nightmare instead. The nightmare has filled the caves he chose. Deviate beasts prowl the winding tunnels and dark pools, ectoplasms ooze through the gloom, and robed Druids of the Fang walk among the beasts unharmed. Somewhere in the depths Naralex still sleeps, and just inside the entrance one of his disciples keeps watch.', '', 'warcraft.wiki.gg/wiki/Wailing_Caverns (beneath the Barrens; Naralex sought to enter the Emerald Dream and restore the land; his dream became a nightmare; deviates, Druids of the Fang); barrens.json 1715 (the mouth beneath Lushwater Oasis; Naralex''s dream turned to nightmare; told there, pointed to in one clause); DB spawns on map 43: Deviate Ravager 3636, Guardian 3637, Lasher 5055, Shambler 5761, Viper 5755, Adder 5048, Dreadfang 5056, Venomwing 5756, Python 8886, Crocolisk 5053, Evolving Ectoplasm 3640 x12, Druid of the Fang 3840 x69; the deviates and druids share faction template 270; smart_scripts 3640 (Evolving Ectoplasm: random Black, Blue, Green or Red form); smart_scripts 3840 (Druid of the Fang: Nature Channeling out of combat, Serpent Form 8041 at 30 percent), kept by the module; creature 3678 Disciple of Naralex at -135,125, about 30 yards from the entrance teleport point (areatrigger_teleport 228, -163,133); quests 1486, 1487 (Nalpak and Ebru outside), 962 (Zamah: serpentbloom in the darkest recesses of the Wailing Caverns), 959 (Bigglefuzz: Mad Magglish ran off with the port to the Wailing Caverns); gameobject Serpentbloom x24 on map 43; npc_text 698 (the Disciple inside: the Fanglords must be slain before the awakening ritual); quest 1487 description and request text (Naralex had a noble goal; regrow these harsh lands back into the lush forest; dream turned into a nightmare; some Disciples seek to awake our master, my concern is ridding these caves; our numbers are dwindling, we have not the forces); quest 1486 description (as Naralex descended deeper into his nightmare a strange breed of beasts arose from beneath the Barrens; otherworldly properties; evil in nature, yet some good can come; hides of use in leatherworking); creature 5767 Nalpak (tauren male model 4289) and 5768 Ebru (night elf female model 4290), subname Disciple of Naralex, faction 35, at -797,-2037 z97 on map 1 (area 17, outside the instance); quests 1486 and 1487: QuestSortID 718, QuestType 2, flags 8, AllowableRaces 0; barrens.json 1715 (his disciples keep watch near the entrance asking travelers to cull the deviates; 1486 and 1487 there only as sources, no trigger)'),
(71801, 2, 718, 0, 0, 0, 'Naralex', 'Naralex is a night elf druid who came down into these caverns with an honorable goal: to enter the Emerald Dream and regrow the Barrens into a forest. His focus waned and serpentine visions crept into his thoughts. Now he lies in fitful sleep in a chamber far within, reptilian beasts seep from his dreams into the land, and his disciple warns that unless he is woken he will be lost forever.', '', 'npc_text 698 (gossip_menu 201 of Disciple of Naralex 3678: Naralex sleeps again; honorable goal of entering the Emerald Dream and regrowing the Barrens into a lush forest; focus waned, thoughts tainted by serpentine visions; reptilian beasts seep from his dreams to the land; must be awoken or be forever lost and a great evil unleashed); creature 3679 Naralex, single spawn on map 43 at 115,240 z-94 (the end of the Disciple''s escort path), night elf male model 4216, faction 35, React Passive; creature_text 3679 group 0 (tosses fitfully in troubled sleep); barrens.json 1715 (his dream turned to nightmare; told there briefly); npc_text 698 (gossip_menu 201: Naralex sleeps again; must be awoken or be forever lost; only after his corrupted servants, the Fanglords, have been slain can I perform the awakening ritual); gossip_menu_option 201 (Let the event begin!) with conditions 15/201: instance data 0-3 (Cobrahn, Pythas, Anacondra, Serpentis) all DONE; smart_scripts 3678 id 0 (On Gossip Hello: cast Mark of the Wild 5232 on the speaker); creature_text 3678 group 1 (You must protect me!); creature 3678 Disciple of Naralex, single spawn on map 43 at -135,125, near the entrance; tauren male model 1941; item 10441 Glowing Shard starts quest 6981; creature_loot_template 3654 (Mutanus the Devourer) gives 10441 at 100 percent, its only source; quest 6981 description and log text (brilliant green; smoke swirls just below the surface; something very disturbing; see if anyone in Ratchet can tell you more); quest 6981: QuestSortID 718, QuestType 2, Flags 2, AllowableRaces 0, ended by Falla Sagewind 8418; 3366 (same title) has no giver, starting item or ender and is unused'),
(71802, 2, 718, 0, 0, 0, 'The Fanglords', 'The Druids of the Fang were part of a noble order that came with Naralex to heal the Barrens. Now they mean to remake that land to match their own twisted dreams, and four Fanglords lead them: Cobrahn, Anacondra, Pythas and Serpentis, each keeping a lair in the caverns and each holding a dream gem. Pressed hard, they cast off their elven shapes and fight as serpents.', '', 'creature 3669 Lord Cobrahn, subname Fanglord, single spawn on map 43 at -151,414 z-73; night elf male model 4213 at scale 1.2; gameobject 146091 Bonfire at -137,415; Deviate Python 8886 x2 within 2 yards; Deviate Viper 5755, Adder 5048 and Python 8886 spawns at x -152 to 65, y 377 to 525; npc_text 698 (only after his corrupted servants, the Fanglords, have been slain can I perform the awakening ritual); quest 914 description (four leaders), as a source only; ACCEPT and DONE 914 are barrens.json 1737''s; creature 3671 Lady Anacondra, subname Fanglord, night elf female model 4313; base spawn on map 43 at 15,297 z-88 with Deviate Guardian 3637 x5 within 8 yards; mod-individual-progression dungeon_wailing_caverns.sql: pool 601040 puts her at one of four spots (15,297; -54,271; -68,123; 46,184), all within the spread of Deviate Guardian 3637 (x -101 to 47, y 97 to 312) and Deviate Ravager 3636 (x -107 to 57, y 85 to 255), 100 to 230 yards from the entrance teleport point (-163,133); Cobrahn stands about 290 yards in, Serpentis about 160, Pythas about 400; warcraft.wiki.gg/wiki/Wailing_Caverns (Anacondra in Screaming Gully near the entrance); npc_text 698 (the Fanglords his corrupted servants); creature 3670 Lord Pythas, subname Fanglord, single spawn on map 43 at 37,-241 z-79, about 400 yards from the entrance; night elf male model 4214 at scale 1.2; Druid of the Fang 3840 at 6 yards, Deviate Shambler 5761 at 14, Deviate Lasher 5055 x2 within 37; npc_text 698 (the Fanglords his corrupted servants); creature 3673 Lord Serpentis, subname Fanglord, single spawn on map 43 at -120,-25 z-29 (the other Fanglords stand at z -73 to -88); night elf male model 4215 at scale 1.2; Deviate Venomwing 5756 at 13 yards, Druid of the Fang 3840 at 24; Verdan the Everliving 5775 at -82,32 z-31, about 70 yards away at the same height; npc_text 698 (the Fanglords his corrupted servants)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(71800, 1, 0, 255, 'The deviate beasts rose from beneath the Barrens as Naralex sank deeper into his nightmare, evil yet strangely otherworldly. His disciples are dwindling, too few to cull them alone.', 'warcraft.wiki.gg/wiki/Wailing_Caverns (beneath the Barrens; Naralex sought to enter the Emerald Dream and restore the land; his dream became a nightmare; deviates, Druids of the Fang)'),
(71801, 1, 0, 255, 'When the disciple''s ritual reached him, Naralex dreamed up a last horror, the murloc Mutanus. With its death he woke, and flew off as an owl to gather his disciples and try again.', 'npc_text 698 (gossip_menu 201 of Disciple of Naralex 3678: Naralex sleeps again; honorable goal of entering the Emerald Dream and regrowing the Barrens into a lush forest; focus waned, thoughts tainted by serpentine visions; reptilian beasts seep from his dreams to the land; must be awoken or be forever lost and a great evil unleashed)'),
(71801, 2, 0, 255, 'A green shard from the Devourer holds the pure essence of the Emerald Dream, yet the vision within it is a nightmare. In Darnassus a druid looked into it and would say only that the Dream is not what the druids had believed.', 'npc_text 698 (gossip_menu 201 of Disciple of Naralex 3678: Naralex sleeps again; honorable goal of entering the Emerald Dream and regrowing the Barrens into a lush forest; focus waned, thoughts tainted by serpentine visions; reptilian beasts seep from his dreams to the land; must be awoken or be forever lost and a great evil unleashed)'),
(71802, 1, 0, 255, 'Their faces haunt the dreams of the druids of Thunder Bluff, and Nara Wildmane will know no peace until all four are dead.', 'creature 3669 Lord Cobrahn, subname Fanglord, single spawn on map 43 at -151,414 z-73; night elf male model 4213 at scale 1.2');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(71800, 1, 718, 0),
(71801, 2, 3678, 0),
(71802, 3, 3669, 0),
(71802, 3, 3671, 0),
(71802, 3, 3670, 0),
(71802, 3, 3673, 0),
(71802, 4, 914, 0),
(71800, 4, 1486, 1),
(71800, 4, 1487, 1),
(71801, 3, 3654, 1),
(71801, 5, 3370, 2),
(71802, 4, 914, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(71800, 71801, 0),
(71800, 71802, 1),
(71800, 1715, 2),
(71801, 71802, 0),
(71801, 90000048, 1),
(71801, 1715, 2),
(71802, 71801, 0),
(71802, 71800, 1),
(71802, 90000048, 2);

-- Zul'Aman
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 380500 AND 380599;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 380500 AND 380599;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 380500 AND 380599;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 380500 AND 380599;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(380500, 0, 3805, 0, 0, 12, 'Zul''Aman', 'Zul''Aman is the ancient capital of the Amani, the city of the forest trolls in the mountains east of Quel''Thalas, and it is stirring again. Warbringers, medicine men and flame casters crowd its terraces, beast tamers drive bears, lynxes and war dragonhawks before them, and the priests at its heart call on the spirits of the animal gods. Outside the gates a treasure hunter''s crew waits for someone else to go in first.', '', 'Zul''Aman spawns (map 568); Harrison Jones gossip 8932, creature_text 24358; Zul''Aman quest 11178; Ghostlands quest 11163'),
(380501, 2, 3805, 0, 0, 12, 'The Four Avatars', 'Four of the Amani''s high priests have given themselves to the animal gods of their people: Nalorakk to the bear, Akil''zon to the eagle, Halazzi to the lynx and Jan''alai to the dragonhawk. Each fights in the shape or with the power of his god, and each would feed the souls of strangers to his spirit: what could be better, Nalorakk asks, than serving the bear spirit for eternity?', '', 'creature_text 23574, 23576, 23577, 23578 (subnames Eagle, Bear, Lynx and Dragonhawk Avatar)'),
(380502, 2, 3805, 0, 0, 12, 'Zul''jin', 'Zul''jin is the warlord of the Amani, the troll the Farstriders once held captive until he cut off his own arm to escape, and he has come home to Zul''Aman to raise the empire again. Everybody always wants to take from his people, he says; now they will take back. He has learned new tricks: the forms of the bear, the eagle, the lynx and the dragonhawk, whose avatars guard his city.', '', 'creature_text 23863, 24239; Silvermoon 348704 (Halduron)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(380500, 1, 0, 255, 'Harrison Jones, an adventurer, warns strangers that this place will chew them up and spit out their bones, then leads them to the gates anyway: if enough of them strike the gong at once, by his calculations, the seal will break.', 'Zul''Aman spawns (map 568); Harrison Jones gossip 8932, creature_text 24358; Zul''Aman quest 11178; Ghostlands quest 11163'),
(380500, 2, 0, 255, 'Budd Nedreck took the Blood of Zul''jin with poor grace. He could have taken the warlord down with ease, he said; the old cretin could not have been as fearsome as the legends claim.', 'Zul''Aman spawns (map 568); Harrison Jones gossip 8932, creature_text 24358; Zul''Aman quest 11178; Ghostlands quest 11163'),
(380500, 3, 0, 255, 'Donna Brascoe of Budd''s crew was a Shattrath Peacekeeper all along, sent to infiltrate his gang and keep an eye on the people who came to work for him.', 'Zul''Aman spawns (map 568); Harrison Jones gossip 8932, creature_text 24358; Zul''Aman quest 11178; Ghostlands quest 11163'),
(380502, 1, 0, 255, 'Even dying, Zul''jin did not give ground in his words: he might fall, he said, but the Amani empire would never die.', 'creature_text 23863, 24239; Silvermoon 348704 (Halduron)'),
(380502, 2, 0, 255, 'Hex Lord Malacrass, his master of voodoo, guarded the way to him, siphoning the souls of his enemies to turn their own powers against them. Dying, the Hex Lord swore that this was not the end for him.', 'creature_text 23863, 24239; Silvermoon 348704 (Halduron)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(380500, 1, 3805, 0),
(380501, 3, 23576, 0),
(380501, 3, 23574, 0),
(380501, 3, 23577, 0),
(380501, 3, 23578, 0),
(380502, 3, 23863, 0),
(380500, 2, 24358, 1),
(380500, 5, 11178, 2),
(380500, 5, 11163, 3),
(380502, 3, 23863, 1),
(380502, 3, 24239, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(380500, 90000030, 0),
(380500, 343318, 1),
(380500, 380502, 2),
(380501, 380500, 0),
(380501, 380502, 1),
(380501, 90000030, 2),
(380502, 380500, 0),
(380502, 348704, 1),
(380502, 90000030, 2);

-- Zul'Farrak
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 117600 AND 117699;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 117600 AND 117699;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 117600 AND 117699;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 117600 AND 117699;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(117600, 0, 1176, 0, 0, 0, 'Zul''Farrak', 'Zul''Farrak is the city of the Sandfury trolls, and inside its walls the desert sky still stands open overhead. Streets of sand wind between temples of old stone, past graves and shrines and a great stepped pyramid. The Sandfury hold all of it, blood drinkers and shadowcasters, witch doctors and shadowhunters, and their dead do not always stay dead. Scarabs swarm the sands, basilisks crawl among the ruins, and the tribe''s rulers and holy places are closely guarded.', '', 'tools/research/zones/zulfarrak.txt (1176 the only area on map 209); warcraft.wiki.gg/wiki/Zul''Farrak (almost entirely outdoors; pyramid, graves, the sacred pool); DB spawns on map 209 only: Sandfury Blood Drinker 5649 x55, Witch Doctor 5650 x39, Shadowhunter 7246 x34, Shadowcaster 5648 x26, Soul Eater 7247 x6, Scarab 7269 x68, Sul''lithuz Sandcrawler 8095 x19 (smart_scripts 8095: Petrify); quests 2768, 2770, 2846, 2865, 3042, 3527 (the errands that send outsiders in; givers all outside the city); tanaris.json 44011 (the walls and the Sandfury, told there); DB spawns on map 209 only: Sandfury Blood Drinker 5649 x55, Witch Doctor 5650 x39, Shadowhunter 7246 x34, Shadowcaster 5648 x26, Soul Eater 7247 x6; smart_scripts 5648, 5649, 5650, 7246, 7247, base and module dungeon_zulfarrak.sql: Blood Leech; Demon Skin, Shadow Bolt, Shadow Word: Pain; Healing Ward, Lava Spout Totem, Flash Heal; Shoot, Hex; Soul Bite, Dark Offering; Flee For Assist at 15 percent; creature_template_model 10080-10082 (TrollMale); creature 7269 Scarab x68, map 209 only; about 30 within 1750-1850, 800-950, around Theka 7272 (1778,860); smart_scripts 7269 (Plague Cloud 3256 in combat); Spell.dbc 3256 (reduces Strength, Agility and Intellect of all enemies in the area); creature_template 7269 faction 15 (creature), not of the Sandfury (37); quest 2865 (Tran''rek 7876 in Gadgetzan gives and ends it; both factions); the shells drop from the scarabs of Zul''Farrak'),
(117601, 1, 1176, 0, 0, 0, 'The Sacred Pool', 'Deep in Zul''Farrak lies the sacred pool of the Sandfury, a broad sheet of still water in a city of sand. Gahz''rilla, the hydra the trolls revere, dwells in its depths, and a great gong at its edge calls him up. The hydromancer Velratha walks the shore as if the water were hers to command, and the tribe keeps the manner of the summoning a close secret.', '', 'gameobject 141832 Gong of Zul''Farrak at 1651,1172, single spawn on map 209; smart_scripts 141832 (on use: summon 7273 at 1659,1180, in the water); creature 7795 Hydromancer Velratha, single spawn at 1698,1211, MovementType 2 (patrols the shore); DB spawns around 1600-1750, 1150-1250: Sandfury Witch Doctor 5650, Shadowhunter 7246, Blood Drinker 5649; waypoint_data 815700 (Velratha''s patrol, 1630-1707, 1153-1229, around the pool); Gahz''rilla 7273 summoned only by the gong, fights on the shore; creature_template_model 7795 display 6685 (TrollFemale); creature 7795 single spawn on map 209; waypoint_data 815700 (her patrol along the pool''s shore, 1630-1707, 1153-1229); quest 2770 description (deep in Zul''Farrak a sacred pool; from it the trolls summon Gahz''rilla; his scales crackle with energy; harness it for my car; the summoning a well-kept secret; wrest it from them); creature 7273 no fixed spawn: summoned only by gong 141832 (smart_scripts 141832; no other summoner in smart_scripts or core scripts); thousand_needles.json 40022 (Wizzle Brassbolts and the rocket car, told there); warcraft.wiki.gg/wiki/Zul''Farrak (patch 3.0.8: the mallet requirement removed in favour of the gong)'),
(117602, 2, 1176, 0, 0, 0, 'Theka the Martyr', 'Theka the Martyr died long ago, yet he still walks Zul''Farrak, an undead troll pacing the ground about his tomb, where the city''s scarabs gather in their dozens. It is said they were once his persecutors, cursed into the shape of the beetles that now scuttle about his shrine. What made him a martyr, and to whom, the city does not tell outsiders.', '', 'creature 7272 single spawn on map 209 at 1778,860, type 6 (undead), MovementType 2; gameobject 142715 Tablet of Theka at 1801,858 beside him (its use is hinterlands.json 4730); DB spawns: Scarab 7269 x68 on map 209 only, about 30 of them within 1750-1850, 800-950; warcraft.wiki.gg/wiki/Theka_the_Martyr (undead sand troll); quest 3527 description (his persecutors cursed into scarabs that scuttle about his shrine); tanaris.json 44011 (the same legend)'),
(117608, 2, 1176, 0, 0, 0, 'Chief Ukorz Sandscalp', 'Chief Ukorz Sandscalp rules Zul''Farrak from a high terrace over the city, reached only past a heavy door not far from the great pyramid, where great serpents and hulking basilisks keep guard with him and the warrior Ruuzlu stands at his side. The Sandfury reign supreme, he roars, and those who reach him will feel the fury of the sands.', '', 'creature 7267 single spawn on map 209 at 1727,1017, z 55, the highest point of the city; DB spawns beside him: Sandfury Guardian 7268 x4 (family 35, serpent model) and Sul''lithuz Abomination 8120 x2 (basilisks), both only there; gameobject 146084 End Door at 1855,1143 z 16; npc_text 1511 and 1514 (the door that leads to the chief of Zul''Farrak); warcraft.wiki.gg/wiki/Zul''Farrak (Ukorz reached only after the pyramid battle; Ruuzlu his companion)'),
(117609, 2, 1176, 0, 0, 0, 'Sergeant Bly', 'Sergeant Bly led a band of adventurers to Zul''Farrak to hunt treasure, Raven, Oro Eyegouge, Murta Grimgut and the goblin Weegli Blastfuse, and the trolls caged them atop the great pyramid for sacrifice. From his cage Bly promises anything to whoever gets them out, and Weegli offers to blow open the door to the chief.', '', 'npc_text 1515 (gossip before the cages open: my band and I captured by trolls, going to sacrifice us; get us out and I''ll give you anything you want); creatures 7604 Sergeant Bly (display 6433 HumanMale), 7605 Raven (HumanFemale), 7606 Oro Eyegouge (OrcMale), 7608 Murta Grimgut (DwarfFemale), 7607 Weegli Blastfuse (GoblinMale), each a single spawn at the top of the pyramid (1881-1891, 1295-1299, z 48) beside Troll Cages 141070-141074'),
(117610, 1, 1176, 0, 0, 0, 'The Great Pyramid', 'The great pyramid of Zul''Farrak rises in broad steps above the sand, and on the platform at its top the Sandfury keep their prisoners in cages, an executioner standing over them. When captives are freed the whole tribe musters below, slaves and zealots climbing the stairs in wave after wave, led at the last by the shadowpriest Sezz''ziz and the undead warrior Nekrum Gutchewer.', '', 'creature 7274 Sandfury Executioner, single spawn at 1887,1290, z 46, beside Troll Cages 141070-141074 (z 48); creature_loot_template 7274: Executioner''s Key 8444, 100 percent, not a quest drop; Lock.dbc 420 (key 8444); item 8444 spell 10738 Unlocking (opens every cage within 15 yards); creature_template_model 7604-7608 (two humans, an orc, a goblin, a dwarf); npc_text 1515 (Bly: captured, to be sacrificed); creature_template 7796 type 6 (undead), display 6690 (TrollMale); instance_zulfarrak.cpp (Nekrum 7796 has no fixed spawn; summoned only in the third wave of the pyramid battle, beside Shadowpriest Sezz''ziz)');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(117600, 1, 0, 255, 'The Sandfury make a tempering agent from sandstone, and the smiths of Gadgetzan pay well for goods tempered with it.', 'tools/research/zones/zulfarrak.txt (1176 the only area on map 209)'),
(117600, 2, 0, 255, 'The scarabs of Tanaris were hunted nearly to extinction for their hard shells. In Zul''Farrak they thrive, for the trolls do not hunt them.', 'tools/research/zones/zulfarrak.txt (1176 the only area on map 209)'),
(117601, 1, 0, 255, 'Velratha''s agents stole the Tiara of the Deep, a jewel of great power, from the home of the mage Tabetha of Dustwallow, and Tabetha wants it back.', 'gameobject 141832 Gong of Zul''Farrak at 1651,1172, single spawn on map 209; smart_scripts 141832 (on use: summon 7273 at 1659,1180, in the water)'),
(117602, 1, 0, 255, 'Theka and Velratha each held a tablet of the prophecy of Mosh''aru, which tells of a way to contain the essence of the god Hakkar. The old mystic Yeh''kinya wanted both.', 'creature 7272 single spawn on map 209 at 1778,860, type 6 (undead), MovementType 2'),
(117602, 2, 0, 255, 'Both tablets went to Steamwheedle Port, where Yeh''kinya fused them together to study their hidden secrets, and said that his debt to their bearer would grow further still.', 'creature 7272 single spawn on map 209 at 1778,860, type 6 (undead), MovementType 2'),
(117609, 1, 0, 255, 'Bly had taken a divino-matic rod from Gadgetzan''s chief engineer, saying he would only borrow it, and it went home to Gadgetzan from his body.', 'npc_text 1515 (gossip before the cages open: my band and I captured by trolls, going to sacrifice us; get us out and I''ll give you anything you want)'),
(117609, 2, 0, 255, 'Once free, Bly told his rescuers to forget anything he had said about repaying them, and his band turned on them.', 'npc_text 1515 (gossip before the cages open: my band and I captured by trolls, going to sacrifice us; get us out and I''ll give you anything you want)');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(117600, 1, 1176, 0),
(117601, 3, 7795, 0),
(117601, 3, 7273, 0),
(117602, 3, 7272, 0),
(117602, 4, 3527, 0),
(117608, 3, 7267, 0),
(117608, 3, 7797, 0),
(117609, 2, 7604, 0),
(117609, 2, 7607, 0),
(117610, 3, 7274, 0),
(117610, 3, 7275, 0),
(117610, 3, 7796, 0),
(117600, 5, 3042, 1),
(117600, 5, 2865, 2),
(117601, 4, 2846, 1),
(117602, 4, 3527, 1),
(117602, 5, 3527, 2),
(117609, 5, 2768, 1),
(117609, 3, 7604, 2);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(117600, 44011, 0),
(117600, 117610, 1),
(117600, 117608, 2),
(117601, 44011, 0),
(117601, 117602, 1),
(117601, 117600, 2),
(117602, 117600, 0),
(117602, 44002, 1),
(117602, 117601, 2),
(117608, 117600, 0),
(117608, 117610, 1),
(117609, 117610, 0),
(117609, 117600, 1),
(117610, 117609, 0),
(117610, 117608, 1),
(117610, 117600, 2);

-- Zul'Gurub
DELETE FROM `mod_lore_codex_trigger` WHERE `Entry` BETWEEN 197700 AND 197799;
DELETE FROM `mod_lore_codex_part` WHERE `Entry` BETWEEN 197700 AND 197799;
DELETE FROM `mod_lore_codex_related` WHERE `Entry` BETWEEN 197700 AND 197799;
DELETE FROM `mod_lore_codex_entry` WHERE `ID` BETWEEN 197700 AND 197799;

INSERT INTO `mod_lore_codex_entry` (`ID`, `Kind`, `Zone`, `SortOrder`, `Faction`, `RequiredState`, `Title`, `Body`, `Hint`, `Sources`) VALUES
(197700, 0, 1977, 0, 0, 3, 'Zul''Gurub', 'Zul''Gurub was the capital of the Gurubashi Empire, a vast temple city in the jungles of northern Stranglethorn. The blood god Hakkar the Soulflayer has been brought back into the world here, and the Gurubashi serve him once more. His high priests hold the temples of the old animal gods, and the god himself waits at the Altar of the Blood God at the heart of the city.', '', 'creature_text 14834; Molthor gossip 6235'),
(197701, 2, 1977, 0, 0, 3, 'The High Priests of Hakkar', 'Hakkar''s high priests hold the temples of Zul''Gurub, each bound to one of the old animal gods of the trolls: Jeklik calls on Hir''eek the bat, Mar''li on Shadra the spider, Thekal on Shirvallah the tiger, Arlokk on Bethekk the panther, and Venoxis lets the coils of the serpent unfurl. Each fights with the power of the god they serve.', '', 'creature_text 14507, 14509, 14510, 14515, 14517'),
(197702, 2, 1977, 0, 0, 3, 'Hakkar the Soulflayer', 'Hakkar the Soulflayer is the faceless blood god, reborn in Zul''Gurub and waiting at the Altar of the Blood God. He offers those who reach him a choice: pledge allegiance and the pain will be minimal. The world, he promises, will suffer immeasurable cruelties under his reign. The Gurubashi serve him, among them the hexxer Jin''do and the Bloodlord Mandokir, who promises to feed his foes'' souls to Hakkar himself.', '', 'creature_text 14834, 11380, 11382; quest 8183'),
(197703, 2, 1977, 0, 0, 3, 'Zanza the Restless', 'Zanza is a loa of Zandalar, come to Zul''Gurub in ethereal form to help his people, and Hakkar has no dominion over his soul. Long ago, he says, the high elves stole his magic to enchant their weapons against the Amani trolls, a weak and pale copy they called arcanum, and he would see the world purged of it.', '', 'Zanza gossip 21258-21261');

INSERT INTO `mod_lore_codex_part` (`Entry`, `Part`, `MinState`, `MaxState`, `Body`, `Sources`) VALUES
(197701, 1, 0, 255, 'Each priest died glad of it. Hakkar binds me no more, Thekal said; Mar''li blessed her killers for the release; Jeklik cursed the Soulflayer with her last breath. They had served him in thrall.', 'creature_text 14507, 14509, 14510, 14515, 14517'),
(197702, 1, 0, 255, 'His heart still burned with the kernel of his power, and Molthor of the Zandalar hailed its bearer: the Soulflayer was slain, and the world saved.', 'creature_text 14834, 11380, 11382; quest 8183');

INSERT INTO `mod_lore_codex_trigger` (`Entry`, `Type`, `Value`, `Part`) VALUES
(197700, 1, 1977, 0),
(197701, 3, 14517, 0),
(197701, 3, 14507, 0),
(197701, 3, 14510, 0),
(197701, 3, 14509, 0),
(197701, 3, 14515, 0),
(197702, 3, 14834, 0),
(197703, 2, 15042, 0),
(197701, 3, 14517, 1),
(197701, 3, 14507, 1),
(197701, 3, 14510, 1),
(197701, 3, 14509, 1),
(197701, 3, 14515, 1),
(197702, 5, 8183, 1);

INSERT INTO `mod_lore_codex_related` (`Entry`, `Related`, `SortOrder`) VALUES
(197700, 91000020, 0),
(197700, 3312, 1),
(197700, 197702, 2),
(197701, 197702, 0),
(197701, 197700, 1),
(197702, 91000020, 0),
(197702, 197701, 1),
(197702, 44002, 2),
(197703, 197700, 0),
(197703, 3312, 1),
(197703, 91000024, 2);
