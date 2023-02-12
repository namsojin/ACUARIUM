--//테이블 정보 조회//------------------------
SELECT * FROM PRODUCT;
SELECT * FROM MEMBER;
SELECT * FROM BOARD;
SELECT * FROM MSG;
SELECT * FROM MSGREPLY;
SELECT * FROM ORDERS;
SELECT * FROM ADDRESS;

CREATE SEQUENCE NAM.emp_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
NOCYCLE
NOCACHE
NOORDER
;

--//테이블 삭제//----------------------------
DROP TABLE PRODUCT;
DROP TABLE ADDRESS;
DROP TABLE ORDERS;
DROP TABLE MEMBER;
DROP TABLE BOARD;
DROP TABLE MSG;
DROP TABLE MSGREPLY;

--//테이블 생성//----------------------------
--PRODUCT TABLE--
CREATE TABLE PRODUCT(
   P_NUM INT NOT NULL PRIMARY KEY,         -- PK --
   P_STATUS VARCHAR(20) DEFAULT '판매중',
   P_CATEGORY VARCHAR(30) NOT NULL,
   P_NAME VARCHAR(200) NOT NULL,
   P_PRICE INT NOT NULL,
   P_CNT INT NULL,
   P_INFO VARCHAR(1000) NULL,
   P_INFOIMG VARCHAR(1000) NULL,
   P_IMG VARCHAR(1000) NULL,
   P_SALE INT DEFAULT 0               -- 할인율 --
);

--ADDRESS TABLE--
CREATE TABLE ADDRESS(
	A_NUM INT NOT NULL PRIMARY KEY,		-- PK --
	MEMBERID VARCHAR(30) NOT NULL,		-- FK --
	A_ADDRESS VARCHAR(300) NOT NULL,
	A_POST INT NULL
);

--ORDERS TABLE--
CREATE TABLE ORDERS(
	O_NUM INT NOT NULL PRIMARY KEY, 	-- PK --
	P_NUM INT NOT NULL,					-- FK --
	M_ID VARCHAR(50) NOT NULL,
	M_NAME VARCHAR(50) NOT NULL,
	M_PHONE VARCHAR(50) NOT NULL,
	O_DATE DATE NOT NULL,
	O_CNT INT NOT NULL,					-- 주문수량 --
	O_MEMO VARCHAR(300) NULL,
	O_PAYMENT INT DEFAULT 0,		-- 결제상태 --
	O_PAYMENT_METHOD VARCHAR(100) NOT NULL,	-- 결제방식 --
	O_STATE INT DEFAULT 0				-- 배송상태 --
);

--MEMBER TABLE--
CREATE TABLE MEMBER (
	MEMBERID	VARCHAR(40)	NOT NULL PRIMARY KEY,
	MEMBERPW	VARCHAR(20)	NOT NULL,
	MEMBERNAME	VARCHAR(20)	NOT NULL,
	MEMBERBIRTH	DATE NOT NULL,
	MEMBERPHONE	VARCHAR(40)	NOT NULL,
	MEMBEREMAIL	VARCHAR(50)	NULL,
	MEMBERATHU	VARCHAR(16)	DEFAULT 'MEMBER'
);

--BOARD TABLE--
CREATE TABLE BOARD (
	BOARDNUM INT NOT NULL PRIMARY KEY,
	BOARDTITLE	VARCHAR(100) NOT NULL,
	BOARDCONTENT VARCHAR(4000) NOT NULL,
    MEMBERID VARCHAR(40) NOT NULL,
    BOARDIMG VARCHAR(300) NULL,
    BOARDDATE DATE NOT NULL
);

--MSG TABLE--
CREATE TABLE MSG (
	MSGNUM	INT	NOT NULL PRIMARY KEY,
	MSGEMAIL	VARCHAR(100)  NOT NULL,
	MSGTITLE    VARCHAR(100)   NOT NULL,
	MSGCONTENT VARCHAR(1000) NOT NULL,
	MSGDATE	DATE	NOT NULL	
);

--MSGREPLY TABLE--
CREATE TABLE MSGREPLY (
	MSGREPLYNUM	INT	NOT NULL PRIMARY KEY,
    MSGNUM  INT	NOT NULL,
    MEMBERID VARCHAR(40) NOT NULL,
    MSGREPLYTITLE VARCHAR(100) NOT NULL,
	MSGREPLYCONTENT VARCHAR(1000)	NOT NULL,
	MSGREPLYDATE	DATE	NOT NULL
);

--//샘플데이터//------------------------------------
--MEMBER-----------------------------
INSERT INTO MEMBER VALUES('admin1','!admin000','관리자',SYSDATE,'01048292181','admin@naver.com','ADMIN');
INSERT INTO MEMBER VALUES('aaa111','!aaa111','aaa',SYSDATE,'01011112222','aaa@naver.com','MEMBER');
--BOARD------------------------------
INSERT INTO BOARD VALUES((SELECT NVL(MAX(BOARDNUM),0)+1 FROM BOARD),'테스터용제목','테스터용 내용입니다','admin1','src',SYSDATE);








