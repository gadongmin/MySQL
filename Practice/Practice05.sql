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