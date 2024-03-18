create table tbl_DistrictList
(
DId                int not null identity(1,1) primary key,	
OrderNo             int not null,
Code                nvarchar(254),
DistrictName          nvarchar(254),
ProvinceName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_DistrictList_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_DistrictList_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO




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




create table tbl_Country
(
CountryId                int not null identity(1,1) primary key,	
OrderNo             int not null,
Code                nvarchar(254),
CountryName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_Country_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_Country_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO



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





create table tbl_VocationalTrainingOrSkill 
(
VocationalId                int not null identity(1,1) primary key,	
OrderNo                     int not null,
Code                        nvarchar(254),
TrainingSubjectName         nvarchar(254), 
TrainingAreasName           nvarchar(254), 

Status              bit not null,

CreateBy             int not null constraint fk_VocationalTrainingOrSkill_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_VocationalTrainingOrSkill_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO
