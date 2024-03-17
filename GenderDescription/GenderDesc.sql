
create table tbl_GenderDescription
(
GDId                int not null identity(1,1) primary key,	
OrderNo             int not null,
Code                nvarchar(254),
GenderName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_GenderDescription_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_GenderDescription_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
 GO

 
INSERT INTO tbl_GenderDescription (OrderNo, Code, GenderName, Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'GE001' , N'महिला',1, 1, GETDATE()),
(2, 'GE002' , N'पुरुष', 1 , 1, GETDATE()),
(3, 'GE003' , N'अन्य', 1, 1, GETDATE());
GO
