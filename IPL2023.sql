create table Auction (
	PlayerID	varchar primary key,
	FirstName	varchar,
	LastName	varchar,
	FullName	varchar,
	Country		varchar,
	Age			int,
	Specialism	varchar,
	BattingStyle varchar,
	BowlingStyle varchar,
	PricePaid	bigint,
	Bid	varchar,
	Team varchar);
copy Auction from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\01Auction.csv' CSV header;
select*from Auction;

create table Teams (
TeamID			varchar primary key,
TeamName		varchar,
ShortName		varchar,
CaptionName		varchar);
copy Teams from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\16Team.csv' CSV header;
select*from teams;


create table TeamPlayers(
TeamPID varchar primary key,
TeamID 	varchar, 
PlayerID varchar,
Teams  varchar,
ShortName varchar,
PlayerName varchar,
Specialism varchar,
Country varchar,
foreign key (TeamID) references Teams(TeamID),
foreign key (PlayerID) references Auction(PlayerID));
copy TeamPlayers from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\02TeamsPlayers.csv' CSV header;
select*from teamplayers;

create table Matches(
MatchID  varchar primary key,
Matches varchar,
ShortName varchar,
HomeTeamID varchar,
HomeTeam   varchar,
AwayTeamID varchar,
AwayTeam   varchar,
TossWon    varchar,
Decision   varchar,
HomePlayerID varchar,
HomeCaptain varchar,
AwayPlayerID varchar,
AwayCaptain varchar,
PlayerOfMatchID varchar,
PlayerOfMatch varchar,
HomeOvers decimal,
HomeRuns bigint,
HomeWickets bigint,
HomeBoundaries bigint,
AwayOvers  decimal,
AwayRuns  bigint,
AwayWickets bigint,
AwayBoundaries bigint,
Winner varchar,
VenueName varchar,
City varchar,
MDate date,
foreign key (HomeTeamID) references Teams(TeamID),
foreign key (AwayTeamID) references Teams(TeamID),
foreign key (HomePlayerID) references Auction(PlayerID),
foreign key (AwayPlayerID) references Auction(PlayerID),
foreign key (PlayerOfMatchID) references Auction(PlayerID));
copy Matches from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\03SeasonSummary.csv' CSV header;
select * from Matches;

create table BattingSummary(
BSID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
MatchName varchar,
HomeTeam varchar,
AwayTeam varchar,
CurrentInnings varchar,
InningsID bigint,
Runs bigint,
BallsFaced bigint,
Fours bigint,
Sixes bigint,
StrikeRate decimal,
NotOut boolean,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy BattingSummary from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\04BattingSummary.csv' CSV header;
select * from BattingSummary;

create table BowlingSummary(
BWSID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
MatchName varchar,
HomeTeam varchar,
AwayTeam varchar,
CurrentInnings varchar,
InningsID bigint,
Overs decimal,
Maidens bigint,
Conceded bigint,
Wickets bigint,
EconomyRate decimal,
Dots bigint,
FoursConceded bigint,
SixesConceded bigint,
Wides bigint,
Noballs bigint,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy BowlingSummary from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\05BowlingSummary.csv' CSV header;
select * from BowlingSummary;

create table BattingStats(
BSSID varchar primary key,
PlayerID varchar,
PlayerName varchar,
Matches bigint,
Innings bigint,
NotOut bigint,
Runs bigint,
HighScore bigint,
BallsFaced bigint,
StrikeRate decimal,
Centuries bigint,
Fiftys bigint,
Fours bigint,
Sixs bigint,
Average decimal,
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy BattingStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\06BattingStats.csv' CSV header;
select * from BattingStats;

create table BowlingStats(
BWSSID varchar primary key,
PlayerID varchar,
PlayerName varchar,
Matches bigint,
Innings bigint,
Overs decimal,
Runs bigint,
Wickets bigint,
Economy decimal,
StrikeRate decimal,
FourWickets bigint,
FiveWickets bigint,
Average decimal,
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy BowlingStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\07BowlingStats.csv' CSV header;
select * from BowlingStats;

create table CenturiesStat(
CID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
Runs bigint,
BallsFaced bigint,
StrikeRate decimal,
Four bigint,
Sixs bigint,
Against varchar,
Venue varchar,
MatchDate date,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy CenturiesStat from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\08CenturiesStats.csv' CSV header;
select * from CenturiesStat;

create table FiftyStats(
FID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
Runs bigint,
BallsFaced bigint,
StrikeRate decimal,
Fours bigint,
Sixs bigint,
Against varchar,
Venue varchar,
MatchDate varchar,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy FiftyStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\09FifityStats.csv' CSV header;
select * from FiftyStats;

create table WicketStats(
WID varchar primary key,
PlayerID varchar,
PlayerName varchar,
Matches bigint,
Innings bigint,
Overs decimal,
Runs bigint,
Wickets bigint,
Economy decimal,
StrikeRate decimal,
FourWicket bigint,
FiveWicket bigint,
Average decimal,	
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy WicketStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\10WicketStats.csv' CSV header;
select * from WicketStats;

create table RunStats(
RSID varchar primary key,
PlayerID varchar,
PlayerName varchar,
Matches bigint,
Innings bigint,
NotOut bigint,
Runs bigint,
HighScore bigint,
BallsFaced bigint,
StrikeRate decimal,
Century bigint,
Fifity bigint,
Four bigint,
Six bigint,
Average decimal,
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy RunStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\11RunsStats.csv' CSV header;
select * from RunStats;

create table Sixes(
SSID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
Runs bigint,
BallFaced bigint,
StrikeRate decimal,
Six bigint,
Against varchar,
Venue varchar,
MatchDate date,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy Sixes from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\12SixesStats.csv' CSV header;
select * from Sixes;

create table Fours(
FSID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
Runs bigint,
BallFaced bigint,
StrikeRate decimal,
Four bigint,
Against varchar,
Venue varchar,
MatchDate date,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy Fours from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\13FoursStats.csv' CSV header;
select * from Fours;

create table DotBallStats(
DBID varchar primary key,
MatchID varchar,
PlayerID varchar,
PlayerName varchar,
Overs decimal,
Runs bigint,
Wikets bigint,
Dots bigint,
StrikeRate decimal,
Against varchar,
Venue varchar,
MatchDate date,
foreign key (MatchID) references Matches(MatchID),
foreign key (PlayerID ) references TeamPlayers(TeamPID));
copy DotBallStats from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\14DotBall.csv' CSV header;
select * from DotBallStats;

create table Ranking(
RankID varchar primary key,
TeamID varchar,
TeamName varchar,
ShortName varchar,
MatchesPlayed bigint,
MatchesWon bigint,
MatchesLost bigint,
Points bigint,
NetRunRate decimal,
foreign key (TeamID) references Teams(TeamID));
copy Ranking from 'C:\Program Files\PostgreSQL\16\data\Dataset\IPL_2022\15Ranking.csv' CSV header;
select * from Ranking;
