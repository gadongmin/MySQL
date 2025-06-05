-- 데이터 베이스 리스트 확인(스키마)
show databases;

-- 데이터 베이스 접속
use web_db;

-- 테이블 리스트 확인
show tables;

-- ----------------------------------------------------------------------------------------
-- 작가 테이블 데이터 조회
select * from author;

-- 작가 데이터 추가
insert into author values(null, '정우성', '서울');