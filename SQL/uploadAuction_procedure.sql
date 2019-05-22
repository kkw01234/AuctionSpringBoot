create or replace Procedure UploadAuction(user_id VARCHAR2, title VARCHAR2
,name VARCHAR2, psubject VARCHAR2, pcontent VARCHAR2, picture VARCHAR2,start_date date, end_date date)
IS
    info_id NUMBER;
    today date;
BEGIN
    SELECT SYSDATE INTO today FROM DUAL;
    INSERT INTO auc_information VALUES(AUC_INFORMATION_AUTO.NEXTVAL,user_id,title,name,psubject,pcontent,picture,start_date,end_date);
    SELECT auc_information_auto.CURRVAL as infor_id INTO info_id  FROM dual;
    INSERT INTO auc_progress VALUES(AUC_PROGRESS_AUTO.NEXTVAL, info_id,today,0,null);
END;



--GRANT EXECUTE ON UPLOADAUCTION TO TEST;