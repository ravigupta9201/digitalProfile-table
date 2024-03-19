
create table tbl_MarriedStatus 
(
MarriedStatusId                int not null identity(1,1) primary key,	
OrderNo             int not null,

Code                nvarchar(254),
MarriedStatusName          nvarchar(254),

Status              bit not null,

CreateBy             int not null constraint fk_MarriedStatus_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_MarriedStatus_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO




INSERT INTO tbl_MarriedStatus (OrderNo, Code, MarriedStatusName , Status , CreateBy, UpdateLogDateTime)
VALUES 
(1, 'MS001' , N'अविवाहित', 1, 1, GETDATE()),
(2, 'MS002' , N'विवाहित', 1 , 1, GETDATE()),
(3, 'MS003' , N'एकल महिला/पुरुष', 1 , 1, GETDATE()),
(4, 'MS004' , N'पारपाचुके / सम्बन्ध विच्छेद', 1 , 1, GETDATE()),
(5, 'MS005' , N'छुट्टिएको', 1 , 1, GETDATE()),
(6, 'MS006' , N'अन्य', 1 , 1, GETDATE());


GO