create procedure usp_AddNaturalDisasters
(
@OrderNo		             int,
@DisastersName		       nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DisastersId		          int=null output ,
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

declare @TranName varchar(40) = 'NaturalDisasters'; 
 BEGIN TRY 

	
	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_NaturalDisasters(nolock)P;
	end
	 if exists(select * from tbl_NaturalDisasters(nolock) C where C.DisastersName=@DisastersName)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@DisastersName+' )  was already exists.';
		end
		else

	begin


	 begin transaction @TranName; 
	 insert into dbo.tbl_NaturalDisasters(OrderNo,DisastersName,Status,CreateBy)
	     values(@OrderNo,@DisastersName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @DisastersId =(select IDENT_CURRENT('tbl_NaturalDisasters')); 
	 SET @ResponseMSG='NaturalDisasters Save Successfully';   
	 set @IsSuccess=1;   
	 end
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate NaturalDisasters Data ';  
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

create procedure usp_UpdateNaturalDisasters
(
@OrderNo		             int,
@DisastersName		       nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DisastersId		          int ,
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

declare @TranName varchar(40) = 'NaturalDisasters'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_NaturalDisasters set OrderNo=@OrderNo,DisastersName=@DisastersName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where DisastersId=@DisastersId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='NaturalDisasters Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate NaturalDisasters Data ' ;  
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

create procedure usp_DelNaturalDisastersById
(
@DisastersId		               int , 
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

declare @TranName varchar(40) = 'NaturalDisasters'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_NaturalDisasters(nolock) TR  where TR.DisastersId=@DisastersId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='NaturalDisasters Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. NaturalDisasters was already in used. ' ;  
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

create procedure usp_GetAllNaturalDisasters
(
-- @DisastersId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DisastersId,TR.OrderNo,TR.DisastersName,TR.Status from dbo.tbl_NaturalDisasters(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetNaturalDisastersById
(
@DisastersId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.DisastersId,TR.OrderNo,TR.DisastersName,TR.Status from dbo.tbl_NaturalDisasters(nolock) TR  where TR.DisastersId=@DisastersId ; 
END;   

 GO 

