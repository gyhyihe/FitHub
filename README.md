# EECS341 Final Project Report 

Prepared by: Yihe Guo, Melody Li, Yue Shu
May 5, 2019

- [EECS341 Final Project Report](#eecs341-final-project-report)
  - [Introduction](#introduction)
    - [Project Overview](#project-overview)
    - [Usage](#usage)
      - [Operating Environment](#operating-environment)
      - [Installation](#installation)
  - [User Interface](#user-interface)
  - [File Structure](#file-structure)
  - [Database](#database)
  - [Responsibilities and Lessons Learned](#responsibilities-and-lessons-learned)
      - [Yue Shu](#yue-shu)
      - [Yihe Guo](#yihe-guo)
      - [Melody Li](#melody-li)

---

## Introduction

### Project Overview

**FitHub** is a virtual gym located on the 4th floor of Veale Center and is open to all CWRU student and faculty. Customers need to register for a membership online before going to the gym. There are five levels of memberships with different sign-up prices: `Bronze`, `Silver`, `Gold`, `Platinum`, and `Diamond`. We are designing websites connecting to the gym database, which allow both users and managers to retrieve and update their information, register in the classes being taught at Veale, or become a course tutor themselves.

We implemented the official website for `FitHub` in `Django` combined with `MySQL`. The website allows users to 
1. Sign up for new accounts and register for classes using the create operation (`INSERT` query in `MySQL`)
2. Check personal information, membership status, and class information using the retrieve operation (`SELECT` query in `MySQL`) 
3. Update personal information and membership level status using the update operation (`UPDATE` query in `MySQL`)
4. Drop classes using the delete operation (`DELETE` query in `MySQL`)
5. Display the total number of students enrolled in a specific class and display the class list in descending order of the popularity of the classes using the aggregate function (`GROUP BY` and `ORDER BY` queries in `MySQL`)
6. Switch to staff portal if applicable 

### Usage
#### Operating Environment

The `FitHub` application is developed under the `django` framework, so as long as the operating environment supports version `Django 2.0.6` or above, the user would be able to run the web server as a localhost. 

#### Installation 

Before deploying all the required packages, please make sure you have `Python 3.6.1` or above installed. All the required packages are specified in `requirements.txt`. We have also implemented a shell script `installReq.sh` to do the work for you, so under `Linux` enviroment, just type the below command in your terminal to have the packages installed:

```
$ ./installReq.sh
```

Once you have successfully installed `Django 2.0.6` and all the other requirements, just type the following command in your terminal to run the `FitHub` application: 

```
$ python3 manage.py runserver
```

Now you should be able to land on our welcome page by typing out your localhost IP and default port number `127.0.0.1:8000` in your web browser and start your journey with FitHub!

## User Interface

When a user first enters the website, this user is greeted by a welcome page where this user is introduced to FitHub and its services. The user could then choose to sign up for a member account for FitHub, or login if the user already have an account. Since FitHub provides the best service to its members exclusively, non-members are not allowed further access to FitHub websites.


Upon login, the user is presented with the user's information page, where this user could make changes to the email and phone number field. However, the user will not be able to change the name field without contacting the administration office for the sake of identity security. The user information page is the core webpage for the whole site, most functions this website provides have user profile page as their base. For example, the user could check and potentially update the user's membership status if requested. The user could check the classes this user is registered for, view the information of this user's classes, or remove the classes this user is enrolled in. There is also a link on the user information page to redirect the user to a sign up page where this user is presented with the complete list of classes.

The user information page contains a link which allows the user to switch to the staff page if this user is a staff, but users cannot register to become tutors as all tutor approval processes has to be done in person for safety purposes. Once the user is done with the FitHub website, a user could log out of the account by clicking on the log out button at the very bottom of the page. 

## File Structure

Both our code and data are under the outer `FitHub` folder, which contains the following files: `manage.py` and `requirements.txt`. It also contains the following subfolders: `FitHub`, `landing`, `login`, and `profile`.

The `FitHub` subfolder contains the files are used and shared across the Django applications. Landing, login, and profile are Django application folders, among which `landing` is the welcome page, `login` handles the login requests, and `profile` is the most important one enabling most of the website features. 

Three application folders all have similar subfiles: `admin.py` is the file in which the models are registered. `models.py` contains the model declarations, which are python objects that represent relations. The models we’ve written in this file are base on the SQL table declaration file `data.sql` in the outermost `FitHub` folder. We’ve written the models here in order for Django to run. 

`apps.py` allows us to set configurations for the application, `profile` in this case. `urls.py` is where the url patterns are defined, in which the path function takes three arguments: first is route which is a url pattern and second is the view that is linked to the url. Third is named url patterns used in the reverse function for getting the url given name. 

Finally, `view.py` is where all the view functions are collected. View functions takes a web request and return the corresponding web response as we defined it. There might also be a `static` folder in the application folder where the `CSS` files are located. The other important subfolder applications have is the templates folder, which is where the actual http files are located.

## Database 

We first writeup our database with SQL createtables and then insert data entries into the tables as something similar to what is now displayed in the `sqlCode.sql` file. We then translate the createtables to Django models as required by the Django framework, and then generate the actual `sqlCode.sql` file accordingly with the Django `sqlmigrate` command. 

While the Django framework would automatically utilize the models for administration purposes, such as for operations done in the `admin` page, we wrote all of our queries used by our functions in `MySQL` to fulfill the `CRUD` operation requirements as well as the aggregation function requirements. Refer to the `views.py` file in the profile folder for more details about our `MySQL` queries. 

## Responsibilities and Lessons Learned

#### Yue Shu 

I'm the program manager, database manager and the frontend developer of most of the templates in our project. I'm also the scrum master of our group as our project is organized in a manner similar to the `Scrum` development approach: 
- I allocated the product backlog at the beginning of our project 
- I make the daily sprint planning and assign tasks to our group members in both our groupchat and the project dashboard of our git repository 
- We perform the scrum meetings on a daily basis before the sprints
- We merge our commits and have the sprint review meetings by the end of everyday, where I will allocate and refine all the backlogs for our next sprint

As I'm the database manager of our project, I set up the database and basically wrote all `SQL` queries used by our view functions. I also formulated most of the templates of our website, and resolved some of the key backend issues such as the encapsulation of user data, etc. 

Through the scope of our project, I got to familiarize Scrum as a development process, and get adapt to Django as a web framework. I'm glad to work as a PM in field with my teammates. 

#### Yihe Guo

I worked on mostly the front end of the project, mostly working with django, css and some SQL:
- I setted up several webpages and linked them to the other webpages as well as the database
- I worked with CSS and HTML to adjust website layout and style
- I fixed varies bugs and optimized some of the url implementations

#### Melody Li

I'm the primary Django developer in the group. My responsibilities are to create user registration form to allow users to signup and login, as well as to connect the frontend HTTP files with our backend SQL database through various HTTP methods. 

I started the basic structure of each HTTP file and let Yue finalize with details, created method stubs in `profile/views.py` with user request and appropriate parameters to support SQL query inputs, and utilized urls to connect our web pages together. 

Through the development experience of this project, I got to learn how to use Django as a web framework, how to connect frontend elements with backend database, and how to collaborate with both software enginners and program manager to work in a more interdesciplinary manner. 
