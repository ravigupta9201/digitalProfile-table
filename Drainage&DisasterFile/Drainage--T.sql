create table tbl_SurfaceDrainageSystem
(
DSId                int not null identity(1,1) primary key,	
OrderNo             int not null,

DrainageSystemName  nvarchar(254),

Status              bit not null,

CreateBy             int not null constraint fk_SurfaceDrainageSystem_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_SurfaceDrainageSystem_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO




INSERT INTO tbl_SurfaceDrainageSystem (OrderNo, DrainageSystemName, Status , CreateBy, UpdateLogDateTime)
VALUES 
(1,  N'नदी वा खोल्सामा ', 1, 1, GETDATE()),
(2,  N'सडकमा', 1 , 1, GETDATE()),
(3,  N'आफ्नै घर कम्पाउण्ड भित्र खनेको खाल्डोमा', 1 , 1, GETDATE()),
(4,  N'करेसाबारीमा', 1 , 1, GETDATE()),
(5,  N'अन्य  ', 1 , 1, GETDATE());

GO





alter table tbl_SurfaceDrainageSystem
Add IsDefault bit not null default 0



update tbl_SurfaceDrainageSystem
set IsDefault = 1 
where DSId<12
GO




USE [Academic]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllSurfaceDrainageSystem]    Script Date: 3/19/2024 4:11:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[usp_GetAllSurfaceDrainageSystem]
(
-- @DSId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DSId,TR.OrderNo,TR.DrainageSystemName,TR.Status, TR.IsDefault from dbo.tbl_SurfaceDrainageSystem(nolock) TR   ; 
END;   

