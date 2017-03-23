CREATE PROCEDURE [dbo].[spLoadTeamMembers]
	
AS
Begin
	Set nocount on;

	Insert into tblTeamMember
	(
		[Key],
		[Name],
		[EmailAddress]
	)
	Values
		('98A2F6D1-7031-4894-AD89-A2868CC3250B','Kevin Mack','kevinmackdev@outlook.com')
	
End
