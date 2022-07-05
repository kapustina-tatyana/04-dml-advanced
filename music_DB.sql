CREATE DATABASE music_db;
\c music_db;
CREATE TABLE IF NOT EXISTS genre(
id serial PRIMARY KEY,
title varchar(60) NOT NULL unique
);
CREATE TABLE IF NOT EXISTS performer(
id serial PRIMARY KEY,
name varchar(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS genre_performer(
id_genre integer REFERENCES genre(id),
id_performer integer REFERENCES performer(id),
CONSTRAINT genre_performer_pk PRIMARY KEY (id_genre, id_performer)
);
CREATE TABLE IF NOT EXISTS albums(
id serial PRIMARY KEY,
title varchar(60) NOT NULL,
year integer NOT NULL
);
CREATE TABLE IF NOT EXISTS performer_albums(
id_performer integer REFERENCES performer(id),
id_album integer REFERENCES albums(id),
CONSTRAINT performer_albums_pk PRIMARY KEY (id_performer, id_album)
);
CREATE TABLE IF NOT EXISTS track(
id serial PRIMARY KEY,
title varchar(60) NOT NULL,
duration integer NOT NULL,
id_album integer REFERENCES albums(id)
);
CREATE TABLE IF NOT EXISTS collection(
id serial PRIMARY KEY,
title varchar(60) NOT NULL,
year integer NOT NULL
);
CREATE TABLE IF NOT EXISTS track_collection(
id_track integer REFERENCES track(id),
id_collection integer REFERENCES collection(id),
CONSTRAINT track_collection_pk PRIMARY KEY (id_track, id_collection)
);