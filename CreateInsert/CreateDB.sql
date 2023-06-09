use Championship_DB
CREATE TABLE PLAYER(
	PLAYER_ID   SMALLINT NOT NULL PRIMARY KEY,
    LASTNAME VARCHAR (20)  NOT NULL,
    NAME  VARCHAR(20)      NOT NULL,
    PATRONYMIC  VARCHAR (20)  NOT NULL,
    BIRTHDAY  DATE NOT NULL,
);

/*PHYSCAL_DATA*/
CREATE TABLE PHYSICAL_DATA(
	PLAYER_ID SMALLINT NOT NULL,
	RESULT_DATE DATE NOT NULL,
	GROWTH SMALLINT NOT NULL,
	WEIGHT SMALLINT NOT NULL,
	RECORD4_ID SMALLINT NOT NULL PRIMARY KEY,
);

/*SEASON*/
CREATE TABLE SEASON(
	SEASON_ID SMALLINT NOT NULL PRIMARY KEY,
	SEASON_YEAR smallint not null,
	start_date date,
	end_date date,
);

/*SEASON_RATING*/
CREATE TABLE SEASON_RATING(
	SEASON_ID SMALLINT NOT NULL,
	TEAM_ID SMALLINT NOT NULL,
	SEASON_PLACE VARCHAR(20) NOT NULL,
	RECORD6_ID SMALLINT NOT NULL PRIMARY KEY,
);

/*SPORTSCHOOL*/
CREATE TABLE SPORTSCHOOL(
	SPORTSCHOOL_ID SMALLINT NOT NULL PRIMARY KEY,
	SPORTSCHOOL_ADRESS VARCHAR(30) NOT NULL,
	SPORTSCHOOL_NAME VARCHAR(20) NOT NULL,
);

/*TEAM*/
CREATE TABLE TEAM(
	TEAM_ID SMALLINT NOT NULL PRIMARY KEY,
	TEAM_NAME VARCHAR(20) NOT NULL,
	TEAM_YEAR smallint,
	SPORTSCHOOL_ID SMALLINT NOT NULL,
);

/*GAME*/
CREATE TABLE GAME(
	GAME_ID SMALLINT NOT NULL PRIMARY KEY,
	SEASON_ID SMALLINT NOT NULL,
	GAME_DATE DATE NOT NULL,
	TEAM_ID1 SMALLINT NOT NULL /*FOREIGN KEY REFERENCES TEAM(TEAM_ID)*/,
	TEAM_ID2 SMALLINT NOT NULL /*FOREIGN KEY REFERENCES TEAM(TEAM_ID)*/,
	WINNER_ID SMALLINT NOT NULL,
);

/*COACH*/
CREATE TABLE COACH(
	COACH_ID SMALLINT NOT NULL PRIMARY KEY,
	LASTNAME VARCHAR (20)  NOT NULL,
    NAME  VARCHAR(20)      NOT NULL,
    PATRONYMIC  VARCHAR (20)  NOT NULL,
    BIRTHDAY  DATE NOT NULL,
	SPORTSCHOOL_ID SMALLINT NOT NULL,
);

/*COACH_TEAM*/
CREATE TABLE COACH_TEAM(
	TEAM_ID SMALLINT NOT NULL,
	SEASON_ID SMALLINT NOT NULL,
	COACH_ID SMALLINT NOT NULL,
	RECORD7_ID SMALLINT NOT NULL PRIMARY KEY,
);

/*RUNK*/
CREATE TABLE RUNK(
	RUNK_ID SMALLINT NOT NULL PRIMARY KEY,
	RUNK_NAME VARCHAR(20) NOT NULL,
);

/*PLAYER_RUNK*/
CREATE TABLE PLAYER_RUNK(
	PLAYER_ID SMALLINT NOT NULL,
	DATE_OF_ASSIGNMENT DATE NOT NULL,
	RUNK_ID SMALLINT NOT NULL,
	RECORD5_ID SMALLINT NOT NULL PRIMARY KEY,
);

/*PLAYER_TEAM*/
CREATE TABLE PLAYER_TEAM(
	TEAM_ID SMALLINT NOT NULL,
	PLAYER_ID SMALLINT NOT NULL,
	SEASON_ID SMALLINT NOT NULL,
	RECORD_ID2 SMALLINT NOT NULL PRIMARY KEY,
);


/*REFEREES*/
CREATE TABLE REFEREES(
	REFEREES_ID SMALLINT NOT NULL PRIMARY KEY,
	FULL_NAME VARCHAR(20) NOT NULL,
	BIRTHDAY DATE NOT NULL,
);

/*GAME_REFEREES*/
CREATE TABLE GAME_REFEREES(
	REFEREES_ID SMALLINT NOT NULL,
	GAME_ID SMALLINT NOT NULL,
	ROLE_OF_REFEREE VARCHAR(20) NOT NULL,
	RECORD3_ID SMALLINT NOT NULL PRIMARY KEY,
);

/*GAME REPORT*/
CREATE TABLE GAME_REPORT(
	GAME_ID SMALLINT NOT NULL,
	PLAYER_ID SMALLINT NOT NULL,
	SCORE_PLAYER SMALLINT not NULL,
	TIME_IN SMALLINT NOT NULL,
	RECORD_ID8 SMALLINT NOT NULL PRIMARY KEY,
);

/*GAME_RECORDS*/
CREATE TABLE GAME_RECORDS(
	PLAYER_ID SMALLINT PRIMARY KEY,
	GAME_ID SMALLINT,
	MAX_SCORE_PLAYER SMALLINT,
);
go
ALTER TABLE GAME_REFEREES ADD
	FOREIGN KEY (REFEREES_ID)
	REFERENCES REFEREES(REFEREES_ID),
	FOREIGN KEY (GAME_ID)
	REFERENCES GAME(GAME_ID)

 
ALTER TABLE PLAYER_TEAM ADD
	FOREIGN KEY (TEAM_ID)
	REFERENCES TEAM(TEAM_ID),
	FOREIGN KEY (PLAYER_ID)
	REFERENCES PLAYER(PLAYER_ID),
	FOREIGN KEY (SEASON_ID)
	REFERENCES SEASON(SEASON_ID)

ALTER TABLE SEASON_RATING ADD
	FOREIGN KEY (SEASON_ID)
	REFERENCES SEASON(SEASON_ID),
	FOREIGN KEY (TEAM_ID)
	REFERENCES TEAM(TEAM_ID)

ALTER TABLE PLAYER_RUNK ADD
	FOREIGN KEY (PLAYER_ID)
	REFERENCES PLAYER(PLAYER_ID),
	FOREIGN KEY (RUNK_ID)
	REFERENCES RUNK(RUNK_ID)

ALTER TABLE COACH_TEAM ADD
	FOREIGN KEY (TEAM_ID)
	REFERENCES TEAM(TEAM_ID),
	FOREIGN KEY (SEASON_ID)
	REFERENCES SEASON(SEASON_ID),
	FOREIGN KEY (COACH_ID)
	REFERENCES COACH(COACH_ID)

ALTER TABLE TEAM ADD
	FOREIGN KEY (SPORTSCHOOL_ID)
	REFERENCES SPORTSCHOOL(SPORTSCHOOL_ID)

ALTER TABLE PHYSICAL_DATA ADD
	FOREIGN KEY (PLAYER_ID)
	REFERENCES PLAYER(PLAYER_ID)

ALTER TABLE GAME ADD
	FOREIGN KEY (SEASON_ID)
	REFERENCES SEASON(SEASON_ID),
	FOREIGN KEY (TEAM_ID1)
	REFERENCES TEAM(TEAM_ID),
	FOREIGN KEY (TEAM_ID2)
	REFERENCES TEAM(TEAM_ID)

ALTER TABLE COACH ADD
	FOREIGN KEY (SPORTSCHOOL_ID)
	REFERENCES SPORTSCHOOL(SPORTSCHOOL_ID)

ALTER TABLE GAME_REPORT ADD 
	FOREIGN KEY (GAME_ID)
	REFERENCES GAME(GAME_ID),
	FOREIGN KEY (PLAYER_ID)
	REFERENCES PLAYER(PLAYER_ID)

ALTER TABLE GAME_RECORDS ADD 
	FOREIGN KEY (GAME_ID)
	REFERENCES GAME(GAME_ID),
	FOREIGN KEY (PLAYER_ID)
	REFERENCES PLAYER(PLAYER_ID)