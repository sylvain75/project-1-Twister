# Project 1: Twitter like

## Features:

- Bootstrap gem to improve the layout:
  - Navbar
  - Tables
  - Footer
- Sign up/in set up with the session controller
- Tweets (twists) system to post in a dedicated page
- Dated comments possible on any twists
- Links to the other profiles

## Where I struggled:

All went smoothly until I start to install the tweet system. I tried to build my app by myself which was a good point to understand better the basic and I could not come back on the tutorial advised because too many difference to link them together. 
The comment controller/routes have also been a real difficulty to manage and hopefully Joel and Jack were there. I will have to review that.

## Sources:
 
http://edgeguides.rubyonrails.org/
https://www.youtube.com/watch?v=Zo2vav3dYnY "Scaffolding and twitter bootstrap"

## What could be improved:

- Image/video uploader system could be installed
- the design

### Cloudinary

I tried to follow jake tutorial https://ga-wolf.gitbooks.io/wdi-12/content/modules/cloudinary.html and also the cloudinary_test app we created however I am struglling to finalise it. 
- In my _form.html.erb, I am not sure if I have to set up a `multipart = true`
- In the users_controller.rb I am not sur of `req = Cloudinary::Uploader.upload params[:image]`
- Finally When I'm trying to check if my form is working, there is only an input for image yet nothing to upload the image. I am not sure to remember but I think it was more like a upload button.

Thanks for your help, I hope you have good holidays.



