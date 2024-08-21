--1. 70년대 생(1970~1979) 중 여자이면서 전씨인 사원의 이름과 주민번호, 부서 명, 직급 조회
SELECT 
    EMP_NAME, 
    EMP_NO, 
    DEPT_TITLE, 
    JOB_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
WHERE 
    SUBSTR(EMP_NO,8,1) IN ('2','4') 
    AND SUBSTR(EMP_NO,1,2) BETWEEN '70' AND '79'
    AND EMP_NAME LIKE '전%';

--2. 나이 상 가장 막내의 사원 코드, 사원 명, 나이, 부서 명, 직급 명 조회
--서브 쿼리를 사용해서 풀수있음
SELECT 
  --TO_DATE(SUBSTR(EMP_NO,1,2),'RR')
    EMP_ID,
    EMP_NAME,
    (EXTRACT(YEAR FROM SYSDATE) -
    EXTRACT(YEAR FROM(TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))+1)) AS "나이",
    /*CASE
        WHEN SUBSTR(EMP_NO, 1, 2) >= '50' THEN 1900 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
        ELSE 2000 + TO_NUMBER(SUBSTR(EMP_NO, 1, 2))
    END) AS "나이"*/
    DEPT_TITLE,
    JOB_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
GROUP BY EMP_ID,EMP_NAME,DEPT_TITLE,JOB_NAME;

--3. 이름에 ‘형’이 들어가는 사원의 사원 코드, 사원 명, 직급 조회  
SELECT 
    EMP_ID,
    EMP_NAME,
    JOB_NAME
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_CODE)
WHERE EMP_NAME LIKE '%형%';

--4. 부서코드가 D5이거나 D6인 사원의 사원 명, 직급 명, 부서 코드, 부서 명 조회
SELECT 
    EMP_NAME,
    JOB_NAME,
    DEPT_CODE,
    DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
WHERE DEPT_CODE IN ('D5','D6');

--5. 보너스를 받는 사원의 사원 명, 부서 명, 지역 명 조회
SELECT
    EMP_NAME,
    DEPT_TITLE,
    LOCAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
WHERE BONUS IS NOT NULL;

--6. 사원 명, 직급 명, 부서 명, 지역 명 조회
SELECT
    EMP_NAME,
    JOB_NAME,
    DEPT_TITLE,
    LOCAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE);

--7. 한국이나 일본에서 근무 중인 사원의 사원 명, 부서 명, 지역 명, 국가 명 조회
SELECT
    EMP_NAME,
    DEPT_TITLE,
    LOCAL_NAME,
    NATIONAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
JOIN LOCATION ON(LOCATION_ID = LOCAL_CODE)
JOIN NATIONAL USING(NATIONAL_CODE)
WHERE NATIONAL_NAME IN ('한국','일본');

--8. 한명의 사원과 같은 부서에서 일하는 사원의 이름 조회(자체조인 활용)
SELECT
    E.DEPT_CODE,
    E.EMP_NAME,
    M.EMP_NAME 
FROM EMPLOYEE E
JOIN EMPLOYEE M ON (E.DEPT_CODE = M.DEPT_CODE)
WHERE E.EMP_ID != M.EMP_ID
ORDER BY E.EMP_ID;

--9. 보너스가 없고 직급 코드가 J4이거나 J7인 사원의 이름, 직급 명, 급여 조회(NVL 이용)
SELECT
    EMP_NAME,
    JOB_NAME,
    SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_CODE)
WHERE JOB_CODE IN ('J4','J7') AND NVL(BONUS,0) = 0;

--10. 부서 명과 부서 별 급여 합계 조회
SELECT
    DEPT_TITLE,
    SUM(SALARY)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE;