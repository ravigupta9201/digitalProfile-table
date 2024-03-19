
create table tbl_Profession 
(
ProfessionId                int not null identity(1,1) primary key,	
OrderNo             int not null,
Code                nvarchar(254),
ProfessionName          nvarchar(254),
className               nvarchar(254),

Status              bit not null,

CreateBy             int not null constraint fk_Profession_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_Profession_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO





INSERT INTO tbl_Profession (OrderNo, Code, ProfessionName, className , Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'OC001' , N'सरकारी नोकरी / जागिर', N'रोजगार',1, 1, GETDATE()),
(2, 'OC002' , N'गैरसरकारी नोकरी / जागिर', N'रोजगार', 1 , 1, GETDATE()),
(3, 'OC003' , N'ज्याला मजदुरी', N'रोजगार', 1 , 1, GETDATE()),
(4, 'OC004' , N'वैदेशिक रोजगारी', N'रोजगार', 1 , 1, GETDATE()),
(5, 'OC005' , N'व्यापार', N'रोजगार', 1 , 1, GETDATE()),
(6, 'OC006' , N'अन्य रोजगारी', N'रोजगार', 1 , 1, GETDATE()),
(7, 'OC007' , N'विद्यार्थी', N'बेरोजगार', 1 , 1, GETDATE()),
(8, 'OC008' , N'', N'बेरोजगार', 1 , 1, GETDATE()),
(9, 'OC009' , N'', N'बेरोजगार', 1 , 1, GETDATE()),

(10, 'OC010' , N'उद्योग, व्यापार, कृषि', N'बेरोजगार', 1 , 1, GETDATE()),
(11, 'OC011' , N'पशुपालन', N'बेरोजगार', 1 , 1, GETDATE()),
(12, 'OC012' , N'अन्य स्वरोजगार', N'बेरोजगार', 1 , 1, GETDATE()),

GO