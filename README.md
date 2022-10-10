# Pewlett-Hackard-Analysis

## Overview of the analysis
This Analysis had for purpose to determine the following:
1) To dertermine the number of retiring employees per title
2) To identify employees who are eligible to participate in a mentorship program

## Results
Focusing on the first analysis : the number of retiring employees per title, we determine from our result the following
- There is a total of 72458 that are on the verge of retirement (*calculated using the query at the end of the file)
- The majority of retirees will be senior engineers (25916) and senior staffs (24926). This represent 70% of the retirees. 
- There will also be 2 Managers that might retire in the near future.

![retiring_titles](https://user-images.githubusercontent.com/111706055/194786756-3dcb7baf-1d0c-46bf-ae5e-224fda8b7fa8.png)

Focusing on the second analysis : employees who are eligible to participate in a mentorship program
- There are 1549 employees that are eligible to participate in the mentorship program that were born from January 1, 1965 and December 31, 1965.(*calculated using the query at the end of the file)

## Summary
There are 72458 roles that will need to be filled in the near future. Inluding 25916 senior engineers, and 24926 senior staffs. This will create quite an impact in the workforce. 
1549 retirement-ready employees acting as mentors might not be enough to train the next generation of employees. This would mean 47 employees per every 1 mentor. 

(*)Query that would give you the count of mentors and the count of retirees are extremely useful in this situation 
1) number of mentors use the following queri

SELECT COUNT(mentorship_eligibility.emp_no)
FROM mentorship_eligibility

![count of mentors](https://user-images.githubusercontent.com/111706055/194787214-76df78b1-1a51-4e58-812c-6eabcd6e3b68.png)

2) Number of employee of verge of retirement

SELECT COUNT(unique_titles.emp_no)
from unique_titles

![verge of retirement](https://user-images.githubusercontent.com/111706055/194787296-eaa2f94b-a45d-49c9-abe2-fd3c2d0d63c7.png)
