/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

Declare @executionLogKey int
Set @executionLogKey = (Select Max([Id]) from tblControl_ExecutionLog)

Declare @ProceduresToExecute table
(
	ID int identity(1,1),
	ProcedureKey uniqueidentifier,
	ProcedureName nvarchar(50),
	VersionSequence int,
	ProcedureSequence int
)

insert into @proceduresToExecute (ProcedureKey,ProcedureName,VersionSequence,ProcedureSequence)
Select
	CVP.[Key],
	CVP.StoredProcedureName,
	CV.VersionNumber,
	CVP.[Sequence]
From tblControl_Version CV
	INNER JOIN tblControl_VersionProcedure CVP
		on CV.[Key] = CVP.VersionKey
Where CVP.WasExecuted = 0
Order by CV.VersionNumber asc, CVP.[Sequence] asc

Declare @ProcCount int;
Set @ProcCount = (Select Count(ProcedureKey) from @ProceduresToExecute)

declare @counter int;
Set @counter = 1;

Declare @noErrors bit;
Set @noErrors = 1;

Declare @message nvarchar(MAX);

While (@counter <= @ProcCount) AND (@noErrors = 1)
Begin

	Declare @ProcedureName nvarchar(50)
	Set @ProcedureName = (Select ProcedureName from @ProceduresToExecute where ID = @counter)
	Declare @ProcedureKey uniqueidentifier
	Set @ProcedureKey = (Select ProcedureKey from @ProceduresToExecute where ID = @counter)

	if (@ProcedureName is not null)
	Begin
		Begin try
			Execute @procedureName

			Set @counter = @counter + 1;

			Update tblControl_VersionProcedure Set WasExecuted = 1 where [Key] = @ProcedureKey
		End try
		begin catch
			set @noErrors = 0;
			Set @message = ERROR_MESSAGE();
		end catch
	End
End

if @noErrors = 1
Begin
	Set @message = 'Completed Successfully'
End

Update tblControl_ExecutionLog
	Set [Message] = @message
Where Id = @executionLogKey