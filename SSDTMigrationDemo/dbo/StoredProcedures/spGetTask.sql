CREATE PROCEDURE [dbo].[spGetTask]
	@ID uniqueidentifier
AS
Begin

	Set nocount on;



	Select
		T.[Key] as TaskKey,
		T.Name as TaskName,
		T.Description as TaskDescription,
		T.DueDate as TaskDueDate,
		TM.Name as TeamMember
	From tblTask as T
		Inner join tblTeamMember as TM
			on T.TeamMemberKey = TM.[Key]
	Where T.[Key] = @ID
End