[![Build Status](https://travis-ci.org/netguru-code-college/how-are-you-today.svg?branch=master)](https://travis-ci.org/netguru-code-college/how-are-you-today)

# How are you today?

## Technology

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.5.1 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 5.1.6 |
| [Postgresql](https://www.postgresql.org/) | 9.5 |

## Links

[Heroku](https://how-are-you-today-app.herokuapp.com/)
[TravisCI](https://travis-ci.org/netguru-code-college/how-are-you-today)

## Setup

#### Clone the repository

    $ git clone https://github.com/netguru-code-college/how-are-you-today.git && cd how-are-you-today

#### Install gems

    $ bundle install

### Create your local database: 

    $ rake db:create
    
### Migrate your database:: 

    $ rake db:migrate
    
#### Run the application

    $ rails server

Your app should now be running on [localhost:3000](http://localhost:3000).


