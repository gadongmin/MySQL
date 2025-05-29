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

/**************************************************************
-- IF ~ ELSE 문IF(조건문, 참일때값, 거짓일때값)
**************************************************************/
-- 모든 직원의 이름, 월급, 수당, 상태(state)을 출력하세요
-- 상태컬럼은 수당이 없으면 0, 수당이 있으면 1 을 state 컬럼에 표시하세요
select	first_name
		,salary
        ,commission_pct
		,if(commission_pct is null, 0, 1) state -- if 파라미터(조건식, 참, 거짓)
        ,ifnull(commission_pct, '없음') 'ifnull()' -- ifnull 파라미터(조건식, 값)
from 	employees
;

/**************************************************************
-- CASE ~ END 문: if~else if~else if~else 유사
**************************************************************/
-- 직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
-- 실제월급은 job_id 가 'AC_ACCOUNT'면 월급 + 월급 * 0.1, 'SA_REP'면 월급 + 월급 * 0.2, 'ST_CLERK'면 월급 + 월급 * 0.3 그 외에는 월급으로 계산하세요
select 	employee_id 직원아이디
		,salary 	월급
 		,job_id 	업무아이디
        ,case when job_id = 'ac_account' then salary + salary * 0.1
		      when job_id = 'sa_rep' 	 then salary + salary * 0.2
			  when job_id = 'st_clerk' 	 then salary + salary * 0.3
              else salary
		end as '실수령 금액'
from 	employees
;

-- 직원의 이름, 부서번호, 팀을 출력하세요 
-- 팀은 코드로 결정하며 부서코드가 10 ~ 50 이면 'A-TEAM' / 60 ~ 100이면 'B-TEAM' / 110 ~ 150이면 'C-TEAM' / 나머지는 '팀없음' 으로 출력하세요.
select 	first_name 		이름
		,department_id 	부서번호
        ,case 	when department_id >= 10 	and department_id <= 50 	then 'A-TEAM'
				when department_id >= 60 	and department_id <= 100 	then 'B-TEAM'
				when department_id >= 110 	and department_id <= 150 	then 'C-TEAM'
				else '팀 없음'
		end	팀
from 	employees
order by department_id asc
;