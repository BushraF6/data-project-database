sudo -u postgres psql
\c bushra
CREATE TABLE matches(id int primary key, season int, city varchar, date date, team1 varchar, team2 varchar, toss_winner varchar, toss_decision varchar, result varchar, dl_applied int, winner varchar, win_by_runs int, win_by_wickets int, player_of_match varchar, venue varchar, umpire1 varchar, umpire2 varchar);
COPY matches(id,season,city,date,team1,team2,toss_winner,toss_decision,result,dl_applied,winner,win_by_runs,win_by_wickets,player_of_match,venue,umpire1,umpire2) FROM  '/home/bf/Desktop/database proj/matches.csv' DELIMITER ',' CSV HEADER;
CREATE TABLE deliveries(match_id int REFERENCES matches (id), inning int, batting_team varchar, bowling_team varchar, over int, ball int, batsman varchar, non_striker varchar, bowler varchar, is_super_over int, wide_runs int, bye_runs int, legbye_runs int, noball_runs int, penalty_runs int,batsman_runs int, extra_runs int, total_runs int, player_dismissed varchar, dismissal_kind varchar, fielder varchar);
COPY deliveries(match_id, inning, batting_team, bowling_team, over, ball, batsman, non_striker, bowler, is_super_over, wide_runs, bye_runs,legbye_runs,noball_runs,penalty_runs,batsman_runs,extra_runs,total_runs,player_dismissed,dismissal_kind,fielder) FROM '/home/bf/Desktop/database proj/deliveries.csv' DELIMITER ',' CSV HEADER;
CREATE TABLE umpires(umpire varchar, country varchar);
COPY umpires(umpire,country) FROM '/home/bf/Desktop/database proj/umpires.csv' DELIMITER ',' CSV HEADER;
/* 1. Total runs scored by team. */
SELECT batting_team,sum(total_runs) FROM deliveries GROUP BY batting_team;
/* 2. Top batsman for Royal Challengers Bangalore. */
SELECT batsman FROM( SELECT batsman,sum(batsman_runs) AS total_runs_scored FROM deliveries WHERE batting_team='Royal Challengers Bangalore' GROUP BY batsman ORDER BY sum(batsman_runs) DESC LIMIT 10) AS batsmanruns;
/* 3. Number of Foreign umpires in IPL.*/
SELECT country,count(country) AS no_of_umpires FROM umpires WHERE country!=' India' GROUP BY country;
/* 4.Number of matches played by team by season. */
SELECT season,team, sum(matches_played) FROM (SELECT season,team1 AS team, count(team1) AS matches_played FROM matches GROUP BY team, season UNION SELECT season, team2 AS team, count(team2) AS matches_played FROM matches GROUP BY team,season) AS matchesplayed GROUP BY team,season ORDER BY season;
/* 5. Number of matches played per year for all the years in IPL. */
SELECT season,count(season) FROM matches GROUP BY season ORDER BY season;
/* 6. Number of matches won per team per year in IPL. */
SELECT season,winner AS team, count(winner) AS matches_won FROM matches GROUP BY team,season ORDER BY season;
/* 7. Extra runs conceded per team in the year 2016. */
SELECT bowling_team,sum(extra_runs) AS extraruns FROM deliveries JOIN matches ON match_id=id WHERE season=2016 GROUP BY bowling_team ORDER BY sum(extra_runs);
/* 8. Top 10 economical bowlers in the year 2015. */
SELECT bowler,round(economy,2) AS economy_rate FROM(SELECT bowler,sum(total_runs)/(count(over)/6.0) AS economy FROM deliveries JOIN matches ON match_id=id WHERE season=2015 GROUP BY bowler ORDER BY economy) AS economyrate LIMIT 10;
