-- create the tables for our movies
CREATE TABLE `actors` (
   `actorid` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `firstName` varchar(100) NOT NULL,
    `lastName` varchar(100) NOT NULL,
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

CREATE TABLE `actor_movie_relationship` (
  `actorid` int(10) unsigned NOT NULL,
  `movieid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`actorid`, `movieid`),
  FOREIGN KEY (`actorid`) REFERENCES actors (`actorid`),
  FOREIGN KEY (`movieid`) REFERENCES movies (`movieid`)
);


INSERT INTO actor_movie_relationship (actorid, movieid)
VALUES 
  (2, 2),  
  (4, 4), 
  (5, 5);

