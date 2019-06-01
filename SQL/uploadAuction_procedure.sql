create or replace Procedure UploadAuction(user_id VARCHAR2, title VARCHAR2
,name VARCHAR2, psubject VARCHAR2, pcontent VARCHAR2, picture VARCHAR2,start_date date, end_date date)
IS
    product_id NUMBER;
    today date;
BEGIN
    --SELECT SYSDATE INTO today FROM DUAL;
    INSERT INTO auc_product VALUES(auc_product_auto.NEXTVAL,user_id,title,name,psubject,pcontent,picture,start_date,end_date);
    SELECT auc_product_auto.CURRVAL as product_id INTO product_id  FROM dual;
    INSERT INTO auc_progress VALUES(AUC_PROGRESS_AUTO.NEXTVAL, product_id,0,null);
END;
