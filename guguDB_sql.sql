-- 사용자				
create table guguUser(
   idx int auto_increment,
   name varchar(10) not null,      
   email varchar(30) not null,   
   password varchar(10) not null,   
   birth int not null,
   gender char(1) not null check (gender in('F','M')),
   phone_number varchar(13) not null,
   hobby varchar(30),   -- 취미
   school varchar(20), -- 출신 학교   
   job varchar(20),   -- 직업
   mbti char(4), -- MBTI
   introduce varchar(60),-- 자기소개
   filename varchar(50),
   primary key(idx)
);


/*drop table guguuser;*/
select * from guguuser g ;
				
insert into guguUser(name,email,password,birth,gender,phone_number)				
	values('이승준','cjstmd120@gmail.com','1111',900101,'01012345678'); -- 예시			
select * from guguUser;				
-- -----------------------------------------------------------------------------				
-- 홈				
create table guguHome(				
	u_idx int ,			
	title varchar(30),	-- 대문 제목		
	todayCount int default 0, -- 오늘 방문자			
	totalCount int default 0,	-- 총 방문자		
	primary key(u_idx),			
	foreign key(u_idx) references guguUser(idx)			
); -- 자기소개introduce varchar(60), -- 자기소개				

insert into guguHome(u_idx,title)				
	values(2,'반갑습니다'); -- 예시			
select * from guguHome;				
-- -----------------------------------------------------------------------------				
				
insert into guguHome(title,introduce)				
	values('반갑습니다','안녕하세요 저는 이00입니다. 취미는 ~~'); -- 예시			
select * from guguHome;	

				
-- -----------------------------------------------------------------------------				
-- 사진첩				
create table guguGallery(				
	idx	int	auto_increment,	
	u_idx int,			
	title varchar(20) not null,			
	filename varchar(50) not null,			
	gdate timestamp default current_timestamp,			
	gcontent varchar(100),			
	primary key(idx),			
	foreign key(u_idx) references guguUser(idx)			
);				
				
-- -----------------------------------------------------------------------------				
-- 게시판				
create table guguBoard(				
	idx	int auto_increment,		
	u_idx int,			
	subject	varchar(40)	not null,	
	content	varchar(1000),		
	heart int default 0,			
	wdate datetime default current_timestamp,			
	commentCount smallint default 0,			
	primary key(idx),			
	foreign key(u_idx) references guguUser(idx)			
);				
				
-- -----------------------------------------------------------------------------				
-- 방명록				
create table guestBook(				
	idx	int	auto_increment,	
	u_idx int,
	v_idx int,			
	content	varchar(200),		
	name varchar(10) not null,			
	wdate datetime default current_timestamp,			
	primary key(idx),			
	foreign key(u_idx) references guguUser(idx)			
);				
				
-- -----------------------------------------------------------------------------				
-- 친구				
create table mate(				
	u_idx int, -- 친구 idx			
	v_idx int, -- 내 idx			
	state char(1) check (state in('H','O','X')), -- 친구 신청 : O, 친구일 때 : H			
	nickName varchar(20),			
	foreign key(u_idx) references guguUser(idx)			
);		
				
-- -----------------------------------------------------------------------------				
-- 게시판 댓글				
create table boardComment(				
	board_idx int,			
	name varchar(10) not null,			
	content	varchar(100) not null,		
	wdate timestamp	default current_timestamp,		
	foreign key(board_idx) references guguBoard(idx)			
);				
				
-- -----------------------------------------------------------------------------				
-- 갤러리 댓글				
create table galleryComment(				
	gallery_idx	int,		
	name varchar(10) not null,			
	content	varchar(100) not null,		
	wdate timestamp	default current_timestamp,		
	foreign key(gallery_idx) references guguGallery(idx)			
);				
				
-- -----------------------------------------------------------------------------				
-- 방명록 댓글				
create table gbookComment(				
	board_idx int,			
	name varchar(10) not null,			
	content	varchar(100) not null,		
	wdate timestamp default current_timestamp,			
	foreign key(board_idx) references guestbook(idx)			
);				

-- --------------------------------------------------------------------------------------
insert into guguUser(name,email,password,birth,gender,phone_number)				
	values('user1','user1@naver.com','1111',900101,'M','010-1234-5678');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user2','user2@naver.com','2222',222222,'M','010-2222-2222');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user3','user3@naver.com','1111',222222,'M','010-2222-2222');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user4','user4@naver.com','1111',222222,'F','010-2222-2222');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user5','user5@naver.com','1111',222222,'F','010-2222-2222');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user6','user6@naver.com','1111',222222,'F','010-2222-2222');
insert into guguUser(name,email,password,birth,gender,phone_number)
	values('user7','user7@naver.com','1111',222222,'F','010-2222-2222');

select * from guguuser g ;
select * from guguuser where name ='user1' and password ='1111';
select * from guguuser where name !='user1';

insert into mate values(1,2,'H','뚱땡이');
insert into mate values(2,1,'H','다현');
insert into mate values(1,3,'H','비실이');
insert into mate values(3,1,'H','다현');
insert into mate values(2,5,'H','모모');
insert into mate values(5,2,'H','모모');

insert into mate values(1,4,'O','이슬이');
insert into mate values(4,1,'X','');
insert into mate values(2,6,'O','친구');
insert into mate values(6,2,'X','');

delete from mate where u_idx =6 and v_idx =2;

select * from mate;


select * from guguhome where u_idx=1 ;

select count(*) from mate where u_idx =1;
select * from mate where u_idx =1 and state ='H';

select * from guguuser as g join mate as m where g.idx != m.v_idx;
select * from guguuser as g left join mate as m on g.idx = m.u_idx;

select * from guguuser as g 
	left join (select * from mate where mate.u_idx =1) m 
	on g.idx =m.v_idx;

-- me to you
select g.idx, g.name from guguuser as g 
	left join (select * from mate where mate.u_idx =1 and state ='O') m 
	on g.idx =m.v_idx where g.idx!=1 and m.v_idx is not null;

-- you to me
select g.idx, g.name from guguuser as g 
	left join (select * from mate where mate.u_idx =4 and state ='X') m 
	on g.idx =m.v_idx where g.idx!=4 and m.v_idx is not null;

-- 추천친구 select
select g.idx, g.name from guguuser as g 
	left join (select * from mate where mate.u_idx =1) m 
	on g.idx =m.v_idx where g.idx!=1 and m.v_idx is null;


select u_idx, v_idx, nickName from mate;

select u_idx from mate where mate.u_idx =1;


select name from guguuser where idx=1;

update guguhome set totalCount = totalCount +1 where u_idx =1;
select * from guguhome g ;

select * from mate;

update mate set state='X' where u_idx =1 and v_idx =4;
update mate set state='O' where u_idx =4 and v_idx =1;
delete from mate where u_idx =1 and v_idx =5;
delete from mate where u_idx =5 and v_idx =1;

select * from freeboard where idx=1;

select * from freeboard where idx=#{b} and password=#{a};

select count(*) from freeboard ;

select * from freeboard order by idx desc;

select * from guguUser where email = 'user1@naver.com' and password = 1111;


select * from mate;

delete from guguuser where idx=8;

select * from guguuser g ;

select * from guguhome ;



insert into guguhome(u_idx,title) values (9,'hi');
delete from guguhome where u_idx =9 ;
/*insert, update 갑자기 안됩니다.이것은 mysql 문제 같은데요.*/
insert into mate values(1,6,'O','hi');  
delete from mate where u_idx =1 and v_idx =6;

update mate set state='H',nickName ='test' where u_idx =12 and v_idx =11;

select * from guestbook where u_idx=1;

insert into guestbook (u_idx,v_idx,content,name) values(1,2,'hihi','user2');


