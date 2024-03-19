create table tbl_NaturalDisasters
(
DisastersId                int not null identity(1,1) primary key,	
OrderNo             int not null,

DisastersName          nvarchar(254),
Status              bit not null,

CreateBy             int not null constraint fk_NaturalDisasters_CreateBy foreign key references tbl_User(UserId),
ModifyBy                 int null constraint fk_NaturalDisasters_ModifyBy foreign key references tbl_User(UserId),
UpdateLogDateTime        datetime,
LogDateTime              datetime not null default current_timestamp
)
 
GO



INSERT INTO tbl_NaturalDisasters (OrderNo, DisastersName, Status , CreateBy, UpdateLogDateTime)
VALUES 
(1,  N'बाढी', 1, 1, GETDATE()),
(2,  N'पहिरो ', 1 , 1, GETDATE()),
(3,  N'आगजनी', 1 , 1, GETDATE()),
(4,  N'महामारी', 1 , 1, GETDATE()),
(5,  N'हावाहुरी', 1 , 1, GETDATE()),
(6,  N'चट्याङ्ग', 1 , 1, GETDATE()),
(7,  N'नदी कटान', 1, 1, GETDATE()),
(8,  N'खडेरी ', 1 , 1, GETDATE()),
(9,  N'शीत लहर ', 1 , 1, GETDATE()),
(10,  N'भुकम्प ', 1 , 1, GETDATE()),
(11,  N'असिना', 1 , 1, GETDATE()),
(12,  N'अन्य...', 1 , 1, GETDATE()),
(13,  N'प्रकोपको खतरा छैन', 1 , 1, GETDATE());

GO


alter table tbl_NaturalDisasters
Add IsDefault bit not null default 0



USE [Academic]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllNaturalDisasters]    Script Date: 3/19/2024 6:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[usp_GetAllNaturalDisasters]
(
-- @DisastersId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DisastersId,TR.OrderNo,TR.DisastersName,TR.Status, TR.IsDefault from dbo.tbl_NaturalDisasters(nolock) TR   ; 
END;   





update tbl_NaturalDisasters
set  IsDefault = 1 
where DisastersId < 17

