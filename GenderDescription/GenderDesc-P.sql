
create procedure usp_AddGenderDescription
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@GenderName		          nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@GDId		                 int=null output ,
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

declare @TranName varchar(40) = 'GenderDescription'; 
 BEGIN TRY
 if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_GenderDescription(nolock)P;
	end
	 if exists(select * from tbl_GenderDescription(nolock) C where C.Code=@Code)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@Code+' )  was already exists.';
		end
		else
		begin
	 begin transaction @TranName; 
	 insert into dbo.tbl_GenderDescription(OrderNo,Code,GenderName,Status,CreateBy)
	     values(@OrderNo,@Code,@GenderName,@Status,@UserId)
	 commit transaction @TranName; 
	 SET @ResponseMSG='GenderDescription Save Successfully';   
	 set @IsSuccess=1;  
	 END
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate GenderDescription Data ';  
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

create procedure usp_UpdateGenderDescription
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@GenderName		          nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@GDId		                 int ,
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

declare @TranName varchar(40) = 'GenderDescription'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_GenderDescription set OrderNo=@OrderNo,Code=@Code,GenderName=@GenderName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where GDId=@GDId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='GenderDescription Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate GenderDescription Data ' ;  
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

create procedure usp_DelGenderDescriptionById
(
@GDId		               int , 
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

declare @TranName varchar(40) = 'GenderDescription'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_GenderDescription(nolock) TR  where TR.GDId=@GDId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='GenderDescription Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. GenderDescription was already in used. ' ;  
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

create procedure usp_GetAllGenderDescription
(
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.GDId,TR.OrderNo,TR.Code,TR.GenderName,TR.Status from dbo.tbl_GenderDescription(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetGenderDescriptionById
(
@GDId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.GDId,TR.OrderNo,TR.Code,TR.GenderName,TR.Status from dbo.tbl_GenderDescription(nolock) TR  where TR.GDId=@GDId ; 
END;   

 GO 

