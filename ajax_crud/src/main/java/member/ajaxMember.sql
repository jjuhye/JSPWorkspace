CREATE DATABASE ajaxMemberDB;
USE ajaxMemberDB;

CREATE TABLE member(
	id VARCHAR(20),
    passwd VARCHAR(20),
    name VARCHAR(20),
    reg_date DATETIME,
    address VARCHAR(100),
    tel VARCHAR(20)
);

SELECT * FROM member;
update member set name='�뀒�뒪�듃11', address='媛뺣턿',tel='123' where id='test1' and passwd='1';
insert into member values('test1','1234','�뀒�뒪�듃1',now(),'媛뺣궓','010-1234-1231');
insert into member values('test2','1234','�뀒�뒪�듃2',now(),'�뿭�궪','010-1234-1232');
insert into member values('test3','1234','�뀒�뒪�듃3',now(),'�떊�궗','010-1234-1233');
insert into member values('test4','1234','�뀒�뒪�듃4',now(),'援먮�','010-1234-1234');