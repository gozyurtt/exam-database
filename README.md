# exam-database
 i created exam database by using t-sql with ms sql server (long description is available))


A school wants to develop an information system in order to create the exam papers that it will send to print for theoretical exams under different groups (A, B, C, D, ...) . These exams can be in different types (midterm, final, quiz etc.). Each exam is defined for a class under a section. Different types of questions can be asked in different numbers in exams. Each question has a different number of options, but only one of these options is correct. For example, if a question is true or false, this question has two options and one of these options is correct. Likewise, if a question has four options, only one of these options is correct and the others are false. Teachers define the questions in the system. Teachers log into the system with their e-mail and passwords. Each teacher has a branch in the system and each teacher is attached to a department. Departments may be affiliated to faculty, institute, college or vocational school. These units are also affiliated with a university. A teacher can teach more than one lesson. A teacher can teach multiple different lessons to the same class. In addition, a teacher can teach classes of different departments with the same course name and under different course code. Exams are conducted according to academic terms. The reason for this is that different courses are offered in each academic term. For this reason, the period of the exam must also be able to be defined in the system. A class has more than one course in an academic term. For example, computer programming 1st graders have seven different courses in one academic term. These lessons can be given by different teachers or the same teacher can teach more than one lesson.
In this system, the following requirements have been determined in addition to the above explanations. Create the most suitable database design to meet these requirements with T-SQL codes.
Requirements:
1.	Teacher information should be kept in the system:
a.	First Name
b.	Last name
c.	Phone number
d.	Date of birth
e.	E-mail address
f.	Password
g.	Branch (Software / System / Design / etc.)
2.	Exams may belong to different universities. For this, the following data about the university should be kept in the system.
a.	First Name
b.	Address
c.	Type (State / Foundation)
3.	The following data about the university's faculty, school, institute, vocational school should be kept:
a.	First Name
b.	Address
c.	Phone number
d.	Fax number
e.	Website
4.	The following data about the departments of the university should be kept in the system:
a.	First Name
b.	Phone number
5.	The following data regarding the classes of the university should be kept in the system:
a.	Class name
b.	Number of students
c.	Number of female students
d.	Number of male students
6.	The following data about the courses for which the exam will be defined should be kept in the system:
a.	Course name
b.	Loan
c.	Lessons per week
d.	Course type (Compulsory, Elective, Departmental Elective, University Elective etc.)
7.	Data on which classes took which courses should be kept in the system.
8.	Lessons change each semester. Term information should be included in the system. (Like 2018-2019 Fall, 2018-2019 Spring.)
9.	Si s tem is designed to create exam papers. For this reason, exam definitions must be made for each course in the system. More than one exam definition should be possible for a course. Create the table or tables suitable for normalization. For this, the following data should be kept in the system .
a.	Exam name
b.	Exam date
c.	Exam period
d.	Exam type (Midterm, Final, Quiz etc.)
e.	Which course does the exam belong to?
10.	Each exam consists of a certain number of different types of questions. Each question has a different number of choices, and only one of these choices is right, the others are false. For this, at least the following data should be kept in the system.
a.	Question text
b.	Question type (True-False, Multiple choice, Fill in the blank etc.)
c.	Which exam does he belong to?
d.	Has the question been asked before? (The questions asked are not reprinted on the exam paper.)
11.	Each question asked in each exam has a correct and a different number of incorrect options. At this point, you need to create the most ideal table that will allow you to keep the exam options in the system for each exam question.
WARNINGS
1.	Cell phone data must be defined in the system as (XXX) XXX-XXXX.
2.	Home phone data must be defined to the system as 0 ( XXX ) XXX XX XX.
3.	Fax data must be defined to the system as 0 (XXX) XXX-XX-XX.
4.	The e-mail address is unique for all teachers.
5.	Only the requirements are given in the list above. Each table corresponds to a requirement DOES NOT. You are expected to read and analyze the requirements well and create the most appropriate table or tables.

