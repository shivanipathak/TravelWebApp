# Travel Planning System

Students:

Sravani Prakki
Shivani Pathak

### Project Problem Statement:
“Live life with no excuses, travel with no regrets” – Oscar Wilde. Many travelers plan to travel different places around the world during different times of the year. Planning your travel is a major work. Once the traveler decides the location of his travel, he must check individually with each travel agency for itinerary and the budget. Which consumes lot of time. Due to which the user will end up visiting few websites. If more travel plans are available under single platform then there is exposure for various travel companies and their plans. 

### Proposed Solution/Project Idea:

Wouldn’t it be easier if somebody planned your trip? And all you must do is pack and leave. In this platform, just mention your specifications. To make this happen both users and travel agency will have to register with our platform. We are using AWS cloud services for developing and hosting a 3-Tier Web Application called Travelezy. It has role-based login for travel companies and travelers. The travel companies upload their itinerary after being a valid user. The travelers can register with the web application to view the travel plans which is matched for them by AWS Lex chatbot, taking traveler’s requirements to plan a travel.

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



