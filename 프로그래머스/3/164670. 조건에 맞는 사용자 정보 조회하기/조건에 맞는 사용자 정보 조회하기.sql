SELECT 
    UU.USER_ID AS USER_ID
    ,UU.NICKNAME AS NICKNAME
    ,CONCAT(UU.CITY,' ',UU.STREET_ADDRESS1,' ',UU.STREET_ADDRESS2) AS 전체주소
    ,CONCAT(SUBSTR(UU.TLNO,1,3),'-',SUBSTR(UU.TLNO,4,4),'-',SUBSTR(UU.TLNO,8,4))  AS 전화번호
FROM 
    USED_GOODS_BOARD UB, USED_GOODS_USER UU
WHERE 
    UB.WRITER_ID = UU.USER_ID
GROUP BY 
    UU.USER_ID
HAVING
    COUNT(UB.BOARD_ID) >= 3
ORDER BY UU.USER_ID DESC;