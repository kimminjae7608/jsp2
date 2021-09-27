-- �����Խ��� : ���̺� 2�� (���α�����, �������)

create table freeboard(
	idx int not null auto_increment,
	name varchar(30) not null,			-- �ۼ���
	password varchar(10) not null,		-- �ۺ�й�ȣ(�ʿ��Ҷ��� ���)
	subject varchar(40) not null,		-- ������
	content varchar(2000) not null,		-- ����
	readCount int default 0,			-- ��ȸ��
	wdate datetime default current_timestamp, -- ������ ���糯¥/�ð�
	ip varchar(15) default '127.0.0.1',			-- ������ ip
	commentCount smallint default 0,			-- ��� ����
	primary key(idx)
);
drop table freeboard;

insert into freeboard (name,password,subject,content,ip)
values ('honey','1111','�Խ��� ����','�Խ��� ó���Դϴ�.','192.168.17.3');
insert into freeboard (name,password,subject,content,ip)
values ('�糪','1111','�Խ��� 2��','�Խ��� �ι�°�ΰ��� �½��ϴ�.','192.168.12.1');
insert into freeboard (name,password,subject,content,ip)
values ('����','1111','�� �������Դϴ�','�Խ��� �̿��Ͻô� ���е鲲 �����մϴ�.','192.168.23.3');
insert into freeboard (name,password,subject,content,ip)
values ('ù����','1111','�Խ��� �׹�°','�Խ��� �����Ź�帳�ϴ�.','192.168.24.3');
insert into freeboard (name,password,subject,content,ip)
values ('�ι�°','1111','5��','�Ŵ����ҷ���','192.168.25.3');
insert into freeboard (name,password,subject,content,ip)
values ('����°','1111','�Խ���','�ݰ����ϴ�.','192.168.26.3');

select * from freeboard f ;

-- mysql ���� limit Ű���� : limit ��ȣ, ����
-- mysql,oracle select ����� ���� ���࿡ ������� ��ȣ�� �ο��ϴ� �÷�(idx�ƴմϴ�)�� ��������ϴ�.
-- limit �� ��ȣ�� row num �Դϴ�.(mysql �� 0���� ����)
select * from freeboard f order by idx desc;
select * from freeboard f order by idx desc limit 0,15;	-- 1������ ���
select * from freeboard f order by idx desc limit 15,15; -- 2������ ���
select * from freeboard f order by idx desc limit 30,15; -- 3������ ���
select * from freeboard f order by idx desc limit 45,15; -- 4������ ���
-- ���� : n=10������ ����? (10-1)*15	-> (n-1)*15
select * from freeboard f order by idx desc limit 135,15;
commit;

alter table freeboard modify column wdate timestamp
default current_timestamp; -- timezone�� ���� ����

-- �� ���� : subject, content ����
update freeboard set subject='123', content ='�������' where idx =157;

-- ��ȸ�� ���� : ���� ������(url ��û �߻�) ī��Ʈ +1
update freeboard set readCount = readCount+1 where idx=157;

-- �� ���� : �� ��й�ȣ 1)���� �� 2)���� ��
delete from freeboard where idx=155 and password = '1111';
delete from freeboard where idx=156;
