-- ----------------------------------------------------------------------------------------
-- web 계정 03 (FOREIGN KEY)
-- ----------------------------------------------------------------------------------------
-- 테이블 삭제
drop table author;
drop table book;


-- 테이블 생성
create table book(
	book_id   int 			primary key 	auto_increment
    ,title 	  varchar(100) 	not null
    ,pubs 	  varchar(100)
    ,pub_date datetime
    ,author_id int
    ,constraint book_fk 
    foreign key	(author_id) 
    references 	author(author_id)
);

create table author(
	author_id 	 int 			primary key 	auto_increment
    ,author_name varchar(100) 	not null
    ,author_desc varchar(500)
);


-- 테이블 리스트 조회
show tables;


-- 작가 데이터 입력
insert into author values(null, '이문열', '경북 영양');
insert into author values(null, '박경리', '경남 통영');
insert into author values(null, '유시민', '17대 국회의원');
insert into author values(null, '기안84', '기안동에서 산 84년생');
insert into author values(null, '강  풀', '온라인 만화가 1세대');
insert into author values(null, '김영하', '알뜰신잡 출연');


-- 책 데이터 입력
insert into book values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book values(null, '삼국지', '민음사', '2002-03-01', 1);
insert into book values(null, '토지', '마로니애북스', '2012-08-15', 2);
insert into book values(null, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01', 3);
insert into book values(null, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book values(null, '순정만화', '재미주의', '2011-08-03', 5);
insert into book values(null, '26년', '재미주의', '2012-02-04', 5);


-- 데이터 조회
select * from author;
select * from book;

-- 전체 조회
select  b.book_id
		,b.title
        ,b.pubs
        ,date_format(b.pub_date, '%Y-%m-%d') as pub_date
        ,a.author_id
        ,a.author_name
        ,author_desc
from    book b
join    author a
  on    b.author_id = a.author_id
;     
