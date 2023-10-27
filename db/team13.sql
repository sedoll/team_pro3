CREATE DATABASE teaspoon;

USE teaspoon;


DROP TABLE member;

CREATE TABLE member(
	id VARCHAR(16) PRIMARY KEY, -- 아이디
	pw VARCHAR(330) NOT NULL, -- 비밀번호
	NAME VARCHAR(100) NOT NULL, -- 이름
	email VARCHAR(100) NOT NULL, -- 이메일
	tel VARCHAR(13) NOT NULL, -- 전화 번호
	addr1 VARCHAR(200), -- 주소1
	addr2 VARCHAR(100), -- 주소2
	postcode VARCHAR(10), -- 우편번호
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 가입일
	birth DATE, -- 생일
	pt INT DEFAULT 0, -- 포인트
	visited INT DEFAULT 0,
	job INT NOT NULL -- 직업 학생: 1, 선생님: 2
);

-- 관리자
INSERT INTO member VALUES(
'admin', '1234', '관리자', 'admin@edu.com', '010-1234-5678', 
	'경기 성남시 분당구 대왕판교로 477', '102호', '13480', DEFAULT, '1998-04-22',
	DEFAULT, DEFAULT, 0);

-- 학부모
INSERT INTO member VALUES(
'hong', '1234', '홍길동', 'hong@edu.com', '010-2222-3333', 
	'경기 성남시 분당구 대왕판교로 477', '102호', '13480', DEFAULT, '1980-04-22',
	DEFAULT, DEFAULT, 1);
	INSERT INTO member VALUES(
'kang', '1234', '강감찬', 'kang@edu.com', '010-1212-1212', 
	'경기 성남시 분당구 대왕판교로 477', '102호', '13480', DEFAULT, '1975-04-22',
	DEFAULT, DEFAULT, 1);

-- 선생
INSERT INTO member VALUES(
'son', '1234', '손흥민', 'son@edu.com', '010-5555-6666', 
	'경기 성남시 분당구 대왕판교로 477', '102호', '13480', DEFAULT, '1983-04-22',
	DEFAULT, DEFAULT, 2);
	INSERT INTO member VALUES(
'lee', '1234', '이순신', 'lee@edu.com', '010-3434-3434', 
	'경기 성남시 분당구 대왕판교로 477', '102호', '13480', DEFAULT, '1990-04-22',
	DEFAULT, DEFAULT, 2);

-- 비밀번호 1234 spring 암호화 버전
UPDATE member SET pw='$2a$10$3zl8fmNyd1IsP1Ru0TNVee9AMtpM9E7yz5ZR9Qiofbj8zqqjJiqIi'

DROP TABLE board;

CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO board(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');
UPDATE board SET par=bno WHERE bno=1;

INSERT INTO board(title, content, author) VALUES('본문 제목2', '본문 내용2', 'hong'); 
UPDATE board SET par=bno WHERE bno=2;

INSERT INTO board(title, content, author) VALUES('본문 제목3', '본문 내용3', 'kang');
UPDATE board SET par=bno WHERE bno=3;

INSERT INTO board(title, content, author) VALUES('본문 제목4', '본문 내용4', 'lee');
UPDATE board SET par=bno WHERE bno=4;

INSERT INTO board(title, content, author) VALUES('본문 제목5', '본문 내용5', 'son');
UPDATE board SET par=bno WHERE bno=5;

INSERT INTO board(title, content, author) VALUES('본문 제목6', '본문 내용6', 'hong');
UPDATE board SET par=bno WHERE bno=6; 

INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 7);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 7);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 6);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 5);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 4);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 3);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 2);
INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글내용', 'admin', 1, 1);

select * from board where par = 7 and lev = 1 order by resdate DESC;


CREATE TABLE board_tea(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

CREATE TABLE board_par(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 공지사항(notice) 테이블 생성
create table notice(
	no int primary KEY AUTO_INCREMENT, -- notice 글 번호
	title varchar(200) not NULL,	-- 제목
	content varchar(1000), -- 내용
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt int DEFAULT 0 -- 조회수
);

-- 공지사항 더미글 추가 10건

INSERT INTO notice(title, content) VALUES ('공지사항1', '공지사항1 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항2', '공지사항2 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항3', '공지사항3 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항4', '공지사항4 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항5', '공지사항5 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항6', '공지사항6 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항7', '공지사항7 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항8', '공지사항8 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항9', '공지사항9 더미글입니다.');
INSERT INTO notice(title, content) VALUES ('공지사항10', '공지사항10 더미글입니다.');

-- 자주 묻는 질문 (FAQ) 테이블 생성

CREATE TABLE faq (
    fno int PRIMARY KEY AUTO_INCREMENT, -- faq 글 번호
    question VARCHAR(1000) NOT NULL, -- 질문
    answer VARCHAR(1000) NOT NULL -- 답변
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문1', '자주 묻는 질문1 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문2', '자주 묻는 질문2 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문3', '자주 묻는 질문3 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문4', '자주 묻는 질문4 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문5', '자주 묻는 질문5 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문6', '자주 묻는 질문6 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문7', '자주 묻는 질문7 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문8', '자주 묻는 질문8 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문9', '자주 묻는 질문9 더미글입니다.');
INSERT INTO faq(question, answer) VALUES('자주 묻는 질문10', '자주 묻는 질문10 더미글입니다.');


-- 대외활동 정보
CREATE TABLE info_act(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 학습 정보
CREATE TABLE info_stu(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 대학 정보
CREATE TABLE info_uni(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(2000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	rec INT DEFAULT 0,
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO free(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');


-- qna
CREATE TABLE qna(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	pw VARCHAR(330), -- 비밀글, 비밀번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 학교 정보
CREATE TABLE school(
	eo_code VARCHAR(10),
	eo_name VARCHAR(100),
	sc_code VARCHAR(50),
	sc_name VARCHAR(100)
	);

-- 자료실 db
CREATE TABLE fileobj (
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	postno INT NOT NULL,
	savefolder VARCHAR(400),
	originfile VARCHAR(400),
	savefile VARCHAR(800),
	filesize LONG,
	uploaddate VARCHAR(100)
);

CREATE TABLE fileboard (
	postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
	title VARCHAR(100) not null,   -- 글제목
	content VARCHAR(1500) not null,    -- 글내용
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
	visited INT DEFAULT 0   -- 조회수
);

-- 성적 게시판
CREATE TABLE grade( 
	no INTEGER auto_increment PRIMARY KEY,
	sname VARCHAR(150) NOT NULL ,
	pid VARCHAR(150) NOT null ,
	kor INTEGER ,
	math INTEGER,
	eng INTEGER ,
	social INTEGER ,
	science INTEGER ,
	exam VARCHAR(80),
	tname VARCHAR(150),
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
						
-- sname : 학생 이름, pid: 부모님 아이디, exam : 시험 유형(?), tname: 선생님 성함 
						  
DROP TABLE grade;

INSERT INTO grade VALUES(DEFAULT, '홍길동', 'oh12345', 90, 50, 50, 50, 50, '1학기 중간고사', '이순신', default);

-- 관리자 게시판 관리 테이블
CREATE TABLE report (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);
CREATE TABLE report_tea (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board_tea(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);
CREATE TABLE report_par (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    board_bno INT,
    reporter VARCHAR(16),
    reason VARCHAR(255),
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(board_bno) REFERENCES board_par(bno) ON DELETE CASCADE,
    FOREIGN KEY(reporter) REFERENCES member(id) ON DELETE CASCADE
);


-- 더미데이터

/*자유게시판 더미데이터 생성 */
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_bd(IN count INT) /*auto_bd 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO board (title, content, author)VALUES('자유게시판-admin' , '내용', 'admin');
		  INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용-son', 'son', 1, i*2); /*댓글*/
		  INSERT INTO board (title, content, author)VALUES('자유게시판-kang' , '내용', 'kang');
		  INSERT INTO board(title, content, author, lev, par) VALUES('댓글', '댓글 내용-admin', 'admin', 1, i*3);
		  INSERT INTO board (title, content, author)VALUES('자유게시판-hong' , '내용', 'hong'); 
		  INSERT INTO board (title, content, author)VALUES('자유게시판-son' , '내용', 'son'); 
		  INSERT INTO board (title, content, author)VALUES('자유게시판-lee' , '내용', 'lee');
		  UPDATE board SET par=bno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/

CALL auto_bd(100); /*() 안의 숫자만큼 반복 실행 */

SELECT * FROM board;

DROP PROCEDURE auto_bd;
/* ===================================================================================================================================== */




/* 학생 게시판 더미데이터 생성*/
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_par(IN count INT) /*auto_stu 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO board_par (title, content, author)VALUES('학부모게시판-kang' , '내용', 'kang'); 
			INSERT INTO board_par (title, content, author, lev, par) VALUES('댓글', '댓글 내용-hong', 'hong', 1, i*2); /*댓글*/
		  INSERT INTO board_par (title, content, author)VALUES('학부모게시판-hong' , '내용', 'hong'); 
		  	INSERT INTO board_par (title, content, author, lev, par) VALUES('댓글', '댓글 내용-kang', 'kang', 1, i*3);
		  UPDATE board_par SET par=bno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
--
CALL auto_par(100); /* 프로시저 실행 */

SELECT * FROM board_stu;

DROP PROCEDURE auto_stu;
/* -------------------------------------------------------------------------------- */


/*선생님 게시판 더미데이터 생성*/ 
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_tea(IN count INT) /*auto_insert 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO board_tea (title, content, author)VALUES('선생님게시판-son' , '내용', 'son');
		  	INSERT INTO board_tea(title, content, author, lev, par) VALUES('댓글', '댓글 내용-son', 'son', 1, i*2); /*댓글*/
		  INSERT INTO board_tea (title, content, author)VALUES('선생님게시판-lee', '내용', 'lee');
		  INSERT INTO board_tea (title, content, author, lev, par)VALUES('댓글', '댓글 내용-lee', 'lee', 1, i*3);
		  UPDATE board_tea SET par=bno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
--
CALL auto_tea(100);

SELECT * FROM board_tea;

DROP PROCEDURE auto_tea;


-- 공지사항
DELIMITER $$
CREATE PROCEDURE auto_notice(IN count INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE (i <= count) DO
		  INSERT INTO notice (title, content)VALUES('공지사항' , '내용');
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
CALL auto_notice(100); /*() 안의 숫자만큼 반복 실행 */
SELECT * FROM notice;
DROP PROCEDURE auto_notice;

-- info-act
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_act(IN count INT) /*auto_insert 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO info_act (title, content, author)VALUES('대외활동게시판' , '내용', 'admin');
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
--
CALL auto_act(100);

-- info-stu
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_stu(IN count INT) /*auto_insert 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO info_stu (title, content, author)VALUES('교육정보게시판' , '내용', 'admin');
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
--
CALL auto_stu(100);

-- info-uni
DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_uni(IN count INT) /*auto_insert 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO info_uni (title, content, author)VALUES('대입정보게시판' , '내용', 'admin');
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/
--
CALL auto_uni(100);


DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_career(IN count INT) /*auto_career 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO qna_career (title, content, author)VALUES('질문게시판-kimg' , '내용', 'kim');
		  INSERT INTO qna_career(title, content, author, lev, par) VALUES('댓글', '댓글 내용-son', 'son', 1, i*2); /*댓글*/
		  INSERT INTO qna_career (title, content, author)VALUES('질문게시판-kang' , '내용', 'kang');
		  INSERT INTO qna_career(title, content, author, lev, par) VALUES('댓글', '댓글 내용-lee', 'lee', 1, i*3);
		  INSERT INTO qna_career (title, content, author)VALUES('질문게시판-hong' , '내용', 'hong'); 
		  INSERT INTO qna_career (title, content, author)VALUES('질문게시판-sej123' , '내용', 'sej123'); 
		  UPDATE qna_career SET par=qno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/

CALL auto_career(100); /*() 안의 숫자만큼 반복 실행 */

DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_problem(IN count INT) /*auto_career 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-kimg' , '내용', 'kim');
		  INSERT INTO qna_problem(title, content, author, lev, par) VALUES('댓글', '댓글 내용-son', 'son', 1, i*2); /*댓글*/
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-kang' , '내용', 'kang');
		  INSERT INTO qna_problem(title, content, author, lev, par) VALUES('댓글', '댓글 내용-lee', 'lee', 1, i*3);
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-hong' , '내용', 'hong'); 
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-sej123' , '내용', 'sej123'); 
		  UPDATE qna_problem SET par=qno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/

CALL auto_problem(100); /*() 안의 숫자만큼 반복 실행 */


DELIMITER $$ /* 프로시저 만들기 위한 구분문자 DELIMITER 사이에 공백 지우면 에러남 */
CREATE PROCEDURE auto_problem(IN count INT) /*auto_career 이름의 프로시저 생성 호출시 들어오는 숫자를 count 변수에 저장*/
BEGIN
    DECLARE i INT DEFAULT 1;/* 변수 I에 1 초기화 */
    WHILE (i <= count) DO/*1부터 호출시 입력한 숫자만큼 반복*/
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-kimg' , '내용', 'kim');
		  INSERT INTO qna_problem(title, content, author, lev, par) VALUES('댓글', '댓글 내용-son', 'son', 1, i*2); /*댓글*/
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-kang' , '내용', 'kang');
		  INSERT INTO qna_problem(title, content, author, lev, par) VALUES('댓글', '댓글 내용-lee', 'lee', 1, i*3);
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-hong' , '내용', 'hong'); 
		  INSERT INTO qna_problem (title, content, author)VALUES('문제게시판-sej123' , '내용', 'sej123'); 
		  UPDATE qna_problem SET par=qno WHERE par IS NULL;
        SET i = i + 1; /* 루프가 끝나기전 I변수 1증가 */
    END WHILE; /* 반복  */
END$$
DELIMITER $$ /* 프로시저 종료 지점 마찬가지로 DELIMITER 사이 공백 지우면 에러남.*/

CALL auto_problem(100); /*() 안의 숫자만큼 반복 실행 */



DELIMITER //

CREATE PROCEDURE InsertMultipleTimes()
BEGIN
    DECLARE counter INT DEFAULT 1;
    
    REPEAT
        INSERT INTO board_act (title, content, author, link)
        VALUES ('대외활동-admin', '내용', 'admin', 'https://www.allforyoung.com/posts/activity');
        SET counter = counter + 1;
    UNTIL counter > 100 END REPEAT;
    
END //

DELIMITER ;

CALL InsertMultipleTimes();