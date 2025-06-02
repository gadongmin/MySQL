-- ----------------------------------------------------------------------------------------
-- web 계정
-- ----------------------------------------------------------------------------------------
-- 테이블 만들기
create table book(
	book_id	  integer
	,title	  varchar(50)
    ,author   varchar(20)
    ,pub_data datetime
);

-- 컬럼추가
alter table book add pubs varchar(50);

-- 컬럼수정
alter table book modify title varchar(100);
alter table book rename column title to subject;

-- 컬럼삭제
alter table book drop author;

-- 테이블 명 수정
rename table book to article;

-- 테이블 삭제
drop table article;

select * from article;

-- author 테이블 만들기
create table author(
	author_id 	 int		  primary key
    ,author_name varchar(100) not null
    ,author_desc varchar(500) 
);

-- author 데이터 삽입(insert문)
-- 묵시적 방법
insert into author 
values(1,'박경리','토지 작가');
insert into author 
values(3,'정우성','');

-- 명시적 방법
insert into author(author_id, author_name) 
values(2, '이문열');

select * from author;

-- book 테이블 만들기
create table book(
	book_id   int	 	   primary key
	,title 	  varchar(100) not null
    ,pubs 	  varchar(100)
	,pub_date datetime
);

select * from book;

































