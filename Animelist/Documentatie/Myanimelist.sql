---------------------------------------------------------------------------------------------
----------------------DROPPING EXISTING TABLES AND SEQUENCES---------------------------------
---------------------------------------------------------------------------------------------

drop table "DB21_ACCOUNT" cascade constraints;
drop table "DB21_FRIENDSHIP" cascade constraints;
drop table "DB21_MESSAGE" cascade constraints;
drop table "DB21_FORUM" cascade constraints;
drop table "DB21_ACCOUNT_FORUM" cascade constraints;
drop table "DB21_TOPIC" cascade constraints;
drop table "DB21_RECOMMENDATION" cascade constraints;
drop table "DB21_MYANIME" cascade constraints;
drop table "DB21_ANIME" cascade constraints;
drop table "DB21_REVIEW" cascade constraints;
drop table "DB21_MANGA" cascade constraints;
drop table "DB21_CHARACTER" cascade constraints;

drop sequence "DB21_S_FORUM";
drop sequence "DB21_S_TOPIC";
drop sequence "DB21_S_REVIEW";
drop sequence "DB21_S_CHARACTER";
drop sequence "DB21_S_ACCOUNT";
drop sequence "DB21_S_MESSAGE";
drop sequence "DB21_S_RECOMMENDATION";
drop sequence "DB21_S_MYANIME";




---------------------------------------------------------------------------------------------
-------------------------------CREATING TABLES-----------------------------------------------
---------------------------------------------------------------------------------------------
create table "DB21_ACCOUNT"
(
Accountnr			  number(13)		primary key,
Mailaddress			varchar2(50)	not null unique,
Password			  varchar2(50)	not null
);

create table "DB21_FRIENDSHIP"
(
AccountnrA			number(13)		,
AccountnrB			number(13)		,

CONSTRAINT fk_FRIENDSHIP_ACCOUNTNRA foreign key(AccountnrA)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade,
CONSTRAINT fk_FRIENDSHIP_ACCOUNTNRB foreign key(AccountnrB)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade,
primary key(AccountnrA, AccountnrB)
);

create table "DB21_MESSAGE"
(
MessageID       number(13) primary key ,
Description     varchar2(200) ,
Accountnr			  number(13),

CONSTRAINT fk_MESSAGE_ACCOUNTNR foreign key(Accountnr)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade

);

create table "DB21_FORUM"
(
ForumID         number(13) primary key,
Forumname       varchar2(50) not null

);

create table "DB21_ACCOUNT_FORUM" 
(
Accountnr			  number(13) ,
ForumID       number(13) ,

CONSTRAINT fk_ACCOUNT_FORUM foreign key(Accountnr)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade ,
CONSTRAINT fk_FORUM_ACCOUNT foreign key(ForumID)REFERENCES "DB21_FORUM"(ForumID) on delete cascade,
primary key(Accountnr, ForumID)
);

create table "DB21_TOPIC" 
(
TopicID         number(13) primary key,
Topicname       varchar2(50) not null, 
ForumID			    number(13),

CONSTRAINT fk_TOPIC_FORUM foreign key(ForumID)REFERENCES "DB21_FORUM"(ForumID) on delete cascade

);

create table "DB21_RECOMMENDATION" 
(
RecommendationID  number(13) primary key,
Description       varchar2(200) ,
Accountnr			    number(13) ,

CONSTRAINT fk_RECOMMENDATION_ACCOUNT foreign key(Accountnr)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade

);

create table "DB21_MANGA" 
(
Manganame       varchar2(50) primary key ,
Chapters        number(3) ,
Description     varchar2(1000)
);

create table "DB21_ANIME" 
(
Animename       varchar2(50) primary key,
Voiceactor      varchar2(50) ,
Episodes        number(3) ,
Description     varchar2(1000)
);


create table "DB21_MYANIME" 
(
MyanimeID        number(13) primary key,
Status           varchar2(50) not null CHECK(Status ='airing' or Status = 'finished'),
Anime            varchar2(50) ,
Manga             varchar2(50),
Genre            varchar2(20) not null,
Score            decimal(2,1), 
Rank             number(4) ,
Popularity       number(4) ,
Members          number(13) ,
Favorites        number(13) ,
Accountnr			   number(13) not null,    

CONSTRAINT fk_MYANIME_ACCOUNT foreign key(Accountnr)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade,
CONSTRAINT fk_MYANIME_ANIME  foreign key(Anime)REFERENCES "DB21_ANIME"(Animename) on delete cascade,
CONSTRAINT fk_MYANIME_MANGA foreign key(Manga)REFERENCES "DB21_MANGA"(Manganame) on delete cascade
);


create table "DB21_REVIEW" 
(
ReviewID        number(13) primary key,
Description     varchar2(200) ,
MyanimeID        number(13) ,
Accountnr			  number(13) ,

CONSTRAINT fk_REVIEW_MYANIME foreign key(MyanimeID)REFERENCES "DB21_MYANIME"(MyanimeID) on delete cascade,
CONSTRAINT fk_REVIEW_ACCOUNT foreign key(Accountnr)REFERENCES "DB21_ACCOUNT"(Accountnr) on delete cascade

);

create table "DB21_CHARACTER" 
(
CharacterID     varchar2(50) primary key,
Charactername   varchar2(50) not null,
Profession      varchar2(50) ,
Relative        varchar2(50) ,
Family          varchar2(50) ,
Skills          varchar2(200),
Birthplace      varchar2(50) ,
Birthdate       date , 
Age             number(2),
MyanimeID       number(13) ,

CONSTRAINT fk_MYANIME_CHARACTER foreign key(MyanimeID)REFERENCES "DB21_MYANIME"(MyanimeID) on delete cascade

);

---------------------------------------------------------------------------------------------
------------------------------TRIGGERS AND SEQUENCES-----------------------------------------
---------------------------------------------------------------------------------------------
--Forum
create sequence "DB21_S_FORUM"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_FORUM
  before insert on "DB21_FORUM"
  for each row
begin
  select "DB21_S_FORUM".nextval into :new.ForumID from dual;
end;
/
--Topic
create sequence "DB21_S_TOPIC"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_TOPIC
  before insert on "DB21_TOPIC"
  for each row
begin
  select "DB21_S_TOPIC".nextval into :new.TopicID from dual;
end;
/
--Message
create sequence "DB21_S_MESSAGE"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_MESSAGE
  before insert on "DB21_MESSAGE"
  for each row
begin
  select "DB21_S_MESSAGE".nextval into :new.MessageID from dual;
end;
/
--Review
create sequence "DB21_S_REVIEW"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_REVIEW
  before insert on "DB21_REVIEW"
  for each row
begin
  select "DB21_S_REVIEW".nextval into :new.ReviewID from dual;
end;
/
--Recommendation
create sequence "DB21_S_RECOMMENDATION"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_RECOMMENDATION
  before insert on "DB21_RECOMMENDATION"
  for each row
begin
  select "DB21_S_RECOMMENDATION".nextval into :new.RecommendationID from dual;
end;
/
--Character
create sequence "DB21_S_CHARACTER"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_CHARACTER
  before insert on "DB21_CHARACTER"
  for each row
begin
  select "DB21_S_CHARACTER".nextval into :new.CharacterID from dual;
end;
/
--account
create sequence "DB21_S_ACCOUNT"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_ACCOUNT
  before insert on DB21_ACCOUNT
  for each row
begin
  select "DB21_S_ACCOUNT".nextval into :new.Accountnr from dual;
end;
/
--Myanime
create sequence "DB21_S_MYANIME"
start with 1
increment by 1
nomaxvalue;

create or replace trigger DB21_T_MYANIME
  before insert on "DB21_MYANIME"
  for each row
begin
  select "DB21_S_MYANIME".nextval into :new.MyanimeID from dual;
end;
/
savepoint sp_Empty;

---------------------------------------------------------------------------------------------
--------------------------------------TEST DATA----------------------------------------------
---------------------------------------------------------------------------------------------
--account
insert into "DB21_ACCOUNT" (Mailaddress, Password)
values ('Jeffrey_kain@hotmail.com', 'Heartless275?');
insert into "DB21_ACCOUNT" (Mailaddress, Password)
values ('barry@live.nl', 'FalsePassword');
insert into "DB21_ACCOUNT" (Mailaddress, Password)
values ('H.swagle@google.us', 'YoullNeverGuess12');
insert into "DB21_ACCOUNT" (Mailaddress, Password)
values ('M.Rutte@belasting.nl', 'Noclue112');

--friendship
insert into "DB21_FRIENDSHIP" (AccountnrA, AccountnrB)
values(1, 4);
insert into "DB21_FRIENDSHIP" (AccountnrA, AccountnrB)
values (1, 3);
insert into "DB21_FRIENDSHIP" (AccountnrA, AccountnrB)
values (2, 3);
insert into "DB21_FRIENDSHIP" (AccountnrA, AccountnrB)
values(2,4);
insert into "DB21_FRIENDSHIP" (AccountnrA, AccountnrB)
values(1,2);

--forum
insert into "DB21_FORUM" (Forumname)
values('General');
insert into "DB21_FORUM" (Forumname)
values('Support');
insert into "DB21_FORUM" (Forumname)
values('Suggestion');
insert into "DB21_FORUM" (Forumname)
values('Anime Discussion');

--message 
insert into "DB21_MESSAGE" (Description,Accountnr)
values('Test1', 1);
insert into "DB21_MESSAGE" (Description,Accountnr)
values('Test2', 1);
insert into "DB21_MESSAGE" (Description,Accountnr)
values('Test3', 1);
insert into "DB21_MESSAGE" (Description,Accountnr)
values('Test1', 2);
insert into "DB21_MESSAGE" (Description,Accountnr)
values('Test2', 2);

--accountforum 
insert into "DB21_ACCOUNT_FORUM" (Accountnr,ForumID)
values(1,1);
insert into "DB21_ACCOUNT_FORUM" (Accountnr,ForumID)
values(1,2);
insert into "DB21_ACCOUNT_FORUM" (Accountnr,ForumID)
values(2,1);
insert into "DB21_ACCOUNT_FORUM" (Accountnr,ForumID)
values(2,2);

--topic
insert into "DB21_TOPIC" (Topicname, ForumID)
values('Naruto',1);
insert into "DB21_TOPIC" (Topicname, ForumID)
values('Anime list problems',1);
insert into "DB21_TOPIC" (Topicname, ForumID)
values('Manga list problems',2);
insert into "DB21_TOPIC" (Topicname, ForumID)
values('Recover password',2);

--recommendation
insert into "DB21_RECOMMENDATION" (Description,Accountnr)
values('Testdata', 1);
insert into "DB21_RECOMMENDATION" (Description,Accountnr)
values('Testdata2', 1);
insert into "DB21_RECOMMENDATION" (Description,Accountnr)
values('Testdata3', 2);
insert into "DB21_RECOMMENDATION" (Description,Accountnr)
values('Testdata', 2);

--Anime
insert into "DB21_ANIME" (Animename, Voiceactor, Episodes,Description)
values('Dragonball','Barack Obama', 100,'Bulma is a girl in search of the mystical Dragonballs that when brought together grant any wish. In her search she bumps into the owner of one of these balls, a strange boy named Goku. The two then set off together, Bulma in search of the Dragonballs and Goku on a quest to become stronger.');
insert into "DB21_ANIME" (Animename, Voiceactor, Episodes,Description)
values('Full Metal Alchemist','John Doe', 150,'The rules of alchemy state that to gain something, one must lose something of equal value. Alchemy is the process of taking apart and reconstructing an object into a different entity, with the rules of alchemy to govern this procedure. However, there exists an object that can bring any alchemist above these rules, the object known as the Philosophers Stone. The young Edward Elric is a particularly talented alchemist who through an accident years back lost his younger brother Alphonse and one of his legs. Sacrificing one of his arms as well, he used alchemy to bind his brothers soul to a suit of armor. This lead to the beginning of their journey to restore their bodies, in search for the legendary Philosophers Stone.');
insert into "DB21_ANIME" (Animename, Voiceactor, Episodes,Description)
values('Bleach','Ichigo', 100,'Bleach');

--manga
insert into "DB21_MANGA" (Manganame, Chapters, Description)
values('YU-GI-OH', 217, 'YUGIOH');
insert into "DB21_MANGA" (Manganame, Chapters, Description)
values('Bleach', 520,'BLEACH');
insert into "DB21_MANGA" (Manganame, Chapters, Description)
values('Dragonball', 220, 'Dragonball');
insert into "DB21_MANGA" (Manganame, Chapters, Description)
values('Full Metal Alchemist', 150, 'Full Metal Alchemist');


--myanime 
insert into "DB21_MYANIME" (Status,Anime,Manga,Genre,Score,Rank, Popularity, Members,
                          Favorites,Accountnr)
values('airing','Dragonball','Dragonball','action',8.12, 2,2,2748342,1234567,1);
insert into "DB21_MYANIME" (Status,Anime,Manga,Genre,Score,Rank, Popularity, Members,
                          Favorites,Accountnr)
values('airing','Bleach','Bleach','action',8.12, 2,2,2748342,1234567,4);

--review 
insert into "DB21_REVIEW" (Description,MyanimeID,Accountnr)
values('Good',1,1);
insert into "DB21_REVIEW" (Description,MyanimeID,Accountnr)
values('Bad',1,2);


--character
insert into "DB21_CHARACTER" (Charactername, Profession, Relative, Family ,
skills, Birthplace, Birthdate, Age, MyanimeID)
values('henk sokken', 'Scientist', 'Assistant: Cookiemonster', 'brother: Barry Sokken', 
'writing', 'Amsterdam', '15/09/1968', 46, 1);
insert into "DB21_CHARACTER" (Charactername, Profession, Relative, Family ,
skills, Birthplace, Birthdate, Age, MyanimeID)
values('Harry potter', 'Wizard', null, 'Father: James Potter', 
'Witchcraft', 'London', '15/09/1989', 25, 2);

-- results:
select * FROM "DB21_ACCOUNT";
select * FROM "DB21_FRIENDSHIP"; 
select * FROM "DB21_MESSAGE";
select * FROM "DB21_FORUM";
select * FROM "DB21_ACCOUNT_FORUM";
select * FROM "DB21_TOPIC";
select * FROM "DB21_RECOMMENDATION";
select * FROM "DB21_MYANIME";
select * FROM "DB21_REVIEW";
select * FROM "DB21_REVIEW";
select * FROM "DB21_ANIME";
select * FROM "DB21_MANGA";
select * FROM "DB21_CHARACTER";

savepoint sp_Clean;


