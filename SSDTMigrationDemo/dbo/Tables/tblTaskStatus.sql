CREATE TABLE [dbo].[tblTaskStatus] (
    [Key]         UNIQUEIDENTIFIER NOT NULL,
    [CodeName]    NVARCHAR (50)    NULL,
    [DisplayName] NVARCHAR (50)    NULL,
    CONSTRAINT [PK_tblTaskStatus] PRIMARY KEY CLUSTERED ([Key] ASC)
);

