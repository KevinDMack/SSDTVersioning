CREATE PROCEDURE [dbo].[spLoadStatus]
	
AS
Begin
	Set nocount on;




	Insert into tblTaskStatus
	(
		[Key],
		CodeName,
		DisplayName
	)
	Values
		('4393742A-A894-47F5-877D-D2D71ABBB913','NotStarted','Not Started'),
		('7E9C8336-E05A-4FBE-A05A-A7E8A0C692D3','InProgress','In Progress'),
		('F32A7867-B04C-4AC9-AB0B-D25332752F09','Completed','Completed'),
		('1CDC64A0-2BB1-4D73-B1D2-F3843939A31C','Blocked','Blocked'),
		('E84731AD-0B92-4B1D-97C4-5DC983346E0F','Cancelled','Cancelled')
	
End
