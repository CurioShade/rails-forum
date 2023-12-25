# Overview

This reposistory contains a simple rails project, with as little dependencies as possible (outside default ones made by rails and bcrypt). 
Wanted to make something tangible with the knowledge of Ruby on Rails framework I acquired in the past few months. Made with **Ruby 3.2.2** and **Rails 7.1.0**.
![Forum Overview](https://github.com/CurioShade/rails-forum/assets/80947734/838e334e-cbdb-4d4e-8594-a4a078998863)

## Features

### Breadcrumb list and pagination
Project uses simple pagination system (own implementation of cursor based pagination) that divides content to pages. 
You are free to edit the values that limit how many records can be shown on the page. Breadcrumb list is also included to allow easier navigation
without the need of using browser's "go back to previous page" button.  

### Account signup and login
Clicking on signup or login button creates respective modal that allows the user to either create an account or log into existing one. 
Account creation doesn't require an email (made mostly for convinience, since the project wasn't made in mind with deploying it on the server).
![Creating an account and logging to it](https://github.com/CurioShade/rails-forum/assets/80947734/90d974bb-20df-4e97-98cd-96e0a0c2cc1a)

### Creation and destruction of comments and posts
As you log in, you gain access to post and comment creation. You can comment posts that belong to you and others. 
Changes on the latter will be also reflected on the post in thread's posts list.
![Posts and comments functionality](https://github.com/CurioShade/rails-forum/assets/80947734/1978fb54-b4e5-4140-9a3b-870f7c9628b5)

### Admin functionality  
While you can't create admin accounts or give admin permissions to existing account on the site itself (you need to do it in rails console itself), included admin account also allows:  

#### Creation and destruction of categories and assigned threads
You can easily add new categories and threads to the site with admin account and even delete existing ones.
![Admin manipulating threads and categories](https://github.com/CurioShade/rails-forum/assets/80947734/805aa5fb-a08e-457d-92c6-109001a498fe)

#### Destruction of posts and comments made by other users
As admin, you can freely delete any comment or post you don't like.
![Admin destroying posts and comments of other users](https://github.com/CurioShade/rails-forum/assets/80947734/1d627a71-25da-4dc4-ba3c-7b002ade4be3)


## What I need to initalize the project?
Outside of owning Ruby and Rails on your computer, as well as making sure you have bcrypt gem, you should create your [own master key](https://stackoverflow.com/questions/59993437/can-i-generate-a-new-config-master-key-file), 
since it is not included in the project. After you do so, you should create new database and seed it with the values from seeds.rb. To do so, you should do as follows:
```
$ bin/rails db:create
$ bin/rails db:migrate
$ bin/rails db:seed
```
That should be enough to make the project working.

## Outside contributions
Since it was my first serious use of Rails in a web project, there were quite few times when I looked for additional help outside the docs themselves.
So here I wanted to thank to: 
* [Ruby on Rails Discussion community](https://discuss.rubyonrails.org/),
* **Alexandre Ruban** - for [awesome Turbo tutorial](https://www.hotrails.dev/turbo-rails),
* **Sid Krishnan** - for [clean solution to my Turbo problem](https://www.ducktypelabs.com/turbo-break-out-and-redirect/)

Also additional thanks to **Star** and **Luppert** for providing feedback on user experience.
Svg files used in the project were taken from [UxWing](https://uxwing.com/) and slightly edited by myself.
