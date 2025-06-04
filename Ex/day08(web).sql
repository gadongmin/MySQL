-- ----------------------------------------------------------------------------------------
-- web 계정 02 (delete, update문)
-- ----------------------------------------------------------------------------------------

-- 테이블 삭제
drop table author;
drop table book;

-- 테이블 생성
create table  author(
	author_id		int		 		primary key		auto_increment
    ,author_name	varchar(100)	not null
    ,author_desc	varchar(500)
);

-- 테이블 조작
insert into author	values(null, '박경리', '토지작가');
insert into author	values(null, '이문열', 	null);
insert into author(author_desc, author_name)	values('런닝맨', '유재석');


-- ----------------------------------------------------------------------------------------
-- 데이터 삭제(delete문)
delete 
from  author 	
where author_id = 3;

-- primary key 이외의 컬럼은 삭제되지 않음(옵션으로 조정가능)
delete 
from  author 	
where author_name = '이문열';

-- 모든 데이터 삭제(옵션으로 설정해야 실행가능)
delete from author;
truncate table article;

-- ----------------------------------------------------------------------------------------
-- 데이터 수정(update문)
update author 
set    author_name = '기안84'
	   ,author_desc = '웹툰작가'
where  author_id = 1;  -- where절이 생략되면 모든 데이터에 적용

update author 
set    author_name = '서장훈'
	   ,author_desc = '농구선수'
where  author_id >= 1;  -- 1이상의 모든 데이터 적용


-- ----------------------------------------------------------------------------------------
-- 테이블 조회
show tables;
select * from author;



