If Not Exists(Select * From sys.databases Where name = 'ExamsDb')
	Create Database ExamsDb
Go
Use ExamsDb
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'UniversityTypes')
	Create Table UniversityTypes
	(
		TypeId Int Identity Primary Key,
		TypeName Varchar(50) Unique
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Universities')
	Create Table Universities
	(
		UniversityId Int Identity Primary Key,
		UniversityName Varchar(50) Not Null Unique,
		UniversityAddress Varchar(150) Not Null,
		UniversityType Int,
		Constraint FK_Universities_UniversityId Foreign Key(UniversityId) References UniversityTypes(TypeId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Faculties')
	Create Table Faculties
	(
		FacultyId Int Identity Primary Key,
		FacultyName Varchar(50) Not Null,
		FacultyAddress Varchar(150) Not Null,
		FacultyPhoneNumber Varchar(20) Not Null,
		FacultyWebsite Varchar(75) Not Null,
		UniversityId Int,
		Constraint FK_Faculties_FacultyId Foreign Key(UniversityId) References Universities(UniversityId),
		Constraint CK_Faculties_Phone Check(FacultyPhoneNumber Like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Departments')
	Create Table Departments
	(
		DepartmentId Int Identity Primary Key,
		DepartmentName Varchar(50),
		FacultyId Int,
		Constraint FK_Departments_FacultyId Foreign Key(FacultyId) References Faculties(FacultyId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Classes')
	Create Table Classes
	(
		ClassId Int Identity Primary Key,
		ClassName Varchar(50) Not Null,
		NumberOfStudents Int Default 0,
		NumberOfFemaleStudents Int Default 0,
		NumberOfMaleStudents Int Default 0,
		DepartmentId Int,
		Constraint FK_Classes_DepartmentId Foreign Key(DepartmentId) References Departments(DepartmentId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'CourseTypes')
	Create Table CourseTypes
	(
		CourseTypeId Int Identity Primary Key,
		CourseTypeName Varchar(50) Unique Not Null
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Courses')
	Create Table Courses
	(
		CourseId Int Identity Primary Key,
		CourseName Varchar(50) Not Null,
		CourseCredit Int Default 0 Not Null,
		LessonsPerWeek Int Default 0 Not Null,
		CourseType Int,
		Constraint FK_Courses_CourseType Foreign Key(CourseType) References CourseTypes(CourseTypeId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Semesters')
	Create Table Semesters
	(
		SemesterId Int Identity Primary Key,
		SemesterTitle Varchar(50) Not Null Unique
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Branches')
	Create Table Branches
	(
		BranchId Int Identity Primary Key,
		BranchTitle Varchar(50)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Teachers')
	Create Table Teachers
	(
		TeacherId Int Identity Primary Key,
		TeacherFirstName Varchar(50) Not Null,
		TeacherLastName Varchar(50) Not Null,
		TeacherPhoneNumber Varchar(20) Not Null,
		TeacherBirthDate Datetime Not Null,
		TeacherEmail Varchar(50) Not Null Unique,
		TeacherPassword Varchar(50) Not Null,
		TeacherBranch Int,
		Constraint FK_Teachers_Branch Foreign Key(TeacherBranch) References Branches(BranchId),
		Constraint CK_Teachers_Phone Check(TeacherPhoneNumber Like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'ClassesCourses')
	Create Table ClassesCourses
	(
		ClassId Int,
		CourseId Int,
		TeacherId Int,
		SemesterId Int,
		Constraint FK_ClassesCourses_ClassId Foreign Key(ClassId) References Classes(ClassId),
		Constraint FK_ClassesCourses_CourseId Foreign Key(CourseId) References Courses(CourseId),
		Constraint FK_ClassesCourses_TeacherId Foreign Key(TeacherId) References Teachers(TeacherId),
		Constraint FK_ClassesCourses_SemesterId Foreign Key(SemesterId) References Semesters(SemesterId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'ExamTypes')
	Create Table ExamTypes
	(
		ExamTypeId Int Identity Primary Key,
		ExamTypeTitle Varchar(50) Unique
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Exams')
	Create Table Exams
	(
		ExamId Int Identity Primary Key,
		ExamTitle Varchar(50) Not Null,
		ExamDate Datetime Default Getdate() Not Null,
		ExamPeriod Int Default 0,
		ExamType Int,
		Constraint FK_Exams_ExamType Foreign Key(ExamType) References ExamTypes(ExamTypeId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'CourseExams')
	Create Table CourseExams
	(
		CourseExamId Int Identity Primary Key,
		CourseId Int,
		ExamId Int,
		Constraint FK_CourseExams_CourseId Foreign Key(CourseId) References Courses(CourseId),
		Constraint FK_CourseExams_ExamId Foreign Key(ExamId) References Exams(ExamId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'QuestionTypes')
	Create Table QuestionTypes
	(
		QuestionTypeId Int Identity Primary Key,
		QuestionTypeTitle Varchar(50) Not Null
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'Questions')
	Create Table Questions
	(
		QuestionId Int Identity Primary Key,
		QuestionTitle Varchar(150) Not Null,
		QuestionType Int,
		QuestionIsAsked Bit Default 0,
		Constraint FK_Questions_QuestionType Foreign Key(QuestionType) References QuestionTypes(QuestionTypeId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'QuestionOptions')
	Create Table QuestionOptions
	(
		QuestionOptionId Int Identity Primary Key,
		QuestionOptionTitle Varchar(50) Not Null,
		QuestionOptionIsTrue Bit Default 0 Not Null,
		QuestionId Int,
		Constraint FK_QuestionOptions_QuestionId Foreign Key(QuestionId) References Questions(QuestionId)
	)
Go
If Not Exists(Select * From INFORMATION_SCHEMA.TABLES Where TABLE_NAME = 'ExamQuestions')
	Create Table ExamQuestions
	(
		ExamId Int,
		QuestionId Int,
		Constraint FK_ExamQuestions_ExamId Foreign Key(ExamId) References Exams(ExamId),
		Constraint FK_ExamQuestions_QuestionId Foreign Key(QuestionId) References Questions(QuestionId)
	)