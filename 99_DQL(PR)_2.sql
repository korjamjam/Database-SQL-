--===========================================================================================
/*
    <함수>
    전달된 컬럼값을 받아서 함수를 실행한 결과를 반환
    
    -단일행 함수 : N개의 값을 읽어들여서 N개의 결과값을 리턴(매행마다 함수실행 결과를 반환)
    -그룹 함수 : N개의 값을 읽어들여서 1개의 결과값을 리턴 (그룹을 지어서 그룹별로 함수실행 결과를 반환)
    
     >> SELECT 절에 단일행함수랑 그룹함수를 함께 사용하지 못함
     -> 결과 행의 갯수가 다르기 때문
     
     >> 함수를 사용할 수 있는 위치 : SELECT절 WHERE절 ORDER BY절 HAVING절
*/

--=========================<단일행 함수>====================================
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
    문자열로부터 특장 문자의 시작위치를 찾아서 반환
    
    INSTR(컬럼 | '문자열', '찾고자하는 문자', ['찾을 위치의 시작값, 순번']) -> 결과는 NUMBER
*/
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; --앞쪽에 있는 첫 B는 3번째 위치해 있다.
--찾을 위치 시작값 : 1, 순번 1 => 기본값
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 뒤에서부터 찾고 위치를 읽을 때는 앞에서부터 읽어준다.
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- 순번을 제시하려면 위치의 시작값을 표시해야한다.
SELECT INSTR('AABAACAABBAA', 'B', 1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_',1,1), INSTR(EMAIL, '@')
FROM EMPLOYEE;

------------------------------------------------------------------------

/*
    *SUBSTR
    문자열에서 특정 문자열을 추출해서 반환
    
    [표현법]
    SUBSTR(STRING, POSITION, [LENGTH])
    - STRING : 문자타입 컬럼 | '문자열'
    - POSITION : 문자열 추출할 시작위치 값
    - LENTH : 추출할 문자 갯수(생략하면 끝까지)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL; -- 7번째 위치부터 끝까지 추출
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;--SHOWME
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "성별"
FROM EMPLOYEE;

--사원들중 여사원들만 EMP_NAME, EMP_NO 조회
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) ='4'
ORDER BY EMP_NAME;

--함수 중첩사용 가능
--이메일의 아이디부분 추출
--사원목록에서 사원명, 이메일, 아이디 조회
SELECT
    EMP_NAME,
    EMAIL,
    SUBSTR(EMAIL,1, INSTR(EMAIL,'@')-1)
FROM EMPLOYEE;

/*
    *LPAD / RPAD
    문자열을 조회할 때 통일감 있게 조회하고자 할 때 사용
    
    [표현법]
    LPAD/RPAD(STRING, 최종적으로 반환할 문자열의 길이, [덧붙이고자하는 문자])
    
    문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 붙여서 최종 N길이만큼 문자열을 반환
    
    문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 붙여서 최종 N길이만큼 문자열을 반환
*/
--20만큼의 길이 중 EMAIL컬럼값은 오른쪽으로 정렬하고 나머지 부분은 공백으로 채운다.

SELECT EMP_NAME, LPAD(EMAIL,20)
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

--사원들의 사원명, 주민등록번호 조회("701011-1XXXXXX")
SELECT
    EMP_NAME, SUBSTR(EMP_NO,1,8) || 'XXXXXX'
--SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14 ,'X')
FROM EMPLOYEE;

/*
    *LSTRIM/RTRIM
    문자열에서 특정 문자를 제거한 나머지를 반환
    LTRIM/RTRIM(STRING, [제거하고자하는 문자들])
    
    문자열의 왼쪽 혹은 오른쪽에서 제거하고자하는 문자들을 찾아서 제거한 나머지 문자열 반환
    *'문자'들이다. 문자열이 아니다.
*/
SELECT RTRIM('     K     H     ')FROM DUAL;
SELECT LTRIM('ACBABCAABCKKH', 'A')FROM DUAL;
SELECT LTRIM('ACBABCAABCKKH', 'ABC')FROM DUAL;
SELECT LTRIM('5135432KH543542', '0123456789')FROM DUAL;

/*
    *TRIM
    문자열의 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 나머지 문자열 반환
    TRIM([LEADING] | TRAILING | BOTH] 제거하고자하는 문자열 FROM 테이블명)
*/
SELECT TRIM('     K     H     ') FROM DUAL; --양쪽에 있는 공백 제거
SELECT TRIM('Z' FROM 'ZZZZKHZZABCZZZZZZ') FROM DUAL; --양쪽에 있는 Z제거

SELECT TRIM(LEADING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; --LTRIM
SELECT TRIM(TRAILING 'Z' FROM 'ZZZZKHZZZZZZZZ') FROM DUAL; --RTRIM

/*
    *LOWER / UPPER / INITCAP
    LOWER : 문자열을 소문자로 변경후 문자열 반환
    UPPER : 문자열을 대문자로 변경후 문자열 반환
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
SELECT CONCAT('가나다', 'ABC') FROM DUAL;
SELECT '가나다' || 'ABC' FROM DUAL;

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
SELECT MOD(10.9 ,3) FROM DUAL;

/*
    *ROUND
    반올림한 결과를 반환
    ROUND(NUMBER, [위치])
*/

SELECT ROUND(123.456) FROM DUAL; --기본자수는 소수점 첫번쨰 자리에서 반올림
SELECT ROUND(123.456, 1) FROM DUAL; -- 양수로 증가할수록 소수점 뒤로 한칸씩 이동(,1)
SELECT ROUND(123.456, -1) FROM DUAL; -- 음수로 감소할수록 소수점 앞자리로 이동

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

----------------------문제----------------------
--검색하고자하는 내용
--JOB CODE가 J7이거나 J6이면서 SALARY값이 200만원 이상이고
--BONUS가 있고 여자인 사원의
--이름, 주민등록번호, 직급코드, 부서코드, 급여, 보너스를 조회하고싶다

SELECT EMP_NAME AS 이름 , EMP_NO AS 주민등록번호 , JOB_CODE AS 직급코드, DEPT_CODE AS 부서코드, SALARY AS 급여, BONUS AS 보너스
FROM EMPLOYEE
WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J7') AND SALARY >= 2000000 AND BONUS IS NOT NULL AND SUBSTR(EMP_NO, 8, 1)= '2';

--=============================================================================

/*
    <날짜 처리 함수>
*/

--SYSDATE : 시스템의 현재 날짜 및 시간을 반환
SELECT SYSDATE FROM DUAL;

--MONTH_BETWEEN : 두 날짜 사이의 개월 수
--사원들의 사원명, 입사일, 근무일 수, 근무개월 수 조회
SELECT EMP_NAME AS 사원명 , HIRE_DATE AS 입사일 , FLOOR(SYSDATE - HIRE_DATE) AS 근무일수,
CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 근무개월수
FROM EMPLOYEE;

--*ADD_MONTHS  : 특정 날짜에 NUMBER개월수를 더해서 반환
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;

--근로자 테이블에서 사원명, 입사일, 입사후 3개월의 날짜를 조회
SELECT
    EMP_NAME,
    HIRE_DATE,
    ADD_MONTHS(HIRE_DATE, 3)
FROM EMPLOYEE;

--*NEXT_DAY(DATE, 요일(문자 | 숫자)) : 특정날짜 이후 가장 가까운 요일의 날짜를 반환
SELECT NEXT_DAY(SYSDATE, '토요일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '토') FROM DUAL;

--1 : 일요일 ~ 7 : 토요일
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;

--현재 SQL 인식언어가 한국어로 되있기 때문에 FRIDAY를 쓰면 오류가 발생
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'금요일')FROM DUAL;

--*LAST_DAY(DATE) : 해당열의 마지막 날짜 구해서 반환
SELECT LAST_DAY(SYSDATE) FROM DUAL;

/*
    EXTRACT : 특정 날짜로부터 년|월|일 값을 추출해서 반환하는 함수
    
    [표현법]
    EXTRACT(YEAR FROM DATE) : 연도만 추출
    EXTRACT(MONTH FROM DATE) : 월만 추출
    EXTRACT(DAY FROM DATE) : 일만 추출
*/

--사원의 사원명, 입사년도, 입사월, 입사일
SELECT EMP_NAME,
EXTRACT(YEAR FROM HIRE_DATE) AS "입사년도",
EXTRACT(MONTH FROM HIRE_DATE) AS "입사월",
EXTRACT(DAY FROM HIRE_DATE) AS "입사일"
FROM EMPLOYEE
ORDER BY 2,3,4;

/*
    [형변환 함수]
    *TO_CHAR : 숫자타입 또는 날짜 타입의 값을 문자타입으로 변환시켜주는 함수
    
    [표현법]
    TO_CHAR(숫자 | 문자, [포멧])
*/

-- 숫자 -> 문자
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(12, '99999') FROM DUAL;
SELECT TO_CHAR(12,'00000') FROM DUAL;
SELECT TO_CHAR(2000000, 'L99999') FROM DUAL;

SELECT TO_CHAR(3500000,'L9,999,999') FROM DUAL;

--날짜타입 -> 문자타입
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS')FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')FROM DUAL; -- AM, PM어떤것을 사용하건 형식을 정해주는 것이기에 동일하게 나타남.
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS')FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY')FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY')FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" HH:MI:SS')FROM DUAL;

--사원들의 이름, 입사날짜(0000년 00월 00일) 조회
SELECT EMP_NAME AS 이름, TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일"') AS 입사날짜
FROM EMPLOYEE;

--년도와 관련된 포멧
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'YY'),
     --TO_CHAR(SYSDATE, 'RRRR'), --RR룰이 따로 존재한다. -> 50년 이상값이 들어오면 +100 EX) 1954 -> 2054
       TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;

SELECT HIRE_DATE, TO_CHAR(HIRE_DATE, 'YYYY'), TO_CHAR(HIRE_DATE, 'RRRR')
FROM EMPLOYEE;

--월과 관련된 포멧
SELECT TO_CHAR(SYSDATE, 'MM'),
       TO_CHAR(SYSDATE, 'MON'),
       TO_CHAR(SYSDATE, 'MONTH')
FROM DUAL;

--일에 관련된 포멧
SELECT TO_CHAR(SYSDATE, 'DDD'), -- 오늘이 이번년도에 몇번째 일수
       TO_CHAR(SYSDATE, 'DD'), -- 오늘 일자
       TO_CHAR(SYSDATE, 'D') -- 요일을 숫자로 나타냄 1 : 일요일 ~ 7 : 토요일
FROM DUAL;

--요일을 나타내는 포멧
SELECT TO_CHAR(SYSDATE, 'DAY'),
       TO_CHAR(SYSDATE, 'DY')
FROM DUAL;

/*
    TO_NUMBER : 문자타입의 데이터를 숫자타입으로 변환시켜주는 함수
    
    [표현법]
    TO_NUMBER(문자, [포멧])
*/

SELECT TO_NUMBER('05123456789') FROM DUAL;

SELECT '100000' + '55000' FROM DUAL;
SELECT '100,000' + '55,000' FROM DUAL;
SELECT TO_NUMBER('100,000', '999,999') + TO_NUMBER('55,000', '99,000') FROM DUAL;

--===========================================================================

/* 
    [NULL처리 함수]
    
    [표현법]
*/
--*NVL(컬럼, 해당컬럼이 NULL일 경우 보여줄 값)
SELECT EMP_NAME, NVL(BONUS, 0)
FROM EMPLOYEE;

--전 사원의 이름, 보너스 포함 연봉 조회
SELECT EMP_NAME, NVL((SALARY + (SALARY * BONUS)) * 12, 0)
FROM EMPLOYEE;

--*NVL2(컬럼, 반환값1, 반환값2)
--반환값1 : 해당컬럼이 존재할 경우 보여줄 값
--반환값2 : 해당컬럼이 NULL일 경우 보여줄 값

SELECT EMP_NAME, BONUS, NVL2(BONUS,'O','X')
FROM EMPLOYEE;

--===========================================================================

/*
    1. 등가조인(EQUAL JOIN) / 내부조인(INNER JOIN)
    연결시키는 컬럼의 값이 일치하는 행들만 조회(일치하는 값이 없는 행은 조회 제외)
*/

-----> ANSI구문
--FROM절에 기준이 되는 테이블 하나 기술
--JOIN절에 같이 조인하고자 하는 테이블 기술 + 매칭시킬 컬럼에 대한 조건
--JOIN USING / JOIN ON

--1. 연결할 두 컬럼명이 다른 경우 (EMPLOYEE : DEPT_CODE / DEPARTMENT : DEPT_ID)
--JOIN ON
--전체 사원들의 사번, 사원명, 부서코드, 부서명
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

--2. 연결할 두 컬럼명이 동일한 경우
--전체 사원들의 사번, 사원명, 직급코드, 직급명
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

--USING
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);










































