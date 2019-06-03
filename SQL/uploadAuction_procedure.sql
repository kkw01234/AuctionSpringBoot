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

create or replace Procedure deleteAuction(product_id NUMBER, user_id VARCHAR2, result OUT NUMBER)

IS

--    CURSOR find_product IS
--    SELECT * FROM AUC_PRODUCT p WHERE  p.id = product_id and p.user_id = user_id;
BEGIN
--    FETCH find_product INTO product;
--    EXIT WHEN find_product%NOTFOUND;

    DELETE FROM AUC_PROGRESS p WHERE p.product_id = product_id;
    DELETE FROM AUC_PRODUCT pr where pr.id = product_id;
    result := 1;
    EXCEPTION
    WHEN OTHERS THEN
        result := 0;

END;