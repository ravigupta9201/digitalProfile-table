
create table tbl_ResidenceElseWhere
(
ResidenceElseWhereId                int not null identity(1,1) primary key,	
OrderNo                             int not null,
Code                                nvarchar(254),
MaritalStatusName                   nvarchar(254),
Status                              bit not null,

CreateBy             int not null constraint fk_ResidenceElseWhere_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_ResidenceElseWhere_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO




INSERT INTO tbl_ResidenceElseWhere (OrderNo, Code, MaritalStatusName , Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'OR001' , N'तलब / ज्याला / नोकरी', 1, 1, GETDATE()),
(2, 'OR002' , N'ब्यापार / व्यवसाय', 1 , 1, GETDATE()),
(3, 'OR003' , N'अध्ययन/तालिम', 1 , 1, GETDATE()),
(4, 'OR004' , N'कामको खोजी', 1 , 1, GETDATE()),
(5, 'OR005' , N'आश्रित', 1 , 1, GETDATE()),
(6, 'OR006' , N'अन्य', 1 , 1, GETDATE());


GO