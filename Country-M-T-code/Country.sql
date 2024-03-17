create procedure usp_AddCountry
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@CountryName		         nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@CountryId		            int=null output ,
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

declare @TranName varchar(40) = 'Country'; 
 BEGIN TRY 

	if @OrderNo = 0
 	begin
		select OrderNo	=isnull(max(OrderNo),0)+1 from tbl_Country(nolock)P;
	end
	 if exists(select * from tbl_Country(nolock) C where C.Code=@Code)
		begin
			set @IsSuccess=0;
			set @ResponseMSG=' ( '+@Code+' )  was already exists.';
		end
		else

	begin

	 begin transaction @TranName; 
	 insert into dbo.tbl_Country(OrderNo,Code,CountryName,Status,CreateBy)
	     values(@OrderNo,@Code,@CountryName,@Status,@UserId)
	 commit transaction @TranName; 
	 set @CountryId =(select IDENT_CURRENT('tbl_Country')); 
	 SET @ResponseMSG='Country Save Successfully';   
	 set @IsSuccess=1;   
	end 
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate Country Data ';  
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

create procedure usp_UpdateCountry
(
@OrderNo		             int,
@Code		                nvarchar(508)=null,
@CountryName		         nvarchar(508)=null,
@Status		              bit,
@UserId		               int , 
@EntityId		             int=null ,
@CountryId		            int ,
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

declare @TranName varchar(40) = 'Country'; 
 BEGIN TRY 
	 begin transaction @TranName; 
	 update top (1) dbo.tbl_Country set OrderNo=@OrderNo,Code=@Code,CountryName=@CountryName,Status=@Status,ModifyBy=@UserId,UpdateLogDateTime=getdate() where CountryId=@CountryId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='Country Update Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() in (2601,2627) 
	 begin  
		     set @ResponseMSG='Duplicate Country Data ' ;  
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

create procedure usp_DelCountryById
(
@CountryId		               int , 
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

declare @TranName varchar(40) = 'Country'; 
 BEGIN TRY 
	 begin transaction @TranName; 
		 delete TR from dbo.tbl_Country(nolock) TR  where TR.CountryId=@CountryId ; 
	 commit transaction @TranName; 
	 SET @ResponseMSG='Country Deleted Successfully';   
	 set @IsSuccess=1;   
 END TRY  
 BEGIN CATCH  
	 rollback transaction @TranName;    
	 if ERROR_NUMBER() = 547 
	 begin  
		     set @ResponseMSG='Can not delete. Country was already in used. ' ;  
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

create procedure usp_GetAllCountry
(
-- @CountryId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select TR.CountryId,TR.OrderNo,TR.Code,TR.CountryName,TR.Status from dbo.tbl_Country(nolock) TR   ; 
END;   

 GO 

create procedure usp_GetCountryById
(
@CountryId		               int , 
@UserId		               int , 
@EntityId		             int=null 
)
AS
BEGIN
SET NOCOUNT ON ;
EXEC sp_set_session_context @key=N'UserId', @value=@UserId; 

 select top (1) TR.CountryId,TR.OrderNo,TR.Code,TR.CountryName,TR.Status from dbo.tbl_Country(nolock) TR  where TR.CountryId=@CountryId ; 
END;   

 GO 

