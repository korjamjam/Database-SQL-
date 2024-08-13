/*
    <SELECT>
    SELECT 가져오고싶은 정보 FROM 테이블;
    SELECT (*) 또는 컬럼1, 컬럼2, 컬럼3...FROM 테이블;
*/

--모든 사원의 모든 정보를 보여줘
SELECT * FROM EMPLOYEE;

--모든 사원의 이름, 주민등록번호, 핸드폰번호
SELECT EMP_NAME 이름, EMP_NO 주민등록번호, PHONE 핸드폰번호 
FROM EMPLOYEE;

---------------실습---------------
--JOB테이블의 직급명만 조회
SELECT JOB_CODE 직급명 FROM JOB;

--DEPARTMENT 테이블의 모든 컬럼 조회
SELECT * FROM DEPARTMENT;

--DEPARTEMENT 테이블의 부서코드, 부서명 조회
SELECT DEPT_ID 부서코드, DEPT_TITLE 부서명 FROM DEPARTMENT;

--EMPLOYEE 테이블의 사원명, 이메일, 전화번호, 입사일, 급여 조회
SELECT EMP_NAME 사원명, EMAIL 이메일, PHONE 전화번호, HIRE_DATE 입사일, SALARY 급여
FROM EMPLOYEE;

--<컬럼값을 통한 산술연산>
--SELECT절 컬럼명 작성부분에 산술연산을 할 수 있다.

--EMPLOYEE테이블의 사원명, 사원의 연봉(SALARY * 12)을 조회
SELECT EMP_NAME 사원명, SALARY * 12 연봉 
FROM EMPLOYEE;

--EMPLOYEE테이블의 사원명, 급여, 보너스, 연봉, 보너스포함연봉(급여 (급여 * 보너스)) *12)
SELECT EMP_NAME 사원명, SALARY 급여, BONUS 보너스, SALARY * 12 연봉, (SALARY +(SALARY * BONUS)) * 12  보너스포함연봉
FROM EMPLOYEE;

--산술연산 과정중에 NULL데이터가 포함되어 있다면 무조건 결과값은 NULL

--EMPLOYEE테이블의 사원명, 입사일, 근무일수를 조회
--현재시간 - 입사일 = 근무한기간
--DATE -DATE = 결과는 무조건 일로 표기 됨.
--코드실행시 날짜를 현재시간을 표시하는 상수 : SYSDATE
SELECT EMP_NAME 사원명, HIRE_DATE 입사일, SYSDATE - HIRE_DATE 근무일수
FROM EMPLOYEE;

-- DUAL : 오라클에서 제공해주는 가상데이터 테이블
SELECT SYSDATE FROM DUAL;


/*
     <컬럼명에 별칭 지정하기>
     산술연산을 하게되면 컬럼명이 지저분해진다. 이때 컬럼명에 별칭을 부여해서 깔끔하게 가져올 수 있다.
     [표현법]
     컬럼명 별칭 / 컬럼명 AS 별칭 / 컬럼명 "별칭" / 컬럼명 AS "별칭"
*/


/*
    <리터럴>
    임의로 지정한 문자열('')
    조회된 결과의 모든 행에 반복적으로 출력
*/

--EMPLOYEE테이블의 사번, 사원명, 급여 
SELECT EMP_ID 사번, EMP_NAME  AS 사원명, SALARY AS "급여"
FROM EMPLOYEE;


/*
    <연결연산자 : ||>
    여러 컬럼값들을 마치 하나의 컬럼처럼 연결할 수 있다.
*/
--사번, 이름, 급여를 하나의 컬럼으로 조회
SELECT EMP_ID ||' '|| EMP_NAME || ' '||SALARY
FROM EMPLOYEE;


--EMPLOYEE테이블에서 모든 사원의 월급을 조회한다.
--다음과 같은 결과가 나오도록 출력해라
-- XX의 월급은 XX원입니다.
SELECT EMP_NAME || '의 월급은 '|| SALARY || '원 입니다.'
FROM EMPLOYEE;


/*
    <DISTINCT>
    중복제거 - 컬럼에 표시된 값들을 한번씩만 조회하고자 할 때 사용
*/
--EMPLOYEE의 직급코드 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

--EMPLOYEE의 부서코드 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;


--SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE 
--위처럼 작성시 에러가 발생한다. DISTINCT는 한번만 사용 가능하다.

SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;
--위처럼 사용시(JOB_CODE, DEPT_CODE)를 쌍으로 묶어서 중복을 제거한 값을 보여준다.


/*
   SQL에서는 게행(자바에서는 \n(한줄 넘기기))가 없다.
   SQL에서는 데이터만을 담당하고 그외는 자바나 다른 언어를 이용해 외부에서 조작한다.
*/

/*
    <WHERE 절>
    조회하고자하는 테이블로부터 특정 조건에 만족하는 데이터만 조회할 때 사용
    조건식에서도 다양한 연산자 사용이 가능하다.
    [표현법]
    SELECT 컬럼,컬럼,컬럼 연산
    FROM 테이블
    WHERE 조건;
    
    >>비교연산<<
    > , <,  >=, <= : 대소비교
    = : 양쪽이 같다
    !=, ^=, <> : 양쪽이 다르다 (!= 을 많이 사용)
*/

--EMPLOYEE에서 부서코드가 'D5'인 사람들만 조회(모든 컬럼)
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

--EMPLOYEE에서 부서코드가 'D9'인 사원들만 조회(모든 컬럼)
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE에서 부서코드가 'D1'인 사원들의 사원명, 급여 부서코드 조회(모든 컬럼)
SELECT EMP_NAME 사원명, SALARY 급여 , DEPT_CODE 부서코드
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

--EMPLOYEE에서 부서코드가 'D1'이 아닌 사원들의 사원명, 급여 부서코드 조회(모든 컬럼)
SELECT EMP_NAME 사원명, SALARY 급여, DEPT_CODE 부서코드
FROM EMPLOYEE
WHERE DEPT_CODE != 'D1';

--월급이 400만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME 사원명, DEPT_CODE 부서코드
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--=============================================================================

--1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉(별칭 -> 연봉)
SELECT EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일, SALARY * 12 연봉
FROM EMPLOYEE
WHERE SALARY >= 3000000;

--2. 연봉이 5천만원 이상인 사원들의 사원명, 급여, 연봉(별칭 -> 연봉), 부서코드
SELECT EMP_NAME 사원명, SALARY 급여, SALARY * 12 연봉, DEPT_CODE 부서코드
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;

--3. 직급코드가 'J3'가 아닌 사원들의 사번 사원명, 직급코드, 퇴사여부
SELECT EMP_ID 사원번호, EMP_NAME 사원명, JOB_CODE 직급코드, EMP_YN 퇴사여부
FROM EMPLOYEE
WHERE JOB_CODE != 'J3';

--4. 급여가 350만원 이상 600만원 이하인 모든 사원의 사원명, 사번, 급여
    -- 중간에 AND,OR 로 조건을 연결할 수 있음   
SELECT EMP_NAME 사원명, EMP_ID 사원번호, SALARY 급여
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <=6000000;
--=============================================================================
--24/08/06
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;
--NULL 비교는 IS NULL, IS NOT NULL을 사용한다.

/*
    ORDER BY절
    SELECT문을 작성할 때 마지막에 작성
    보통 정렬할 때 사용함.
    
    [표현법]
    ORDER BY 정렬기준 컬럼 | 별칭 | 컬럼 순번
*/

SELECT *
FROM EMPLOYEE
--ORDER BY BONUS;
--ORDER BY BONUS ASC NULLS FIRST;
ORDER BY BONUS DESC, SALARY ASC;

--전 사원의 사원명, 연봉(보너스 제외) 조회(이 때 연봉별 내림차순 정렬)
SELECT EMP_NAME, SALARY * 12 AS 연봉
FROM EMPLOYEE
--ORDER BY SALARY *12 DESC;
--ORDER BY 연봉 DESC;
ORDER BY 2 DESC;

--============================================================================
/*
    <함수>
    전달된 컬럼값을 받아서 함수를 실행한 결과를 반환
    
    -단일행 함수 : N개의 값을 읽어들여서 N개의 결과값을 리턴 (매행마다 함수실행 결과를 반환)
    -그룹 함수 : N개의 값을 읽어 들여서 1개의 결과값을 리턴(그룹을 지어서 그룹별로 함수실행 결과를 반환)
    
    >> SELECT 절에 단일행함수랑 그룹함수를 함께 사용하지 못함
    -> 결과 행의 갯수가 다르기 때문
    
    >> 함수를 사용할 수 있는 위치 : SELECT절 WHERE절 ORDER BY절 HAVING절
    
*/

--=========================단일행 함수=========================
/*
    <문자처리함수>
    *LENGTH(컬럼 | '문자열') : 해당 문자열의 글자수를 반환
    *LENGTHB(컬럼 | '문자열') : 해당 문자열의 바이트 수를 반환
    
    '최' '나' 'ㄱ' 한글은 글자당 3BYTE
    영문자, 숫자, 특수문자 글자당 1BYTE
*/

SELECT LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;

SELECT LENGTH('ORACLE'), LENGTHB('ORACLE')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME)
FROM EMPLOYEE;

--=============================================================
/*
    *INSTR
    문자열로부터 특정 문자의 시작위치를 찾아서 반환
    
    INSTR(컬럼 | '문자열', '찾고자하는 문자', ['찾을 위치의 시작값, 순번']) -> 결과는 NUMBER]
    *순번은 찾는 순서이다 (ex 1,2 라면 1부터 찾기 시작해서 2번째로 찾은 값)
*/
SELECT INSTR('AABAACAABBA', 'B') FROM DUAL; --앞쪽에 있는 첫 B는 3번째 위치해 있다.
--찾을 위치 시작값 : 1, 순번 1 => 기본값
SELECT INSTR('AABAACAABBA', 'B', 1) FROM DUAL;
SELECT INSTR('AABAACAABBA', 'B', -1) FROM DUAL; --뒤에서부터 찾고 위치를 읽을 때는 앞에서부터 읽어준다.
SELECT INSTR('AABAACAABBA', 'B', 1, 2) FROM DUAL; --9?
SELECT INSTR('AABAACAABBA', 'B', 1, 3) FROM DUAL; 

SELECT EMAIL, INSTR(EMAIL, '_', 1,1), INSTR(EMAIL,'@')
FROM EMPLOYEE;

--=============================================================

/*
    *SUBSTR
    문자열에서 특정 문자열을 추출해서 반환
    
    [표현법]
    SUBSTR(STRING, POSITION, [LENGTH])
    - STRING : 문자타입 컬럼 | '문자열'
    - POSITION : 문자열 추출할 시작위치 값
    - LENTH : 추출할 문자 갯수 (생략하면 끝까지)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "성별"
FROM EMPLOYEE;

--사원들중 여사원들만 사원명, 주민번호 조회
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4'
ORDER BY EMP_NAME;

--함수 중첩사용 가능
--이메일의 아이디부분 추출
--사원목록에서 사원명, 이메일, 아이디 조회
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1)
FROM EMPLOYEE;

/*
    *LPAD / RPAD
    문자열을 조회할 때 통일감 있게 조회하고자 할 때 사용
    
    [표현법]
    LPAD/RPAD(STRING, 최종적으로 반환할 문자열의 길이, [덧붙이고자하는 문자])
    
    문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 붙여서 최종 N길이만큼 문자열을 반환
*/
--20만큼의 길이 중 EMAIL 컬럼값은 오른쪽으로 정렬하고 나머지 부분은 공백으로 채운다.
--덧붙이고자하는 문자를 넣어주지 않았기 때문에 공백으로 표시
SELECT EMP_NAME, LPAD(EMAIL, 20)
FROM EMPLOYEE;

--왼쪽 공백을 #으로 채움
SELECT EMP_NAME, LPAD(EMAIL,20, '#')
FROM EMPLOYEE;

--오른쪽 공백을 #으로 채움
SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

--사원들의 사원명, 주민등록번호 조회("701011-1XXXXXX")
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, 'X')AS "보안 된 주민등록번호"
FROM EMPLOYEE;

/*
    *LTRIM/RTRIM
    문자열에서 특정 문자를 제거한 나머지를 반환
    LTRIM/RTRIM(STRING, [제거하고자하는 문자들])
    
    문자열의 왼쪽 혹은 오른쪽에서 제거하고자하는 문자들을 찾아서 제거한 나머지 문자열 반환
    *'문자'들이다 문자열이 아니다.
*/
SELECT LTRIM('     K     H     ') FROM DUAL;
SELECT LTRIM('ACBABCAABCKKH', 'A') FROM DUAL;
SELECT LTRIM('ACBABCAABCKKH', 'ABC') FROM DUAL;
SELECT LTRIM('5135432KH543542', '0123456789')FROM DUAL;

/*
    *TRIM
    문자열의 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
    TRIM([LEADING] | TRAILING | BOTH] 제거하고자하는 문자열 FROM 문자열)
*/

SELECT TRIM('     K     H     ') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZZKHZZABCZZZZZZ') FROM DUAL; --양쪽에 있는 Z제거

SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; --LTRIM
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; --RTRIM

/*
    *LOWER / UPPER / INITCAP
    LOWER : 다 소문자로 변경한 문자열 반환
    UPPER : 다 대문자로 변경한 문자열 반환
    INITCAP : 띄어쓰기 기준 첫글자마다 대문자로 변경한 문자열 반환
*/

SELECT LOWER ('Welcome To My KH') FROM DUAL;
SELECT UPPER ('Welcome To My KH') FROM DUAL;
SELECT INITCAP ('welcome to my kh') FROM DUAL;

/*
    *CONCAT
    문자열 두개 전달받아 하나로 합친 후 반환
    CONCAT(STRING1, STRING2)
*/
SELECT CONCAT('가나다',' ABC') FROM DUAL;
SELECT '가나다' || 'ABC' FROM DUAL;

/*
    *REPLACE
    특정문자열에서 특정부분을 다른 부분으로 교체
    REPLACE(문자열, 찾을 문자열, 변경할 문자열)
*/

SELECT EMAIL, REPLACE(EMAIL,'KH.or.kr', 'gmail,com')
FROM EMPLOYEE;

--=============================================================================

/*
    <숫자 처리 함수>
    
    *ABS
    숫자의 절대값을 구해주는 함수
*/
SELECT ABS(-10), ABS(-6.3) FROM DUAL;

/*
    *MOD
    두 수를 나눈 나머지값을 반환
    *몫이 아닌 나머지이다. (자바에서 연산기호 %와 같음)
    MOD(NUMBER, NUMBER)
*/

SELECT MOD(10,3) FROM DUAL;
SELECT MOD(10.9, 3) FROM DUAL;

/*
    *ROUND
    반올림한 결과를 반환
    ROUND(NUMBER, [위치])
*/

-- 1, -1은 반올림할 소수점 자릿수이다
-- 기본적으로 소수점 첫번째 자리에서 반올림
-- 1은 소수점 첫번째 자리
-- -1은 소수점위로 올라가서 1의 자릿수
SELECT ROUND(123.456) FROM DUAL;
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, -1) FROM DUAL;

/*
    *CEIL
    올림처리를 위한 함수
    CEIL(NUMBER)
*/

SELECT CEIL(123.456) FROM DUAL;

/*
    TRUNC
    버림처리함수
    TRUNC(NUMBER, [위치])
*/

SELECT TRUNC(123.456) FROM DUAL;
SELECT TRUNC(123.456, 1) FROM DUAL;
SELECT TRUNC(123.456, -1) FROM DUAL;

--검색하고자하는 내용
--JOB CODE가 J7이거나 J6이면서 SALARY값이 200만원 이상이고 -->WHERE 조건
--BONUS가 있고 여자인 사원의 
--이름, 주민등록번호, 직급코드, 부서코드, 급여, 보너스를 조회하고싶다

SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000 
AND BONUS IS NOT NULL AND SUBSTR(EMP_NO, 8, 1) = '2';


--===================================================

/*
    <날짜 처리 함수>
*/

--*SYSDATE : 시스템의 현재 날짜 및 시간을 반환
SELECT SYSDATE FROM DUAL;

--*MONTHS_BETWEEN : 두 날짜 사이의 개월 수
--사원들의 사원명, 입사일, 근무일수, 근무개월수 조회 (근무일수 = 현재날짜 - 입사일)
SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE) AS 근무개월수,
CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 근무개월수
FROM EMPLOYEE;

--*ADD_MONTHS : 특정 날짜에 NUMBER개월수를 더해서 반환
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;

--근로자 테이블에서 사원명, 입사일, 입사후 3개월의 날짜를 조회
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 3)
FROM EMPLOYEE;

--*NEXT_DAY(DATE, 요일(문자|숫자)) : 특정날짜 이후 가장 가까운 요일의 날짜를 반환
SELECT NEXT_DAY(SYSDATE, '토요일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '토') FROM DUAL;

--1 : 일요일 ~ 7 : 토요일 (달력을 보면 알 수 있듯이 일요일부터 시작)
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;

--현재 SQL 인식언어가 한국어로 되있기 때문에 FRIDAY를 쓰면 오류가 발생
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;

--언어변경
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;

--*LAST_DAY(DATE) : 해당열의 마지막 날짜 구해서 반환
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    EXTRACT : 특정 날짜로부터 년|
    
    [표현법]
    EXTRACT(YEAR FROM DATE) : 연도만 추출
    EXTRACT(MONTH FROM DATE) :월만 추출
    EXTRACT(DAY FROM DATE) : 일만 추출
*/

--사원의 사원명, 입사년도, 입사월, 입사일 조회
SELECT EMP_NAME,
EXTRACT(YEAR FROM HIRE_DATE),
EXTRACT(MONTH FROM HIRE_DATE),
EXTRACT(DAY FROM HIRE_DATE)
FROM EMPLOYEE
ORDER BY 2,3,4; --(정렬할 컬럼)

/*
    <LIKE>
    비교하고자하는 컬럼값이 내가 제시한 특정 패턴에 만족할 경우 조회
    
    [표현법]
    비교한 대상컬럼 LIKE '특정패턴'; -> 일치하는 것만 가져온다.
    
    특정패턴을 제시할 때 '와일드카드'라는 특정 패턴이 정의되어야 한다.
    1. '%' : 포함문자 검색(0글자 이상 전부 조회)
    EX) 비교할 대상 컬럼 LIKE '문자%' : 비교할 대상 컬럼값 중에서 해당 문자로 시작하는 값들만 가져온다.
                                      즉, 뒤의 글자는 상관이 없다.
                                    
*/


--===================================================코드 연습===================================================

--1. JOB 테이블의 모든 정보 조회
SELECT *
FROM JOB;

--2. JOB 테이블의 직급 이름 조회
SELECT JOB_NAME
FROM JOB;

--3. DEPARTMENT 테이블의 모든 정보 조회
SELECT *
FROM DEPARTMENT;

--4. EMPLOYEE테이블의 직원명, 이메일, 전화번호, 고용일 조회
SELECT 
    EMP_NAME AS "직원명", 
    EMAIL AS "이메일", 
    PHONE AS "전화번호", 
    HIRE_DATE AS "고용일"
FROM EMPLOYEE;

--5. EMPLOYEE테이블의 고용일, 사원 이름, 월급 조회
SELECT
    HIRE_DATE AS "고용일",
    EMP_NAME AS "직원명",
    SALARY AS "월급"
FROM EMPLOYEE;

--6. EMPLOYEE테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총수령액 - (연봉*세금 3%)) 조회
SELECT
    EMP_NAME,
    SALARY * 12 AS "연봉",
    (SALARY+(SALARY * NVL(BONUS,0)))*12 AS "총수령액(보너스포함)",
    ((SALARY+(SALARY * NVL(BONUS,0)))*12-(SALARY *12) * 0.03) AS "실수령액"
FROM EMPLOYEE;


--7. EMPLOYEE테이블에서 SAL_LEVEL이 S1인 사원의 이름, 월급, 고용일, 연락처 조회
SELECT EMP_NAME, SALARY, HIRE_DATE,PHONE
FROM EMPLOYEE
WHERE SALARY BETWEEN 6000000 AND 10000000;

--8. EMPLOYEE테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
SELECT 
    EMP_NAME AS "이름", 
    SALARY AS "월급",
    ((SALARY+(SALARY * NVL(BONUS,0)))*12-(SALARY *12) * 0.03) AS "실수령액",
    HIRE_DATE AS "고용일"
FROM EMPLOYEE
WHERE ((SALARY+(SALARY * NVL(BONUS,0)))*12-(SALARY *12) * 0.03) > 50000000;

--9. EMPLOYEE테이블에 월급이 4000000이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE = 'J2';

--10. EMPLOYEE테이블에 DEPT_CODE가 D9이거나 D5인 사원 중 고용일이 02년 1월 1일보다 빠른 사원의 이름, 부서코드, 고용일 조회
SELECT 
    EMP_NAME,
    DEPT_CODE,
    HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D9','D5')
ORDER BY DEPT_CODE;

--11. EMPLOYEE테이블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

--12. EMPLOYEE테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';

--13. EMPLOYEE테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
SELECT 
    EMP_NAME,
    PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';
--WHERE SUBSTR(PHONE, 1, 3) != '010';


--14. EMPLOYEE테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고 고용일이 90/01/01 ~ 00/12/01이고,
--    급여가 270만 이상인 사원의 전체를 조회
--★★★★
SELECT *
FROM EMPLOYEE
WHERE  
    EMAIL LIKE '____\_%' ESCAPE '\'
    AND DEPT_CODE IN ('D9','D6')
    AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01';
    
--15. EMPLOYEE테이블에서 사원 명과 직원의 주민번호를 이용하여 생년, 생월, 생일 조회
SELECT 
    EMP_NAME,
    SUBSTR(EMP_NO,1,2) AS "생년",
    SUBSTR(EMP_NO,3,2) AS "생월",
    SUBSTR(EMP_NO,5,2) AS "생일" 
FROM EMPLOYEE;

--16. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)
--SELECT EMP_NAME AS 사원명, SUBSTR(EMP_NO,1 ,7) || '*******' AS 주민등록번호 ★★★★
SELECT 
    EMP_NAME,
    RPAD(SUBSTR(EMP_NO,1,7),14,'*')
FROM EMPLOYEE;

--17. EMPLOYEE테이블에서 사원명, 입사일-오늘, 오늘-입사일 조회
--(단, 각 별칭은 근무일수1, 근무일수2가 되도록 하고 모두 정수(내림), 양수가 되도록 처리)
--★★★★
SELECT
    EMP_NAME,
    ABS (ROUND(HIRE_DATE - SYSDATE)) AS "근무일수1",
    ABS (ROUND(SYSDATE - HIRE_DATE)) AS "근무일수2"
FROM EMPLOYEE
ORDER BY 근무일수1;

--18. EMPLOYEE테이블에서 사번이 홀수인 직원들의 정보 모두 조회
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1;

--19. EMPLOYEE테이블에서 근무 년수가 20년 이상인 직원 정보 조회
--근무 년수가 20년 = 240개월
--★★★★
SELECT *   
FROM EMPLOYEE
WHERE (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) >= 240;

--20. EMPLOYEE 테이블에서 사원명, 급여 조회 (단, 급여는 '\9,000,000' 형식으로 표시 , \은 '원'표시)
--★★★★
SELECT
    EMP_NAME,
    TO_CHAR(SALARY,'L99,999,999')
FROM EMPLOYEE;


--21. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회
--(단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며
--나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)★★★★
SELECT 
    EMP_NAME,
    DEPT_CODE,
    SUBSTR(EMP_NO,1,2)|| '년 ' ||
    SUBSTR(EMP_NO,3,2)|| '월 ' ||
    SUBSTR(EMP_NO,5,2)|| '일' AS "생년월일",
    EXTRACT(YEAR FROM SYSDATE) -  --현재날짜에서 년도만 추출 
    CASE
        WHEN SUBSTR(EMP_NO, 1, 2) >= '50' THEN 1900 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
        ELSE 2000 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
    END "나이(만)" --추출한 현재년도에 50이상이면 19xx년대생으로 하고, 그
FROM EMPLOYEE;


--22. EMPLOYEE테이블에서 부서코드가 D5, D6, D9인 사원만 조회하되 D5면 총무부, D6면 기획부, D9면 영업부로 처리
--(단, 부서코드 오름차순으로 정렬)
SELECT EMP_ID, EMP_NAME, DEPT_CODE,
       DECODE(DEPT_CODE, 'D5', '총무부', 'D6', '기획부', 'D9', '영업부')
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9')
ORDER BY DEPT_CODE;

--23. EMPLOYEE테이블에서 사번이 201번인 사원명, 주민번호 앞자리, 주민번호 뒷자리,
--주민번호 앞자리와 뒷자리의 합 조회
SELECT 
    EMP_NAME,
    SUBSTR(EMP_NO,1,6),
    SUBSTR(EMP_NO,8,14),
    SUBSTR(EMP_NO,1,6) + SUBSTR(EMP_NO,8,14)
FROM EMPLOYEE
WHERE EMP_ID = '201';

--24. EMPLOYEE테이블에서 부서코드가 D5인 직원의 보너스 포함 연봉 합 조회
SELECT
    SUM((SALARY+(SALARY * NVL(BONUS,0)))*12) AS "보너스 포함 연봉 합"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

--25. EMPLOYEE테이블에서 직원들의 입사일로부터 년도만 가지고 각 년도별 입사 인원수 조회
--전체 직원 수, 2001년, 2002년, 2003년, 2004년 ★★★★
SELECT
    COUNT(*) AS "전체 직원수",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2001, 1, NULL)) AS "2001년",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2002, 1, NULL)) AS "2002년",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2003, 1, NULL)) AS "2003년",
    COUNT(DECODE(EXTRACT(YEAR FROM HIRE_DATE), 2004, 1, NULL)) AS "2004년"
    --DECODE를 사용해 200X년이면 카운트 1증가
FROM EMPLOYEE;

--=========================JOIN=========================
/*
    JOIN
    두개 이상의 테이블에서 데이터를 조회하고자 할 때 사용되는 구문
    조회 결과는 하나의 결과(RESULT SET)를 반환한다.
    
    관계형 데이터베이스에서는 최소한의 데이터를 각각의 테이블에 담고 있다.
    (무작정 다 조회해 오는게 아니라 각 테이블간 연결고리 (외래키)를 통해 데이터를 매칭시켜 조회해야한다.
    JOIN은 크게 '오라클 전용구문" "ANSI 구문"
    
    ANSI는 모든 SQL에서 사용
    오라클 전용 구문은 알고 있으면 좋음, 단 필수는 아님

*/
--전체 사원들의 사번, 사원명, 부서코드, 부서명
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--연결할 두 컬럼명이 다를 때
--JOIN ON
SELECT 
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--연결한 두 컬럼명이 같을 때
--JOIN USING
SELECT
    EMP_ID,
    EMP_NAME,
    E.JOB_CODE,
    JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
--혹은
SELECT
    EMP_ID,
    EMP_NAME,
    JOB_CODE,
    JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

--오라클 전용 구문
--FROM절에 조회하고자하는 테이블을 나열(,로 구분)
--WHERE절에 매칭시킬 컬럼에 대한 조건을 제시

--1. 연결할 두 컬럼명이 다를 때
--전체 사원들의 사번, 사원명, 부서코드, 부서명
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;
--위 코드는 ANSI로 했을 때 아래와 같다
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--2. 연결할 두 컬럼명이 동일할 때
--전체 사원들의 사번, 사원명, 직급코드, 직급명
SELECT 
    EMP_ID, 
    EMP_NAME, 
    E.JOB_CODE, 
    J.JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;
--위 코드는 ANSI로 했을 때 아래와 같다
SELECT
    EMP_ID,
    EMP_NAME,
    E.JOB_CODE,
    J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE);

SELECT
    EMP_ID,
    EMP_NAME,
    JOB_CODE,
    JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

--추가적인 조건제시
--직급이 대리인 사원의 사번, 사원명, 직급명, 급여 조회
SELECT
    EMP_ID,
    EMP_NAME,
    JOB_NAME,
    SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '대리';

--오라클
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '대리';

--===================================실습===================================
--1. 부서가 인사관리부인 사원들의 사번, 이름, 보너스 조회
SELECT
    EMP_ID,
    EMP_NAME,
    BONUS
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '인사관리부';

--2. DEPARTMENT와 LOCATION 테이블을 참고하여
--전체부서의 부서코드, 부서명, 지역코드, 지역명 조회
SELECT
    DEPT_ID,
    DEPT_TITLE,
    LOCAL_CODE,
    LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);


--3. 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명 조회
SELECT
    EMP_ID,
    EMP_NAME,
    BONUS,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;


--4. 부서가 총무부가 아닌 사원들의 사원명, 급여 조회
SELECT
    EMP_NAME,
    SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '총무부';


--===========================================================================
/*
    2. 포괄조인 / 외부조인(OUTER JOIN)
    두 테이블간의 JOIN시 일치하지 않는 행도 포함시켜 조회 가능
    단, 반드시 LEFT/RIGHT를 지정해야된다.(어떤 테이블이 기준이다.)  
*/

--외부조인과 비교할만한 내부조인
--사원명, 부서명, 급여, 연봉
--부서배치를 받지않은 2명의 사원정보는 누락됨

--1) LEFT[OUTRE] JOIN : 두 테이블 중 왼편에 기술된 테이블을 기준으로 JOIN
--ANSI
SELECT
    EMP_NAME,
    DEPT_TITLE,
    SALARY,
    SALARY * 12
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--오라클
SELECT
    EMP_NAME,
    DEPT_TITLE,
    SALARY,
    SALARY*12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

--2) RIGHT [OUTER] JOIN : 두 테이블 중 오른편에 기술된 테이블들을 기준으로 JOIN
--ANSI
SELECT
    EMP_NAME
    DEPT_TITLE,
    SALARY,
    SALARY * 12
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);
--오라클
SELECT
    EMP_NAME,
    DEPT_TITLE,
    SALARY,
    SALARY * 12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

--FULL [OUTER] JOIN : 두 테이블이 가진 모든 행을 조회할 수 있다.
--ANSI에만 있음.(오라클은 없음)
SELECT
    EMP_NAME
    DEPT_TITLE,
    SALARY,
    SALARY * 12
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

------------------------------------------------------------------------------
/*
    3. 등가조인(NON EQUAL JOIN)
    매칭시킬 컬럼에 대한 조건 작성시 '='를 사용하지 않는 조인문
    ANSI구문사용 시 JOIN ON만 가능
*/

--사원명, 급여, 급여레벨 조회
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY >= MIN_SAL AND SALARY <= MAX_SAL);

--오라클
SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE, SAL_GRADE
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL; 
------------------------------------------------------------------------------
/*
    4.자체 조인
    같은 테이블을 다시한번 조인하는 경우
*/

-- 전체 사원의 사번, 사원명, 사원부서코드 --> EMPLOYEE E
--사원의   사번, 사원명, 사원부서코드 --> EMPLOYEE M
--ANSI
SELECT E.EMP_ID, E.EMP_NAME, E.DEPT_CODE,
       M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON(E.MANAGER_ID = M.EMP_ID);


--오라클
SELECT E.EMP_ID, E.EMP_NAME, E.DEPT_CODE,
       M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

------------------------------------------------------------------------------
/*
    <다중조인>
    2개 이상의 테일블 가지고 JOIN할 수 있다.
*/
--사번, 사원명, 부서명, 직급명
--ANSI
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_TITLE,
    JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE);

--오라클
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE E.DEPT_CODE = DEPT_ID AND E.JOB_CODE = J.JOB_CODE;

--사번, 사원명, 부서명, 지역명
--ANSI
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);

--===================================실습===================================
--1. 사번, 사원명, 부서명, 지역명, 국가명 조회
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_TITLE,
    LOCAL_NAME,
    NATIONAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING(NATIONAL_CODE);

--2. 사번, 사원명, 부서명, 직급명, 국가명, 급여등급 조회
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_TITLE,
    JOB_NAME,
    NATIONAL_NAME,
    SAL_LEVEL
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING(NATIONAL_CODE)
JOIN SAL_GRADE ON(SALARY BETWEEN MIN_SAL AND MAX_SAL);

--======================================================================
--24/08/09
/*
    <JOIN>
    두개 이상의 테이블에서 데이터를 조회하고자 할 때 사용되는 구문 
    조회 결과는 하ㅏ의 결과(RESULT SET)를 반환한다.
    
    관계형 데이터베이스에서는 최소한의 데이터를 각각의 테이블에 담고 있 다.
    (무작정 다 조회해 오는게 아니라 각 테이블간 연결 (외래키)를 통해 데이터를 매칭시켜 조회해야한다.)
    
    JOIN은 크게 오라클 전용구문과 ANSI 구문으로 사용(오라클 전용 구문은 오라클SQL에서만 사용가능)
    [용어정리]
    
            오라클 전용 구문              |              ANSI 구문
    ---------------------------------------------------------------------------
                등가조인                 |               내부조인
              (EQUAL JOIN)              |    (INNER JOIN) -> JOIN USING/ON
    ---------------------------------------------------------------------------
                등가조인                 |               외부조인
              LEFT, RIGHT               |          LEFT, RIGHT, FULL
    ---------------------------------------------------------------------------
                자체조인                 |               JOIN ON
               비증가 조인               |               
*/

--1. 연결할 두 컬럼명이 다른 경우(EMPLOYEE : DEPT_CODE / DEPARTMENT : DEPT_ID)
--JOIN ON
--전체 사원들의 사번, 사원명, 부서코드, 부서명
SELECT
    EMP_ID AS 사번,
    EMP_NAME AS 사원명,
    DEPT_CODE AS 부서코드,
    DEPT_TITLE AS 부서명
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--2. 연결할 두 컬럼명이 동일한 경우
--전체 사원들의 사번, 사원명, 직급코드, 직급명
SELECT
    EMP_ID AS 사번,
    EMP_NAME AS 사원명,
    JOB_CODE AS 직급코드,
    JOB_NAME AS 직급명
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

SELECT
    E.EMP_ID AS 사번,
    E.EMP_NAME AS 사원명,
    E.JOB_CODE AS 직급코드,
    J.JOB_NAME AS 직급명
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-->오라클 전용구문
--FROM절에 조회하고자하는 테이블들 나열(,로구분)
--WHERE절에 매칭시킬 컬럼에 대한 조건을 제시

--1. 연결할 두 컬럼명이 다른 경우(EMPLOYEE : DEPT_CODE / DEPARTMENT : DEPT_ID)
--전체 사원들의 사번, 사원명, 부서코드, 부서명
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;
--아래의 JOIN ON과 같다
SELECT
    EMP_ID AS 사번,
    EMP_NAME AS 사원명,
    DEPT_CODE AS 부서코드,
    DEPT_TITLE AS 부서명
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

--2. 연결할 두 컬럼명이 동일한 경우
--전체 사원들의 사번, 사원명, 직급코드, 직급명
SELECT
    E.EMP_ID,
    E.EMP_NAME,
    E.JOB_CODE,
    J.JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

--추가적인 조건제시
--직급이 대리인 사원의 사번, 사원명, 직급명, 급여 조회
SELECT
    EMP_ID AS 사번,
    EMP_NAME AS 사원명,
    JOB_NAME AS 직급명,
    SALARY AS 급여
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리';

--오라클
SELECT
    EMP_ID AS 사번,
    EMP_NAME AS 사원명,
    JOB_NAME AS 직급명,
    SALARY AS 급여
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '대리';

--===================================실습===================================
--1. 부서가 인사관리부인 사원들의 사번, 이름, 보너스 조회
SELECT
    EMP_ID,
    EMP_NAME,
    SALARY
    --DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '인사관리부';

--2. DEPARTMENT와 LOCATION 테이블을 참고하여
--전체부서의 부서코드, 부서명, 지역코드, 지역명 조회
SELECT
    DEPT_ID,
    DEPT_TITLE,
    LOCAL_CODE,
    LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

--3. 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명 조회
SELECT
    EMP_ID,
    EMP_NAME,
    BONUS,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;

--4. 부서가 총무부가 아닌 사원들의 사원명, 급여 조회
SELECT
    EMP_NAME,
    SALARY
    --DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '총무부';

--=============================================================================
SELECT EMP_ID, EMP_NAME, SALARY          -- 3   탐색순서
FROM EMPLOYEE                            -- 1
WHERE DEPT_CODE IS NULL; --IS NOT NULL;  -- 2

--NULL을 비교할 때는 IS NULL, IS NOT NULL

/*
    <ORDER BY절>
    SELECT로 가장 마지막 줄에 작성, 실행순서, 또한 가장 마지막에 실행한다.
    
    [표현법]
    SELECT 조회할 컬럼...
    FROM 조회할 테이블
    WHERE 조건식 <- 필수가 아니라 없을 수 있음
    ORDER BY 정렬기준될 컬럼 | 별칭 | 컬럼순번 [ASC | DESC] [NULLS FIRST | NULLS LAST]
    
    -ASC : 오름차순(작은 값으로 시작해서 값이 점점 커지는 것)
    -DESC : 내림차순(큰 값으로 시작해서
    *ASC와 DESC는 생략 가능 (기본적으로 ASC이다.)

    -NULL은 기본적으로 가장 큰 값으로 분류해서 정렬한다.
    -NULLS FIRST : 정렬하고자 하는 컬럼값에 NULL이 있을 경우 해당 데이터 맨 앞에 배치(DESC일 때 기본 값)
    -NULLS LAST : 정렬하고자 하는 컬럼값에 NULL이 있을 경우 해당 데이터 맨 마지막에 배치(ASC일 때 기본 값)
*/

SELECT *
FROM EMPLOYEE
--ORDER BY BONUS
--ORDER BY BONUS ASC
--ORDER BY BONUS ASC NULLS FIRST
--ORDER BY BONUS DESC
ORDER BY BONUS DESC, SALARY ASC;

--=========================<단일행 함수>====================================

/*
    <문자처리함수>

    *LENGTH(컬럼 | '문자열') : 해당 문자열의 글자수를 반환
    *LENGTHB(컬럼 | '문자열') : 해당 문자열의 바이트 수를 반환
    
    '최' '나' 'ㄱ' 한글은 글자당 3BYTE
    영문자, 숫자, 특수문자 글자당 1BYTE
*/

SELECT
    LENGTH('오라클'), LENGTHB('오라클')
    --한글은 1글자당 3바이트
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME)
FROM EMPLOYEE;

/*
    *INSTR
    문자열로부터 특정 문자의 시작위치를 찾아서 반환
    
    
    INSTR(컬럼 | '문자열', '찾고자하는 문자', ['찾을 위치의 시작값, 순번'))-> 결과는 NUMBER
*/
SELECT INSTR('AABAACAABBBAA', 'B')FROM DUAL;
SELECT INSTR('AABAACAABBBAA', 'B', 1)FROM DUAL;
SELECT INSTR('AABAACAABBBAA', 'B',-1)FROM DUAL;
SELECT INSTR('AABAACAABBBAA', 'B', 1, 2)FROM DUAL;
SELECT INSTR('AABAACAABBBAA', 'B', 1, 3)FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_',1,1), INSTR(EMAIL,'@')
FROM EMPLOYEE;
------------------------------------------------------------------------
/*
    *SUBSTR
    문자열에서 특정 문자열을 추출해서 반환
    
    [표현법]
    SUBSTR(STRING, POSTION, [LENGTH])
    -STIRNG : 문자타입 컬럼 | '문자열'
    -POSITION : 문자열 추출할 시작위치 값
    -LENGTH : 추출할 문자 갯수(생략하면 끝까지)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL; --7번째부터 끝까지
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL; --5번째부터 2개
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;--SHOWME
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL; --왼쪽으로 가되, 문자 갯수는 오른쪽으로

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "성별"
FROM EMPLOYEE;

--사원들 중 여사원들만 사원명, 주민등록번호 조회
SELECT
    EMP_NAME,
    EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) = '2' OR SUBSTR(EMP_NO,8,1) ='4'
ORDER BY EMP_NAME;


--==============================================================================
/*
    *서브쿼리
    -하나의 SQL문 안에 포함된 또 다른 SELECT문
    -메인 SQL문을 위해 보조 역할을 하는 쿼리
    (쉽게 말해 쿼리안 조건문(WHERE,HAVING)에 쿼리를 넣는 것이다.
*/

--노옹철 사원과 같은 부서에 속한 사원들 조회
SELECT
    EMP_NAME,
    DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND EMP_NAME != '노옹철';

--노옹철사원은 어떤 부서일까?
SELECT
    EMP_NAME,
    DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철';

--위에 두 쿼리를 하나의 쿼리로 변경하자
SELECT
    EMP_NAME,
    DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                  FROM EMPLOYEE
                  WHERE EMP_NAME = '노옹철');

--서브 쿼리 예시2)
--전 직원의 평균 급여보다 더 많은 급여를 받는 사원들의 사번, 이름, 직급코드
--1) 전직원의 평균 급여
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE;
SELECT
    EMP_ID,
    EMP_NAME,
    JOB_CODE
    FROM EMPLOYEE;
--2)3047663 보다 급여가 많은 사람들의 급여
SELECT 
    EMP_NAME,
    SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT ROUND(AVG(SALARY)) FROM EMPLOYEE)
ORDER BY SALARY DESC;

/*
    *서브쿼리의 구분
    서브쿼리를 수행한 결과값이 몇행 몇열로 나오느냐에 따라서 분류
    
    --단일행 서브쿼리 : 서브쿼리의 조회 결과값이 오로지 1개일 때
    --다중행 서브쿼리 : 서브쿼리의 조회 결과값이 여러행 때 (여러행 한열)
    --다중열 서브쿼리 : 서브쿼리의 조회 결과값이 한행이지만 컬럼이 여러개 일 때
    --다중행 다중열 서브쿼리 : 서브쿼리의 조회 결과값이 여러행 여러 컬럼일 때
    
    >> 서브쿼리의 결과값에 따라서 서브쿼리 앞쪽에 연산자가 달라진다
*/

/*
    1. 단일행 서브쿼리
    서브쿼리의 조회 결과값이 오로지 1개일 때 (한행 한열)
    일반 비교연산자 사용 가능
    = != > <= ...
*/
--1. 전 직원의 평균 급여보다 급여를 더 적게받는 사원들의 사원명, 직급코드, 급여 조회
SELECT
    EMP_NAME,
    JOB_CODE,
    SALARY
FROM EMPLOYEE
WHERE SALARY <= (SELECT AVG(SALARY) FROM EMPLOYEE);

--2. 최저급여를 받는 사원의 사번, 이름, 급여, 입사일 조회
SELECT
    EMP_ID,
    EMP_NAME,
    SALARY,
    HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);
    
--3. 노옹철 사원의 급여보다 많이 받는 사원들의 사번, 이름, 부서코드 ,급여 조회
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

--4. 노옹철 사원의 급여보다 적게 받는 사원들의 사번, 이름 부서명, 급여 조회
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_TITLE,
    SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
WHERE SALARY < (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

--5. 부서별 급여합이 가장 큰 부서의 부서코드, 급여합 ★★★
--1) 부서별 급여합이 가장 큰 부서
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--2) 급여합이 17700000원인 부서코드, 급여합
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

--3) 두 쿼리를 하나로 합하기
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                     FROM EMPLOYEE
                     GROUP BY DEPT_CODE);

--6. '전지연'사원과 같은 부서의 사람들의 사번, 사원명, 전화번호, 입사일, 부서명 조회
-- 단 전지연 사원 제외
SELECT
    EMP_ID,
    EMP_NAME,
    PHONE,
    HIRE_DATE,
    DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '전지연')
AND EMP_NAME != '전지연';

------------------------------------------------------------------------------
/*
    2. 다중행 서브쿼리
    서브쿼리를 수행한 결과값이 여러행일 때 (컬럼은 한개)
    IN(서브쿼리) : 여러개의 결과값 중에서 한개라도 클 경우 조회
    > ANY(서브쿼리) : 여러개의 결과값 중에서 한개라도 클 경우 조회
    < ANY(서브쿼리) : 여러개의 결과값 중에서 한개라도 작을 경우 조회
        비교대상 > ANY (서브쿼리의 결과값 ->값1, 값2, 값3...)
        
    > ALL(서브쿼리) : 여러개의 모든 결과값들 보다 클 경우 조회
    < ALL(서브쿼리) : 여러개의 모든 결과값들 보다 작을 경우 조회
*/

--1) 유재식 또는 윤은해 사원과 같은 직급인 사원들의 사번, 사원명, 직급코드, 급여 조회
--1-1) 유재식 또는 윤은해 사원의 직급
SELECT
    JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME IN('유재식','윤은해');

--1-2)직급이 J3, J7인 사원들의 사번, 사원명, 직급코드, 급여 조회
SELECT
    EMP_ID,
    EMP_NAME,
    JOB_CODE,
    SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J3','J7');

--두 쿼리를 하나로 합하기
SELECT EMP_ID,
    EMP_NAME,
    JOB_CODE,
    SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN(SELECT JOB_CODE FROM EMPLOYEE 
                  WHERE EMP_NAME IN('유재식','윤은해'))
AND EMP_NAME != '유재식' AND EMP_NAME != '윤은해';

--2. 대리직급임에도 과장 직급 급여들 중 최소 급여보다 많이 받는 
--   사원들의 사번, 사원명, 직급명, 급여 조회
--두 쿼리를 합치기
SELECT
    EMP_ID,
    EMP_NAME,
    JOB_NAME,
    SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '대리' AND SALARY > ANY
(SELECT SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)WHERE JOB_NAME = '과장');

-------------------------------------------------------------------------------
/*
    3. 다중열 서브쿼리
    결과값은 한 행이지만 나열된 컬럼수가 여러개일 경우
*/

--1) 하이유 사원과 같은 부서코드, 같은 직급코드에 해당하는 사원들 조회
--(사원명, 부서코드, 직급코드, 입사일)
-->단일행 서브쿼리


--서브쿼리 못다한 정리할 것












-------------------------------------------------------------------------------
/*
   <DML>
   데이터 조작 언어
   테이블 값을 삽입(INSERT), 수정(ALTER), 삭제(DELETE) 하는 구문
*/

/*
    1. INSERT
    테이블에 새로운 행을 추가하는 구문
    
    [표현식]
    1) INSERT INTO 테이블명 VALUES(값, 값, 값,...)
    테이블의 모든 컬럼에 대한 값을 직접 제시해서 한 행을 ISNERT하고자 할 때
    컬럼의 순번을 지켜서 VALUES에 값을 나열해야 한다.
    
    부족하게 값을 제시할 경우, 값을 더 많이 제시한 경우 -> 에러 발생
*/

SELECT * FROM EMPLOYEE;

INSERT INTO EMPLOYEE
VALUES(900,'이소근', '880914-1456789','SG8809@NAVER.COM','01078945656','D7',
       'J5',4000000,0.2,200,SYSDATE, NULL,'N');

/*
    2) INSERT INTO 테이블명(컬럼,컬럼,컬럼...)VALUES(값, 값, 값,...)
    테이블에 내가 선택한 컬럼에 대한 값만 INSERT할 때 사용
    그래도 한 행 단위로 추가 되기 때문에 선택 안된 컬럼은 기본적으로 NULL이 들어간다.
    -> NOT NULL 제약조건이 걸려있는 컬럼은 반드시 직접값을 넣어줘야 한다.
    단, 기본값이 지정되어 있으면 NULL이 아닌 기본값이 들어간다.
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, HIRE_DATE)
VALUES(901, '전제민', '440701-1234567', 'J7', SYSDATE);
SELECT * FROM EMPLOYEE;

INSERT
INTO EMPLOYEE(
            EMP_ID,
            EMP_NAME,
            EMP_NO,
            JOB_CODE,
            HIRE_DATE
            )
        VALUES(
              902, 
              '민소라', 
              '440811-1234567',
              'J7',
              SYSDATE
              );

/*
    3) INSERT INTO 테이블명 (서브쿼리);
    VALUES에 직접 값을 명시하는 것 대신 서브쿼리로 조회된 값을 통째로 INSERT 가능
*/

CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_TITLE VARCHAR2(20)
);

SELECT * FROM EMP_01;

INSERT INTO EMP_01(SELECT EMP_ID, EMP_NAME, DEPT_TITLE
                   FROM EMPLOYEE
                   LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID));
                   
-------------------------------------------------------------------------------
/*
    2. INSERT ALL
    두개 이상의 테이블에 각각 INSERT할 때
    이때 사용되는 서브쿼리가 동일한 경우
*/

CREATE TABLE EMP_DEPT
AS(SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM EMPLOYEE
    WHERE 1 = 0
    );
    
CREATE TABLE EMP_MANAGER
AS(SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE 1=0);
    
--부서코드가 D1인 사원들의 사번, 이름, 부서코드, 입사일 ,사수사번을 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

/*
    [표현식]
    INSERT ALL
    INTO 테이블명1 VALUES [컬럼,컬럼,...]
    INTO 테이블명2 VALUES [컬럼,컬럼,...]
    서브쿼리;
*/

INSERT ALL
    INTO EMP_DEPT VALUES (EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
    INTO EMP_MANAGER VALUES (EMP_ID, EMP_NAME, MANAGER_ID)
    (SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D1');

SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

-------------------------------------------------------------------------------

/*
    3. UPDATE
    테이블에 기록되어있는 기존의 데이터를 수정하는 구문
    
    [표현식]
    UPDATE 테이블명
    SET 컬럼 = '값'
        컬럼 = '값'
        ...
    (WHERE 조건) -> 생략 시 전체 모든 행의 데이터가 변경
    
    *업데이트시에도 제약조건 잘 확인해야한다.
*/

CREATE TABLE DEPT_TABLE
    AS(SELECT * FROM DEPARTMENT);
    
    SELECT * FROM DEPT_TABLE;

--D9 부서의 부서명을 '전략기획팀'으로 변경
UPDATE DEPT_TABLE
SET DEPT_TITLE ='전략기획팀'
WHERE DEPT_ID = 'D9';

SELECT * FROM DEPT_TABLE;

CREATE TABLE EMP_SALARY
AS (SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE);

--EMP_SALARY 테이블에서
--노옹철 사원의 급여를 100만원으로 변경
UPDATE EMP_SALARY
SET SALARY = 1000000
WHERE EMP_NAME = '노옹철';

--선동일 사원의 급여를 700만원, 보너스를 0.2로 변경
UPDATE EMP_SALARY
    SET SALARY = 700000,
        BONUS = 0.2
WHERE EMP_NAME = '선동일';

SELECT * FROM EMP_SALARY;

--전체 사원의 급여를 기존 급여에 10프로 연상된 금액으로 변경

UPDATE EMP_SALARY
    SET SALARY = SALARY * 1.1 
    --10프로를 더하므로 기존SALARY에 0.1을 곱한 SALARY *0.1을 더하거나 1.1을 곱함
    ;

/*
    UPDATE에서 서브쿼리 사용
    
    UPDATE 테이블명
    SET 컬럼명 = (서브쿼리)
    WHERE 조건
*/
    
--방명수 사원의 급여와 보너스 값을 유재식 사원의 급여와 보너스 값으로 변경
UPDATE EMP_SALARY
    SET SALARY = (SELECT SALARY
                  FROM EMPLOYEE
                  WHERE EMP_NAME = '유재식'),
        BONUS   =(SELECT BONUS
                  FROM EMPLOYEE
                  WHERE EMP_NAME = '유재식')
WHERE EMP_NAME ='방명수';

--ASIA지역에서 근무하는 사원들의 보너스값을 0.3으로 변경
-- UPDATE를 하기 위한 조건문을 먼저 작성후 UPDATE WHERE 조건에 넣기

SELECT EMP_ID, EMP_NAME
FROM EMP_SALARY
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE LOCAL_NAME LIKE 'ASIA%';

--위에서 구한 사원들의 보너스값을 0.3으로 변경
UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE EMP_ID IN(SELECT EMP_ID
                FROM EMP_SALARY
                JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                WHERE LOCAL_NAME LIKE 'ASIA%');
COMMIT;

/*
    4. DELETE
    테이블에 기록된 데이터를 삭제하는 구문(한 행 단위로 삭제가 된다.)
    
    [표현식]
    DELETE FROM 테이블명
    [WHERE 조건] -> WHERE절 제시안하면 전체행 다 삭제 됨
*/

DELETE FROM EMOLYEE;

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_NAME ='이소근';


































































