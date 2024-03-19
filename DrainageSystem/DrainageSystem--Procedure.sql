create procedure usp_AddDrainageSystem
(
@OrderNo		             int,
@RiverOrCreek		        nvarchar(508)=null,
@OnRoad		              nvarchar(508)=null,
@PitDug		              nvarchar(508)=null,
@Karesabari		          nvarchar(508)=null,
@Other		               nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DrainageSystemId		     int=null output ,
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

declare @TranName varchar(40) = 'DrainageSystem'; 
 BEGIN TRY 

    
	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_DrainageSystem(nolock)P;
	end
	 if exists(select * from tbl_DrainageSystem(nolock) C where C.RiverOrCreek=@RiverOrCreek)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@RiverOrCreek+' )  was already exists.';
		end
		else

	begin


	 begin transaction @TranName; 
	 insert into dbo.tbl_DrainageSystem(OrderNo,RiverOrCreek,OnRoad,PitDug,Karesabari,Other,Status,CreateBy)
	     values(@OrderNo,@RiverOrCreek,@OnRoad,@PitDug,@Karesabari,@Other,@Status,@UserId)
	 commit transaction @TranName; 
     set @DrainageSystemId =(select IDENT_CURRENT('tbl_DrainageSystem')); 
	 SET @ResponseMSG='DrainageSystem Save Successfully';   
	 set @IsSuccess=1;   
     end
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate DrainageSystem Data ';  
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

create procedure usp_UpdateDrainageSystem
(
@OrderNo		             int,
@RiverOrCreek		        nvarchar(508)=null,
@OnRoad		              nvarchar(508)=null,
@PitDug		              nvarchar(508)=null,
@Karesabari		          nvarchar(508)=null,
@Other		               nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@DrainageSystemId		     int ,
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

declare @TranName varchar(40) = 'DrainageSystem'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_DrainageSystem set OrderNo=@OrderNo,RiverOrCreek=@RiverOrCreek,OnRoad=@OnRoad,PitDug=@PitDug,Karesabari=@Karesabari,Other=@Other,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where DrainageSystemId=@DrainageSystemId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='DrainageSystem Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate DrainageSystem Data ' ;  
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

create procedure usp_DelDrainageSystemById
(
@DrainageSystemId		               int , 
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

declare @TranName varchar(40) = 'DrainageSystem'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_DrainageSystem(nolock) TR  where TR.DrainageSystemId=@DrainageSystemId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='DrainageSystem Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. DrainageSystem was already in used. ' ;  
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

create procedure usp_GetAllDrainageSystem
(
-- @DrainageSystemId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.DrainageSystemId,TR.OrderNo,TR.RiverOrCreek,TR.OnRoad,TR.PitDug,TR.Karesabari,TR.Other,TR.Status from dbo.tbl_DrainageSystem(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetDrainageSystemById
(
@DrainageSystemId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.DrainageSystemId,TR.OrderNo,TR.RiverOrCreek,TR.OnRoad,TR.PitDug,TR.Karesabari,TR.Other,TR.Status from dbo.tbl_DrainageSystem(nolock) TR  where TR.DrainageSystemId=@DrainageSystemId ; 
END;   

 GO 

