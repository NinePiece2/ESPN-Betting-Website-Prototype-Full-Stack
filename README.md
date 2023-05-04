# ESPN Betting Website Prototype (Full Stack)

## Table of Contents
- [ESPN Betting Website Prototype (Full Stack)](#espn-betting-website-prototype-full-stack)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Website Design](#website-design)
  - [Microservice Design](#microservice-design)
    - [REST API Implementation](#rest-api-implementation)
  - [Docker](#docker)
  - [Kubernetes](#kubernetes)
  - [Conclusion](#conclusion)

## Introduction
The purpose of this project is to create a website from scratch that uses microservice architecture to host the website across multiple applications. This is done using ```HTML, JSP, Java, CSS, SQL, Docker and Kubernetes``` to manage different steps in the process. Communication between the applications occurs through ```REST APIs and XML```.

## Website Design
The first step in the process was to come up with a topic for the website and ESPN with a betting portion was chosen due to the rising popularity of such services. The next step was to design the website using the website design tools mentioned above to create a website base that is functional on a local machine using Apache Tomcat. This single website was then split into three different applications so that other applications can be made that use the different components and it also makes the overall website easier to modify iteratively as only one microservice would need to be modified at a time instead of one large application. These files can be found in the [ProjectFiles](ProjectFiles) folder.

</br>

Below is a ```Use Case Diagram``` that was created for the website described above:

</br>

[<img src=resources/ESPN_with_Bets_Use_Case_Diagram.jpg height=500>](resources/ESPN_with_Bets_Use_Case_Diagram.jpg)

</br>

Below is a ```Entity Relationship Diagram``` that was created for the database needed to run the website described above:

</br>

[<img src=resources/ER_Diagram.jpg height=400>](resources/ER_Diagram.jpg)

## Microservice Design

As mentioned previously there were three microservices chosen to create the website:

- ```FrontEnd```: This microservice handles the GUI portion for the project allowing the user to interact with the other components of the project. This microservice has an ```Account_ESPN``` database with an Account table.

- ```Information```: This microservice handles the information that a user can view on the website. Information included is statistics based on teams, leagues, players, etc. This microservice has an ```Information_ESPN``` database and contains Leagues, Teams, and Players tables.

- ```Betting```: This microservice handles information about bets with regards to ongoing bets, bet amounts, the odds of a bet, what the bet is contingent on and the user that the bet is associated with. This microservice has a ```Betting_ESPN``` database with a single table named Betting.

### REST API Implementation

```REST API``` is used to allow the FrontEnd microservice to communicate with the information microservice and request information such as information about a league, or the teams in a league. This information is transmitted using ```XML``` and the [InformationResource.java](ProjectFiles\Information\src\main\java\endpoint\InformationResource.java) class which can be seen below:

[<img src=resources/XML_NFL.png height=200>](resources/XML_NFL.png)
<br/>

^This shows the ```XML``` output that results from searching for information on the NFL.

[<img src=resources/XML_NFLTeams.png height=25>](resources/XML_NFLTeams.png)
<br/>

^This shows the input that is used to generate the ```XML``` output for NFL Teams which can be seen in the [NFLTeams.xml](resources\NFLTeams.xml) file.

The FrontEnd then takes this ```XML``` and converts it into an ArrayList of Team object in the [Business.java](ProjectFiles\FrontEnd\src\main\java\Business\Business.java) and [TeamsXML.java](ProjectFiles\FrontEnd\src\main\java\Helper\TeamsXML.java) which is then used by the [NFLTeams.jsp](ProjectFiles\FrontEnd\src\main\webapp\NFLTeams.jsp) to show the relevant data to the user.

## Docker

To deploy the web application that has been created so far ```Docker``` was used to create 6 images. The first 3 images were used to host Apache Tomcat instances of the 3 microservices that use a compressed version of the Project Files for each microservice called .war files. The other 3 images were used to host MySQL instances for each microservice so they would have access to their own database as specified in [Microservice Design](#microservice-design). The files that were used to create the docker images are stored in the [DockerFiles](DockerFiles) folder.

</br>

Due to the limitations of the ```Kubernetes``` deployment the user facing microservices FrontEnd and Information need to be able to support HTTPS which requires them to have SSL certificates. The certificates were created and both of the images for those microservices were updated to use the certificates and an updated [server.xml](DockerFiles/server.xml) starting on line ```103``` that would use HTTPS. For more information view the [Dockerfile-frontendservice](DockerFiles/Dockerfile-frontendservice) file.

## Kubernetes

To finally deploy the web application Kubernetes was used and a [Deployment.yaml](Kubernetes/Deployment.yaml) was created to use the docker images that were created to create the microservices. There are volume claims done for the MySQL databases so that their data is persistent and the databases are connected to the microservices using environment variables.

## Conclusion

To conclude the website was created using a microservice architecture and deployed at [espn.ninepiece2.tk/FrontEnd](https://espn.ninepiece2.tk/FrontEnd) using Kubernetes on my personal server which can be further explained [here](https://github.com/NinePiece2/TrueNASHomeServer#appsdocker-and-kubernetes). 

</br>

The website that was created is a prototype and other pages can be easily added now that a framework has been created for them.  Currently the Home button does not work and will error out however logging in and creating account work as well as the NFL Home and Teams pages and the Betting page after logging in. Other pages may be added at a later time. As the website is running off my personal server it is slow sometimes and does require some patients.
