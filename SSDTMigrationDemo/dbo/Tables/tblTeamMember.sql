CREATE TABLE [dbo].[tblTeamMember] (
    [Key]          UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NULL,
    [EmailAddress] NVARCHAR (300)   NULL,
    CONSTRAINT [PK_tblTeamMember] PRIMARY KEY CLUSTERED ([Key] ASC)
);

