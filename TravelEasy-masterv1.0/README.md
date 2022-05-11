# Travel Planning System

## Introduction
 
### Cloud Final project: Travel Planning System

University Name: https://www.csueastbay.edu/

Course: https://catalog.csueastbay.edu/preview_course_nopop.php?catoid=21&coid=82452

Professor: https://lwa1.csueastbay.edu/staffdir/index.cfm?ID=151159545252&n=230003000A_24120C0004080D08&Fuseaction=ShowDetails&MAXRECS=25

Students:

Sravani Prakki
Shivani Pathak


### Demo
[Demo video Link]()

### Project Problem Statement:

Planning a trip could be really stressful. Many of us cannot get over the anxiety of where to begin. Making travel arrangements, developing the itenary could be hectic. We try checking the budget and itinerary with different travel agencies. As it is hard to check all websites we end up visiting only a few. It would be really time saving if more travel plans are available on a single site based on our requirements with less effort. 

### Proposed Solution/Project Idea:

“Travel Planning system” (TPS) is a simple dynamic web application that is hosted on the AWS cloud platform. A new user/travel company can register on the website. The application is not only useful for travel lovers but many travel agencies themselves can also access this application. Login can be granted based on roles such as user or travel company. These login details are stored in an AWS RDS. Users can provide their travel requirements such as place of travel, their month of travel , preferred budget which are stored in AWS RDS. Travel companies can upload new itinerary details which are stored in the AWS S3 bucket. Registered users can provide feedback and post reviews which are also stored in AWS RDS and AWS S3 Bucket respectively.  An interactive chatbot is built using AWS Lex, AWS Lambda and AWS Cognito which takes the user’s travel preferences and provides them suitable itinerary plans. This application is hosted on AWS EBS which allows the application to be more scalable,  available and also provides data persistence and security to the application.

### Features List
1.	New users are allowed to create new account using Sign up. A new user row/record is created in RDS. Sign up id restricted if registered user tries to sign up.
2.	Only allows users who are registered to login via Login Page. Authentication for username and password match is achieved. Role-based login is aided to redirect users to their respective pages.
3.	Travel Companies can upload travel itinerary which includes photos, place, month of travel and budget.
4.	User Dashboard page provides lex chatbot, which takes user requirements and to provide them with matching travel plan.
5.	By using Amazon Lex and Polly our platform increases the user interaction.
6.	Travel users Home Page displays all the travel images uploaded by Travel Companies. Images are displayed from CloudFront.
7.	Lex interacts with lambda to retrieve the travel plans uploaded by the company while matching it with the users input. 
8.	Users can post review and photos for the travel plans they availed, which is stored in S3 bucket.
9.	Machine learning predicts user’s interests based on the reviews provided by them, which in turn helps Travel Companies to modify their plans.

### Architecture Diagram
![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/image.png)

Code Pipeline
![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/image%20(1).png)

### Application Screenshots

User signup:

 ![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/usersignup.png)



Company signup:

 ![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/companysignup.png)



Login Page:

 ![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/login.png)



User Dashboard:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/userdashboard.png)


User Lex bot:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/amazonlex.png)


Travel Plans:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/travelplans.png)


Specific travel plan:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/specifictravelplan.png)



Company Dashboard:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/companydashboard.png)



Machine learning analysis:

![alt text](https://github.com/AnandMuralidhar/TravelEasy/blob/master/machinelearning.png)

 

### Pre-requisite Set Up

#### Resources to be configured on AWS:

1.	EC2, AutoScale Group
2.	ELB
3.	Route 53
4.	S3, IA, Glacier
5.	CloudFront
6.	Elasticbeanstalk
7.	Codepipeline
8.	Codebuild
9.	Amazon Machine Learning 
10.	DynamoDB 
11.	 RDS
12.	Lambda 
13.	Lex
14.	Polly
15.	Cloudwatch
16.	CloudTrail 
17.	SNS
18.	IAM
19.	API gateway

#### Softwares to download locally:

1.	Server Side: Spring Boot, REST, Java, AWS Java SDK, Apache Tomcat
2.	Client Side: HTML5, JavaScript, Bootstrap, CSS
3.	Database: RDS MySQL, Hibernate, DynamoDB
4.	Build Tool: Maven
5.	Web Server: Apache Tomcat 8.5

### Deployment Instructions on Local
1.	Prerequisite Software: Java8 Runtime, Maven, Eclipse, MySQL 5.7.
2.	Code is download from GitHub.
3.	Use maven project in eclipse
4.	applications.properties should be changed with your MySQL URL, Username and Password.
5.	application.properties should also be changed with your access key and secret.
6.	For social logins update the developer account URL. 
7.	Change credentials for machine learning and lex in code
8.	Run the instructions mvn clean and maven update
9.	Then run application as java application
10.	Application will be accessible for you  at http://localhost:8080/
