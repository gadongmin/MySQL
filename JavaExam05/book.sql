-- 김동민
-- 테이블 삭제
drop table author;
drop table book;

-- 1) 테이블 생성
create table book(
	book_id   int 			primary key 	auto_increment
    ,title 	  varchar(100) 	not null
    ,pubs 	  varchar(100)
    ,pub_data datetime
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

-- 2) 책 데이터 입력
insert into book values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
insert into book values(null, '삼국지', '민음사', '2002-03-01', 1);
insert into book values(null, '토지', '마로니애북스', '2012-08-15', 2);
insert into book values(null, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01', 3);
insert into book values(null, '패션왕', '중앙북스(books)', '2012-02-22', 4);
insert into book values(null, '순정만화', '재미주의', '2011-08-03', 5);
insert into book values(null, '26년', '재미주의', '2012-02-04', 5);

-- 3) 작가 데이터 입력
insert into author values(null, '이문열', '경북 영양');
insert into author values(null, '박경리', '경남 통영');
insert into author values(null, '유시민', '17대 국회의원');
insert into author values(null, '기안84', '기안동에서 산 84년생');
insert into author values(null, '강  풀', '온라인 만화가 1세대');
insert into author values(null, '김영하', '알뜰신잡 출연');

-- 4) 전체 조회
select *
from   book b
	   ,author a
where  b.author_id = a.author_id
;     

-- 5) 전체 조회
select *
from   book b
right join author a
on  b.author_id = a.author_id
;     

-- 6) 데이터 수정
update author 
set    author_desc = '서울특별시'
where  author_id = 5;

-- 7) 김영하 데이터 삭제
delete 
from  author 	
where author_id = 6;

-- 8) 기안84 데이터 삭제
delete 
from  author 	
where author_id = 4;

-- 9) 기안84 데이타 삭제가 되지 않는 이유 (주석으로 작성)
-- book 데이터를 먼저 삭제한 후 실행

-- 10) 기안84 삭제할 수 있는 방법( 주석으로 작성)
delete 
from  book 	
where book_id = 5;

delete 
from  author 	
where author_id = 4;