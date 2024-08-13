/*
    *데이터 정의 언어
    오라클에서 제공하는 객체를 새로 만들고(CREATE)
    구조를 변경하고(ALTER),
    구조자체를 삭제(DELETE)하는 언어
    즉, 실제 데이터값이 아닌 규칙 자체를 정의하는 언어

    오라클에서 객체(구조) : 테이블, 뷰, 시퀀스
                         인덱스, 패키지, 트리거,
                         프로시져, 함수, 동의어, 사용자
                         
    <CREATE>
    객체를 새로 생성하는 구문
*/
/*
    1. 테이블 생성
    - 테이블이란? : 행과 열로 구성되는 가장 기본적인 데이터베이스 객체
                   모든 데이터들은 테이블을 통해 저장됨
                  (DBMS용어 중 하나라 , 데이터를 일종의 '표' 형태로 표현한 것이다)
                  
    [표현식]
    CREATE TABLE 테이블명(
        컬럼명 자료명(크기),
        컬럼명 자료명(크기),
        컬럼명 자료명, --크기 생략 가능
        ...
    )
    
    *자료형
    -문자(CHAR(바이트 크기) | VARCHAR2(바이트크기)) -> 반드시 크기 지정을 해줘야 함.
    CHAR는 고정길이, VARCHAR2 가변길이를 쓸 때 유용하다
    (CHAR는 성별 같이 고정적인 값 {남자, 여자처럼 2개}일 때 많이 사용)
    -숫자(NUMBER)
    -날짜(DATE)
    
    기억하기
    문자 = CHAR , VARCHAR2
    숫자 = NUMBER
    날짜 = DATE
*/

--회원에 대한 데이터를 담기위한 테이블 MEMBER 생성
CREATE TABLE MEMBER(
    MEM_NO NUMBER,
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(20),
    MEW_NAME VARCHAR2(20),
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    MEM_DATE DATE
);

SELECT * FROM MEMBER;

/*
    2. 컬럼에 주석달기(컬럼에 대한 간단한 설명)
    
    [표현법]
    COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
    -> 잘못 작성 시 새로 수정하면 된다.
*/

COMMENT ON COLUMN MEMBER.MEM_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEM_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEM_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.MEM_NAME IS '회원명';
COMMENT ON COLUMN MEMBER.GENDER IS '성별(남/여)';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEM_DATE IS '회원가입일';

--테이블을 삭제하고자 할 때 : DROP TABLE 테이블명;
DROP TABLE MEMBER;

--INSERT INTO 테이블명 VALUES(값, 값, 값, (테이블에 있는 모든 컬럼 값들을 다 써야한다.))
INSERT INTO MEMBER
VALUES (1, 'USER1', 'PASS1', '홍길동','남','010-1111-2222','AAA@AAA.COM','24/08/12');

SELECT * FROM MEMBER;

INSERT INTO MEMBER
VALUES (1, 'USER1', NULL, NULL,'남','010-1111-2222','AAA@AAA.COM',NULL);

/*
   *NOT NULL
   해당 컬럼에 반드시 값이 존재해야만 할 경우(즉, 절대 NULL이 들어오면 안되는 경우)
   삽입/수정시 NULL 값을 허용하지 않도록 제한
   
   제약 조건을 부여하는 방식은 크게 2가지가 있다. (컬럼레벨방식, 테이블레벨방식)
   NOT NULL 제약조건은 무조건 컬럼레벨방식으로만 가능하다.
*/

/*
    *UNIQUE 제약조건
    해당 컬럼에 중복된 값이 들어가서는 안될 경우 사용한다.
    컬럼값에 중복값을 제한하는 제약조건이다.
    삽입/수정시 기존에 있는 데이터값 중 중복값이 있을 경우 오류를 발생시킨다.
*/

/*
    *CHECK(조건식)
    해당 컬럼에 들어올 수 있는 값에 대한 조건을 제시해둘 수 있다.
    해당조건에 만족하는 데이터값만 담길수 잇따.
*/

/*
    *PRIMARY KEY(기본키) 제약조건
    테이블에서 각 행(ROW)을 식별하기위해 사용될 컬럼에 부여하는 제약조건
    
    EX) 회원번호, 학번, 군번, 부서코드, 직급코드, 주민번호, 주문번호, 운송장번호, 예약반호
    PIRMARY KEY -> NOT NULL + UNIQUE
    
    한테이블당 오직 한개만 설정 가능
*/

/*
    *FOREIGN KEY(외래키) 제약조건
    다른 테이블에 존재하는 값만 들어와야되는 특정 컬럼에 부여하는 제약조건
    -> 다른 테이블을 참조한다고 표현
    -> 주로 FORIGN KEY 제약조건으로 인해 테이블간 관계가 형성된다.
    
    >컬럼레벨방식
    컬럼명 자료형 REFERENCES 참조할 테이블명[참조할 컬럼명]
    
    >테이블 레벨 방식
    FOREIGN KEY(컬럼명) REFERENCES 참조할 테이블명[참조할 컬럼명]
    
    -> 참조할 컬럼명 생략시 참조할 테이블의 PRIMARY KEY로 지정된 컬럼이 매칭된다.
*/






















































































































