SQL and Git
=================
Introduction: This repository records my learning, history, use in real projects and internships, and personal feelings about git operation and SOL language.

My Perception and Experience
----------------------------
1. Git is used every day during the internship, uploading work content, assigning work tasks, updating work content, etc. Very convenient tool.

2. As the most basic information extraction, query, and modification language, SQL is very easy to learn and use, and is widely used in data analysis and other fields.I did a lot of database basic exercises (collected in the learning material) during the learning of SQL, basic operations, the use of fixed formats, table joins, subqueries, table changes, column additions, changes, etc.

3. In the actual internship process, I found that I would not just write SQL language, but SQL is used in tasks, such as extracting data from the database and subsequent data cleaning. When connecting the web front-end and AWS data and interacting with information, you need to use SQL language to realize query, write to the database, and real-time update of some information. It is just a step in the task, so SQL must be used skillfully. The independent part needs to be used in conjunction with other languages to complete the task.


Git
-----------------
To understand GitHub, we must first have an understanding of Git. Git is an open-source version control system. Git is similar to other version control systems—Subversion, CVS, and Mercurial to name a few.

So, Git is a version control system, but what does that mean? When developers create something (an app, for example), they make constant changes to the code, releasing new versions up to and after the first official (non-beta) release.

### Installing Git
  1. https://git-scm.com/downloads
  2. Github Desktop(Recommend)
      Using easily, Fetch origin, easy commit, push origin
      Great interface
    
### Git commands
  1.  Git status        -- Check your Git status
      Git add filename  -- Add a file for staging
      Git add *         -- Add all the files for the staging
      Git commit -a     -- Commit all the files for staging
      Git push          -- Push all the staged changes to remote (origin) master
      Git pull          -- Pull any new updates from remote (origin) master to local branch
      Git log --oneline -- check uplade history
  2. Using Github Desktop can easy deal with these commands.
  
  However, These two ways have their advantages and disadvantages. Using toghter. It's a great tools in study and intern.

### Git branch
  1. Cooperation with group or partner on master branch
  1. Great a new branch do your job, if these work are great and finished push to master branch

SQL
-----------------
The Structured Query Language (SQL) is the standard user and application program interface for a relational database. Relational databases are easy to extend, and a new data category can be added after the original database creation without requiring that you modify all the existing applications.

### AWS RDB
  1. Main using MySQL workbench operate table in AWS RDB
  2. Table creation, addition, deletion and modification.
  
### Upload Real Data and Creat database by Workbench
  1. Option 1 - Table Data Import Wizard
      Go to database home_credit -> Table Data Import Wizard -> Browse to the table files -> Upload
      Deal eith the real data(csv), Creat database by Workbench. We can do some operation check and get we want information. 
  2. Option 2 - Manual import (faster but a bit tedious)

### SQL basic

    Master SQL query keywords for most of the common queries!

    SELECT (DISTINCT) CONCAT(), COUNT(), SUM(), LENGTH(), MAX(), MIN(), AVG(), CASE WHEN... THEN... ELSE.. END AS

    FROM

    Join  ....  using()

    Join .... on ....

    WHERE  AND, OR, IS NULL, is NOT NULL, LIKE '%a%', NOT Like, between  and , regexp '  ',

    GROUP BY HAVING

    ORDER BY (DESC)
    
    LIMIT

    operators:

    +, -, *, /, =, <, >, NOT, AND (&), OR (|), IN, LIKE, BETWEEN ... AND ...
    
    MORE OPERATION 
    Insert into,  update set, ADD, DELETE , IN, AS,

### Regex in MySQL
  1. Online tool https://rubular.com/
  2. https://dev.mysql.com/doc/refman/8.0/en/regexp.html

### SQL Software
  1. MySQL workbench
  2. Sakila database(For practice in free time)
  3. AWS Cloud RDB


### SQL Query and SQL Database  Related Operations
   W3 SCHOOL
   https://www.w3schools.com/sql/sql_groupby.asp

### Practice
   1. W3 School
   2. Course exercise
   3. Leetcode   https://leetcode.com/problemset/database
   4. Hackerrank https://www.hackerrank.com
   

