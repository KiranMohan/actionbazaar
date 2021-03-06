--liquibase formatted sql

--changeset rcuprak:1
CREATE TABLE CATEGORIES (CATEGORY_ID BIGINT NOT NULL, CATEGORY_NAME VARCHAR(255), CREATE_DATE VARCHAR(255), PARENT_ID BIGINT, PRIMARY KEY (CATEGORY_ID));
CREATE TABLE BILLINGINFO (BILLING_ID BIGINT NOT NULL, BILLING_TYPE VARCHAR(1), BIDDER_USER_ID BIGINT, PRIMARY KEY (BILLING_ID));
CREATE TABLE groups (group_pk BIGINT NOT NULL, groupid VARCHAR(255), username VARCHAR(255), USER_USER_ID BIGINT, PRIMARY KEY (group_pk));
CREATE TABLE ITEMS (ITEM_ID BIGINT NOT NULL, BID_END_DATE DATE, BID_START_DATE DATE, CREATEDDATE DATE, INITIAL_PRICE DECIMAL(15), ITEM_NAME VARCHAR(255) NOT NULL, SELLER_ID BIGINT, PRIMARY KEY (ITEM_ID));
CREATE TABLE EMAIL (EMAIL_ID BIGINT NOT NULL, ACTION VARCHAR(255), HTMLCONTENT bytea, PLAINCONTENT bytea, SUBJECT VARCHAR(255), PRIMARY KEY (EMAIL_ID));
CREATE TABLE BILLING_INFO (BILLING_USER_ID BIGINT NOT NULL, ACCOUNTNUMBER VARCHAR(255), EXPIRYDATE VARCHAR(255), SECRETCODE VARCHAR(255), CITY VARCHAR(255), PHONE VARCHAR(255), STATE INTEGER, STREETNAME1 VARCHAR(255), ZIPCODE VARCHAR(255), PRIMARY KEY (BILLING_USER_ID));
CREATE TABLE USERS (USER_ID BIGINT NOT NULL, USER_TYPE VARCHAR(1), ACCOUNTVERIFIED boolean, BIRTHDATE DATE, CREATED DATE, EMAIL VARCHAR(255), FIRSTNAME VARCHAR(255), GUEST boolean, LASTNAME VARCHAR(255), PASSWORD VARCHAR(255), PICTURE bytea, USERNAME VARCHAR(255), CITY VARCHAR(255), PHONE VARCHAR(255), STATE INTEGER, STREETNAME1 VARCHAR(255), ZIPCODE VARCHAR(255), PRIMARY KEY (USER_ID));
CREATE TABLE employees (USER_ID BIGINT NOT NULL, TITLE VARCHAR(255), PRIMARY KEY (USER_ID));
CREATE TABLE SHIPPING (SHIPPINGID BIGINT NOT NULL, COST DECIMAL(15), PRIMARY KEY (SHIPPINGID));
CREATE TABLE orders (ORDERID BIGINT NOT NULL, ORDERSTATUS INTEGER, BIDDER_USER_ID BIGINT, BILLING_BILLING_USER_ID BIGINT, CREDITCARD_BILLING_ID BIGINT, ITEM_ITEM_ID BIGINT, SHIPPING_SHIPPINGID BIGINT, PRIMARY KEY (ORDERID));
CREATE TABLE BID (ID BIGINT NOT NULL, BIDDATE DATE, BIDPRICE DECIMAL(15), BAZAARACCOUNT_USER_ID BIGINT, ITEM_ITEM_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE BAZAARACCOUNT (USER_ID BIGINT NOT NULL, COMM_RATE DECIMAL(15), MAX_ITEMS BIGINT, PRIMARY KEY (USER_ID));
CREATE TABLE CREDITCARD (BILLING_ID BIGINT NOT NULL, ACCOUNTNUMBER VARCHAR(255), CREDITCARDTYPE INTEGER, EXPIRATIONMONTH VARCHAR(255), EXPIRATIONYEAR INTEGER, NAMEONCARD VARCHAR(255), SECURITYCODE VARCHAR(255), PRIMARY KEY (BILLING_ID));
CREATE TABLE keywords (Category_CATEGORY_ID BIGINT, KEYWORDS VARCHAR(255));
CREATE TABLE CATEGORIES_ITEMS (CI_CATEGORY_ID BIGINT NOT NULL, CI_ITEM_ID BIGINT NOT NULL, PRIMARY KEY (CI_CATEGORY_ID, CI_ITEM_ID));
CREATE TABLE CATEGORIES_CATEGORIES (Category_CATEGORY_ID BIGINT NOT NULL, subCategories_CATEGORY_ID BIGINT NOT NULL, PRIMARY KEY (Category_CATEGORY_ID, subCategories_CATEGORY_ID));
CREATE TABLE USERS_groups (User_USER_ID BIGINT NOT NULL, groups_group_pk BIGINT NOT NULL, PRIMARY KEY (User_USER_ID, groups_group_pk));
CREATE TABLE BAZAARACCOUNT_BILLINGINFO (BazaarAccount_USER_ID BIGINT NOT NULL, billingInfo_BILLING_ID BIGINT NOT NULL, PRIMARY KEY (BazaarAccount_USER_ID, billingInfo_BILLING_ID));
CREATE TABLE BAZAARACCOUNT_orders (BazaarAccount_USER_ID BIGINT NOT NULL, orders_ORDERID BIGINT NOT NULL, PRIMARY KEY (BazaarAccount_USER_ID, orders_ORDERID));
ALTER TABLE CATEGORIES ADD CONSTRAINT CATEGORIESPARENTID FOREIGN KEY (PARENT_ID) REFERENCES CATEGORIES (CATEGORY_ID);
ALTER TABLE BILLINGINFO ADD CONSTRAINT BLLNGINFOBDDRSERID FOREIGN KEY (BIDDER_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE groups ADD CONSTRAINT groupsUSER_USER_ID FOREIGN KEY (USER_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE ITEMS ADD CONSTRAINT FK_ITEMS_SELLER_ID FOREIGN KEY (SELLER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE employees ADD CONSTRAINT employees_USER_ID FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE orders ADD CONSTRAINT rdrsCRDTCRDBLLNGID FOREIGN KEY (CREDITCARD_BILLING_ID) REFERENCES BILLINGINFO (BILLING_ID);
ALTER TABLE orders ADD CONSTRAINT ordersBIDDERUSERID FOREIGN KEY (BIDDER_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE orders ADD CONSTRAINT rdrsBLLNGBLLNGSRID FOREIGN KEY (BILLING_BILLING_USER_ID) REFERENCES BILLING_INFO (BILLING_USER_ID);
ALTER TABLE orders ADD CONSTRAINT rdrsSHPPNGSHPPNGID FOREIGN KEY (SHIPPING_SHIPPINGID) REFERENCES SHIPPING (SHIPPINGID);
ALTER TABLE orders ADD CONSTRAINT ordersITEM_ITEM_ID FOREIGN KEY (ITEM_ITEM_ID) REFERENCES ITEMS (ITEM_ID);
ALTER TABLE BID ADD CONSTRAINT BDBZRACCOUNTUSERID FOREIGN KEY (BAZAARACCOUNT_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE BID ADD CONSTRAINT BID_ITEM_ITEM_ID FOREIGN KEY (ITEM_ITEM_ID) REFERENCES ITEMS (ITEM_ID);
ALTER TABLE BAZAARACCOUNT ADD CONSTRAINT BAZAARACCOUNTSERID FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE CREDITCARD ADD CONSTRAINT CREDITCARDBLLINGID FOREIGN KEY (BILLING_ID) REFERENCES BILLINGINFO (BILLING_ID);
ALTER TABLE keywords ADD CONSTRAINT kywrdsCtgryCTGRYID FOREIGN KEY (Category_CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID);
ALTER TABLE CATEGORIES_ITEMS ADD CONSTRAINT CTGORIESITEMSCTMID FOREIGN KEY (CI_ITEM_ID) REFERENCES ITEMS (ITEM_ID);
ALTER TABLE CATEGORIES_ITEMS ADD CONSTRAINT CTGRSITEMSCCTGRYID FOREIGN KEY (CI_CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID);
ALTER TABLE CATEGORIES_CATEGORIES ADD CONSTRAINT CTGRSCTCtgryCTGRYD FOREIGN KEY (Category_CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID);
ALTER TABLE CATEGORIES_CATEGORIES ADD CONSTRAINT CTGRSsbCtgrsCTGRYD FOREIGN KEY (subCategories_CATEGORY_ID) REFERENCES CATEGORIES (CATEGORY_ID);
ALTER TABLE USERS_groups ADD CONSTRAINT SRSgroupsserUSERID FOREIGN KEY (User_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE USERS_groups ADD CONSTRAINT SRSgrpsgrpsgrouppk FOREIGN KEY (groups_group_pk) REFERENCES groups (group_pk);
ALTER TABLE BAZAARACCOUNT_BILLINGINFO ADD CONSTRAINT BZRCCNTBBzrccntSRD FOREIGN KEY (BazaarAccount_USER_ID) REFERENCES USERS (USER_ID);
ALTER TABLE BAZAARACCOUNT_BILLINGINFO ADD CONSTRAINT BZRCCbllngnfBLLNGD FOREIGN KEY (billingInfo_BILLING_ID) REFERENCES BILLINGINFO (BILLING_ID);
ALTER TABLE BAZAARACCOUNT_orders ADD CONSTRAINT BZRCCNTrdrrdrsRDRD FOREIGN KEY (orders_ORDERID) REFERENCES orders (ORDERID);
ALTER TABLE BAZAARACCOUNT_orders ADD CONSTRAINT BZRCCNTrBzrccntSRD FOREIGN KEY (BazaarAccount_USER_ID) REFERENCES USERS (USER_ID);
CREATE TABLE SEQUENCE (SEQ_NAME VARCHAR(50) NOT NULL, SEQ_COUNT DECIMAL(15), PRIMARY KEY (SEQ_NAME));
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN_TABLE', 0);
CREATE SEQUENCE CATEGORY_SEQ START WITH 1;
INSERT INTO SEQUENCE(SEQ_NAME, SEQ_COUNT) values ('SEQ_GEN', 0);


--rollback ALTER TABLE CATEGORIES DROP CONSTRAINT CATEGORIESPARENTID;
--rollback ALTER TABLE BILLINGINFO DROP CONSTRAINT BLLNGINFOBDDRSERID;
--rollback ALTER TABLE groups DROP CONSTRAINT groupsUSER_USER_ID;
--rollback ALTER TABLE ITEMS DROP CONSTRAINT FK_ITEMS_SELLER_ID;
--rollback ALTER TABLE employees DROP CONSTRAINT employees_USER_ID;
--rollback ALTER TABLE orders DROP CONSTRAINT rdrsCRDTCRDBLLNGID;
--rollback ALTER TABLE orders DROP CONSTRAINT ordersBIDDERUSERID;
--rollback ALTER TABLE orders DROP CONSTRAINT rdrsBLLNGBLLNGSRID;
--rollback ALTER TABLE orders DROP CONSTRAINT rdrsSHPPNGSHPPNGID;
--rollback ALTER TABLE orders DROP CONSTRAINT ordersITEM_ITEM_ID;
--rollback ALTER TABLE BID DROP CONSTRAINT BDBZRACCOUNTUSERID;
--rollback ALTER TABLE BID DROP CONSTRAINT BID_ITEM_ITEM_ID;
--rollback ALTER TABLE BAZAARACCOUNT DROP CONSTRAINT BAZAARACCOUNTSERID;
--rollback ALTER TABLE CREDITCARD DROP CONSTRAINT CREDITCARDBLLINGID;
--rollback ALTER TABLE keywords DROP CONSTRAINT kywrdsCtgryCTGRYID;
--rollback ALTER TABLE CATEGORIES_ITEMS DROP CONSTRAINT CTGORIESITEMSCTMID;
--rollback ALTER TABLE CATEGORIES_ITEMS DROP CONSTRAINT CTGRSITEMSCCTGRYID;
--rollback ALTER TABLE CATEGORIES_CATEGORIES DROP CONSTRAINT CTGRSCTCtgryCTGRYD;
--rollback ALTER TABLE CATEGORIES_CATEGORIES DROP CONSTRAINT CTGRSsbCtgrsCTGRYD;
--rollback ALTER TABLE USERS_groups DROP CONSTRAINT SRSgroupsserUSERID;
--rollback ALTER TABLE USERS_groups DROP CONSTRAINT SRSgrpsgrpsgrouppk;
--rollback ALTER TABLE BAZAARACCOUNT_BILLINGINFO DROP CONSTRAINT BZRCCNTBBzrccntSRD;
--rollback ALTER TABLE BAZAARACCOUNT_BILLINGINFO DROP CONSTRAINT BZRCCbllngnfBLLNGD;
--rollback ALTER TABLE BAZAARACCOUNT_orders DROP CONSTRAINT BZRCCNTrdrrdrsRDRD;
--rollback ALTER TABLE BAZAARACCOUNT_orders DROP CONSTRAINT BZRCCNTrBzrccntSRD;
--rollback DROP TABLE CATEGORIES;
--rollback DROP TABLE BILLINGINFO;
--rollback DROP TABLE groups;
--rollback DROP TABLE ITEMS;
--rollback DROP TABLE EMAIL;
--rollback DROP TABLE BILLING_INFO;
--rollback DROP TABLE USERS;
--rollback DROP TABLE employees;
--rollback DROP TABLE SHIPPING;
--rollback DROP TABLE orders;
--rollback DROP TABLE BID;
--rollback DROP TABLE BAZAARACCOUNT;
--rollback DROP TABLE CREDITCARD;
--rollback DROP TABLE keywords;
--rollback DROP TABLE CATEGORIES_ITEMS;
--rollback DROP TABLE CATEGORIES_CATEGORIES;
--rollback DROP TABLE USERS_groups;
--rollback DROP TABLE BAZAARACCOUNT_BILLINGINFO;
--rollback DROP TABLE BAZAARACCOUNT_orders;
--rollback DELETE FROM SEQUENCE WHERE SEQ_NAME = 'SEQ_GEN_TABLE';
--rollback DROP SEQUENCE CATEGORY_SEQ RESTRICT;
--rollback DELETE FROM SEQUENCE WHERE SEQ_NAME = 'SEQ_GEN';