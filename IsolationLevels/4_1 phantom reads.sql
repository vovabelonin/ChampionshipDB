--4.1-�������
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ --����� ��������
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--��� ��������

BEGIN TRAN

--������ ���-�� ������� � ������ ����
SELECT count(*) FROM PLAYER 
WHERE name = '����'
-- 
--������ ���-�� ������� � ������ ����
SELECT count(*) FROM PLAYER 
WHERE name = '����'
COMMIT
