/**************************************************************
마침표(;)가 없으면 앞테이블과 연결해서 해석
마침표(;)를 작성해야 오류나지 않는다
**************************************************************/
-- select문 (select절 + from절)
select * from employees; -- 대소문자 구분하지 않는다.

-- 테이블 전체 조회하기
select * from employees; -- 직원
select * from locations; -- 도시
select * from countries; -- 국가
select * from regions; -- 지역
select * from job_history; -- 업무현황
select * from jobs; -- 업무
select * from departments; -- 부서

/**************************************************************
-- select절
**************************************************************/
-- 전체
select * from employees;

-- employees_id
select employee_id from employees;

-- employees_id, first_name, last_name
select employee_id, first_name, last_name from employees;

-- first_name,salary
select first_name, 
	   salary
from employees;

-- first_name, last_name, salary, phone_number, email, hire_date
select first_name, 
	   last_name, 
	   salary, 
	   phone_number, 
	   email, 
	   hire_date
from employees;

-- 출력할 때 컬럼에 별명 사용하기
-- 직원아이디, 이름, 월급을 출력하세요.
-- 단 직원아이디는 empNO, 이름은 "f-name", 월급은 "월 급" 으로 컬럼명을 출력하세요
select employee_id as empNO, -- as 생략가능
	   first_name 'f-name', 
       salary '월 급'
from employees;

-- 직원의 이름(fisrt_name)과 전화번호, 입사일, 월급 으로 표시되도록 출력하세요
select first_name 이름,
	   phone_number 전화번호,
       hire_date 입사일,
       salary 월급
from employees;

-- 직원의 직원아이디를 사 번, 이름(first_name), 성(last_name), 월급, 전화번호, 이메일, 입사일로 표시되도록 출력하세요
select employee_id '사 번', -- 공백이나 특수문자 일 경우
	   first_name 이름,
       last_name 성,
       salary 월급,
       phone_number 전화번호,
       email 이메일,
       hire_date 입사일
from employees;

-- 산술 연산자 사용하기
select first_name,
	   salary 월급,
	   salary - 100 '월급 - 식대',
	   salary * 12 연봉,
	   salary * 12+5000 보너스포함,
	   salary / 30 일급,
	   employee_id % 3 '워크샵 팀'
from employees;

-- 연산시 문자열은 0으로 처리 → 오류나지 않아 주의
select job_id * 12
from employees;

-- concat()함수로 컬럼     / concatenation: 사물(주로문자열)을 연결, 결합
-- Steven | King 다른컬럼
select first_name, last_name,
	   concat(first_name, last_name) '전체이름(성이름)', -- StevenKing 같은 컬럼
	   concat(first_name, ' ', last_name) '전체-이름(성 이름)', -- Steven King 같은 컬럼
	   concat('이름  ', first_name, ' ', last_name, '       입사일  ', hire_date) '전체정보' -- Steven King hire date is 1987-06-17 같은 컬럼
from employees; 

/*
전체직원의 정보를 다음과 같이 출력하세요
성명(first_name last_name)
성과 이름사이에 – 로 구분 ex) William-Gietz
월급
연봉(급여*12)
보너스(급여*12+5000)
전화번호
*/

select concat(first_name, '-', last_name),
	   salary  월급,
       salary * 12  연봉,
       salary * 12+5000  보너스,
       phone_number 전화번호
from employees;

