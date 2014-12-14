### Introduction

This repo is for Getting And Cleaning Data's Course Project

## run_analysis.R

run_analysis.R file is the main file of this repo
It can be run as long as the Samsung data is in R's working directory, 
and output to 'tidyset.txt' file as result. 

run_analysis.R file works step by step
1.  define the file names
2.  parse trainset
3.  parse testset
4.  combine 2 dataset into 1
5.  extract only the subject/label/mean*/std* cols
6.  level the activity 
7.  summarise the result
8.  write output file


