
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
