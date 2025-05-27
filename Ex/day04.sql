-- day03 복습
select 	first_name
		,Upper(first_name) -- 대문자로 출력
        ,rpad(first_name, 10, '*') -- 단어를 10개로 만들고 오른쪽 모자른 부분을 '*'로 채움
from	 employees
;

/**************************************************************
-- 복수행 함수(그룹 함수, 집계 함수)
-- 종류 : 갯수, 합계, 평균, 최고값, 최저값
**************************************************************/
-- 사용 가능
select 	avg(salary)
from 	employees
;

-- 사용 불가능, 데이터 값의 크기가 달라 출력오류
select 	first_name		-- 107개
		,avg(salary) 	-- 1개
from 	employees
;

-- 그룹함수 → count()
select 	count(*) '직원수(null 포함)'
		,count(commission_pct) '커미션 받은 직원수'
		,count(manager_id) '매니저가 있는 직원 수(null 제외)'
from 	employees
;

-- 월급이 16000 초과 되는 직원의 수는?
select 	count(*)
		,count(salary)
        ,count(manager_id)
from 	employees
where	salary > 16000
;

-- 그룹함수 →  sum()
-- 전체직원의 수와 급여의 합
select 	count(*)
		,sum(salary)
from 	employees
;

-- 그룹함수 →  avg(), null 포함여부 확인 필수
select 	avg(salary)				-- salary가 null이면 평균에 포함안됨
		,avg(ifnull(salary, 0)) -- salary가 null이면 0으로 변환하여 평균에 포함됨
from 	employees
;

select 	commission_pct
		,ifnull(commission_pct, 0)
from 	employees
;

-- 그룹함수 →  max() / min()
select 	max(salary) 최대월급
		,min(salary) 최소월급
        ,max(hire_date) '가장 최근 입사'
        ,min(hire_date) '가장 오래된 입사'
from 	employees
;

/**************************************************************
-- GROUP BY 절
**************************************************************/
-- 부서별 월급 합계를 구하라
select 		department_id
			,count(*)
			,sum(salary)
            ,avg(salary)
            ,max(salary)
            ,min(salary)
from 		employees
group by 	department_id
order by	department_id asc
;

-- 부서별로 부서 번호, 인원수, 월급합계를 출력하세요.
select 		department_id
			,count(*)
            ,sum(salary)
from 		employees
group by 	department_id
order by 	department_id asc
;

-- 부서별로 부서 번호, 최고월급, (최고월급을 받는 직원, 불가)의 이름을 출력하세요.
select 		department_id
			,max(salary)
from 		employees
group by 	department_id
order by 	department_id asc
;

-- 그룹 2개 생성, department_id 안의 job_id의 내용 출력
select 		department_id
			,job_id
            ,sum(salary)
            ,count(*)
from 		employees
group by 	department_id
			,job_id
order by 	department_id asc
;

-- 월급(salary)의 합계가 (20000 이상인 부서, 불가)의 부서 번호, 인원수, 월급 합계를 출력하세요
select 		department_id
			,count(*)
            ,sum(salary)
from 		employees
group by 	department_id
;

/**************************************************************
-- HAVING 절
**************************************************************/
-- 월급(salary)의 합계가 20000 이상인 부서의 부서번호, 인원수, 월급 합계를 출력하세요
select 		department_id
			,count(*)
            ,sum(salary)
from 		employees
group by 	department_id
having		sum(salary) >= 20000 -- 월급 합계가 20000 이상
and			department_id >= 100 -- 부서번호가 100 이상
order by	department_id asc
;
