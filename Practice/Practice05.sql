/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의
이름, 매니저아이디, 커미션 비율, 월급을 출력하세요.
(45건)
*/
select 	first_name		이름
		,manager_id		매니저아이디
        ,commission_pct	'커미션 비율'
        ,salary			월급
from 	employees
where 	manager_id is not null
and 	commission_pct is null
and 	salary > 3000
;

/*
문제2.
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 월급 (salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요
-조건절비교 방법으로 작성하세요
-월급의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select department_id
		,max(salary)
from employees
group by department_id
;

select 	 employee_id						직원번호						
		 ,first_name						이름
         ,e.salary							월급
         ,concat(
         date_format(hire_date, '%Y-%m-%d')
         ,case date_format(hire_date, '%w')
		 	when '0' then '  일요일'
            when '1' then '  월요일'
            when '2' then '  화요일'
            when '3' then '  수요일'
            when '4' then '  목요일'
            when '5' then '  금요일'
            when '6' then '  토요일'
            else ''
            end
		 ) 									입사일	
         ,replace(phone_number, '.', '-') 	전화번호
         ,e.department_id						부서번호
from 	 employees e
		 ,(select 	department_id
					,max(salary) maxSalary
		   from 	employees
		   group by department_id) s
where	 e.salary = s.maxSalary
and 	 e.department_id = s.department_id
order by e.salary desc
;

/*
문제3
매니저별 담당직원들의 평균월급 최소월급 최대월급을 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균월급이 5000이상만 출력합니다.
-매니저별 평균월급의 내림차순으로 출력합니다.
-매니저별 평균월급은 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균월급, 매니저별최소월급, 매니저별최대월급 입니다.
(9건)
*/
select 	 m.manager_id				as '매니저 아이디'
		 ,e.first_name				as '매니저 이름'
		 ,round(avg(m.salary), 0) 	as '매니저별 평균월급'
         ,min(m.salary)				as '매니저별 최소월급'
         ,max(m.salary)				as '매니저별 최대월급'
from 	 employees m
join 	 employees e
on	 	 m.manager_id = e.employee_id
where 	 date_format(m.hire_date, '%Y') >= 2005
group by m.manager_id
having 	 round(avg(m.salary), 0) >= 5000
;

/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)은 표시 합니다.
매니저가 없는 직원(Steven) 은 출력하지 않습니다.
(106명)
*/
select 		e.employee_id		사번
			,e.first_name		이름
			,department_name	부서명
			,m.first_name		'매니저 이름'
from 		employees e
inner join 	employees m
		on 	e.manager_id = m.employee_id
left join 	departments d
	   on 	e.department_id = d.department_id
;

/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의
사번, 이름, 부서명, 월급, 입사일을 입사일 순서로 출력하세요
*/
select 	 employee_id		사번
		 ,first_name		이름
         ,department_name	부서명
         ,salary			월급
         ,hire_date			입사일
from 	 employees e
join 	 departments d
on		 e.department_id = d.department_id
where 	 date_format(hire_date, '%Y') >= 2005
order by hire_date asc
limit 	 10,10
;

/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 월급(salary)과 근무하는 부서 이름(department_name)은?
*/
select *
from employees
;

select min(cast(date_format(hire_date, '%Y%m%d') as unsigned))
from employees
;

select 	concat(first_name,'-',last_name) 이름
		,salary							 월급
        ,department_name				 부서명
from 	employees e
		,departments d
where 	e.department_id = d.department_id
and 	date_format(hire_date, '%Y%m%d') = (select 	min(cast(date_format(hire_date, '%Y%m%d') as unsigned))
											from 	employees)
;

/*
문제7.
평균월급(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과 업무(job_title), 월급(salary)을 조회하시오.
*/
select avg(salary)
from employees
group by department_id
;

select max(avgSalary)
from (select avg(salary) avgSalary
	  from employees
	  group by department_id
     ) t
;

select department_id
	  ,avg(salary) 
from employees
group by department_id
having round(avg(salary), 1)  = (select round(max(avgSalary), 1) 
								 from (
										select avg(salary) avgSalary
										from employees
										group by department_id
									  ) maxAvg
								)  
;

select 	e.employee_id  	직원번호
		,first_name		이름
		,last_name		성
        ,job_title		업무
        ,salary			월급
from 	employees e
join 	jobs j
on	 	e.job_id = j.job_id
where 	e.department_id = (select   department_id
						   from 	employees
						   group by department_id
						   having   round(avg(salary), 1)  = (select round(max(avgSalary), 1) 
															  from (
															  select avg(salary) avgSalary
															  from employees
															  group by department_id
															  ) maxAvg
														     )		  
						  )
;

select 	e.employee_id  	직원번호
		,e.first_name		이름
		,e.last_name		성
        ,j.job_title		업무
        ,e.salary			월급
from 	employees e
join	(select   department_id
		 from 	employees
		 group by department_id
		 having   round(avg(salary), 1)  = (select round(max(avgSalary), 1) 
											from (
												  select avg(salary) avgSalary
												  from employees
												  group by department_id
												 ) maxAvg
										   )		  
		) a
on 		e.department_id = a.department_id
join 	jobs j
on 	 	e.job_id = j.job_id
;