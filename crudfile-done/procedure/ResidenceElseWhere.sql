create procedure usp_AddResidenceElseWhere
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@MaritalStatusName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@ResidenceElseWhereId		  int=null output ,
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

declare @TranName varchar(40) = 'ResidenceElseWhere'; 
 BEGIN TRY 

	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_DistrictList(nolock)P;
	end
	 if exists(select * from tbl_DistrictList(nolock) C where C.Code=@Code)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@Code+' )  was already exists.';
		end
		else

	begin
	 begin transaction @TranName; 
	 insert into dbo.tbl_ResidenceElseWhere(OrderNo,Code,MaritalStatusName,Status,CreateBy)
	     values(@OrderNo,@Code,@MaritalStatusName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @ResidenceElseWhereId =(select IDENT_CURRENT('tbl_ResidenceElseWhere')); 
	 SET @ResponseMSG='ResidenceElseWhere Save Successfully';   
	 set @IsSuccess=1;   
	end
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate ResidenceElseWhere Data ';  
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

create procedure usp_UpdateResidenceElseWhere
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@MaritalStatusName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@ResidenceElseWhereId		  int ,
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

declare @TranName varchar(40) = 'ResidenceElseWhere'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_ResidenceElseWhere set OrderNo=@OrderNo,Code=@Code,MaritalStatusName=@MaritalStatusName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where ResidenceElseWhereId=@ResidenceElseWhereId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='ResidenceElseWhere Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate ResidenceElseWhere Data ' ;  
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

create procedure usp_DelResidenceElseWhereById
(
@ResidenceElseWhereId		               int , 
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

declare @TranName varchar(40) = 'ResidenceElseWhere'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_ResidenceElseWhere(nolock) TR  where TR.ResidenceElseWhereId=@ResidenceElseWhereId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='ResidenceElseWhere Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. ResidenceElseWhere was already in used. ' ;  
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

create procedure usp_GetAllResidenceElseWhere
(
-- @ResidenceElseWhereId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.ResidenceElseWhereId,TR.OrderNo,TR.Code,TR.MaritalStatusName,TR.Status from dbo.tbl_ResidenceElseWhere(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetResidenceElseWhereById
(
@ResidenceElseWhereId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.ResidenceElseWhereId,TR.OrderNo,TR.Code,TR.MaritalStatusName,TR.Status from dbo.tbl_ResidenceElseWhere(nolock) TR  where TR.ResidenceElseWhereId=@ResidenceElseWhereId ; 
END;   

 GO 

