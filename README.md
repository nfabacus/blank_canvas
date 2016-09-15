# **Blank Canvas**

<a href="https://github.com/hannako">Jess 'BB' Jones</a> | <a href="https://github.com/bkluczynski">Bart Kluczynski</a> | <a href="https://github.com/nfabacus">Nobuyuki Fujioka</a> | <a href="https://github.com/liskowsky">Karol Lebiedzinski</a> | <a href="https://github.com/benjamin-white">Ben White</a>

This repositry was made for the final challenge of our time with **Makers Academy** suring the summer of 2016.<br>

## **User Stories**
We arrived at the following user stories to help inform and drive our development iterations.

    As a thing
    So that I can thing
    I want to thing


## **Usage**

If you have PostgreSQL and bundler installed the following commands can be employed to run and the test the site locally :

    $ git clone https://github.com/hannako/blank_canvas
    $ cd blank_canvas
    $ createdb blank_canvas_development && reatedb blank_canvas_test
    $ bin/rake db:migrate
    $ bundle install
    $ bin/rails s

## **Some Screenshots**

![Screenshot](https://somescreenshot.jpg)

## **Things we struggled with**

## **Our Successes**
MVP + Agile practices
Rails PostgreSQL Interact / JQueryUI Rspec/Capybara extensive use of XPath for testing CSS + Shoulda Matchers SVG / DOM Nokogiri + Local file system
User input -> HTML Fragemnt on server and manipulate with Nokogiri to write to filesystem

CRUD RESTful

## **Future Features**

* Replace fixed CSS sizes with REMs and enhance stylesheet breakpoints.
