/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- Check for control table
-- Check for version procedure table


Insert into tblControl_ExecutionLog (ExecuteDate) values (GETDATE())

MERGE dbo.tblControl_Version AS target  
    Using (
		Values ('C7EC51B4-DB3F-4025-BB0E-2A97ED4D7E76','1','Release 1.0.0')
		) AS source ([Key],VersionNumber,VersionName)  
    ON (target.[Key] = source.[Key])  
    WHEN MATCHED THEN   
        UPDATE SET VersionNumber = source.VersionNumber, VersionName = source.VersionName
WHEN NOT MATCHED THEN  
    INSERT ([Key],VersionNumber,VersionName)  
    VALUES (source.[Key],source.VersionNumber,source.VersionName)  ;


MERGE dbo.tblControl_VersionProcedure AS target  
    USING (
		Values ('5FEF9910-C404-4532-8DCE-745D15FCBD8E','C7EC51B4-DB3F-4025-BB0E-2A97ED4D7E76','spLoadStatus',1),
		('AF8EAEC1-BFC4-42C1-99D2-038F2CC7355C','C7EC51B4-DB3F-4025-BB0E-2A97ED4D7E76','spLoadTeamMembers',2)
	) AS source ([Key],VersionKey,StoredProcedureName,Sequence)  
    ON (target.[Key] = source.[Key])  
    WHEN MATCHED THEN   
        UPDATE SET StoredProcedureName = source.StoredProcedureName, [Sequence] = source.[Sequence]
WHEN NOT MATCHED THEN  
    INSERT ([Key],VersionKey,StoredProcedureName,[Sequence])  
    VALUES (source.[Key],source.VersionKey,source.StoredProcedureName,source.[sequence]) ;


	--predeployment