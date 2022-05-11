# Travel Planning System

## Introduction
 
### Cloud Final project: Travel Planning System

University Name: [California State University East Bay](https://www.csueastbay.edu/)

Course: [Cloud Computing](https://catalog.csueastbay.edu/preview_course_nopop.php?catoid=21&coid=82452)

Professor:  [Babak Esmaeili csueb](https://lwa1.csueastbay.edu/staffdir/index.cfm?ID=151159545252&n=230003000A_24120C0004080D08&Fuseaction=ShowDetails&MAXRECS=25)

Students:

- Sravani Prakki
- Shivani Pathak 


### Demo
[Demo video Link](https://drive.google.com/file/d/1J0uQsMJ1a9K0QXDy53wHMIobihGiTJEO/view?usp=sharing)

### Project Problem Statement:

Planning a trip could be really stressful. Many of us cannot get over the anxiety of where to begin. Making travel arrangements, developing the itenary could be hectic. We try checking the budget and itinerary with different travel agencies. As it is hard to check all websites we end up visiting only a few. It would be really time saving if more travel plans are available on a single site based on our requirements with less effort. 

### Proposed Solution/Project Idea:

“Travel Planning system” (TPS) is a simple dynamic web application that is hosted on the AWS cloud platform. A new user/travel company can register on the website. The application is not only useful for travel lovers but many travel agencies themselves can also access this application. Login can be granted based on roles such as user or travel company. These login details are stored in an AWS RDS. Users can provide their travel requirements such as place of travel, their month of travel , preferred budget which are stored in AWS RDS. Travel companies can upload new itinerary details which are stored in the AWS S3 bucket. Registered users can provide feedback and post reviews which are also stored in AWS RDS and AWS S3 Bucket respectively.  An interactive chatbot is built using AWS Lex, AWS Lambda and AWS Cognito which takes the user’s travel preferences and provides them suitable itinerary plans. This application is hosted on AWS EBS which allows the application to be more scalable,  available and also provides data persistence and security to the application.

### Features List

1.	New users/New Travel company can sign up to create a new account within the website. In RDS, a new user row/record is created. The user/company login details are stored in AWS RDS.
2.	The application only allows the users who are registered to login via user/company Login Page. Authentication is based on username and password match which is queried from AWS RDS tables. Role-based login is added to redirect users to their respective pages. Travel users/Travel companies need to select their user type and accordingly will be redirect to their respective pages.
3.	Travel Companies can upload travel itinerary details such as photos, place, month of travel and budget.
4.	User Dashboard page provides lex chatbot, which takes user preferences as input and provides them with best travel plan within the budget provided by the user. Users can also view/select plans that not suggested by Lex chatbot by clicking on submit button.
5.	Our platform's user interaction is increased by using Amazon Lex chatbot.
6.	Travel users Home Page displays all the travel images uploaded by Travel Companies.
7.	Lex interacts with lambda to retrieve the travel plans uploaded by the company while matching it with the users input. 
8.	Users can post review and photos for the travel plans they availed, which is stored in S3 bucket.

### Architecture Diagram
![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/Archirecture.png)

### Application Screenshots

**User signup:**

 ![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/UserSignup.jpg)

**Company signup:**

 ![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/NewCompanySignup.jpg)

**Login Page:**

 ![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/LoginPage.jpg)

**User Dashboard:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/Userhomepage.jpg)

**User Lex bot:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/Lexchatbot.jpg)

**Travel Plans:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/UserTravelplans.jpg)

**Specific travel plan:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/SpecificTravelPlan.jpg)

**Company Dashboard:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/companypage.jpg)

**Logout Page:**

![alt text](https://github.com/shivanipathak/TravelWebApp/blob/Third-commit/TravelEasy-masterv1.0/Logout.jpg)


### Pre-requisite Set Up

#### Resources to be configured on AWS:


1. ELB
2. S3
3. Elasticbeanstalk
4. DynamoDB 
5. RDS
6. Lambda 
7. Lex
8. Cloudwatch
9. IAM


#### Softwares to download locally:

1.	Server Side: Spring Boot, REST, Java, AWS Java SDK, Apache Tomcat, Python
2.	Client Side: HTML5, JavaScript, Bootstrap, CSS
3.	Database: RDS MySQL, Hibernate
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
