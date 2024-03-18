create procedure usp_AddMarriedStatus
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@MarriedStatusName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@MarriedStatusId		      int=null output ,
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

declare @TranName varchar(40) = 'MarriedStatus'; 
 BEGIN TRY 

    if @OrderNo = 0
		begin
			select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_MarriedStatus(nolock)P;
		end
		if exists(select * from tbl_MarriedStatus(nolock) C where C.Code=@Code)
			begin
				set @IsSuccess=0;
				set @ResponseMSG=' ( '+@Code+' )  was already exists.';
			end
			else
	begin

	 begin transaction @TranName; 
	 insert into dbo.tbl_MarriedStatus(OrderNo,Code,MarriedStatusName,Status,CreateBy)
	     values(@OrderNo,@Code,@MarriedStatusName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @MarriedStatusId =(select IDENT_CURRENT('tbl_MarriedStatus')); 
	 SET @ResponseMSG='MarriedStatus Save Successfully';   
	 set @IsSuccess=1; 
	end  
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate MarriedStatus Data ';  
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

create procedure usp_UpdateMarriedStatus
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@MarriedStatusName		   nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@MarriedStatusId		      int ,
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

declare @TranName varchar(40) = 'MarriedStatus'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_MarriedStatus set OrderNo=@OrderNo,Code=@Code,MarriedStatusName=@MarriedStatusName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where MarriedStatusId=@MarriedStatusId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='MarriedStatus Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate MarriedStatus Data ' ;  
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

create procedure usp_DelMarriedStatusById
(
@MarriedStatusId		               int , 
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

declare @TranName varchar(40) = 'MarriedStatus'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_MarriedStatus(nolock) TR  where TR.MarriedStatusId=@MarriedStatusId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='MarriedStatus Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. MarriedStatus was already in used. ' ;  
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

create procedure usp_GetAllMarriedStatus
(
-- @MarriedStatusId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.MarriedStatusId,TR.OrderNo,TR.Code,TR.MarriedStatusName,TR.Status from dbo.tbl_MarriedStatus(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetMarriedStatusById
(
@MarriedStatusId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.MarriedStatusId,TR.OrderNo,TR.Code,TR.MarriedStatusName,TR.Status from dbo.tbl_MarriedStatus(nolock) TR  where TR.MarriedStatusId=@MarriedStatusId ; 
END;   

 GO 

