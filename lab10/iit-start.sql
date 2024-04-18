-- create the tables for our movies
CREATE TABLE `movies` (
   `movieid` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `title` varchar(100) NOT NULL,
   `year` char(4) DEFAULT NULL,
   PRIMARY KEY (`movieid`)
);
-- insert data into the tables
INSERT INTO movies
VALUES (1, "Elizabeth", "1998"),
   (2, "Black Widow", "2021"),
   (3, "Oh Brother Where Art Thou?", "2000"),
   (
      4,
      "The Lord of the Rings: The Fellowship of the Ring",
      "2001"
   ),
   (5, "Up in the Air", "2009");

   -- create the tables for our movies
CREATE TABLE `actors` (
   `actorid` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `first_names` varchar(100) NOT NULL,
    `last_name` varchar(100) NOT NULL,
   `dob` date DEFAULT NULL,
   PRIMARY KEY (`actorid`)
);
-- insert data into the tables
INSERT INTO actors
VALUES (2, "Finn", "Wolfhard", "2002-12-23"),
   (3, "Adam", "Sandler", "1966-09-09"),
   (4, "Michael", "Jordan", "1987-02-09"),
   (5,"Will", "Smith", "1968-09-25"),
    (6, "Ian", "Somerhalder", "1978-12-08"),
    (7, "Meryl", "Streep", "1949-06-22"),
    (8, "Harrison", "Ford", "1942-07-13"),
    (9, "Jack", "Nicholson", "1937-04-22");

SELECT * FROM actors WHERE dob >= '1960-01-01';

CREATE TABLE `actor_movie_relationship` (
   `movieID` int(10) unsigned,
   `title` varchar(100),
   `full_name` varchar(100),
   `actorID` int(10) unsigned 
);


INSERT INTO actor_movie_relationship (actorid, movieid)
VALUES 
  (2, 2),  
  (4, 4), 
  (5, 5);


UPDATE actor_movie_relationship
SET full_name = (
        SELECT CONCAT(actors.first_names, ' ', actors.last_name)
        FROM actors
        WHERE actors.actorid = actor_movie_relationship.actorid
    ),
    title = (
        SELECT movies.title
        FROM movies
        WHERE movies.movieid = actor_movie_relationship.movieid
    );

SELECT * FROM actor_movie_relationship;
