CREATE TABLE grade( 
no INTEGER auto_increment PRIMARY KEY,
sname VARCHAR(150) NOT null ,
							pid VARCHAR(150) NOT null ,
						  kor INTEGER ,
						  math INTEGER,
						  eng INTEGER ,
						  social INTEGER ,
						  science INTEGER ,
						exam VARCHAR(80),
						  tname VARCHAR(150),
						  regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
						  tid varchar(50));
						
-- sname : 학생 이름, pid: 부모님 아이디, exam : 시험 유형(?), tname: 선생님 성함 
						  
DROP TABLE grade;

INSERT INTO grade VALUES(DEFAULT, '홍박사', '홍길동', 90, 50, 50, 50, 50, '1학기 중간고사', '손흥민', default, 'son');