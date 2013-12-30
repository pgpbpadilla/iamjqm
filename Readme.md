# IAMjQM

IAMjQM is a Java EE web application that demonstrates the use of the Java codekit for the IAM API in a mobile web application using jQuery Mobile.


## Requirements
- Netbeans + Maven plugin or any other IDE and Maven.
- JDK 1.6
- Glassfish or some other Java Application Server

## Build it and run it

If you have everything in place you should be able to just run the application, otherwise check the following.

If you want to see how it looks like, go to: http://iamjqm.herokuapp.com/

## Components description

- `com.servlets.app`: A servlet that uses the codekit to get a list of messages and redirects to `app.jsp` setting the list of messages in the session parameters.
- `app.jsp` a simple web page that shows the list using jQuery Mobile `listview` with the option to delete the message from the list.

#Notes

- I couldn't make the Heroku repo work because I couldn't figure out how to easily provide my own app server packaged withing my app. So I simply uploaded the locally generated file to heroku with the help of [this guide](https://devcenter.heroku.com/articles/war-deployment#command-line).