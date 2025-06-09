-- ----------------------------------------------------------------------------------------
drop table book;


-- 테이블 생성
create table book(
	book_id   int 			primary key 	auto_increment
    ,title 	  varchar(100) 	not null
    ,pubs 	  varchar(100)
    ,pub_date datetime
);

-- 테이블 리스트 조회
show tables;

-- 책 데이터 입력
insert into book values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22');
insert into book values(null, '삼국지', '민음사', '2002-03-01');
insert into book values(null, '토지', '마로니애북스', '2012-08-15');
insert into book values(null, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01');
insert into book values(null, '패션왕', '중앙북스(books)', '2012-02-22');
insert into book values(null, '순정만화', '재미주의', '2011-08-03');
insert into book values(null, '26년', '재미주의', '2012-02-04');


-- 데이터 조회
select * from book;

-- 전체 조회
select  b.book_id
		,b.title
        ,b.pubs
        ,date_format(b.pub_date, '%Y-%m-%d') as pub_date
from    book b
;     

-- ----------------------------------------------------------------------------------------
-- 작가 테이블 데이터 조회
select * from book;

-- 작가 데이터 추가
insert into book values(null, '', '', '');

-- 작가 데이터 삭제
delete from	book
where		book_id = 5;

-- 작가 데이터 수정
update book
set    title = ''
	   ,pubs = ''
	   ,pub_date = ''
where  book_id = 1;