/*Encryption*/
alter table Person add Username varchar(50) null, [Password]  varbinary(400) null

create MASTER KEY
ENCRYPTION BY PASSWORD = 'damg6210';

SELECT name KeyName,
  symmetric_key_id KeyID,
  key_length KeyLength,
  algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

CREATE CERTIFICATE UserPass  
   WITH SUBJECT = 'User Sample Password';  
GO  

CREATE SYMMETRIC KEY UserPass_SM 
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE UserPass;  
GO  

OPEN SYMMETRIC KEY UserPass_SM  
   DECRYPTION BY CERTIFICATE UserPass;  



 UPDATE dbo.Person set  [username] = Email
, [Password] = EncryptByKey(Key_GUID('UserPass_SM'),  convert(varbinary,'Pass123')  ) 
GO  

OPEN SYMMETRIC KEY UserPass_SM  
   DECRYPTION BY CERTIFICATE UserPass;  

SELECT *, 
    CONVERT(varchar, DecryptByKey([Password]))   
    AS 'Decrypted password'  
    FROM dbo.Person;  
GO  

select * from Person
Go



