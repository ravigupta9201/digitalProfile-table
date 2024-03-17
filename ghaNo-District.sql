
create table tbl_District
(
DId                int not null identity(1,1) primary key,	
Code                nvarchar(254),
DistrictName          nvarchar(254),
ProvinceName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_District_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_District_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO

INSERT INTO tbl_District (Code, DistrictName, ProvinceName , Status , CreateBy, UpdateLogDateTime)
VALUES 
('DS001' , N'ताप्लेजुङ', N'प्रदेश नं. १',1, 1, GETDATE()),
('DS002' , N'पाँचथर', N'प्रदेश नं. १', 1 , 1, GETDATE()),
GO