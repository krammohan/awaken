# README

Awaken attempts to make the unpleasant experience of waking up every morning more enjoyable. Our Ruby on Rails web app onboards a user and allows them to set preferences and a date/time for when they want to be woken up. 

PubNub's publish-subscribe technology connects the server to the Raspberry Pi, which will then turn on the television (or display of choice) and render the user's widgets page. 

A background job scheduler (ActiveJob) was used to listen to the time set by the user and activates the job when that time arrives. A widgets page will gently awaken the user at that time.  

## Demo
This project is deployed [on Heroku](http://awakenapp.herokuapp.com/) for your perusal.

## Web App
### Landing Page

  ![](https://github.com/krammohan/awaken/blob/master/landing-page.png)
  
### User Preferences Page
This is the page a user will see once they have logged in to the app using their Google account. For the Google login functionality, we utilized Google OAuth and the Ruby Devise gem. 

  ![](https://github.com/krammohan/awaken/blob/master/preferences-page.png)
  
### Widgets Page
Based on which widgets a user has selected on the user preferences page and which time and day they have set their alarm for, the Raspberry Pi will display a personalized widgets page.

  ![](https://github.com/krammohan/awaken/blob/master/widgets-page.png)

## Built With
- Ruby on Rails
- Python
- Raspberry Pi
- JavaScript/Materialize

## Authors
- Kavya Rammohan [(GitHub)](https://github.com/krammohan)
- Angela Marshall [(GitHub)](https://github.com/asmarshall)
- Marcela Porto [(GitHub)](https://github.com/marcelaporto)
- Roger Clayton [(GitHub)](https://github.com/radiohegel)
- Antonio Saric [(GitHub)](https://github.com/antoniosaric)
