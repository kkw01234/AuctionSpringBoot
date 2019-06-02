create or replace Procedure UploadAuction(user_id VARCHAR2, title VARCHAR2
, psubject VARCHAR2, pcontent VARCHAR2, picture VARCHAR2,start_date date, end_date date, price NUMBER)
IS
    product_id NUMBER;
    today date;
BEGIN
    --SELECT SYSDATE INTO today FROM DUAL;
    INSERT INTO auc_product VALUES(auc_product_auto.NEXTVAL,user_id,title,psubject,pcontent,picture,start_date,end_date,price);
    SELECT auc_product_auto.CURRVAL as product_id INTO product_id  FROM dual;
    INSERT INTO auc_progress VALUES(AUC_PROGRESS_AUTO.NEXTVAL, product_id,0,null);
END;

create or replace Procedure insertBidding(product_id NUMBER, user_id VARCHAR2, price NUMBER)
IS
    today date;
BEGIN
    SELECT SYSDATE INTO today FROM DUAL;
    INSERT INTO auc_log VALUES(AUC_LOG_AUTO.NEXTVAL, product_id,user_id,today, price);
END;