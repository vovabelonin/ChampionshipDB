--3.1-��������������� ������
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED--����� ��������
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--��� ��������
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE


BEGIN TRAN

Select *  FROM GAME_REPORT
WHERE game_id = 2 AND player_id = 3

--

SELECT * FROM GAME_REPORT
WHERE game_id = 2 AND player_id = 3

COMMIT
