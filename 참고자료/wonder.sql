/* ȸ�� */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* ���������� */
DROP TABLE EXPERT_INFO 
	CASCADE CONSTRAINTS;

/* ��ǰ */
DROP TABLE PRODUCT 
	CASCADE CONSTRAINTS;

/* ��ǰ�� */
DROP TABLE PD_DETAIL 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE REVIEW 
	CASCADE CONSTRAINTS;

/* �Խ���ī�װ� */
DROP TABLE CATEGORY 
	CASCADE CONSTRAINTS;

/* �����Խ��� */
DROP TABLE QNA 
	CASCADE CONSTRAINTS;

/* ��/���� �ߺ����� */
DROP TABLE NONE_DUP 
	CASCADE CONSTRAINTS;

/* �������̺� */
DROP TABLE PAYMENT 
	CASCADE CONSTRAINTS;

/* ��ǰ�̹��� */
DROP TABLE PD_IMAGE 
	CASCADE CONSTRAINTS;

/* �Ƿڼ� */
DROP TABLE FORM 
	CASCADE CONSTRAINTS;

/* ���������� */
DROP TABLE EXPERT_GRANT 
	CASCADE CONSTRAINTS;

/* �����Խ��� */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE ADMIN 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE REPLY 
	CASCADE CONSTRAINTS;

/* ä�� */
DROP TABLE CHAT 
	CASCADE CONSTRAINTS;

/* �ڷ�� */
DROP TABLE DONE_PROJECT 
	CASCADE CONSTRAINTS;

/* ���  */
DROP TABLE LANGUAGE 
	CASCADE CONSTRAINTS;

/* �����ӿ�ũ */
DROP TABLE FRAMEWORK 
	CASCADE CONSTRAINTS;

/* ����Ʈ�̹��� */
DROP TABLE SITE_IMAGE 
	CASCADE CONSTRAINTS;

/* �������̹��� */
DROP TABLE EXPERT_IMAGE 
	CASCADE CONSTRAINTS;

/* �Ƿ���� */
DROP TABLE FORM_CALCLE 
	CASCADE CONSTRAINTS;

/* ȸ�� */
CREATE TABLE MEMBER (
	MEM_NO NUMBER NOT NULL, /* ȸ����ȣ */
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	NAME VARCHAR2(50) NOT NULL, /* �̸� */
	PWD VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	NICKNAME VARCHAR2(50) NOT NULL, /* �г��� */
	EMAIL VARCHAR2(50) NOT NULL, /* �̸��� */
	TEL VARCHAR2(100), /* ����ó */
	REGDATE DATE  DEFAULT SYSDATE, /* ����� */
	OUTDATE DATE, /* Ż���� */
	TYPE VARCHAR2(20) DEFAULT '�Ϲ�ȸ��' NOT NULL /* ȸ���з� */
);

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		USER_ID ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			USER_ID
		);

/* ���������� */
CREATE TABLE EXPERT_INFO (
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	MAJOR VARCHAR2(50), /* ���� */
	CAREER CLOB, /* ��� */
	GRADE CLOB, /* �з� */
	BANK_NAME VARCHAR2(30), /* ����� */
	ACCOUNT_NO VARCHAR2(50), /* ���¹�ȣ */
	CERTIFICATE CLOB, /* �ڰ��� */
	SERVICABLE_TIME VARCHAR2(100), /* �������ɽð� */
	INTRODUCTION CLOB, /* �Ұ� */
	APPROVAL VARCHAR2(20) DEFAULT 'N', /* ���ο��� */
	WORK_AMOUNT NUMBER, /* �۾����� */
	LANG CLOB NOT NULL, /* ��� */
	FRAME CLOB /* �����ӿ�ũ */
);

CREATE UNIQUE INDEX PK_EXPERT_INFO
	ON EXPERT_INFO (
		USER_ID ASC
	);

ALTER TABLE EXPERT_INFO
	ADD
		CONSTRAINT PK_EXPERT_INFO
		PRIMARY KEY (
			USER_ID
		);

/* ��ǰ */
CREATE TABLE PRODUCT (
	PD_NO  NUMBER NOT NULL, /* ��ǰ��ȣ */
	USER_ID VARCHAR2(100), /* ȸ�����̵� */
	CATE_TYPE  VARCHAR2(20), /* ī�װ����� */
	PD_TITLE VARCHAR2(500) NOT NULL, /* ��ǰ���� */
	REGDATE DATE  DEFAULT SYSDATE, /* ����� */
	DEL_TYPE VARCHAR2(20) DEFAULT 'N', /* �������� */
	READ_COUNT NUMBER DEFAULT 0, /* ��ȸ�� */
	LANG CLOB NOT NULL, /* ��� */
	FRAME CLOB /* �����ӿ�ũ */
);

CREATE UNIQUE INDEX PK_PRODUCT
	ON PRODUCT (
		PD_NO  ASC
	);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT PK_PRODUCT
		PRIMARY KEY (
			PD_NO 
		);

/* ��ǰ�� */
CREATE TABLE PD_DETAIL (
	DETAIL_NO NUMBER NOT NULL, /* ��ǰ�󼼹�ȣ */
	PD_NO  NUMBER NOT NULL, /* ��ǰ��ȣ */
	PD_TYPE VARCHAR(100), /* ��ǰŸ�� */
	PD_PRICE NUMBER, /* ��ǰ���� */
	PD_TERM NUMBER, /* ��ǰ���� */
	EDIT_COUNT NUMBER NOT NULL, /* ����Ƚ�� */
	SERVICE_EXPLANATION CLOB, /* ���񽺼��� */
	EDIT_EXPLANATION CLOB, /* �������� */
	COMMERCIAL VARCHAR2(100) DEFAULT 'N', /* ������̿� */
	CODE_SUPPLY VARCHAR2(100) DEFAULT 'N', /* �ҽ��ڵ����� */
	PAYMENT VARCHAR2(100) DEFAULT 'N', /* ������� */
	CUSTOMIZE VARCHAR2(100) DEFAULT 'N' /* ������������� */
);

CREATE UNIQUE INDEX PK_PD_DETAIL
	ON PD_DETAIL (
		DETAIL_NO ASC
	);

ALTER TABLE PD_DETAIL
	ADD
		CONSTRAINT PK_PD_DETAIL
		PRIMARY KEY (
			DETAIL_NO
		);

/* ���� */
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER NOT NULL, /* �����ȣ */
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	PD_NO  NUMBER NOT NULL, /* ��ǰ��ȣ */
	REVIEW_TITLE VARCHAR2(150) NOT NULL, /* �������� */
	REVIEW_CONTENT CLOB NOT NULL, /* ���䳻�� */
	RATING NUMBER NOT NULL, /* ���� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	DEL_TYPE VARCHAR2(20) DEFAULT 'N' /* �������� */
);

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		REVIEW_NO ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			REVIEW_NO
		);

/* �Խ���ī�װ� */
CREATE TABLE CATEGORY (
	CATE_NO NUMBER NOT NULL, /* ī�װ���ȣ */
	CATE_TYPE  VARCHAR2(20) NOT NULL, /* ī�װ����� */
	CATE_NAME VARCHAR2(100) NOT NULL /* ī�װ��� */
);

CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY (
		CATE_TYPE  ASC
	);

ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY
		PRIMARY KEY (
			CATE_TYPE 
		);

/* �����Խ��� */
CREATE TABLE QNA (
	QNA_NO NUMBER NOT NULL, /* �Խñ۹�ȣ */
	CATE_TYPE VARCHAR2(20) NOT NULL, /* ī�װ����� */
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	QNA_TITLE VARCHAR2(150) NOT NULL, /* �Խñ����� */
	QNA_CONTENT CLOB NOT NULL, /* �Խñ۳��� */
	QNA_REGDATE DATE  DEFAULT SYSDATE, /* ����� */
	READ_COUNT NUMBER DEFAULT 0, /* ��ȸ�� */
	GROUP_NO NUMBER, /* �׷��ȣ */
	STEP NUMBER DEFAULT 0, /* ��۴ܰ� */
	SORT_NO NUMBER DEFAULT 0, /* ��۹�ȣ */
	DEL_TYPE VARCHAR2(20) DEFAULT 'N', /* �������� */
	FILE_NAME VARCHAR2(150), /* ���ϸ� */
	ORIGINAL_FILE_NAME VARCHAR2(150), /* �������ϸ� */
	FILE_SIZE NUMBER /* ����ũ�� */
);

CREATE UNIQUE INDEX PK_QNA
	ON QNA (
		QNA_NO ASC
	);

ALTER TABLE QNA
	ADD
		CONSTRAINT PK_QNA
		PRIMARY KEY (
			QNA_NO
		);

/* ��/���� �ߺ����� */
CREATE TABLE NONE_DUP (
	DUP_NO  NUMBER NOT NULL, /* �ߺ�������ȣ */
	USER_ID VARCHAR2(100), /* ȸ�����̵� */
	PD_NO  NUMBER, /* ��ǰ��ȣ */
	DUP_FLAG VARCHAR2(20) /* �ߺ�Ÿ�� */
);

CREATE UNIQUE INDEX PK_NONE_DUP
	ON NONE_DUP (
		DUP_NO  ASC
	);

ALTER TABLE NONE_DUP
	ADD
		CONSTRAINT PK_NONE_DUP
		PRIMARY KEY (
			DUP_NO 
		);

/* �������̺� */
CREATE TABLE PAYMENT (
	PAY_NO NUMBER NOT NULL, /* ������ȣ */
	PAY_CODE VARCHAR2(100), /* �����ڵ� */
	PAY_METHOD VARCHAR2(50) NOT NULL, /* �������� */
	FORM_NO  NUMBER, /* �Ƿڼ���ȣ */
	PD_NAME VARCHAR2(100), /* ��ǰ�� */
	PRICE NUMBER NOT NULL, /* �����ݾ� */
	BUYER_NAME VARCHAR2(100), /* �����ڸ� */
	BUYER_TEL VARCHAR2(100), /* �����ڿ���ó */
	REGDATE DATE  DEFAULT SYSDATE /* ������ */
);

CREATE UNIQUE INDEX PK_PAYMENT
	ON PAYMENT (
		PAY_NO ASC
	);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT
		PRIMARY KEY (
			PAY_NO
		);

/* ��ǰ�̹��� */
CREATE TABLE PD_IMAGE (
	PDIMG_NO NUMBER NOT NULL, /* �̹�����ȣ */
	PD_NO  NUMBER NOT NULL, /* ��ǰ��ȣ */
	FILE_NAME VARCHAR2(100) NOT NULL, /* ���ϸ� */
	ORIGINAL_FILE_NAME CLOB NOT NULL, /* �������ϸ� */
	FILE_SIZE NUMBER NOT NULL, /* ����ũ�� */
	FILE_TYPE VARCHAR2(20) NOT NULL /* �̹���Ÿ�� */
);

CREATE UNIQUE INDEX PK_PD_IMAGE
	ON PD_IMAGE (
		PD_NO  ASC
	);

ALTER TABLE PD_IMAGE
	ADD
		CONSTRAINT PK_PD_IMAGE
		PRIMARY KEY (
			PD_NO 
		);

/* �Ƿڼ� */
CREATE TABLE FORM (
	FORM_NO  NUMBER NOT NULL, /* �Ƿڼ���ȣ */
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	P_USER_ID  VARCHAR2(100) NOT NULL, /* �����������̵� */
	PD_NO  NUMBER, /* ��ǰ��ȣ */
	FORM_TITLE VARCHAR2(150) NOT NULL, /* ���� */
	FORM_CONTENT CLOB NOT NULL, /* ���� */
	FORM_REGDATE DATE  DEFAULT SYSDATE, /* ����� */
	PRICE NUMBER, /* �ݾ� */
	PAY_FLAG  VARCHAR2(20) DEFAULT 'N', /* �������� */
	ORDERSTART DATE, /* ������ */
	ORDEREND DATE /* ������ */
);

CREATE UNIQUE INDEX PK_FORM
	ON FORM (
		FORM_NO  ASC
	);

ALTER TABLE FORM
	ADD
		CONSTRAINT PK_FORM
		PRIMARY KEY (
			FORM_NO 
		);

/* ���������� */
CREATE TABLE EXPERT_GRANT (
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	REGDATE DATE DEFAULT SYSDATE, /* ��û�� */
	GRANT_DATE DATE , /* ������ */
	GRANT_FLAG VARCHAR2(20) DEFAULT 'N' /* ���ο��� */
);

CREATE UNIQUE INDEX PK_EXPERT_GRANT
	ON EXPERT_GRANT (
		USER_ID ASC
	);

ALTER TABLE EXPERT_GRANT
	ADD
		CONSTRAINT PK_EXPERT_GRANT
		PRIMARY KEY (
			USER_ID
		);

/* �����Խ��� */
CREATE TABLE BOARD (
	BOARD_NO  NUMBER NOT NULL, /* �����Խ��ǹ�ȣ */
	CATE_TYPE  VARCHAR2(20) DEFAULT 'B' NOT NULL, /* ī�װ����� */
	USER_ID VARCHAR2(100) DEFAULT 'N', /* ȸ�����̵� */
	ADMIN_ID VARCHAR2(70) DEFAULT 'N', /* �����ھ��̵� */
	BOARD_TITLE VARCHAR2(150) NOT NULL, /* ���� */
	BOARD_CONTENT CLOB NOT NULL, /* ���� */
	DEL_TYPE VARCHAR2(20) DEFAULT 'N', /* �������� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	READ_COUNT NUMBER DEFAULT 0, /* ��ȸ�� */
	FILE_NAME VARCHAR2(100), /* ���ϸ� */
	ORIGINAL_FILE_NAME CLOB, /* �������ϸ� */
	FILE_SIZE NUMBER, /* ����ũ�� */
	NICKNAME VARCHAR2(50) NOT NULL, /* �г��� */
	PWD VARCHAR2(20), /* ��й�ȣ */
	TOTAL_COMMENT NUMBER DEFAULT 0 /* ��ۼ� */
);

CREATE UNIQUE INDEX PK_BOARD
	ON BOARD (
		BOARD_NO  ASC
	);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD
		PRIMARY KEY (
			BOARD_NO 
		);

/* ������ */
CREATE TABLE ADMIN (
	ADMIN_NO NUMBER NOT NULL, /* �����ڹ�ȣ */
	ADMIN_ID VARCHAR2(70) NOT NULL, /* �����ھ��̵� */
	ADMIN_PWD VARCHAR2(100) NOT NULL /* ��й�ȣ */
);

CREATE UNIQUE INDEX PK_ADMIN
	ON ADMIN (
		ADMIN_ID ASC
	);

ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN
		PRIMARY KEY (
			ADMIN_ID
		);

/* ��� */
CREATE TABLE REPLY (
	REPLY_NO NUMBER NOT NULL, /* ��۹�ȣ */
	BOARD_NO  NUMBER NOT NULL, /* �����Խ��ǹ�ȣ */
	USER_ID VARCHAR2(100) NOT NULL, /* ȸ�����̵� */
	REPLY_CONTENT CLOB NOT NULL, /* ��۳��� */
	REPLY_REGDATE DATE  DEFAULT sysdate, /* ����� */
	GROUP_NO NUMBER, /* �׷��ȣ */
	STEP NUMBER, /* ��۴ܰ� */
	SORT_NO NUMBER, /* ���Ĺ�ȣ */
	DEL_TYPE VARCHAR2(20) DEFAULT 'N', /* �������� */
	NICKNAME VARCHAR2(50) /* �г��� */
);

CREATE UNIQUE INDEX PK_REPLY
	ON REPLY (
		REPLY_NO ASC
	);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			REPLY_NO
		);

/* ä�� */
CREATE TABLE CHAT (
	CHAT_NO NUMBER NOT NULL, /* ä�ù�ȣ */
	S_USER_ID VARCHAR2(100) NOT NULL, /* ����ȸ�����̵� */
	R_USER_ID VARCHAR2(100)  NOT NULL, /* ����ȸ�����̵� */
	CONTENT CLOB, /* ���� */
	CHATROOM_STATUS VARCHAR2(10) DEFAULT 'O', /* ä�ù� ���� �÷��� */
	CHECK_STATUS VARCHAR2(10) DEFAULT 'N', /* �޼��� ���� �÷� */
	TIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP /* �����ð� */
);

CREATE UNIQUE INDEX PK_CHAT
	ON CHAT (
		CHAT_NO ASC
	);

ALTER TABLE CHAT
	ADD
		CONSTRAINT PK_CHAT
		PRIMARY KEY (
			CHAT_NO
		);

/* �ڷ�� */
CREATE TABLE DONE_PROJECT (
	FILE_NO NUMBER NOT NULL, /* �ڷ�ǹ�ȣ */
	USER_ID VARCHAR2(100), /* ȸ�����̵� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	MEMO CLOB, /* �޸� */
	FILE_NAME VARCHAR2(100), /* ���ϸ� */
	ORIGINAL_FILE_NAME CLOB, /* �������ϸ� */
	FILE_SIZE NUMBER /* ����ũ�� */
);

CREATE UNIQUE INDEX PK_DONE_PROJECT
	ON DONE_PROJECT (
		FILE_NO ASC
	);

ALTER TABLE DONE_PROJECT
	ADD
		CONSTRAINT PK_DONE_PROJECT
		PRIMARY KEY (
			FILE_NO
		);

/* ���  */
CREATE TABLE LANGUAGE (
	LANG_NO NUMBER NOT NULL, /* ����ȣ */
	LANG VARCHAR2(150) /* ��� */
);

CREATE UNIQUE INDEX PK_LANGUAGE
	ON LANGUAGE (
		LANG_NO ASC
	);

ALTER TABLE LANGUAGE
	ADD
		CONSTRAINT PK_LANGUAGE
		PRIMARY KEY (
			LANG_NO
		);

/* �����ӿ�ũ */
CREATE TABLE FRAMEWORK (
	FRAME_NO NUMBER NOT NULL, /* �����ӿ�ũ��ȣ */
	FRAME VARCHAR2(150) /* �����ӿ�ũ */
);

CREATE UNIQUE INDEX PK_FRAMEWORK
	ON FRAMEWORK (
		FRAME_NO ASC
	);

ALTER TABLE FRAMEWORK
	ADD
		CONSTRAINT PK_FRAMEWORK
		PRIMARY KEY (
			FRAME_NO
		);

/* ����Ʈ�̹��� */
CREATE TABLE SITE_IMAGE (
	SITE_IMAGE_NO NUMBER, /* ����Ʈ�̹�����ȣ */
	ADMIN_ID VARCHAR2(70), /* �����ھ��̵� */
	FILE_NAME VARCHAR2(100), /* ���ϸ� */
	ORIGINAL_FILE_NAME CLOB, /* �������ϸ� */
	FILE_SIZE NUMBER, /* ����ũ�� */
	TYPE VARCHAR2(50), /* Ÿ�� */
	REGDATE DATE DEFAULT SYSDATE /* ����� */
);

/* �������̹��� */
CREATE TABLE EXPERT_IMAGE (
	 EXPERT_IMG_NO NUMBER NOT NULL, /* �̹�����ȣ */
	USER_ID VARCHAR2(100), /* ȸ�����̵� */
	FILE_NAME VARCHAR2(100) NOT NULL, /* ���ϸ� */
	ORIGINAL_FILE_NAME CLOB NOT NULL, /* �������ϸ� */
	FILE_SIZE NUMBER NOT NULL, /* ����ũ�� */
	FILE_TYPE VARCHAR2(20) NOT NULL /* �̹���Ÿ�� */
);

CREATE UNIQUE INDEX PK_EXPERT_IMAGE
	ON EXPERT_IMAGE (
		 EXPERT_IMG_NO ASC
	);

ALTER TABLE EXPERT_IMAGE
	ADD
		CONSTRAINT PK_EXPERT_IMAGE
		PRIMARY KEY (
			 EXPERT_IMG_NO
		);

/* �Ƿ���� */
CREATE TABLE FORM_CALCLE (
	F_CANCLE_NO NUMBER NOT NULL, /* �Ƿڼ���ҹ�ȣ */
	FORM_NO NUMBER, /* �Ƿڼ���ȣ */
	C_REASON CLOB, /* ��һ��� */
	REGDATE DATE DEFAULT SYSDATE /* ��û��¥ */
);

CREATE UNIQUE INDEX PK_FORM_CALCLE
	ON FORM_CALCLE (
		F_CANCLE_NO ASC
	);

ALTER TABLE FORM_CALCLE
	ADD
		CONSTRAINT PK_FORM_CALCLE
		PRIMARY KEY (
			F_CANCLE_NO
		);

ALTER TABLE EXPERT_INFO
	ADD
		CONSTRAINT FK_MEMBER_TO_EXPERT_INFO
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_CATEGORY_TO_PRODUCT
		FOREIGN KEY (
			CATE_TYPE 
		)
		REFERENCES CATEGORY (
			CATE_TYPE 
		);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT FK_EXPERT_INFO_TO_PRODUCT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES EXPERT_INFO (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE PD_DETAIL
	ADD
		CONSTRAINT FK_PRODUCT_TO_PD_DETAIL
		FOREIGN KEY (
			PD_NO 
		)
		REFERENCES PRODUCT (
			PD_NO 
		)
		ON DELETE CASCADE;

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_PRODUCT_TO_REVIEW
		FOREIGN KEY (
			PD_NO 
		)
		REFERENCES PRODUCT (
			PD_NO 
		);

ALTER TABLE QNA
	ADD
		CONSTRAINT FK_MEMBER_TO_QNA
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE QNA
	ADD
		CONSTRAINT FK_CATEGORY_TO_QNA
		FOREIGN KEY (
			CATE_TYPE
		)
		REFERENCES CATEGORY (
			CATE_TYPE 
		);

ALTER TABLE NONE_DUP
	ADD
		CONSTRAINT FK_MEMBER_TO_NONE_DUP
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE NONE_DUP
	ADD
		CONSTRAINT FK_PRODUCT_TO_NONE_DUP
		FOREIGN KEY (
			PD_NO 
		)
		REFERENCES PRODUCT (
			PD_NO 
		)
		ON DELETE CASCADE;

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_FORM_TO_PAYMENT
		FOREIGN KEY (
			FORM_NO 
		)
		REFERENCES FORM (
			FORM_NO 
		);

ALTER TABLE PD_IMAGE
	ADD
		CONSTRAINT FK_PRODUCT_TO_PD_IMAGE
		FOREIGN KEY (
			PD_NO 
		)
		REFERENCES PRODUCT (
			PD_NO 
		)
		ON DELETE CASCADE;

ALTER TABLE FORM
	ADD
		CONSTRAINT FK_MEMBER_TO_FORM
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE FORM
	ADD
		CONSTRAINT FK_MEMBER_TO_FORM2
		FOREIGN KEY (
			P_USER_ID 
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE FORM
	ADD
		CONSTRAINT FK_PRODUCT_TO_FORM
		FOREIGN KEY (
			PD_NO 
		)
		REFERENCES PRODUCT (
			PD_NO 
		);

ALTER TABLE EXPERT_GRANT
	ADD
		CONSTRAINT FK_MEMBER_TO_EXPERT_GRANT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_CATEGORY_TO_BOARD
		FOREIGN KEY (
			CATE_TYPE 
		)
		REFERENCES CATEGORY (
			CATE_TYPE 
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_BOARD
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_ADMIN_TO_BOARD
		FOREIGN KEY (
			ADMIN_ID
		)
		REFERENCES ADMIN (
			ADMIN_ID
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_REPLY
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_BOARD_TO_REPLY
		FOREIGN KEY (
			BOARD_NO 
		)
		REFERENCES BOARD (
			BOARD_NO 
		)
		ON DELETE CASCADE;

ALTER TABLE DONE_PROJECT
	ADD
		CONSTRAINT FK_MEMBER_TO_DONE_PROJECT
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES MEMBER (
			USER_ID
		);

ALTER TABLE SITE_IMAGE
	ADD
		CONSTRAINT FK_ADMIN_TO_SITE_IMAGE
		FOREIGN KEY (
			ADMIN_ID
		)
		REFERENCES ADMIN (
			ADMIN_ID
		);

ALTER TABLE EXPERT_IMAGE
	ADD
		CONSTRAINT FK_EXPERT_INFO_TO_EXPERT_IMAGE
		FOREIGN KEY (
			USER_ID
		)
		REFERENCES EXPERT_INFO (
			USER_ID
		)
		ON DELETE CASCADE;

ALTER TABLE FORM_CALCLE
	ADD
		CONSTRAINT FK_FORM_TO_FORM_CALCLE
		FOREIGN KEY (
			FORM_NO
		)
		REFERENCES FORM (
			FORM_NO 
		);


create or replace view expertMemberView
as
select A.*, B.file_name, B.file_type from 
(select m.mem_no, e.*,  m.name, m.pwd, m.nickname, m.email, m.tel, m.regdate
from expert_info e join member m
on e.user_id=m.user_id)A left outer join expert_image B
on A.user_id=B.user_id;

create or replace view formConfirmView
as
select f.*, p.pd_type, p.pd_term, p.edit_count
from form f join pd_detail p
on f.pd_no=p.pd_no and f.price=p.pd_price;

create sequence MEMBER_seq
start with 1
increment by 1
nocache;

create sequence EXPERT_INFO_seq
start with 1
increment by 1
nocache;

create sequence PRODUCT_seq
start with 1
increment by 1
nocache;

create sequence PD_DETAIL_seq
start with 1
increment by 1
nocache;

create sequence REVIEW_seq
start with 1
increment by 1
nocache;

create sequence CATEGORY_seq
start with 1
increment by 1
nocache;

create sequence QNA_seq
start with 1
increment by 1
nocache;

create sequence NONE_DUP_seq
start with 1
increment by 1
nocache;

create sequence PAYMENT_seq
start with 1
increment by 1
nocache;

create sequence PD_IMAGE_seq
start with 1
increment by 1
nocache;

create sequence FORM_seq
start with 1
increment by 1
nocache;

create sequence EXPERT_GRANT_seq
start with 1
increment by 1
nocache;

create sequence BOARD_seq
start with 1
increment by 1
nocache;

create sequence ADMIN_seq
start with 1
increment by 1
nocache;

create sequence REPLY_seq
start with 1
increment by 1
nocache;

create sequence CHAT_seq
start with 1
increment by 1
nocache;

create sequence DONE_PROJECT_seq
start with 1
increment by 1
nocache;

create sequence LANGUAGE_seq
start with 1
increment by 1
nocache;

create sequence FRAMEWORK_seq
start with 1
increment by 1
nocache;

create sequence SITE_IMAGE_seq
start with 1
increment by 1
nocache;

create sequence EXPERT_IMAGE_seq
start with 1
increment by 1
nocache;

create sequence FORM_CALCLE_seq
start with 1
increment by 1
nocache;

insert into admin(admin_no, admin_id, admin_pwd)
values(ADMIN_SEQ.nextval, 'admin', 'a123');

insert into category(CATE_NO, CATE_TYPE, CATE_NAME)
values(category_seq.nextval, 'P', '��ǰ�Խ���');

insert into category(CATE_NO, CATE_TYPE, CATE_NAME)
values(category_seq.nextval, 'Q', 'QNA�Խ���');

insert into category(CATE_NO, CATE_TYPE, CATE_NAME)
values(category_seq.nextval, 'A', 'QNA�亯');

insert into language
valueS(LANGUAGE_SEQ.nextval, 'A#');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'ActionScript');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'AssemblyLanguage');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Autohotkey');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Autolt');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'C');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'C#');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'C++');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Clojure');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'COBOL');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'CSS');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Dart');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Delphi');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Elixir');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'F#');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Fortran');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Go');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Groovy');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'HTML');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Java');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'JavaScript');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'JSP');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Kotlin');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'LabVIEW');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Liquid');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Lua');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Node.js');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'ObjectPascal');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Objective-C');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Perl');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'PHP');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'PowerShell');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Processing');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Prolog');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'JavaScript');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Python');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'R');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Ruby');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Rust');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Sass');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Scala');

insert into language
valueS(LANGUAGE_SEQ.nextval, 'Scratch');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Solidity');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Swift');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'TypeScript');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Verilog');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'VisualBasic');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'VisualBasic.NET');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'Webassembly');
insert into language
valueS(LANGUAGE_SEQ.nextval, 'XML');

insert into framework
values(framework_SEQ.nextval, '.NET');
insert into framework
values(framework_SEQ.nextval, 'Angular');
insert into framework
values(framework_SEQ.nextval, 'AngularJS');
insert into framework
values(framework_SEQ.nextval, 'ASP');
insert into framework
values(framework_SEQ.nextval, 'ASP.NET');
insert into framework
values(framework_SEQ.nextval, 'Bootstrp');
insert into framework
values(framework_SEQ.nextval, 'Bulma');
insert into framework
values(framework_SEQ.nextval, 'Codelgniter');

insert into framework
values(framework_SEQ.nextval, 'Django');

insert into framework
values(framework_SEQ.nextval, 'Electron');
insert into framework
values(framework_SEQ.nextval, 'Express.js');
insert into framework
values(framework_SEQ.nextval, 'FastAPI');

insert into framework
values(framework_SEQ.nextval, 'Flask');

insert into framework
values(framework_SEQ.nextval, 'Flutter');

insert into framework
values(framework_SEQ.nextval, 'Foundation');
insert into framework
values(framework_SEQ.nextval, 'Framework7');
insert into framework
values(framework_SEQ.nextval, 'lonic');
insert into framework
values(framework_SEQ.nextval, 'Laminas');
insert into framework
values(framework_SEQ.nextval, 'Laravel');
insert into framework
values(framework_SEQ.nextval, 'Material-UI');
insert into framework
values(framework_SEQ.nextval, 'Materialize');
insert into framework
values(framework_SEQ.nextval, 'Next.js');
insert into framework
values(framework_SEQ.nextval, 'Qt');
insert into framework
values(framework_SEQ.nextval, 'ReactNative');
insert into framework
values(framework_SEQ.nextval, 'RubyonRails');
insert into framework
values(framework_SEQ.nextval, 'Spring');
insert into framework
values(framework_SEQ.nextval, 'Swing');
insert into framework
values(framework_SEQ.nextval, 'Vue.js');
insert into framework
values(framework_SEQ.nextval, 'WPF');
insert into framework
values(framework_SEQ.nextval, 'Xamarin');
insert into framework
values(framework_SEQ.nextval, '��������ǥ�������ӿ�ũ');



commit;

select * from product;