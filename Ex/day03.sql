/**************************************************************
-- 단일행 함수
**************************************************************/
-- 숫자 함수
-- round() : 반올림
select 	round(123.123, 2)		-- 123.12, 소수점 3자리에서 반올림
			,round(123.126, 2)	-- 123.13 , 소수점 3자리에서 반올림
            ,round(234.567, 0) 	-- 235, 소수점 1자리에서 반올림
            ,round(123.456, 0) 	-- 123, 소수점 1자리에서 반올림
            ,round(123.124, -1) -- 120, 정수 1의 자리에서 반올림
            ,round(125.126, -2) -- 100, 정수 2의 자리에서 반올림
            ,round(125.126, -3) -- 0, 정수 3의 자리에서 반올림
from dual
;

-- truncate() : 자리 수 버림
select 	truncate(1234.34567,  2) 		-- 1234.34
			,truncate(1234.34567,  3) 	-- 1234.345
            ,truncate(1234.34567,  0) 	-- 1234
            ,truncate(1234.34567,  -2)	-- 1200
from dual
;

-- ceil() : 올림, 0번째 자리까지 표현(소수점 1자리에서 올림)
select	ceil(123.456) 			-- 124
			,ceil(123.789) 		-- 124
            ,ceil(123.7892313) 	-- 124
            ,ceil(987.1234)    	-- 988
from dual
;

-- floor() : 버림, 0번째 자리까지 표현(소수점 1자리에서 올림)
select 	floor(123.456) 			-- 123
			,floor(123.789) 	-- 123
            ,floor(123.7892313) -- 123
            ,floor(987.1234)	-- 987
from dual
;

-- POWER(숫자, n),  POW(숫자, n) : 숫자의 n승
select 	power(12, 2) 			-- 12 * 12
			,power(12, 3) 		-- 12 * 12 * 12
            ,pow(12, 2) 		-- 12 * 12
            ,pow(12, 3) 		-- 12 * 12 * 12
from dual
;

-- SQRT(숫자) : 숫자의 제곱근(루트), 같은 수의 곱
select	sqrt(144) 		-- 144 : 12 * 12
			,sqrt(121) 	-- 11 * 11
            ,sqrt(9) 	-- 3 * 3
from dual
;

-- SIGN(숫자) : 숫자가 음수이면 -1, 0이면 0, 양수이면 1
select	sign(123) 			-- 1(양수)
			,sign(0) 		-- 0(0)
            ,sign(-123) 	-- -1(음수)
from dual
;

-- ABS(숫자): 절대 값
select	abs(123) 		-- 123
			,abs(0) 	-- 0
			,abs(-123)	-- 123
from dual
;

-- GREATEST(x, y, z, ...) : 괄호 안의 값 중 가장 큰 값
select 	greatest(2, 0, -2)					-- 2
			,greatest(4, 3.2, 5.25)			-- 5.25
			,greatest('B', 'A', 'C', 'c')	-- c
from dual
;

-- LEAST(x, y, z, ...) : 괄호 안의 값 중 가장 작은 값
select 	least(2, 0, -2)					-- -2
			,least(4, 3.2, 5.25)		--  3.20
			,least('B', 'A', 'C', 'c') 	-- A
from dual
;

/**************************************************************
-- 단일행 함수
**************************************************************/
-- 문자 함수
-- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결
select concat('안녕', '하세요')
from dual
;

select concat('안녕', '-', '하세요')
from dual
;

select concat(first_name, " ", last_name)
from employees
;

-- CONCAT_WS(s, str1, str2, ..., strn) : str1, str2, ..., strn을 연결할때 사이에 s 로 연결 * with seperator
select concat_ws('-', 'abc', '123', '가나다')
from dual
;

select 	first_name, last_name
			,concat(first_name, last_name)
			,concat(first_name, '-', last_name, '-',  employee_id)
			,concat_ws('-', first_name, last_name, salary)
from employees;

-- LCASE(str) 또는 LOWER(str) : str의 모든 대문자를 소문자로 변환
select 	first_name
			,lcase(first_name)
			,lower(first_name)
			,lower('ABCabc!#$%')
			,lower('가나다') 
from employees;

-- UCASE(str) 또는 UPPER(str) : str의 모든 소문자를 대문자로 변환
select 	first_name
			,ucase(first_name)
			,upper(first_name)
			,upper('ABCabc!#$%')
			,upper('가나다')
from employees;

-- LENGTH(str) : str의 길이를 바이트로 반환
-- CHAR_LENGTH(str) 또는 CHARACTER_LENGTH() : str의 문자열 길이를 반환
select 	first_name
		,length(first_name) 			-- 바이트 수
		,char_length(first_name) 		-- 글자 수
		,character_length(first_name)	-- 글자 수
from employees
;

select 	length('a') 			-- 바이트 수
		,char_length('a') 		-- 글자 수
		,character_length('a') 	-- 글자 수
from dual
;

select 	length('가') 			-- 한글 영어 바이트 수가 다름
		,char_length('가')		-- 글자 수
		,character_length('가')	-- 글자 수
from dual
;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len) : str의 pos 위치에서 시작하여 len 길이의 문자열 반환
select 	first_name
		,substring(first_name, 1, 3) 	-- 1번째부터 3글자, 양수인 경우 왼쪽 → 오른쪽으로 검색해서 글자수 만큼 추출
		,substr(first_name, 2, 3) 		-- 2번째부터 3글자
		,substring(first_name, -3, 2) 	-- 역순 3번째부터 2글자, 음수인 경우 오른쪽 → 왼쪽 검색을 한 후 왼쪽 → 오른쪽으로 글자수 만큼 추출
        ,substr(first_name, -4, 3) 		-- 역순 4번째부터 3글자
from 	employees
;

select 	substr('901112-1234567', 8, 1) -- 성별확인
		,substr('901112-2234567', -7, 1) -- 성별확인
        ,substr('08-1111111', 1, 2) -- 학번 입학년도 확인
from dual
;

-- LPAD(str, len, padstr) : str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
-- RPAD(str, len, padstr) : str 문자열 오른쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
select 	first_name
		,lpad(first_name, 10, '*') 		-- 문자열을 왼쪽부터 '*'로 10개 만듬
		,rpad(first_name, 10, '123') 	-- 문자열을 오른쪽부터 '123'로 10개 만듬
from employees
;

-- TRIM(str): str의 양쪽에 있는 공백 문자를 제거
-- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
select 	concat('|', '        안녕하세요        ', '|' )
		,concat('|', trim('        안녕  하세요        '), '|' ) 	-- 양쪽 공백 제거, 문장 중간에 있는 공백은 적용되지 않는다.
		,concat('|', ltrim('        안녕하세요        '), '|' ) 	-- 왼쪽 공백 제거
		,concat('|', rtrim('        안녕하세요        '), '|' ) 	-- 오른쪽 공백 제거
        ,trim(concat('|', '        안녕  하세요        ', '|' )) 	-- 양쪽 공백 제거, 문장 중간에 있는 공백은 적용되지 않는다.
from dual
;

-- REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경, 글자수 상관없음
select 	first_name
		,replace(first_name, 'a', '&*&') -- 이름 안에 'a'를 '&*&'로 변경
from employees
;
-- 예) 이벤트 당첨자 이름 표기
select 	first_name -- 이름
		,substr(first_name, 2, 3) -- 이름 두번째부터 3글자
		,replace(first_name, substr(first_name, 2, 3), '***') -- 이름 두번째부터 3글자를 '***'로 변경
from employees
;

/**************************************************************
-- 단일행 함수
**************************************************************/
-- 날짜 / 시간 함수
-- CURRENT_DATE() 또는 CURDATE(): 현재 날짜를 반환
select 	current_date()
		,curdate()
from dual
;

-- CURRENT_TIME() 또는 CURTIME(): 현재 시간을 반환
select 	current_time()
		,curtime()
from dual
;

-- CURRENT_TIMESTAMP() 또는 NOW(): 현재 날짜와시간을 반환
select 	current_timestamp()
		,now()
from dual
;

-- ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기, 음수로 넣으면 빼기 효과
-- SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기, 음수로 넣으면 더하기 효과

select 	adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR)		-- 1년 후, '2022-06-20 00:00:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH)	-- 1달 후, '2021-07-20 00:00:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK)	-- 1주 후, '2021-06-27 00:00:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 DAY)		-- 1일 후, '2021-06-21 00:00:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR)	-- 1시간 후, '2021-06-20 01:00:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE)	-- 1분 후, '2021-06-20 00:01:00' 
		,adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)	-- 1초 후, '2021-06-20 00:00:01' 
from dual
;

select 	subdate('2021-06-20 00:00:00', INTERVAL 1 YEAR)		-- 1년 전, '2020-06-20 00:00:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 MONTH)	-- 1달 전, '2021-05-20 00:00:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 WEEK)	-- 1주 전, '2021-06-13 00:00:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 DAY)		-- 1일 전, '2021-06-19 00:00:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 HOUR)	-- 1시간 전, '2021-06-19 23:00:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 MINUTE)	-- 1분 전, '2021-06-19 23:59:00' 
		,subdate('2021-06-20 00:00:00', INTERVAL 1 SECOND)	-- 1초 전, '2021-06-19 23:59:59' 
from dual
;

-- DATEDIFF(): 두 날짜간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차
select 	datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00')  
		,timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
from dual
;

select 	datediff('2025-09-05', '2025-03-27')  
from dual
;

-- 현재까지 근무년수
select 	first_name
        ,datediff(now(), hire_date) / 365
		,ceil(datediff(now(), hire_date) / 365)
        ,concat(ceil(datediff(now(), hire_date) / 365), '년차')
from employees
;

/**************************************************************
-- 단일행 함수
**************************************************************/
-- 변환함수
-- 날짜(시간) → 문자열, DATE_FORMAT(date, format) : date를 format형식으로 변환
select 	now()
		,date_format(now(), '%y.%m.%d(%a) %H:%i:%s')
		,date_format(now(), '%Y년 %m월 %d일(%W) %h시 %i분 %s초(%p)')
        ,date_format(now(), '%y%m%d%h%i%s')
from dual
;

-- 변환함수: 문자열 → 날짜(시간), STR_TO_DATE(str, format) : str를 format형식으로 변환
select 	datediff('2021-06-04', '2021-06-01') -- 문자열로 인식되면 계산이 안되지만, 자동으로 날짜로 변환되어 계산됨
		,datediff('2021-Jun-04', '2021-06-01') -- 문자열로 인식되어 계산불가
from dual
;

select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d') -- 월이 문자로 표현되어, %M(월 이름),b(축약된 월 이름)로 설정해야 변환가능
from dual
;

select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
from dual
;

select 	concat(
			datediff( -- 일수 차
				str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d') -- 2021-06-04 07:48:58
				,str_to_date('2021-06-01 12:30:05', '%Y-%m-%d') -- 2021-06-01 12:30:05
			), '일'
        )
; -- 3일

-- FORMAT(숫자, p) : 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
SELECT 	format(1234567, 0)
		,format(1234567.89, 0) -- 정수로 표현, 소수점 1번째에서 반올림
		,format(1234567.89128, 4) -- 소수점 4번째까지 출력, , 소수점 5번째에서 반올림
        ,format(1234567.89128, -5) -- 음수는 소수점 1번째에서 반올림
from dual
;

-- CAST(expression AS type): expression을 type형식으로 변환
-- 숫자 → 문자열
select cast(1234567.89 as char)
from dual
;

-- 날짜 → 문자열
select cast('2024-01-10' as char)
from dual
;

-- 문자열 → 숫자 unsigned
SELECT cast('1234' as unsigned)
from dual
;

-- 문자열 → 날짜
select cast('2024-01-10' as date)
from dual
;

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select 	commission_pct
		,ifnull(commission_pct, 0)
from employees;

select 	commission_pct
		,ifnull(commission_pct, "없음")
from employees;

select 	first_name
		,manager_id
		,ifnull(manager_id, "매니저 없음")
from employees;