/*
문제 1.
매니저가 있는 직원은 몇 명입니까 ? 아래의 결과가 나오도록 쿼리문을 작성하세요
*/
select 	count(manager_id) haveMngCnt
from 	employees
;

/*
문제 2.
직원중에 최고임금(salary)과 최저임금을 "최고임금", "최저임금"으로 출력해 보세요.
두 임금의 차이는 얼마인가요? "최고임금-최저임금"이란 타이틀로 함께 출력해 보세요
*/
select 	max(salary) 				최고임금
		,min(salary)				최저임금 
        ,max(salary)-min(salary)	'최고임금-최저임금' 
from 	employees
;

/*
문제 3.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요
예) 2014 년 07 월 10 일
*/
select 	date_format(min(hire_date), '%Y년 %m월 %d일') 
from 	employees
;

/*
문제 4.
부서별로 평균임금, 최고임금, 최저임금을 부서 아이디 (department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
select	 department_id	부서아이디
		 ,max(salary)	최고임금
         ,min(salary)	최저임금
from	 employees
group by department_id
order by department_id desc
;

/*
문제 5.
업무(job_id) 별로 평균임금 , 최고임금 , 최저임금을 업무아이디 (job_id)와 함께 출력하고 
정렬순서는 최저임금 내림차순 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
*/
select 		job_id			업무아이디
			,avg(salary)	평균임금
            ,max(salary)	최고임금
            ,min(salary)	최저임금
from 		employees
group by	job_id
order by	min(salary) desc, avg(salary) asc
;

/*
문제 6.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요
예) 2005-08-20 Saturday
*/
select  date_format(min(hire_date), '%Y-%m-%d %W')	
from 	employees
;

/*
문제 7.
평균임금과 최저임금의 차이가 2000 미만인 부서 (department_id), 평균임금 , 최저임금 
그리고 평균임금 최저임금 를 평균임금 최저임금 의 내림차순으로 정렬해서 출력하세요
*/
select 		department_id 			'부서번호'
			,avg(salary) 			'평균임금'
            ,min(salary)			'최저임금'
            ,avg(salary)-min(salary)'평균-최저임금'
from 		employees
group by 	department_id
having 		avg(salary)-min(salary) < 2000
order by 	'평균-최저임금' desc
;

/*
문제 8.
업무(JOBS) 별로 최고임금과 최저임금의 차이를 출력해보세요
차이를 확인할 수 있도록 내림차순으로 정렬하세요
*/
select		job_title							'업무명'
			,max(max_salary) 					'최고임금'
			,min(min_salary)					'최저임금'
			,max(max_salary) - min(min_salary)  '최고 - 최저 임금'
from 		jobs
group by 	job_title
order by 	max(max_salary) - min(min_salary) desc
;

/*
문제 9.
2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다
출력은 관리자별로 평균급여가 5000 이상 중에 평균급여 최소급여 최대급여를 출력합니다
평균 급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다
매니저아이디는 manager_id 평균급여는 avg, 최대급여는 max, 최소급여는 min 으로 출력합니다
*/
select 		manager_id 				'매니저'
			,round(avg(salary), 1) 	'평균임금'
			,min(salary)			'최저임금'
			,max(salary)			'최고임금'
from 		employees
where 		date_format(hire_date, '%Y')  >= 2005
group by 	manager_id
having 		avg(salary) >= 5000
order by 	round(avg(salary), 1) desc
;

/*
문제 10.
아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다 .
입사일이 02/12/31 일 이전이면 '창립맴버', 03년은 '03년입사', 04년은 '04년입사'
이후입사자는 상장이후입사 optDate 컬럼의 데이터로 출력하세요
정렬은 입사일로 오름차순으로 정렬합니다
*/
select 		hire_date
			,case	when hire_date < '2002-12-31' 				then '창립 맴버'
					when date_format(hire_date, '%Y') =	2003	then '03년 입사'
					when date_format(hire_date, '%Y') =	2004	then '04년 입사'
					else 'optDate'
			end	입사일
from 		employees
order by 	hire_date asc
;

/*
문제 11.
필요한 함수(특정날짜의 요일을 숫자로 알려줌)를 검색 하고 사용법을 주석으로 남겨두세요
가장오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요
예) 2005 년 08 월 20 일 토요일
*/
select 
	concat(
		date_format(min(hire_date), '%Y년 %m월 %d일 ') 
		,case date_format(min(hire_date), '%w')
			when '0'	then '일요일'
            when '1'	then '월요일'
            when '2'	then '화요일'
            when '3'	then '수요일'
            when '4'	then '목요일'
            when '5'	then '금요일'
            when '6'	then '토요일'
            else ''
		end
       ) '가장 오래 근속한 직원 입사일'
from employees
;