/*SELECT * FROM ALL_USER;*/
-- �����ּ� 
/*
    ���� ���� ���
    CREATE USER �����̸�  IDENTIFIED BY ��й�ȣ; 
    GRANT ���� TO ������;
*/
CREATE USER KH IDENTIFIED BY KH;

-- KH������ �ּ����� ������ �ο��Ѵ�.(����, ������ ���� ����)
GRANT CONNECT, RESOURCE TO KH; 