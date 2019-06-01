
CREATE TABLE auc_user(
    id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    address VARCHAR2(500) NOT NULL,
    phone VARCHAR2(100) NOT NULL,
    account VARCHAR2(100) NOT NULL,
    authcode VARCHAR2(100) NOT NULL,
    stopdate date
);

CREATE TABLE auc_admin(
    id VARCHAR2(100) PRIMARY KEY,
    password VARCHAR2(100)
);


CREATE TABLE auc_product(
    id NUMBER PRIMARY KEY,
    user_id VARCHAR2(100),
    title VARCHAR2(100) NOT NULL,
    pname VARCHAR2(100) NOT NULL,
    psubject VARCHAR2(100),
    pcontent CLOB,
    picture VARCHAR2(500),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT product_user_FK FOREIGN KEY(user_id) REFERENCES auc_user(id)
);

CREATE TABLE auc_progress(
    id NUMBER PRIMARY KEY,
    product_id NUMBER CONSTRAINT progress_product_FK REFERENCES auc_product(id),
    -- app_date date,
    approval number(1) NOT NULL CHECK (approval in (0,1)),
    admin_id varchar2(100) CONSTRAINT progress_admin_FK REFERENCES auc_admin(id)
);


CREATE TABLE auc_complete(
    id VARCHAR2(100) PRIMARY KEY,
    product_id NUMBER CONSTRAINT complete_product_FK REFERENCES auc_product(id),
    complete_price number,
    tender_user_id varchar2(100) CONSTRAINT complete_tender_user_FK REFERENCES auc_user(id),
    uid_check date,
    tender_id_check date
);

CREATE TABLE auc_log(
    id NUMBER PRIMARY KEY,
    product_id NUMBER CONSTRAINT log_product_FK REFERENCES auc_product(id),
    user_id varchar2(100) CONSTRAINT log_user_FK REFERENCES auc_user(id),
    log_date date,
    price NUMBER
);


CREATE TABLE auc_interest(
    user_id VARCHAR2(100) REFERENCES auc_user(id),
    interest varchar2(100)
);

create TABLE auc_note(
        sendid VARCHAR2(100) REFERENCES auc_user(id),
        receiveid VARCHAR2(100) REFERENCES auc_user(id),
        content clob, --clob 대용량 텍스트 데이터 타입
        note_date date,
        CONSTRAINT note_pk PRIMARY KEY (sendid, receiveid)
);
