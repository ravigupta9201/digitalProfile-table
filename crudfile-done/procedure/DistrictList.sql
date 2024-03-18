create procedure usp_AddDistrictList
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@DistrictName		        nvarchar(508)=null,
@ProvinceName		        nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DId		                  int=null output ,
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

declare @TranName varchar(40) = 'DistrictList'; 
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
	 insert into dbo.tbl_DistrictList(OrderNo,Code,DistrictName,ProvinceName,Status,CreateBy)
	     values(@OrderNo,@Code,@DistrictName,@ProvinceName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @DId =(select IDENT_CURRENT('tbl_DistrictList')); 
	 SET @ResponseMSG='DistrictList Save Successfully';   
	 set @IsSuccess=1;   
	 end
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate DistrictList Data ';  
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

create procedure usp_UpdateDistrictList
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@DistrictName		        nvarchar(508)=null,
@ProvinceName		        nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DId		                  int ,
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

declare @TranName varchar(40) = 'DistrictList'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_DistrictList set OrderNo=@OrderNo,Code=@Code,DistrictName=@DistrictName,ProvinceName=@ProvinceName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where DId=@DId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='DistrictList Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate DistrictList Data ' ;  
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

create procedure usp_DelDistrictListById
(
@DId		               int , 
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

declare @TranName varchar(40) = 'DistrictList'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_DistrictList(nolock) TR  where TR.DId=@DId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='DistrictList Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. DistrictList was already in used. ' ;  
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

create procedure usp_GetAllDistrictList
(
-- @DId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DId,TR.OrderNo,TR.Code,TR.DistrictName,TR.ProvinceName,TR.Status from dbo.tbl_DistrictList(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetDistrictListById
(
@DId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.DId,TR.OrderNo,TR.Code,TR.DistrictName,TR.ProvinceName,TR.Status from dbo.tbl_DistrictList(nolock) TR  where TR.DId=@DId ; 
END;   

 GO 

