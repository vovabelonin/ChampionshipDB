--display top 5 who has the highest average points per game
select top 5
p.player_id,
p.season_id,
round(convert(decimal(18,4),sumscore)/convert(decimal(18,4),number)*100,0)/100 as average
from PS_Result as p
group by p.season_id,p.player_id,p.number,p.sumscore
order by average desc

--display stats of fifth team
select 
*
from player_analyt
where histeam = 5

--choose 5 games in which the difference between points scored and conceded was the largest
select top 5 with ties
g.game_date,
TEAM_ID1 as team1,
TEAM_ID2 as team2,
score_t1,
Score_t2,
abs(score_t1-score_t2) as DiffResult
from game_big as g
inner join TEAM as t1 on t1.TEAM_ID=g.TEAM_ID1
inner join team as t2 on t2.TEAM_ID=g.TEAM_ID2
order by 6 desc

--display top 3 coaches with the highest percentage of wins

select top 3
COACH_id,
lastname,
SEASON_id,
count(*) as n,
sum(iswin) as w,
convert(decimal,sum(iswin))/convert(decimal,count(*)) as att
from coach_analyt
group by COACH_id,lastname,SEASON_id
order by att desc


