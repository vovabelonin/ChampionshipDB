--���� - ��� ������,� ������� ������������ ������������.
--���� - ����������� ����� ����������
--GRANT ������������� ���������� �� ���������� ������ ���������
--REVOKE ������� ����������, �������� ��� ����������� �����
--DENY ��������� ���������� ��� ���������. ������������� ������������ ���������� ���������� ����� ��� �������� � ������ ��� ����

--����� - �������� �������:�������,�������������,���������,������� � ��
-- ����� - ��� "����������", ���, �������� � �++ ������,
-- ����� ��������� ����� - ��� ��������� �������� ���� ������(�� ���� ��� ������ ���� ������ ��� �������), 
-- ������� (������ ���������) � ����������� ���� ������������ ����
--��������� - ��� �� ,��� �������� � ���� ������ �������
--�����- ������ ����������
-- � �����, � ���� - ��� ��������
-- �������� � ��� ��������, ������� ����� ����������� ������� SQL Server .
-- �����(� ������ ��� ����� ��� �������� ����������� SQL Server / Windows) �������� ��������� ������ �������,
-- ����� �������, �� ����� ����������� ������� ������ �������(������, ��������, �� ���� ����� ������, ���� �������� ��������)
-- ���� - ��� ������� ������ ���� ������, �� �������� � �����-�� ���� ������ � ����� �������� ������� ������ ���� ������,
-- ��������, �� ����� ����������� ������ � �������� ������ ���� ������

-- ����� ���� ���� ������ ������� � ������ ���� ������, � ������� ����� ����� �� ����������� �������� ����� ���������� ���, ��������, ������,
-- ������� ������ ���� ������, � ������ �������� � ������ ���� ���� �����
-- �������������� ����, ������� ����� ������ - ��� ���� public, ��� ������ �������

CREATE LOGIN  test WITH PASSWORD = 'test'
CREATE USER test FOR LOGIN test
--exec sp_grantdbaccess 'test'
--SELECT CURRENT_USER;--������� �������� ������������
-----------------------------------------------------------------
--��������� ������ ������������ ����� SELECT, INSERT, UPDATE � ������ ������ �� ���� �������
GRANT INSERT, SELECT, UPDATE,Delete ON sportschool TO test
----------------------------------------------------------------------------
--��� ����� ������� ������ ������������ �������� ����� SELECT � UPDATE ������ ��������� ��������.
GRANT SELECT, UPDATE ON game_report (score_player,game_id) TO test
--------------------------------------------------------------------------------
--��� ����� ������� ������ ������������ �������� ������ ����� SELECT.
GRANT SELECT ON physical_data TO test
-------------------------------------------------------------------------------
--�������� ������ ������������ ����� ������� (SELECT) � �������������, ���������� � ������������ ������ �5.
GRANT SELECT ON sportschool TO test
--------------------------------------------------------------------------------



--�������� ����������� ���� ������ ���� ������.
CREATE ROLE testrole
---------------------------------------------------------------------------------
--�������� �� ����� ������� (UPDATE �� ��������� �������) � �������������, ���������� � ������������ ������ �5.
GRANT UPDATE ON  sportschool(sportschool_id,sportschool_adress) TO testrole
---------------------------------------------------------------------------------
--�������� ������ ������������ ��������� ����.
ALTER ROLE testrole ADD MEMBER test
----------------------------------------------------------------------------------
GRANT  CREATE TABLE TO test
GRANT ALTER ON SCHEMA::dbo TO test

