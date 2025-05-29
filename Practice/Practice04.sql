/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.(56건)
*/
select 	avg(salary) -- 6467.831776
from 	employees
;

select 	count(salary)
from 	employees
where 	salary < (select avg(salary)
					from employees)
;

/*
문제2.
평균월급 이상, 최대월급 이하의 월급을 받는 사원의
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차순으로 정렬하여 출력하세요.(51건)
*/
select 	avg(salary) -- 6467.831776
from 	employees
;

select 	max(salary) -- 24000.00
from 	employees
;

select 	 employee_id	직원번호
		 ,first_name 	이름
         ,salary		월급
         ,avg			평균월급
         ,max			최대월급
from 	 employees e
		 ,(select	avg(salary) avg
					,max(salary) max
		   from 	employees) s
order by salary asc
;

/*
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/
select 	l.location_id	도시아이디
		,street_address	거리명
        ,postal_code	우편번호
        ,city			도시명
        ,state_province	주
        ,country_id		나라아이디
from 	employees e
		,departments d
        ,locations l
where 	e.department_id = d.department_id
and		d.location_id = l.location_id
and  	first_name = 'Steven'
and		last_name = 'king'
;

select 	l.location_id	도시아이디
		,street_address	거리명
        ,postal_code	우편번호
        ,city			도시명
        ,state_province	주
        ,country_id		나라아이디
from 	locations l
where 	l.location_id = (select d.location_id
						 from 	departments d
                         where 	d.department_id = (select e.department_id
												   from   employees e
                                                   where  first_name = 'Steven'
												   and	  last_name = 'king')
)
;


