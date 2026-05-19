CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenresArtists (
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id),
	artist_id INTEGER NOT NULL REFERENCES Artists(artist_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_year INTEGER
);

CREATE TABLE IF NOT EXISTS ArtistsAlbums (
	artist_id INTEGER NOT NULL REFERENCES Artists(artist_id),
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	CONSTRAINT aapk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	name VARCHAR(80) NOT NULL,
	duration INTERVAL NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_year INTEGER
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
	collection_id INTEGER NOT NULL REFERENCES Collections(collection_id),
	track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
	CONSTRAINT ctpk PRIMARY KEY (collection_id, track_id)
);