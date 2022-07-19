# mfit_jsonreport

The csv export of the mfit assessment has a lot of good information and the html has a lot of good information but it is difficult to use to determine all of the servers a single app may be hosted on. 

This script pulls the data from the json export and creates a csv with the information about the workload and the systems it is hosted on. 

From there you can create a pivot table on the csv to determine all of the servers an app may sit on. This is useful if the applications sits behind a load balancer so is hosted on many web servers. 
