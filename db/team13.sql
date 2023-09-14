CREATE DATABASE teaspoon;

USE teaspoon;

CREATE TABLE sample(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(100)
);

INSERT INTO sample VALUES(DEFAULT, '홍길동');
INSERT INTO sample VALUES(DEFAULT, '강감찬');
INSERT INTO sample VALUES(DEFAULT, '이순신');
INSERT INTO sample VALUES(DEFAULT, '오세훈');
INSERT INTO sample VALUES(DEFAULT, '김철수');

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
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
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
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);


-- 파일 업로드 하는 게시판
CREATE TABLE free(
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
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

INSERT INTO free(title, content, author) VALUES('본문 제목1', '본문 내용1', 'admin');


CREATE TABLE fileinfo(
	articleno INT,
	savefolder VARCHAR(500),
	oroginfile VARCHAR(500),
	savefile VARCHAR(500)
)

CREATE TABLE guestbook (
	articleno INT PRIMARY KEY AUTO_INCREMENT
	