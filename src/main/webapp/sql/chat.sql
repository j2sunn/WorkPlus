create table chat {
	 CHAT_ID       NOT NULL NUMBER
	 CHAT_FROM   VARCHAR2(30)
 	 CHAT_TO     VARCHAR2(30)
 	 CHAT_CONTENT     VARCHAR2(800)
 	 CHAT_CREATE_AT    DATE
 	 CHAT_FILE_ADR    VARCHAR2(100)
 	 CHAT_ROOM_NAME    VARCHAR2(100)
}


select * from CHAT_FRIEND_BOOKMARK;

ALTER TABLE chat MODIFY CHAT_FROM VARCHAR2(30);
ALTER TABLE chat MODIFY CHAT_TO VARCHAR2(30);

insert into CHAT_FRIEND_BOOKMARK 
(CHAT_ID, CHAT_FROM, CHAT_TO)
values (1,  'gws12', 'nois12' );

TRUNCATE table chat;

create table CHAT_FRIEND_BOOKMARK(
    FBOOKMARK_NUM NUMBER(20) PRIMARY KEY, 
    C_SUBJECT VARCHAR2(30),
    C_OBJECT VARCHAR2(30)
);

insert into CHAT_FRIEND_BOOKMARK
(FBOOKMARK_NUM, C_SUBJECT, C_OBJECT)
values (1,  'gjs12', 'nois12' );

select * from CHAT_FRIEND_BOOKMARK;

fbookmark_seq.nextva

select fbookmark_seq.currval from CHAT_FRIEND_BOOKMARK
TRUNCATE table CHAT_FRIEND_BOOKMARK;

select m_profilefile, m_name, chat_status, d_name, m_job, m_id , c_object, c_subject
from member 
left join dept on member.d_num = dept.d_num 
left join position on member.p_num = position.p_num
full outer join CHAT_FRIEND_BOOKMARK on member.m_id = CHAT_FRIEND_BOOKMARK.c_object 
and c_subject = 'gwono12'
where member.m_id != 'admin'
and member.m_id != 'gwono12'
and r_admit='2'
and m_status='1'
order by M_NAME;

select m_profilefile, m_name, chat_status, d_name, m_job, m_id , c_object
from member 
left join dept on member.d_num = dept.d_num 
left join position on member.p_num = position.p_num
full outer join CHAT_FRIEND_BOOKMARK on member.m_id = CHAT_FRIEND_BOOKMARK.c_object 
where member.m_id != 'admin'
and member.m_id != 'gjs12'
order by M_NAME;


select m_profilefile, m_name, chat_status, d_name, m_job, m_id , c_object
from member 
left join dept on member.d_num = dept.d_num 
left join position on member.p_num = position.p_num
full outer join CHAT_FRIEND_BOOKMARK on member.m_id = CHAT_FRIEND_BOOKMARK.c_object 
where member.m_id != 'admin'
and member.m_id != 'gjs12'
order by M_NAME;

SELECT m_profilefile, m_name, chat_status, d_name, m_job, m_id, c_object,
 c_subject, m_status, r_admit
FROM member
LEFT JOIN dept ON member.d_num = dept.d_num
LEFT JOIN position ON member.p_num = position.p_num
FULL OUTER JOIN CHAT_FRIEND_BOOKMARK ON member.m_id = CHAT_FRIEND_BOOKMARK.c_object
                                      AND c_subject = 'gjs12'
WHERE member.m_id != 'admin'
AND member.m_id != 'gjs12'
AND r_admit = '2'
AND m_status = '1'
ORDER BY
 c_subject NULLS LAST, 
 m_name;

TRUNCATE table CHAT_FRIEND_BOOKMARK;


CREATE SEQUENCE fbookmark_seq;

insert into CHAT_FRIEND_BOOKMARK 
(FBOOKMARK_NUM, C_SUBJECT, C_OBJECT) 
values ( fbookmark_seq.nextval ,'gws12'  , 'nois12' );

delete from CHAT_FRIEND_BOOKMARK
where C_SUBJECT = 'gws12'
and C_OBJECT = 'nois12';