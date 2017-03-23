CREATE TABLE [dbo].[tblControl_ExecutionLog]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1), 
    [ExecuteDate] DATETIME NOT NULL, 
    [Message] NVARCHAR(MAX) NULL
)
