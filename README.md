# Vanderbilt_Squirrel_Analysis


## Synopsis of the Project

For this project, I analyzed data on the Central Park squirrel population to assess the feasibility of Vanderbilt's claim of a 3:1 squirrel to student ratio on campus. The analysis was conducted using RStudio, with visualizations created in both RStudio and Tableau.  

## Introduction to the Project

In 2018, while I was college hunting, I visited Vanderbilt University. During the tour, the guide casually mentioned a 3:1 squirrel to student ratio on campus, which both my fath and I found remarkable. We humorously started comparing colleges based on their student-squirrel ratios. Four years later, I stumbled upon the "Squirrel of the Week" section in my university's newspaper, the Purdue Exponent, and remembered Vanderbilt's claim. Armed with data analysis skills, I decided to explore the veracity of the ratio and this project was initiated.   

## Methods

Vanderbilt does not have data to back up their 3:1 squirrel to student ratio claim. I used data from a 2018 Central Park squirrel study and estimated student enrollment at Vanderbilt to compare the two locations. I chose Central Park for these reasons:  
&nbsp; 1) Central Park is the only dataset about squirrel populations I could find  
&nbsp; 2) Central Park serves as an ideal rural benchmark for comparison puroposes    
&nbsp; 3) Vanderbilt and Central Park share similarities as rural-like locations surrounded by urban areas within the same country  

I started my analysis by importing and cleaning the Central Park study data in RStudio. This involved removing duplicates, converting column data types, replacing missing values, and making other necessary changes. Although much of the cleaning had no impact on analysis, it streamlined visualizing the data in Tableau.   

To validate Vanderbilt's claim, I looked at two characteristics: squirrels per acre and squirrels per tree. My calculations showed that Vanderbilt has around 115 squirrels per acre compared to about 3 in Central Park. Additionally, Vanderbilt has more squirrels per tree than Central Park. These findings suggest that Vanderbilt's claim of a 3:1 squirrel to student ratio may not be accurate.    

I gathered weather data (temperatures and snowfall) in both locations to see if these factors impacted the observed differences in squirrel population. Although a comparison of the weather showed that Vanderbilt has a more favorable climate for squirrels (warmer and less snow), I cannot conclude that these conditions are the sole cause of the significant difference in squirrel population.  

Lastly, I estimated the future squirrel population at Vanderbilt based on their 3:1 student to squirrel ratio and student enrollment data from 2019-2022. I also calculated when Vanderbilt will reach 50,000 squirrels.  

## Visualization

I created visualizations in RStudio and a Tableau story. The link to the Tableau story is below:    
&nbsp;&nbsp;&nbsp; *TBD*  

## Limitations  

The limitations of this project and how I addressed them are listed below.  

1) Vanderbilt does not have any data available about their squirrel population   
&nbsp; I estimated the squirrel population at Vanderbilt using their 3:1 student to squirrel ratio and student enrollment numbers from their registrar.
&nbsp; These estimates were used in the analysis.    

2) Many of the numbers used in this project are based on estimates, such as the number of trees in both locations  
&nbsp; I sourced my data from reliable websites to estimate certain values (e.g. trees at Vanderbilt and Central Park). These numbers are deemed accurate enough
&nbsp; that the results of the analysis would not change significantly in the actual values were used.     

I understand that the limitations of this project may not make it credible. This is not meant to be taken seriously or as proof of Vanderbilt's population ratio claims. It was just a fun experiment to showcase my R skills and answer a long-standing curiosity. This project is meant to be enjoyed, not taken as solid evidence.  

## Link to original datasets  

The necessary .csv files for the analysis are located in the Squirrel_Analysis_.csv_files folder and a link to the source dataset is included here:  
https://data.cityofnewyork.us/Environment/2018-Central-Park-Squirrel-Census-Squirrel-Data/vfnx-vebw/data  

The source for the weather data was obtained from this website:   
https://www.weather.gov/  

## Outside Sources and Description   

The sources used in the analysis are listed below, in the order they were referenced.   

1) https://registrar.vanderbilt.edu/documents/2018_Fall_Enrollment_Report.pdf   
&nbsp; This source provided information ons tudent enrollment at Vanerbilt in 2018.   

2) https://en.wikipedia.org/wiki/Central_Park  
&nbsp; This source provided information on the size of Central Park in acres.    

3) https://www.vanderbilt.edu/about/quick-facts/  
&nbsp; This source provided information on the size of Vanderbilt University's campus in acres.  

4) https://www.centralparknyc.org/articles/park-city-healthy#:~:text=Central%20Park%20is%20home%20to,Yorkers%20breathe%20a%20little%20easier.  
&nbsp; This source provided information on the number of trees in Central Park.     

5) https://www.vanderbilt.edu/trees/about/  
&nbsp; This source provided information on the number of trees on Vanderbilt's campus.     

6) https://registrar.vanderbilt.edu/documents/2019_Fall_Enrollment_Report.pdf  
&nbsp; This source provided information ons tudent enrollment at Vanerbilt in 2019.      

7) https://registrar.vanderbilt.edu/documents/2020_Fall_Enrollment_Report.pdf  
&nbsp; This source provided information ons tudent enrollment at Vanerbilt in 2020.     

8) https://registrar.vanderbilt.edu/documents/2021_Fall_Enrollment_Report.pdf  
&nbsp; This source provided information ons tudent enrollment at Vanerbilt in 2021.     

9) https://registrar.vanderbilt.edu/documents/2022_Fall_Enrollment_Report.pdf  
&nbsp; This source provided information ons tudent enrollment at Vanerbilt in 2022.    

## Final Thoughts

Thank you for taking the time to read through all of this. I hope it was informative, or at least not a total waste of your time. 
 
