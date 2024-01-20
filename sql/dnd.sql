CREATE TABLE characters (
    character_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    race TEXT NOT NULL,
    class TEXT NOT NULL,
    level INTEGER NOT NULL,
    hit_points INTEGER NOT NULL
);
INSERT INTO characters (name, race, class, level, hit_points) VALUES
    ('Gandalf', 'human', 'wizard', 12, 87),
    ('Legolas', 'elf', 'ranger', 8, 65),
    ('Gimli', 'dwarf', 'fighter', 10, 73);


CREATE TABLE weapons (
    weapon_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    damage_dice TEXT NOT NULL,
    range INTEGER NOT NULL
);
INSERT INTO weapons (name, damage_dice, range) VALUES
    ('Longsword', '1d8', 5),
    ('Shortbow', '1d6', 80),
    ('Battleaxe', '1d8', 5);


CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    character_id INTEGER REFERENCES characters(character_id),
    weapon_id INTEGER REFERENCES weapons(weapon_id),
    armor_class INTEGER NOT NULL,
    shield BOOLEAN NOT NULL
);
INSERT INTO equipment (character_id, weapon_id, armor_class, shield) VALUES
    (1, 1, 14, FALSE),
    (2, 2, 12, TRUE),
    (3, 3, 16, TRUE);


CREATE TABLE monsters (
    monster_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    hit_points INTEGER NOT NULL,
    armor_class INTEGER NOT NULL,
    damage_dice TEXT NOT NULL
);
INSERT INTO monsters (name, hit_points, armor_class, damage_dice) VALUES
    ('Goblin', 7, 13, '1d6'),
    ('Orc', 15, 14, '1d8'),
    ('Dragon', 150, 20, '3d8');


CREATE TABLE encounters (
    encounter_id SERIAL PRIMARY KEY,
    character_id INTEGER REFERENCES characters(character_id),
    monster_id INTEGER REFERENCES monsters(monster_id),
    result BOOLEAN NOT NULL,
    experience_points INTEGER NOT NULL
);
INSERT INTO encounters (character_id, monster_id, result, experience_points) VALUES
    (1, 1, TRUE, 50),
    (2, 2, FALSE, 75),
    (3, 3, TRUE, 500);
