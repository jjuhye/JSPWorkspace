 -- primary key 데이터가 유일하고 비어있지 않는 데이터 not null 
-- unique key null은 가능하나 데이터 중복은 허용하지않음 
-- drop table board;
create table board(
    num int primary key auto_increment,
    name varchar(20) not null,
    regDate varchar(20) not null, 
    title varchar(20) not null,
    content varchar(100) not null
);

-- 명령할 쿼리 영역 alt + x => 쿼리문 실행 
-- read : 데이터 베이스에서 값을 읽어오는 명령문 
select * from board;  -- view table 출력 

-- 데이터베이스에 추가하기 
insert into board(name,regDate,title,content) values("작성자1","2022-02-01","제목1","내용1");
insert into board(name,regDate,title,content) values("작성자2","2022-02-02","제목2","내용2");
insert into board(name,regDate,title,content) values("작성자3","2022-02-03","제목3","내용3");

select * from board;  -- 뷰테이블 컬럼 이름 수정이 가능하다 --> 일시적인 수정 -> 실제 테이블 컬럼값 바꾼건 아니다 

-- update 수정하기 
--update board set title = 30 where id ='test1';
--update board set title = 35 where id ='test1' and title <20; --(0 rows affected) : 조건 안맞더라도 문법이 맞으면 실행은 한다 
--
--update board set title = 40, pass='test2' where id ='test2';
--
---- delete 삭제하기 
--delete from board where regDate >2022-01-01;  -- (3 rows affected)
--
---- delete 삭제하기 --> table 내용 삭제 
--delete from board;  --테이블은 삭제가 안되고 유지 -> 안에있는 전체 row 만 다 삭제된다 
--
---- table 자체 삭제 
--drop table board;