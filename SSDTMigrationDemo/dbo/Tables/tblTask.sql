CREATE TABLE [dbo].[tblTask] (
    [Key]         UNIQUEIDENTIFIER NOT NULL,
    [Name]        NVARCHAR (100)    NULL,
    [Description] NVARCHAR (100)   NULL,
    [DueDate]     DATETIME         NULL,
    [TeamMemberKey] UNIQUEIDENTIFIER NOT NULL, 
    CONSTRAINT [PK_tblTask] PRIMARY KEY CLUSTERED ([Key] ASC)
);

