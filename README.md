# Vanderbilt_Squirrel_Analysis


## Synopsis of the Project

In this project, I use data collected about the population of squirrels in Central Park to investigate whether Vanderbilt's claim of there being a 3:1 squirrel to student ratio on campus is possible.

## Introduction to the Project

Back in 2018, when I was deciding what colleges to apply to, I went and visited Vanderbilt University. While on a tour there, the tour guide, as a off-handed comment, mentioned there being a 3:1 squirrel to student ratio on campus. Both my father, who was in attendance with me, and I were suprised at this claim. It became a running joke of sorts, as we would evaluate places jokingly based on their student to squirrel population. Four years later, I had forgotten about this *unique* ratio. That was until I saw in my University's newspaper, the Purdue Exponent, a section titled "Squirrel of the Week". Reminded of this ratio, and now knowing methods to analyze data, I decided to do some digging as to whether that ratio is true. And thus, this project was born.  

## Methods

Vanderbilt does not have available data to support their claim about there being a 3:1 squirrel to student population. *shocker*. So, I used data from a 2018 study about squirrels in Central Park, and estimates using student enrollment at Vanderbilt, and compared the two locations. I used Central Park for a few reasons:  
&nbsp; 1) Central Park is the only dataset about squirrel populations I could find  
&nbsp; 2) Central Park is ideal as it is a purely rural, and serves as a "baseline for reality", for lack of a better term  
&nbsp; 3) Vanderbilt and Central Park are similar in that they are both ruralish areas
&nbsp;&nbsp;&nbsp; surrounded by more urban areas and they are in the same country

My analysis began by importing and cleaning the Central Park study dataset. I only removed duplicates, among other small changes, as I was mostly interested in the number of observed squirrels being accurate, not their attributes.



## Limitations

The following are the limitations of the project, and how I decided to overcome them.

1) Vanderbilt does not have data explicitly about their squirrel population... like none
&nbsp; I used student enrollment numbers from their registrar, and using there 3:1 ratio, I estimated the number of squirrels that would be on campus, provided 
&nbsp; Vanderbilt is correct, and used that for the analysis.  

2) A good portion of the numbers used are estimated (Trees at Vanderbilt and Central Park, for example)  
&nbsp; I went to the most accurate of websites to find data that estimated these totals (including Wikipedia, of course). I am confident that these numbers are
&nbsp; accurate enough to where the results of the analysis would not differ dramatically if the true (possibly unknown) numbers were used.  

Given these limitations, I do not expect anyone to take the project seriously. Nor am I claiming that anyone is/isn't lying about their population ratios, or that my analysis is hard evidence that their claim is/isn't true. I was just bored, wanted to show off some of what I know in R, and use data analysis to answer a question that was *burning* in my skull for four years. This is one of the *fun* projects, if those things exist :)

## Link to original datasets  

All .csv files used in the analysis can be found in the Squirrel_Analysis_.csv_files folder. A link to the original dataset is also provided here:  
https://data.cityofnewyork.us/Environment/2018-Central-Park-Squirrel-Census-Squirrel-Data/vfnx-vebw/data  

The datasets used for temperature and snowfall were created using the following website: https://www.weather.gov/  

## Outside Sources and Description   

The following are the sources for some of the information that was needed to complete the analysis. They are listed in the order that they are referenced in the analysis.   

1) https://registrar.vanderbilt.edu/documents/2018_Fall_Enrollment_Report.pdf   
&nbsp; This source was used to obtain the number of students enrolled at Vanderbilt in 2018.  

2) https://en.wikipedia.org/wiki/Central_Park  
&nbsp; This source was used to find the size of Central Park (in acres).  

3) https://www.vanderbilt.edu/about/quick-facts/  
&nbsp; This source was used to find the size of Vanderbilt University's Campus (in acres).  

4) https://www.centralparknyc.org/articles/park-city-healthy#:~:text=Central%20Park%20is%20home%20to,Yorkers%20breathe%20a%20little%20easier.  
&nbsp; This source was used to find the number of trees in Central Park.   

5) https://www.vanderbilt.edu/trees/about/  
&nbsp; This source was used to find the number of trees on Vanderbilt University's campus.    

6) https://registrar.vanderbilt.edu/documents/2019_Fall_Enrollment_Report.pdf  
&nbsp; This source was used to obtain the number of students enrolled at Vanderbilt in 2019.    

7) https://registrar.vanderbilt.edu/documents/2020_Fall_Enrollment_Report.pdf  
&nbsp; This source was used to obtain the number of students enrolled at Vanderbilt in 2020.   

8) https://registrar.vanderbilt.edu/documents/2021_Fall_Enrollment_Report.pdf  
&nbsp; This source was used to obtain the number of students enrolled at Vanderbilt in 2021.   

9) https://registrar.vanderbilt.edu/documents/2022_Fall_Enrollment_Report.pdf  
&nbsp; This source was used to obtain the number of students enrolled at Vanderbilt in 2022.   
