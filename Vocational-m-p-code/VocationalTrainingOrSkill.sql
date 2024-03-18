create procedure usp_AddVocationalTrainingOrSkill
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@TrainingSubjectName		 nvarchar(508)=null,
@TrainingAreasName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@VocationalId		         int=null output ,
@ResponseMSG		          nvarchar(254)='Invalid' output ,
@IsSuccess		             bit=0 output, 
@ErrorNumber		           int=0 output
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

declare @BranchId int;
select top 1 @BranchId=U.BranchId from tbl_User(nolock) U where U.UserId=@UserId; 

declare @TranName varchar(40) = 'VocationalTrainingOrSkill'; 
 BEGIN TRY 

	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_VocationalTrainingOrSkill(nolock)P;
	end
	 if exists(select * from tbl_VocationalTrainingOrSkill(nolock) C where C.Code=@Code)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@Code+' )  was already exists.';
		end
		else

	begin

	 begin transaction @TranName; 
	 insert into dbo.tbl_VocationalTrainingOrSkill(OrderNo,Code,TrainingSubjectName,TrainingAreasName,Status,CreateBy)
	     values(@OrderNo,@Code,@TrainingSubjectName,@TrainingAreasName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @VocationalId =(select IDENT_CURRENT('tbl_VocationalTrainingOrSkill')); 
	 SET @ResponseMSG='VocationalTrainingOrSkill Save Successfully';   
	 set @IsSuccess=1;   
	end
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate VocationalTrainingOrSkill Data ';  
	 end  
	 else  
	 begin 
		     exec usp_ErrorLog @UserId; 
		     set @ErrorNumber=(select IDENT_CURRENT('tbl_SQLErrorLog')); 
		     SET @ResponseMSG=ERROR_MESSAGE()    
	 end 
 END CATCH   

 END;   

 GO 

create procedure usp_UpdateVocationalTrainingOrSkill
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@TrainingSubjectName		 nvarchar(508)=null,
@TrainingAreasName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@VocationalId		         int ,
@ResponseMSG		          nvarchar(254)='Invalid' output ,
@IsSuccess		             bit=0 output, 
@ErrorNumber		           int=0 output
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

declare @BranchId int;
select top 1 @BranchId=U.BranchId from tbl_User(nolock) U where U.UserId=@UserId; 

declare @TranName varchar(40) = 'VocationalTrainingOrSkill'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_VocationalTrainingOrSkill set OrderNo=@OrderNo,Code=@Code,TrainingSubjectName=@TrainingSubjectName,TrainingAreasName=@TrainingAreasName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where VocationalId=@VocationalId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='VocationalTrainingOrSkill Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate VocationalTrainingOrSkill Data ' ;  
	 end  
	 else  
	 begin 
		     exec usp_ErrorLog @UserId; 
		     set @ErrorNumber=(select IDENT_CURRENT('tbl_SQLErrorLog')); 
		     SET @ResponseMSG=ERROR_MESSAGE()    
	 end 
 END CATCH   

 END;   

 GO 

create procedure usp_DelVocationalTrainingOrSkillById
(
@VocationalId		               int , 
@UserId		               int , 
@EntityId		             int=null ,
@ResponseMSG		          nvarchar(254)='Invalid' output ,
@IsSuccess		             bit=0 output, 
@ErrorNumber		           int=0 output
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

declare @TranName varchar(40) = 'VocationalTrainingOrSkill'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_VocationalTrainingOrSkill(nolock) TR  where TR.VocationalId=@VocationalId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='VocationalTrainingOrSkill Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. VocationalTrainingOrSkill was already in used. ' ;  
	 end  
	 else  
	 begin 
		     exec usp_ErrorLog @UserId; 
		     set @ErrorNumber=(select IDENT_CURRENT('tbl_SQLErrorLog')); 
		     SET @ResponseMSG=ERROR_MESSAGE()    
	 end 
 END CATCH   

 END;   

 GO 

create procedure usp_GetAllVocationalTrainingOrSkill
(
-- @VocationalId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.VocationalId,TR.OrderNo,TR.Code,TR.TrainingSubjectName,TR.TrainingAreasName,TR.Status from dbo.tbl_VocationalTrainingOrSkill(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetVocationalTrainingOrSkillById
(
@VocationalId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.VocationalId,TR.OrderNo,TR.Code,TR.TrainingSubjectName,TR.TrainingAreasName,TR.Status from dbo.tbl_VocationalTrainingOrSkill(nolock) TR  where TR.VocationalId=@VocationalId ; 
END;   

 GO 

