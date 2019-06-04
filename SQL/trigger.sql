create or replace TRIGGER bidding_date
before insert or update on auc_log
for each row

declare
    under_date EXCEPTION;
    over_date EXCEPTION;
    now Date;
    sstart Date;
    estart Date;
BEGIN
    SELECT SYSDATE INTO now FROM DUAL;
    SELECT start_date, end_date INTO sstart, estart FROM auc_product WHERE id=:new.product_id;
    if(now - sstart <= 0) THEN
        raise under_date;
    ELSIF(estart - now <=0) THEN
        raise over_date;
    END IF;

    EXCEPTION
        WHEN under_date THEN
            RAISE_APPLICATION_ERROR(-22000, '시작날짜 이후에만 참여 가능합니다.');
        WHEN over_date THEN
            RAISE_APPLICATION_ERROR(-22001, '이미 마감 되었습니다.');
END;

create or replace TRIGGER delproduct
before update or delete on auc_product
for each row

declare
    afterdate DATE;
    appr NUMBER;
    now DATE;
    not_delete EXCEPTION;
begin
    SELECT SYSDATE INTO now FROM DUAL;
    SELECT i.start_date, p.approval INTO afterdate, appr FROM auc_product i, auc_progress p WHERE i.id=p.product_id and p.approval = 1 and i.id = :new.id;
    if(afterdate - now <= 0) THEN
        raise not_delete;
    end if;

    EXCEPTION
        WHEN not_delete THEN
            RAISE_APPLICATION_ERROR(-22001, '시작된 것은 삭제 및 수정이 불가능 합니다');

end;

create or replace trigger password
before insert or update on auc_user
for each row

declare
    nLength NUMBER;
    underflow_length Exception;
begin
    nLength := length(:new.password);
    IF(nLength < 6) THEN
        raise underflow_length;
    END IF;

    EXCEPTION
        WHEN underflow_length THEN
            RAISE_APPLICATION_ERROR(-20002, '암호는 6자리 이상이여야합니다');
end;

create or replace TRIGGER upload_product
before insert or update on auc_product
for each row

declare
    below_zero EXCEPTION;
BEGIN
    if(:new.price < 0) THEN
        raise below_zero;
    end if;
    EXCEPTION
        WHEN below_zero THEN
            RAISE_APPLICATION_ERROR(-21005, '0원 이하로 등록할 수 없습니다.');
END;

create or replace trigger price
before insert or update on auc_log
for each row

declare
    low_price EXCEPTION;
    nprice NUMBER;
    maxprice NUMBER;
begin

    SELECT price INTO nprice FROM auc_product WHERE id=:new.product_id;
    if(nprice >:new.price) THEN
        raise low_price;
    END IF;
    SELECT max(price) INTO maxprice FROM auc_log WHERE id=:new.product_id;
    if(maxprice >:new.price) THEN
        raise low_price;
    END IF;
    EXCEPTION
        WHEN low_price THEN
            RAISE_APPLICATION_ERROR(-21004, '현재 최고가 보다 낮은 금액입니다');
end;

