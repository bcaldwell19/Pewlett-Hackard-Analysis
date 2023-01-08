# Pewlett-Hackard-Analysis

>Pewlett Hackard is a large company boasting several thousand employees, and it's been around for a long time. As baby boomers begin to retire at a rapid rate, Pewlett Hackard is looking toward the future in two ways. 
    First, it's offering a retirement package for those who meet certain criteria. 
    Second, it's starting to think about which positions will need to be filled in the near future.

>The number of upcoming retirements will leave thousands of job openings. What would happen to a company if they didn't look ahead and prepare for this many vacancies? It probably wouldn't be pretty.

>Bobby is an up-and-coming HR analyst whose task is to perform employee research. Specifically, he needs to find answers to the following questions: 
    Who will be retiring in the next few years? And how many positions will Pewlett Hackard need to fill? 
    This analysis will help future-proof Pewlett Hackard by generating a list of all employees eligible for the retirement package. The employee data Bobby needs is only available in the form of six CSV files because Pewlett Hackard has been mainly using Excel and VBA to work with their data.

>But now, they have decided to update their methods to use SQL, a definite upgrade considering the amount of data. Your task is to help Bobby build an employee database with SQL by applying your data modeling, engineering, and analysis skills.
____________________________________________________________________________________________________________________________

## Overview of the analysis:
### Explain the purpose of this analysis.
 
Pewlett Hackard has been using csvs for database storage.  This method is a bit antiquated with newer technologies available such as SQL.  SQL allows all six csvs to be stored in one database. The SQL database then can be queried to create new tables from the input sources that would normally be a very manual process.  The assumption of this company is that there could be a sizable portion of the company's employees that could be approaching retirement age.   Pewlett Hackard has requested our team to update their methods to use SQL to generate a database that can be queried to find all employees eligible for retirement.    We must help Bobby create an employee database using [SQL](/Queries/Employee_Database_challenge.sql) to automate their older process of using csvs.
 
 
## Results:
### Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
 
 
* 133776 employees are approaching retirement age.
* The two major job openings will be engineers and staff members.  The most being senior level positions, but some lower levels as well.  The picture shows the exact breakdown of the job openings if there are no plans to downsize or consolidate departments.

![Job Openings](/Resources/job_openings.png)

* There are 1549 current employees that can be possible mentors.
* In the mentors [csv file](/Data/mentorship_eligibilty.csv), there are zero managers to train future managers.
 
 
## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
There are seven different roles that will need to be filled with no plans to downsize or consolidate departments.
 
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employee
Most roles have at least one person who could serve as a mentor.  In my opinion, one person could be a mentor to at least a few younger colleageues.The only role that would likely struggle would be the managers, so no there are not enough qualified retirement-ready people to mentor the future generation.
 
A table with title, count(title), and department columns would be useful information.
A query to find the quantity of people title role are retirement-ready in a department.
 
