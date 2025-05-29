/**************************************************************
-- JOIN
**************************************************************/
select	first_name
        ,department_name
from 	employees
		,departments
; -- 2889개 출력

-- where절을 사용하여 자료를 맞춘다
select 	first_name
        ,department_name
from 	employees
		,departments
where 	employees.department_id = departments.department_id
; -- 106개 출력(null 때문에 1개 감소)

/**************************************************************
-- inner join (EQUI Join)
**************************************************************/
-- 2개 테이블 조인
select 	first_name
		,employees.department_id
		,department_name
        ,departments.department_id
from 	employees inner join departments -- null제외 
on		employees.department_id = departments.department_id
;

select 	e.first_name
		,e.department_id
        ,d.department_id
        ,d.department_name
from 	employees e inner join departments d
on 		e.department_id = d.department_id
;

select 	e.first_name
		,e.department_id
        ,d.department_id
        ,d.department_name
from 	employees e
		,departments d
where 	e.department_id = d.department_id
;

-- 3개 테이블 조인
select 	e.first_name
        ,d.department_name
        ,l.city
from 	employees e
		,departments d
        ,locations l
where	e.department_id = d.department_id
and		d.location_id = l.location_id
;
-- join으로 작성(위와 동일)
select 		first_name
			,department_name
			,city
            ,d.location_id
            ,l.location_id
from 		employees e
inner join 	departments d
		on 	e.department_id = d.department_id
inner join 	locations l
		on 	d.location_id = l.location_id
;

select 	first_name
        ,department_name
        ,job_title
from 	employees e
		,departments d
        ,jobs j
where 	e.department_id = d.department_id
and		e.job_id = j.job_id
;        
-- join으로 작성(위와 동일)
select 		first_name
			,department_name
			,job_title
from 		employees e
inner join 	departments d
		on 	e.department_id = d.department_id
inner join 	jobs j
		on 	e.job_id = j.job_id
;

/**************************************************************
-- outer join
**************************************************************/
-- left outer join
-- 모든 직원의 부서번호, 이름, 부서번호를 출력하세요
-- 부서번호가 없는 직원도 표시(Kimberely)
select 			d.department_id
				,e.first_name
                ,d.department_name
from 			employees e
left outer join	departments d
			 on	e.department_id = d.department_id
;

-- right outer join
-- 모든 직원의 부서번호, 이름, 부서번호를 출력하세요
-- 직원이 없는 부서도 표시(부서가 없는 Kimberely 빠짐)
select 				first_name
					,department_name
                    ,e.department_id
                    ,d.department_id
from 				employees e
right outer join 	departments d
			  on 	e.department_id = d.department_id 
;

-- right outer join → left outer join
select 			first_name
				,department_name
				,e.department_id
				,d.department_id
from		 	departments d
left outer join	employees e
             on	d.department_id =  e.department_id
;

-- full outer join
-- 왼쪽 기준
(
select 			 e.employee_id		직원아이디
				 ,e.department_id	부서아이디
				 ,e.first_name		이름
				 ,d.department_name 	부서명
from 			 employees e
left outer join  departments d
			 on  e.department_id = d.department_id
)
union
(
select	 		 e.employee_id 
				 ,e.department_id 
				 ,e.first_name 		
				 ,d.department_name  
from 			 employees e
right outer join departments d
			  on e.department_id = d.department_id
);

-- 오른쪽 기준
(
select 			 e.employee_id		직원아이디  	
				 ,e.department_id	부서아이디
				 ,e.first_name		이름
				 ,d.department_name	부서명
from 			 employees e
right outer join departments d
			  on e.department_id = d.department_id
)
union
(
select 			 e.employee_id		 		
				 ,e.department_id	
				 ,e.first_name		
				 ,d.department_name	
from 			 employees e
left outer join  departments d
			 on  e.department_id = d.department_id
);