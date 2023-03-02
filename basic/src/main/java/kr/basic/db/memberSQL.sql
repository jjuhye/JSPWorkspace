 -- primary key 데이터가 유일하고 비어있지 않는 데이터 not null 
-- unique key null은 가능하나 데이터 중복은 허용하지않음 
-- drop table member;
create table member(
    num int primary key auto_increment, --속성을 주는 첫번째 방법
    id varchar(20) not null, 
    pw varchar(20) not null,
    name varchar(20) not null,
    age int not null,
    email varchar(30) not null,
    phone varchar(30) not null,    
);

select * from member;  -- view table 출력 

-- 데이터베이스에 추가하기 
insert into member(id,pass,name,age,email,phone) values('admin','admin','관리자',30,'test@admin.com','010-1111-1234');

insert into member(id,pass,name,age,email,phone) values('test1','1111','테스트1',31,'test1@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test2','2222','테스트2',32,'test2@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test3','3333','테스트3',33,'test3@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test4','4444','테스트4',34,'test4@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test5','5555','테스트5',35,'test5@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test6','6666','테스트6',36,'test6@test.com','010-1111-1234');
insert into member(id,pass,name,age,email,phone) values('test7','7777','테스트7',37,'test7@test.com','010-1111-1234');
