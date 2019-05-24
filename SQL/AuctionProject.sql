
CREATE TABLE auc_user(
    id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(100) NOT NULL,
    account VARCHAR2(100) NOT NULL,
    authcode VARCHAR2(100) NOT NULL,
    stopdate date
);

CREATE TABLE admin(
    id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100)
);
create TABLE note(
        sendid VARCHAR2(100) REFERENCES auc_user(id),
        receiveid VARCHAR2(100) REFERENCES auc_user(id),
        content clob, --clob 대용량 텍스트 데이터 타입
        condate date,
        CONSTRAINT note_pk PRIMARY KEY(sendid, receiveid)
    
);
--drop table auc_information;

CREATE TABLE auc_information(
    pid NUMBER PRIMARY KEY,
    user_id VARCHAR2(100),
    title VARCHAR2(100) NOT NULL,
    pname VARCHAR2(100) NOT NULL,
    psubject VARCHAR2(100),
    pcontent CLOB,
    picture VARCHAR2(500),
    register_date DATE NOT NULL, 
    end_date DATE NOT NULL,
    CONSTRAINT information_FK FOREIGN KEY(user_id) REFERENCES auc_user(id)
);

CREATE TABLE auc_progress(
    id NUMBER PRIMARY KEY,
    pid NUMBER REFERENCES auc_information(pid),
    app_date date,
    admin_approval number(1) NOT NULL CHECK (admin_approval in (0,1)),
    admin_id varchar2(100) REFERENCES admin(id)
);

CREATE TABLE auc_log(
    id NUMBER PRIMARY KEY,
    progress_id NUMBER REFERENCES auc_progress(id),
    tender_user_id varchar2(100) REFERENCES auc_user(id),
    tender_date date,
    tender_price NUMBER
);

CREATE TABLE auc_complete(
    id VARCHAR2(100) PRIMARY KEY,
    auc_id NUMBER REFERENCES auc_information(pid),
    complete_price number,
    tender_user_id varchar2(100) REFERENCES auc_user(id),
    uid_check date,
    tender_id_check date
);

CREATE TABLE interestinfo(
    user_id VARCHAR2(100) PRIMARY KEY REFERENCES auc_user(id),
    interest varchar2(100)
);
