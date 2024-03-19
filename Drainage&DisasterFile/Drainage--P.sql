create procedure usp_AddSurfaceDrainageSystem
(
@OrderNo		             int,
@DrainageSystemName		  nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DSId		                 int=null output ,
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

declare @TranName varchar(40) = 'SurfaceDrainageSystem'; 
 BEGIN TRY 

	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_SurfaceDrainageSystem(nolock)P;
	end
	 if exists(select * from tbl_SurfaceDrainageSystem(nolock) C where C.DrainageSystemName=@DrainageSystemName)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@DrainageSystemName+' )  was already exists.';
		end
		else

	begin


	 begin transaction @TranName; 
	 insert into dbo.tbl_SurfaceDrainageSystem(OrderNo,DrainageSystemName,Status,CreateBy)
	     values(@OrderNo,@DrainageSystemName,@Status,@UserId)
	 commit transaction @TranName; 
	  set @DSId =(select IDENT_CURRENT('tbl_SurfaceDrainageSystem'));
	 SET @ResponseMSG='SurfaceDrainageSystem Save Successfully';   
	 set @IsSuccess=1;  

	 end 
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate SurfaceDrainageSystem Data ';  
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

create procedure usp_UpdateSurfaceDrainageSystem
(
@OrderNo		             int,
@DrainageSystemName		  nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DSId		                 int ,
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

declare @TranName varchar(40) = 'SurfaceDrainageSystem'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_SurfaceDrainageSystem set OrderNo=@OrderNo,DrainageSystemName=@DrainageSystemName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where DSId=@DSId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='SurfaceDrainageSystem Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate SurfaceDrainageSystem Data ' ;  
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

create procedure usp_DelSurfaceDrainageSystemById
(
@DSId		               int , 
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

declare @TranName varchar(40) = 'SurfaceDrainageSystem'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_SurfaceDrainageSystem(nolock) TR  where TR.DSId=@DSId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='SurfaceDrainageSystem Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. SurfaceDrainageSystem was already in used. ' ;  
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

create procedure usp_GetAllSurfaceDrainageSystem
(
-- @DSId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DSId,TR.OrderNo,TR.DrainageSystemName,TR.Status from dbo.tbl_SurfaceDrainageSystem(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetSurfaceDrainageSystemById
(
@DSId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.DSId,TR.OrderNo,TR.DrainageSystemName,TR.Status from dbo.tbl_SurfaceDrainageSystem(nolock) TR  where TR.DSId=@DSId ; 
END;   

 GO 

