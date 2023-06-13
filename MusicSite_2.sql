-- Создаём таблицу жанров
CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

-- Создаём таблицу артистов
CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

-- Создаём связь "многие-ко-многим" "Артисты-Жанры"
CREATE TABLE IF NOT EXISTS GenresArtists (
	genre_id INTEGER REFERENCES Genres(id),
	artist_id INTEGER REFERENCES Artists(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

-- Создаём таблицу альбомов
CREATE TABLE IF NOT exists Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_of_release INTEGER NOT NULL 
);

-- Создаём связь "многие-ко-многим" "Артисты-Альбомы"
CREATE TABLE IF NOT EXISTS ArtistsAlbums (
	artist_id INTEGER REFERENCES Artists(id),
	album_id INTEGER REFERENCES Albums(id),
	CONSTRAINT pk2 PRIMARY KEY (artist_id,album_id)
);

-- Создаём таблицу треков
-- Cоздаём связь "один-к-одному" с таблицей альбомов
CREATE TABLE IF NOT EXISTS Trecks (
	id SERIAL PRIMARY KEY ,
	name VARCHAR(80) NOT NULL ,
	duration INTEGER NOT NULL ,
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

-- Создаём таблицу сборников
CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_of_release INTEGER NOT NULL 
);
-- Создаём связь "многие-ко-многим" "Сборники-треки"
CREATE TABLE IF NOT EXISTS CollectionsTrecks (
	сollection_id INTEGER REFERENCES Collections(id),
	treck_id INTEGER REFERENCES Trecks(id),
	CONSTRAINT pk3 PRIMARY KEY (сollection_id,treck_id)	
);
