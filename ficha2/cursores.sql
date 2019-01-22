DELIMITER $$
CREATE PROCEDURE curMedal()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux VARCHAR(45);
    DECLARE cur CURSOR FOR SELECT DISTINCT medal FROM athlete_events;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO medal_dim(md_name) values(aux);
	END LOOP;
    CLOSE cur;
END;
$$

DELIMITER $$
CREATE PROCEDURE curTeam()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux VARCHAR(45);
    DECLARE cur CURSOR FOR SELECT DISTINCT team FROM athlete_events;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO team_dim(tm_name) values(aux);
	END LOOP;
    CLOSE cur;
END;
$$

DELIMITER $$
CREATE PROCEDURE curEvent()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT DISTINCT event FROM athlete_events;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO event_dim(ev_name) values(aux);
	END LOOP;
    CLOSE cur;
END;
$$

DELIMITER $$
CREATE PROCEDURE curAtlhete()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux3 INT;
    DECLARE aux1 VARCHAR(100);
    DECLARE aux2 VARCHAR(45);
    DECLARE cur CURSOR FOR SELECT DISTINCT id_athlete,name_athlete,sex FROM athlete_events;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux3,aux1,aux2;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO athlete_dim(idathlete_dim,at_name,sex) values(aux3,aux1,aux2);
	END LOOP;
    CLOSE cur;
END;
DELIMITER $$
CREATE PROCEDURE curGame()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux1 VARCHAR(45);
    DECLARE aux2 INT;
    DECLARE aux3 VARCHAR(45);
    DECLARE aux4 VARCHAR(45);
    DECLARE cur CURSOR FOR SELECT DISTINCT games,year,season,city FROM athlete_events;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux1,aux2,aux3,aux4;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO games_dim(gm_name,gm_year,season,city) values(aux1,aux2,aux3,aux4);
	END LOOP;
    CLOSE cur;
END;
$$

DELIMITER $$
CREATE PROCEDURE curFacts()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE aux1 INT;
    DECLARE aux2 INT;
    DECLARE aux3 INT;
    DECLARE aux4 INT;
    DECLARE aux5 INT;
    DECLARE aux6 INT;
    DECLARE aux7 INT;
    DECLARE aux8 INT;
    DECLARE cur CURSOR FOR 
    SELECT DISTINCT age,height,weight,id_athlete,idteam_dim,idgames_dim,idevent_dim,idmedal_dim 
		FROM athlete_events ae,team_dim t,games_dim g,event_dim e,medal_dim m
			WHERE
				ae.games=g.gm_name AND
				ae.event=e.ev_name AND
				ae.team=t.tm_name AND
				ae.medal=m.md_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
    OPEN cur;
    readLoop: LOOP
		FETCH cur INTO aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8;
        IF done THEN
			LEAVE readLoop;
		END IF;
        INSERT INTO facts(age,height,weight,idAthlete,idTeam,idGames,idEvent,idMedal) values(aux1,aux2,aux3,aux4,aux5,aux6,aux7,aux8);
	END LOOP;
    CLOSE cur;
END;
$$