# Google-Capstone-Project
## About Cyclistic
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations
across Chicago. The bikes can be unlocked from one station and returned to any other station
in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable
than casual riders. Although the pricing flexibility helps Cyclistic attract more customers,
Moreno believes that maximizing the number of annual members will be key to future growth.
Rather than creating a marketing campaign that targets all-new customers, Moreno believes
there is a solid opportunity to convert casual riders into members. She notes that casual riders
are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.


## Introduction
The dataset used in this analysis is from [Here](https://divvy-tripdata.s3.amazonaws.com/index.html) under this  [Data License Agreement](https://divvybikes.com/data-license-agreement) and is for learning purposes. as Cyclistic is a fictional company. For this analysis, we'll be using the datasets made available from June 2023 till June 2024. The purpose of this analysis is to identify possible insights and patterns in the dataset provided by the company that would help with decision-making.

## Ask
Three questions will guide the future marketing program:​
  1. How do annual members and casual riders use Cyclistic bikes differently? ​
  2. Why would casual riders buy Cyclistic annual memberships? ​
  3. How can Cyclistic use digital media to influence casual riders to become members? ​

We will address the first question mostly in this analysis.

## Prepare
Tools Used:​

  1. R Programming Language(For Data Wrangling and Analysis)​
  2. Tableau (For Data Visualization)​

We have 12 datasets each covering a month from June 2023 till June 2024 and their formatted as shown below. 
![image](Images/JuneFormat.png)

we used the rbindlist to bind all 12 datasets into one. As seen in [here](Analysis.R)

