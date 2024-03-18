
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
