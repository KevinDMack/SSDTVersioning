CREATE TABLE [dbo].[tblControl_Version] (
    [Key]           UNIQUEIDENTIFIER NOT NULL,
    [VersionNumber] INT              NULL,
    [VersionName]    NVARCHAR (50)    NULL,
    CONSTRAINT [PK_tblControl_Version] PRIMARY KEY CLUSTERED ([Key] ASC)
);

