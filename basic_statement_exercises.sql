SHOW databases;
USE albums_db;
SHOW tables;
DESCRIBE albums;

-- Use the albums_db database.

-- What is the primary key for the albums table?
-- Answer: The primary key for the albums table is "id".

-- What does the column named 'name' represent?
-- Answer: 'name' represents the name of the album.

-- What do you think the sales column represents?
-- Answer: 'sales' column represents number of albums sold.

-- Find the name of all albums by Pink Floyd.
-- Answer: The Dark Side of the Moon and The Wall.
SELECT name 
FROM albums
Where artist = 'Pink Floyd';

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
-- Answer: 1967
Select release_date
From albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";


-- What is the genre for the album Nevermind?
-- Answer: Grunge, Alternative Rock.
SELECT genre
FROM albums
WHERE name = 'Nevermind';


-- Which albums were released in the 1990s?
-- Answer: 'The Bodyguard', 'Jagged Little Pill', 'Come On Over', 'Falling into You', 'Let\'s Talk About Love', 'Dangerous', 'The Immaculate Collection', 'Titanic: Music from the Motion Picture', 'Metallica', 'Nevermind', 'Supernatural'.
SELECT name
FROM albums
WHERE release_date > 1989 and release_date < 2000;


-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
-- Answer: 'Grease: The Original Soundtrack from the Motion Picture', 'Bad', 'Sgt. Pepper\'s Lonely Hearts Club Band', 'Dirty Dancing', 'Let\'s Talk About Love', 'Dangerous', 'The Immaculate Collection', 'Abbey Road', 'Born in the U.S.A.', 'Brothers in Arms', 'Titanic: Music from the Motion Picture', 'Nevermind', 'The Wall'.
SELECT name as low_selling_albums
FROM albums
WHERE sales < 20;



