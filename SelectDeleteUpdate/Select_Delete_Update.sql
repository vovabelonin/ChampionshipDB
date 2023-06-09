use Championship_DB
/*Mastering the ways of manipulating data in interactive SQL DBMS of Microsoft SQL Server.*/

-----------------
/*SELECT*/
-----------------

--Let's find top5 highest players
select top 5 P.Player_id,p.lastname,p.name,max(convert(int,Pd.Growth)) as height from player as P 
inner join PHYSICAL_DATA as PD on PD.player_id=P.Player_ID
group by P.Player_id,p.lastname,p.name
order by height desc

--select all league members (players, coaches, judges, ) born in the current month to place an announcement on the site.
Select P.Lastname+' '+P.name+ ' '+P.patronymic as NName,day(P.birthday) as DateBD,'Игрок' As CL, T.Team_name
from Player as P
Left join Player_team as PT on P.Player_id=PT.Player_id and Pt.Season_id=2
left join team as T on T.Team_ID=Pt.team_ID
where month(birthday)=MONTH (getdate())
Union
Select C.Lastname+' '+C.name+' '+C.patronymic as NName,day(C.birthday) as DateBD, 'Тренер' As CL,Team_name 
from Coach as C
Left join Coach_team as CT on C.coach_id=cT.Coach_id and Ct.Season_id=2
left join team as T on T.Team_ID=Ct.team_ID
where month(birthday)=MONTH (getdate())
Union
Select Full_name as NName,day(birthday) as DateBD,'Судья' As CL,'' from REFEREES where  month(birthday)=MONTH (getdate())
Order by DateBD,NName

--Display teams with number of players in each season
Select T.Team_name,  S.Season_year, count(*)
from Team as T
inner join Player_team as PT on PT.team_id=T.Team_ID
inner join Season as S on S.Season_ID=PT.Season_ID
group by T.Team_name, S.Season_year
order by 3 

-----------------
/*DELETE*/
-----------------

-- 1. delete the title of master of sports (With integrity restriction) does not work
--Delete runk where RUNK_NAME ='Мастер Спорта'
--select * from runk where RUNK_NAME ='Мастер Спорта'

--delete rank in order (players put down kms, then delete rank)
--print confirmation that the data has been changed
Update Player_runk
set Runk_ID=(select runk_id from runk where RUNK_NAME ='Кандидат в МС')
where runk_id=(select runk_id from runk where RUNK_NAME ='Мастер Спорта')
Delete runk where RUNK_NAME ='Мастер Спорта'
select * from runk 


-- 2. remove player from the DB (with integrity constraint) doesn't work
--Delete player where year(birthday)>2003
select * from player where year(birthday)>2003

--remove the player in order (from the team, then from the DB)
delete GAME_REPORT where exists (select top 1 1 from player where player.PLAYER_ID = GAME_REPORT.PLAYER_ID and year(player.birthday)>2003)
delete player_runk where exists (select top 1 1 from player where player.PLAYER_ID =PLAYER_RUNK .PLAYER_ID and year(player.birthday)>2003)
delete PHYSICAL_DATA where exists (select top 1 1 from player where player.PLAYER_ID =PHYSICAL_DATA.PLAYER_ID and year(player.birthday)>2003)
delete PLAYER_TEAM  where exists (select top 1 1 from player where player.PLAYER_ID =PLAYER_TEAM.PLAYER_ID and year(player.birthday)>2003)
Delete player where year(birthday)>2003
--print confirmation that the data has been changed
select * from player where year(birthday)>2003

-----------------
/*UPDATE*/
-----------------

-- 1. player 5 passed a medical test today and height, weight has been changed, we will change the date of measurement and height weight
select * from PHYSICAL_DATA where RECORD4_ID = 5

update PHYSICAL_DATA
set GROWTH = 202,WEIGHT = 93
where RECORD4_ID = 5

select * from PHYSICAL_DATA where RECORD4_ID = 5

-- 2. - The coach got married, changed her last name
select*from COACH where COACH_ID = 7

update coach
set LASTNAME = 'Ханжина'
where COACH_ID = 7

select*from COACH where COACH_ID = 7