/**************************************************************
-- SubQuery
**************************************************************/
-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?
-- 'Den' 월급
select 	salary
from 	employees
where 	first_name = 'Den'
;

-- 'Den' 월급보다 많은 인원
select 	first_name
		, salary
from 	employees
where 	salary > 11000
;

-- SubQuery
select 	first_name
		, salary
from 	employees
where 	salary > (select 	salary
					from 	employees
				   where 	first_name = 'Den')
;

-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
select 	min(salary)
from 	employees
;

select 	first_name
		,salary
        ,employee_id
from 	employees
where 	salary = (select 	min(salary)
					from 	employees)
;

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
select 	avg(salary)
from 	employees
;

select 	first_name
		,salary
from 	employees
where 	salary < (select avg(salary)
					from employees)
;

/**************************************************************
-- 다중행 SubQuery(in)
-- Query 값이 같을때
**************************************************************/
-- 부서번호가 110인 직원의 월급과 같은 월급을 받는 모든 직원의 사번, 이름, 월급를 출력하세요
select 	salary
from 	employees
where 	department_id = 110
;

select 	employee_id
		,first_name
        ,salary
from 	employees
where 	salary in (select salary
				     from employees
				    where department_id = 110)
;

-- 각 부서별로 최고급여를 받는 사원을 출력하세요
-- 그룹화로 인한 개인의 정보는 출력안됨
select 		department_id
			,max(salary)
from 		employees
group by	department_id
;

select 	department_id
		,employee_id
        ,first_name
        ,salary
from 	employees
where 	(department_id, salary) in (select 		department_id
												,max(salary)
									from 		employees
									group by 	department_id)
;

/**************************************************************
-- 다중행 SubQuery(any)
-- Query 안에 작은값을 기준
**************************************************************/
-- 부서번호가 110인 직원의 월급 중 가장 작은 월급 보다 월급이 많은 모든 직원의 이름, 급여를 출력하세요.
select 	 department_id
		 ,min(salary)
from 	 employees
where	 department_id = 110
group by department_id
;

select 	*
from 	employees
where	salary > 8300
or 		salary > 12008
;

-- or를 any로 대신함
select *
from employees
where salary > any (select 	salary
				    from  	employees
				    where 	department_id = 110)
;

/**************************************************************
-- 다중행 SubQuery(all)
-- Query 안에 큰 값을 기준
**************************************************************/
-- 부서번호가 110인 직원의 월급 중 가장 많은 월급 보다 월급이 많은 모든 직원의 이름, 급여를 출력하세요
select 	 department_id
		 ,max(salary)
from 	 employees
where	 department_id = 110
group by department_id
;

select *
from employees
where salary > all (select 	salary
				    from  	employees
				    where 	department_id = 110)
;

-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요.
select 	 department_id	
		 ,max(salary)
from 	 employees
group by department_id
;

select 	department_id 	부서번호
		,employee_id 	직원번호
        ,first_name		이름
        ,salary			월급
from 	employees
where 	(department_id, salary) in (select   department_id
											 ,max(salary)
								    from 	 employees
								    group by department_id)
;

/**************************************************************
-- 조건절(where)에서 비교 vs 테이블에서 조인
**************************************************************/
-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
select 	 department_id	
		 ,max(salary)
from 	 employees
group by department_id
;

select 	 e.department_id
		 ,e.employee_id
         ,e.first_name
         ,e.salary
from 	 employees e
		 ,(select 	department_id	
				    ,max(salary) salary
		   from 	employees
		   group by department_id) s
where 	e.department_id = s.department_id
and		e.salary = s.salary
;

