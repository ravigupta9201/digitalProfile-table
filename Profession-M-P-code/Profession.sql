create procedure usp_AddProfession
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@ProfessionName		      nvarchar(508)=null,
@className		           nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@ProfessionId		         int=null output ,
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

declare @TranName varchar(40) = 'Profession'; 
 BEGIN TRY 

	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_Profession(nolock)P;
	end
	 if exists(select * from tbl_Profession(nolock) C where C.Code=@Code)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@Code+' )  was already exists.';
		end
		else

	begin

	 begin transaction @TranName; 
	 insert into dbo.tbl_Profession(OrderNo,Code,ProfessionName,className,Status,CreateBy)
	     values(@OrderNo,@Code,@ProfessionName,@className,@Status,@UserId)
	 commit transaction @TranName; 
	 set @ProfessionId =(select IDENT_CURRENT('tbl_Profession')); 
	 SET @ResponseMSG='Profession Save Successfully';   
	 set @IsSuccess=1; 
	end

 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate Profession Data ';  
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

create procedure usp_UpdateProfession
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@ProfessionName		      nvarchar(508)=null,
@className		           nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@ProfessionId		         int ,
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

declare @TranName varchar(40) = 'Profession'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_Profession set OrderNo=@OrderNo,Code=@Code,ProfessionName=@ProfessionName,className=@className,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where ProfessionId=@ProfessionId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='Profession Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate Profession Data ' ;  
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

create procedure usp_DelProfessionById
(
@ProfessionId		               int , 
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

declare @TranName varchar(40) = 'Profession'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_Profession(nolock) TR  where TR.ProfessionId=@ProfessionId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='Profession Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. Profession was already in used. ' ;  
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

create procedure usp_GetAllProfession
(
-- @ProfessionId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.ProfessionId,TR.OrderNo,TR.Code,TR.ProfessionName,TR.className,TR.Status from dbo.tbl_Profession(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetProfessionById
(
@ProfessionId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.ProfessionId,TR.OrderNo,TR.Code,TR.ProfessionName,TR.className,TR.Status from dbo.tbl_Profession(nolock) TR  where TR.ProfessionId=@ProfessionId ; 
END;   

 GO 

