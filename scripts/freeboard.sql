-- 자유게시판 : 테이블 2개 (메인글저장, 댓글저장)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- 작성자
	password varchar(10) not null,		-- 글비밀번호
	subject varchar(40) not null,		-- 글제목
	content varchar(2000) not null,		-- 내용
	readCount int default 0,			-- 조회수
	wdate datetime default current_timestamp, -- 서버의 현재날짜/시간
	ip varchar(15) default '127.0.0.1',			-- 접속자 ip
	commemtCount smallint default 0,			-- 댓글 갯수
	primary key(idx)
);

insert into freeboard (name,password,subject,content,ip)
values ('honey','1111','게시판 시작','게시판 처음입니다.','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
values ('사나','1111','게시판 2등','게시판 두번째인가요 맞습니다.','192.168.12.1');
insert into freeboard (name,password,subject,content,ip)
values ('민재','1111','난 관리자입니다','게시판 이용하시는 모든분들께 감사합니다.','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
values ('첫번재','1111','게시판 네번째','게시판 등업부탁드립니다.','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
values ('두번째','1111','5등','매니져할래요','192.168.25.3');
insert into freeboard (name,password,subject,content,ip)
values ('세번째','1111','게시판','반갑습니다.','192.168.26.3');

select * from freeboard f ;

-- mysql 에는 limit 키워드 : limit 번호, 갯수
-- mysql,oracle select 결과에 대해 각행에 순서대로 번호를 부여하는 컬럼(idx아닙니다)이 만들어집니다.
-- limit 의 번호는 row num 입니다.(mysql 은 0부터 시작)
select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15;	-- 1페이지 목록
select * from freeboard f order by idx desc limit 15,15; -- 2페이지 목록
select * from freeboard f order by idx desc limit 30,15; -- 3페이지 목록
select * from freeboard f order by idx desc limit 45,15; -- 4페이지 목록
-- 계산식 : n=10페이지 글은? (10-1)*15	-> (n-1)*15
select * from freeboard f order by idx desc limit 135,15;
commit;

-- 글 수정 : subject, content 수정
update freeboard set subject='123', content ='내용수정' where idx =157;

-- 조회수 변경 : 읽을 때마다(url 요청 발생) 카운트 +1
update freeboard set readCount = readCount+1 where idx=157;