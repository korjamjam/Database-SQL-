/*
    <SELECT>
    SELECT ����������� ���� FROM ���̺�;
    SELECT (*) �Ǵ� �÷�1, �÷�2, �÷�3...FROM ���̺�;
*/

--��� ����� ��� ������ ������
SELECT * FROM EMPLOYEE;

--��� ����� �̸�, �ֹε�Ϲ�ȣ, �ڵ�����ȣ
SELECT EMP_NAME, EMP_NO, PHONE FROM EMPLOYEE;

---------------�ǽ�---------------
--JOB���̺��� ���޸� ��ȸ
SELECT JOB_NAME FROM JOB;

--DEPARTMENT ���̺��� ��� �÷� ��ȸ
SELECT * FROM DEPARTMENT;

--DEPARTEMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--EMPLOYEE ���̺��� �����, �̸���, ��ȭ��ȣ, �Ի���, �޿� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

--<�÷����� ���� �������>
--SELECT�� �÷��� �ۼ��κп� ��������� �� �� �ִ�.

--EMPLOYEE���̺��� �����, ����� ����(SALARY * 12)�� ��ȸ
SELECT EMP_NAME, SALARY * 12 FROM EMPLOYEE;

--EMPLOYEE���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ����Կ���(�޿� (�޿� * ���ʽ�)) *12)
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + (SALARY * BONUS)) *12
FROM EMPLOYEE;
--������� �����߿� NULL�����Ͱ� ���ԵǾ� �ִٸ� ������ ������� NULL

--EMPLOYEE���̺��� �����, �Ի���, �ٹ��ϼ��� ��ȸ
--����ð� - �Ի��� = �ٹ��ѱⰣ
--DATE -DATE = ����� ������ �Ϸ� ǥ�� ��.
--�ڵ����� ��¥�� ����ð��� ǥ���ϴ� ��� : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;

SELECT SYSDATE FROM DUAL;
-- DUAL : ����Ŭ���� �������ִ� �������� ���̺�

/*
     <�÷��� ��Ī �����ϱ�>
     ��������� �ϰԵǸ� �÷����� ������������. �̶� �÷��� ��Ī�� �ο��ؼ� ����ϰ� ������ �� �ִ�.
     [ǥ����]
     �÷��� ��Ī / �÷��� AS ��Ī / �÷��� "��Ī" / �÷��� AS "��Ī"
*/

SELECT EMP_NAME �����, SALARY AS �޿�, BONUS ���ʽ�,
SALARY * 12 AS ����, (SALARY + (SALARY * BONUS)) *12 AS �Ѽҵ�
FROM EMPLOYEE;

/*
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�('')
    ��ȸ�� ����� ��� �࿡ �ݺ������� ���
*/

--EMPLOYEE���̺��� ���, �����, �޿� 
SELECT EMP_ID, EMP_NAME, SALARY, '��' AS "����"
FROM EMPLOYEE;

/*
    <���Ῥ���� : ||>
    ���� �÷������� ��ġ �ϳ���  �÷�ó�� ������ �� �ִ�.
*/
--���, �̸�, �޿��� �ϳ��� �÷����� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY
FROM EMPLOYEE;

--EMPLOYEE���̺��� ��� ����� ������ ��ȸ�Ѵ�.
--������ ���� ����� �������� ����ض�
-- XX�� ������ XX���Դϴ�.
SELECT EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�.' AS "�޿�"
FROM EMPLOYEE;

/*
    <DISTINCT>
    �ߺ����� - �÷��� ǥ�õ� ������ �ѹ����� ��ȸ�ϰ��� �� �� ���
*/
--EMPLOYEE�� �����ڵ� ��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

--EMPLOYEE�� �μ��ڵ� ��ȸ
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE 
--��ó�� �ۼ��� ������ �߻��Ѵ�. DISTINCT�� �ѹ��� ��� �����ϴ�.
SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE;
--��ó�� ����(JOB_CODE, DEPT_CODE)�� ������ ��� �ߺ��� ������ ���� �����ش�.


/*
   SQL������ ����(�ڹٿ����� \n(���� �ѱ��))�� ����.
   SQL������ �����͸��� ����ϰ� �׿ܴ� �ڹٳ� �ٸ� �� �̿��� �ܺο��� �����Ѵ�.
*/

/*
    <WHERE ��>
    ��ȸ�ϰ����ϴ� ���̺�κ��� Ư�� ���ǿ� �����ϴ� �����͸� ��ȸ�� �� ���
    ���ǽĿ����� �پ��� ������ ����� �����ϴ�.
    [ǥ����]
    SELECT �÷�,�÷�,�÷� ����
    FROM ���̺�
    WHERE ����;
    
    >>�񱳿���<<
    > , <,  >=, <= : ��Һ�
    = : ������ ����
    !=, ^=, <> : ������ �ٸ��� (!= �� ���� ���)
*/

--EMPLOYEE���� �μ��ڵ尡 'D5'�� ����鸸 ��ȸ(��� �÷�)
SELECT * FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

--EMPLOYEE���� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ(��� �÷�)
SELECT * FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE���� �μ��ڵ尡 'D1'�� ������� �����, �޿� �μ��ڵ� ��ȸ(��� �÷�)
SELECT EMP_NAME, SALARY,DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

--EMPLOYEE���� �μ��ڵ尡 'D1'�� �ƴ� ������� �����, �޿� �μ��ڵ� ��ȸ(��� �÷�)
SELECT EMP_NAME, SALARY,DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE != 'D1';

--������ 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, SALARY,DEPT_CODE FROM EMPLOYEE
WHERE SALARY >= 4000000;

--=============================================================================

--1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ����(��Ī -> ����)
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY * 12 AS "����"
FROM EMPLOYEE
WHERE SALARY >= 3000000;

--2. ������ 5õ���� �̻��� ������� �����, �޿�, ����(��Ī -> ����), �μ��ڵ�
SELECT EMP_NAME, SALARY, SALARY * 12 ����, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;

--3. �����ڵ尡 'J3'�� �ƴ� ������� ��� �����, �����ڵ�, ��翩��
SELECT EMP_ID, EMP_NAME, JOB_CODE, EMP_YN
FROM EMPLOYEE
WHERE JOB_CODE != 'J3';

--4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿�
    -- �߰��� AND,OR �� ������ ������ �� ����   
SELECT EMP_NAME ,EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;


-----------------------------------------------------------

/*
    <AND, OR ������>
    ������ ������ ������ �� ����Ѵ�.
    [ǥ����]
    ����A AND ����B -> ����A�� B�� ��� �����ϴ� ���� ������ �����Ѵ�.
    ����A OR ����B -> ����A�� ����B�� �ϳ��� �����ص� ������ �����Ѵ�.
    
    <BETWEEN AND>
    ���ǽĿ� ���Ǵ� ����
    ���̻� �������� ������ ���� ������ ������ �� �ַ� ����ϴ� ������(�̻�, ���ϸ� ����)
    
    [ǥ����]
    �񱳴�� �÷� BETWEEN �ϾȰ� AND ���Ѱ� ()
*/

--�޿��� 350���� �̻�, 600���� ������ ��� ����� �����, ��� �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
--WHERE SALARY >= 3500000 AND SALARY <= 6000000
WHERE SALARY BETWEEN 3500000 AND 6000000;

--�޿��� 350���� �̸�, 600���� �ʰ��� ��� ����� �����, ���, �޿���ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
--WHERE SALARY < 3500000 OR SALARY >= 6000000
WHERE NOT SALARY /*NOT*/ BETWEEN 3500000 AND 6000000;
-- NOT�� SALARY �� Ȥ�� �� ��ġ�� �������.

--NOT : �� ���� ������
--�÷��� �� ���� BETWEEN�տ� ���� ����

--�Ի����� '90/01/01' ~ '01/01/01'������� ��ü ��ȸ
SELECT *
FROM EMPLOYEE
--WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

--===================================================================

/*
    <LIKE>
    ���ϰ����ϴ� �÷����� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    [ǥ����]
    ���� ����÷� LIKE 'Ư������'; -> ��ġ�ϴ� �͸� �����´�.
    
    Ư�������� ������ �� ���ϵ�ī���� Ư�������� ���ǵǾ���Ѵ�.
    1. '%' : ���Թ��� �˻�(0���� �̻� ���� ��ȸ)
     EX) ���� ��� �÷� LIKE '����%'  : ���� ��� �÷��� �߿��� �ش� ���ڷ� �����ϴ� ���鸸 �����´�. 
         ���� ��� �÷� LIKE '%����'  : ���� ��� �÷��� �߿��� �ش� ���ڷ� ������ ���鸸 �����´�.
         ���� ��� �÷� LIKE '%����%' : ���� ��� �÷��� �߿��� �ش� ���ڷ� ���Ե� ���� ��ȸ�Ѵ�.
         
    2. '_': 1���ڸ� ��ü�ϴ� �˻�
     EX)���� ��� �÷� LIKE '_����'  : ���� ��� �÷��� ���ھտ� �ƹ����ڳ� �ִ� ���� ��ȸ�Ѵ�.
        ���� ��� �÷� LIKE '����_'  : ���� ��� �÷��� ���ڵڿ� �ƹ����ڳ� �ִ� ���� ��ȸ�Ѵ�.
        ���� ��� �÷� LIKE '_����_' : ���� ��� �÷��� ���ھյڿ� �ƹ����ڳ� �ִ� ���� ��ȸ�Ѵ�.
        
        ���� ��� �÷� LIKE '___����__' : ���� ���ϴ� ���·� _�� ���ؼ� ���ڼ��� ������ �� �ִ�.

*/
--������� ���� '��'���� ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

--������� �̸��� '����'�� ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%����';

--����� �߿��� �̸��� '��'��� ���ڰ� ���Ե� ����� �̸�, ��ȭ��ȣ ���
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';
   
--����� �߿��� �̸��� �߰��� '��'��� ���ڰ� ���Ե� ����� �̸�, ��ȭ��ȣ ��� 
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

--��ȭ��ȣ�� 3��° �ڸ��� 1�� ������� ���, �����, ��ȭ��ȣ ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

--�̸��� �� �ձ��ڰ� 3������ ������� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
--WHERE EMAIL LIKE '___%'; ->���ϵ�ī�� ���ڶ����� ��������� ���� �ʴ´�
--���ϵ�ī�幮�ڿ� �Ϲݹ��ڸ� ����������Ѵ�.
--�����Ͱ����� ����ϰ� ���� ���ϵ� ī�� ���ھտ� ������ Ż�⹮�ڸ� �����ؼ� Ż������ָ� �ȴ�.
--ESCAPE OPTION�� ����ؼ� ���
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

--=======================================================================
--1. �̸��� '��'���� ������ ������� �����, �Ի��� ��ȸ
SELECT EMP_NAME LIKE '%��';

--2. ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME AS ����� , PHONE AS ��ȭ��ȣ
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--3. �̸��� '��'�� ���ԵǾ� �ְ� �޿��� 240�����̻��� ������� �����, �޿� ��ȸ
SELECT EMP_NAME AS �����, SALARY AS �޿�
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%' AND SALARY >= 2400000;

--4. �μ����̺��� �ؿܿ������� �μ����� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID AS �μ��ڵ�, DEPT_TITLE AS �μ���
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '%�ؿܿ���%';


--=============================================================================
/*
    <IN>
    WHERE������ �񱳴�� �÷����� ���� ������ ����߿� ��ġ�ϴ� ���� �ִ��� �˻�
    
    [ǥ����]
    �񱳴���÷� IN ('��','��','��')
*/

--�μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� �μ������� �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';
WHERE DEPT_CODE IN ('D6','D8','D5'); 

/*
    <������ �켱����>
    1. ��������� (��Ģ����)
    2. ���Ῥ���� (||)
    3. �񱳿����� (< > <= >=)
    4. IS NULL / LIKE / IN 
    5. BETWEEN A AND B
    6. NOT
    7. AND
    8. OR
*/

--=======================����=======================

--1. ����� ���� �μ���ġ�� �������� ������� �����, ���, �μ��ڵ� ��ȸ
SELECT EMP_NAME AS �����, EMP_ID AS ���, DEPT_CODE AS �μ��ڵ�
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;

--2. ����(���ʽ� ������)�� 3õ���� �̻��̰� ���ʽ��� ���� �ʴ� ������� ���, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID AS ���, EMP_NAME  AS ����� , SALARY AS �޿�, BONUS AS ���ʽ�
FROM EMPLOYEE
WHERE (SALARY * 12) >= 30000000 AND BONUS IS NULL;

--3. �Ի����� '95/01/01' �̻��̰� �μ���ġ�� �������� ������� ���, �����, �Ի���, �μ��ڵ� ��ȸ
SELECT EMP_ID AS ���, EMP_NAME AS �����, HIRE_DATE AS �Ի���, DEPT_CODE AS �μ��ڵ�
FROM EMPLOYEE
WHERE HIRE_DATE >= '95/01/01';

--4. �޿��� 200���� �̻��̰� 500���� ������ ��� �߿��� �Ի����� '01/01/01'�̻��̰� ���ʽ��� �������� �������
--   ���, �����, �޿�, �Ի���, ���ʽ� ��ȸ
SELECT EMP_ID AS ���, EMP_NAME AS �����, SALARY AS �޿�, HIRE_DATE AS �Ի���, BONUS AS ���ʽ�
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 5000000 AND (HIRE_DATE >= '01/01/01') AND BONUS IS NULL;

--5. ���ʽ��� ���� ������ NULL�� �ƴϰ� �̸��� '��'�� ���Ե� ������� ���, �����, �޿�, ���ʽ����� ���� ��ȸ
SELECT EMP_ID AS ���, EMP_NAME AS �����, SALARY AS �޿�, (SALARY + (SALARY * BONUS)) *12 AS "���ʽ����� ����"
FROM EMPLOYEE
WHERE (SALARY + (SALARY * BONUS)) *12 IS NOT NULL AND EMP_NAME LIKE '%��%';


