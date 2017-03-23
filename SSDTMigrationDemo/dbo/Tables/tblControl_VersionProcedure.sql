CREATE TABLE [dbo].[tblControl_VersionProcedure] (
    [Key]                 UNIQUEIDENTIFIER NOT NULL,
    [VersionKey]          UNIQUEIDENTIFIER NULL,
    [StoredProcedureName] NVARCHAR (50)    NULL,
    [WasExecuted]         BIT              NULL DEFAULT 0,
    [Sequence]            INT              NULL,
    CONSTRAINT [PK_tblControl_VersionProcedure] PRIMARY KEY CLUSTERED ([Key] ASC)
);

