CREATE TABLE [dbo].[tblTaskNotes] (
    [Key]       UNIQUEIDENTIFIER NOT NULL,
    [TaskKey]   UNIQUEIDENTIFIER NULL,
    [Note]      NVARCHAR (500)   NULL,
    [DateAdded] DATETIME         NULL,
    CONSTRAINT [PK_tblTaskNotes] PRIMARY KEY CLUSTERED ([Key] ASC)
);

