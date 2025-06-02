-- ----------------------------------------------------------------------------------------
-- root 계정
-- ----------------------------------------------------------------------------------------
show databases;
use mysql;
show tables;
select * from user;
use hr_db;
show tables;
select * from employees;


-- ----------------------------------------------------------------------------------------
-- 계정만들기
-- create user '계정이름' @ '접속가능구역' identified by '비밀번호'
-- 모든곳 접속가능
create user	'web'@'%' 			  identified by '1234';
-- localhost에서만 접속가능
create user	'web'@'localhost' 	  identified by '1234';
-- 192.168.0.122에서만 접속가능
create user	'web'@'192.168.0.122' identified by '1234';

-- 계정조회
-- 'web' 이름의 3개 아이디가 나옴
-- IP만 접속 가능한 아이디로 로그인 됨
-- 로그인 우선순위 '192.168.0.122' > 'localhost' > 'web'@'%'
use mysql;
select user, host
from user
;

-- 비밀번호 변경
-- alter user '계정이름'@'접속가능구역' identified by '비밀번호'
alter user 'web'@'%' identified by 'web';

-- 계정삭제
drop user 'web'@'%';
drop user 'web'@'localhost';
drop user 'web'@'192.168.0.122';


-- ----------------------------------------------------------------------------------------
-- 데이터 베이스(스키마) 만들기
create database web_db
	default character set utf8mb4   -- 이모티콘 케릭터 셋
	collate utf8mb4_general_ci		-- 정렬규칙
	default encryption='n'			-- 암호화 : no(기본값 생략가능)
;

-- 데이터 베이스 삭제
drop database web_db;

-- 데이터 베이스 조회
show databases;

-- 데이터 베이스 선택
use web_db;


-- ----------------------------------------------------------------------------------------
-- 권한부여
-- web_db 데이타베이스의 모든 테이블에 'web'@'%' 사용자에게 모든 권한 부여
grant all privileges on web_db.* to 'web'@'%';
flush privileges;

-- ----------------------------------------------------------------------------------------


