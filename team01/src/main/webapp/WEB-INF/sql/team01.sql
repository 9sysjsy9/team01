-- ���û��� ���̺�
create table tbl_notice(
   notice_no number primary key,
   notice_title varchar2(100) not null,
   notice_content varchar2(1000) not null,
   comment_count number default 0
);

-- �������� ������ ����
create sequence seq_notice_no;