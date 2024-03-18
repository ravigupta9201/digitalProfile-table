
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
