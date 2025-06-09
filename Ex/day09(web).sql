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

-- 작가 데이터 삭제
delete from	author
where		author_id = 5;

-- 작가 데이터 수정
update author 
set    author_name = '강풀'
	   ,author_desc = '천호동'
where  author_id = 1;

-- 데이터 조회
select  author_id
		,author_name
        ,author_desc
from 	author
;

