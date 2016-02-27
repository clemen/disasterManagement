# disasterManagement
* install rvm
        on Mac: <tt>\curl -sSL https://get.rvm.io | bash -s stable --rails</tt>
* use ruby 2.2.1:
        <tt>rvm use 2.2.1</tt>
* install postgres
        on mac: <tt>brew install postgres</tt>
* start the postgres server
        on mac: <tt>brew services start postgres</tt>
* create a postgres user:
        <tt>createuser -W userpg</tt>
* create the db:
        <tt>createdb postgres -O disasters_help</tt>
* login to the postgres console:
        <tt>psql disaster_help</tt>
* <tt> CREATE ROLE userpg WITH LOGIN SUPERUSER PASSWORD 'the_password'</tt>
* Edit ~/.bash_profile and add:
        <tt> export POSTGRES_USERNAME='userpg'</tt>
        <tt> export POSTGRES_PASSWORD='thepassword'</tt>
* install the required gems:
        <tt> bundle install</tt>
* create the tables:
        <tt> rake db:migrate</tt>
* populate the tables:
        <tt> RAILS_ENV=test rake db:setup</tt>
* run the server:
        <tt> rails s</tt>
* go to localhost:3000/home

