-- 김동민

-- 계정 생성
create user	'book'@'%' 			  identified by '1234';

-- 데이터 베이스(스키마)
create database book_db
	default character set utf8mb4
	collate utf8mb4_general_ci	
	default encryption='n';		
    
-- 권한부여
grant all privileges on book_db.* to 'web'@'%';
flush privileges;
