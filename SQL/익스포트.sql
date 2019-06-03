
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
    psubject VARCHAR2(100),
    pcontent CLOB,
    picture VARCHAR2(500),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price NUMBER NOT NULL,
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

create table auc_note(
    id NUMBER PRIMARY KEY,
    send_id VARCHAR2(100),
    receive_id VARCHAR2(100),
    content CLOB NOT NULL,
    data_send Date,
    data_read Date,
    recv_read number(1) NOT NULL CHECK (recv_read in (0,1)),
    recv_del number(1) NOT NULL CHECK (recv_del in (0,1)),
    sent_del number(1) NOT NULL CHECK (sent_del in (0,1)),
    CONSTRAINT NOTE_SEND_ID_FK FOREIGN KEY(send_id) REFERENCES auc_user(id) ,

    CONSTRAINT NOTE_RECEIVE_FK FOREIGN KEY(receive_id) REFERENCES auc_user(id)
)
