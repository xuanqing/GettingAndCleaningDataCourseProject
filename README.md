### Introduction

This repo is for Getting And Cleaning Data's Course Project

#### How to
Be sure the Samsung data is in your working directory. 
And Source the run\_analysis.R file though the right path. 

#### run\_analysis.R

run\_analysis.R file is the main file of this repo
It can be run as long as the Samsung data is in R's working directory, 
and output to 'tidyset.txt' file as result. 

=============
run\_analysis.R file works step by step

1.  define the file names
2.  parse trainset
3.  parse testset
4.  combine 2 dataset into 1
5.  extract only the subject/label/mean*/std* cols
6.  level the activity 
7.  summarise the result
8.  write output file

<!-- -->

