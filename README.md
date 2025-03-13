# How to set up this project

1. Follow the instructions in Lesson 1 to set up your machine with Ruby and Rails.
2. Once you've verified both Ruby and Rails are installed properly, fork this repository and then clone your fork to your source directory (wherever you keep your source code.)
3. In a terminal window, navigate to the root directory of the project and run
   ```
   bundle install
   ```
   This installs any additional gems the project needs on your local machine.
5. In a terminal window and in the root directory of the project, run the following command to set up the database and starter data:
   ```
   bin/rails db:setup
   ```
   This runs the rails executable's db:setup command, which creates development and test databases with the current schema. It also populates the development database with data created by running `db/seeds.rb`.

## SQLite Database GUI

We'll be using a SQLite database to store application data in this project. You'll likely find it helpful to be able to view and access the database with a GUI (graphical user interface). There are many options to choose from, and these applications come and go from time to time. I recommend [Beekeeper Studio](https://www.beekeeperstudio.io/), which has a very complete free (community) [offering](https://www.beekeeperstudio.io/get) and a nice interface with versions for multiple platforms. There's also the official [SQLite GUI](https://sqlitebrowser.org/dl/) which may support a wider variety of platforms, but the interface may be a little less polished.

Once you have a SQLite GUI installed, open the database and take a look. There should be data in most tables that looks similar to the data from the spreadsheet (though the data will not match exactly). The development and test databases are located in `app/storage`, called `development.sqlite3` and `test.sqlite3` respectively.

In Beekeeper Studio...
- Click "File" -> "New window", then choose "SQLite" from the options
- Then click "Choose File" and navigate to `app/storage/development.sqlite3` inside the root directory of your project. - Select the file and click "Connect".

You should see a list of table names on the left. Double click any table to see a preview of data. Notice there are filters at the top for quick querying on individual columns.

## Running the rails console

Rails has an interactive shell interface that includes the entire application development environment, giving you the ability to create, read, update and delete data, and interact with the classes and models you define in the application without going through a frontend interface. We'll spend a lot of time in the rails console. Here's how you can start a rails console session.

In a terminal window, inside the root directory of your project:

```
bin/rails c
```

After some startup, you'll see your cursor at a command prompt. Any valid Ruby code is permitted. Hit enter to execute code. Or if your code is several lines long (like a loop or if statement), the console will delay execution until you've entered the syntax that closes the loop or statement.

At any point, to exit the console, hold Control and hit c.

## Running the rails server

The Rails framework comes with a built-in web server that listens on port 3000 (by default) for requests to localhost in development. To start the server...

In a terminal window, inside the root directory of your project:

```
bin/rails s
```

This time, you'll see some startup output and then some logs like:

```
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```

Now you should be able to visit `http://localhost:3000` in your browser and see the default application home page.

Check out some of the existing routes:

`http://localhost/coding_classes`
`http://localhost/enrollments`
`http://localhost/students`

As you click around, look back at the terminal window where you started the application. You should see the requests you make logged in the terminal window. 

```
Started GET "/students/" for 127.0.0.1 at 2025-02-23 15:48:50 -0500
Processing by StudentsController#index as HTML
  Rendering layout layouts/application.html.erb
  Rendering students/index.html.erb within layouts/application
  Student Load (0.4ms)  SELECT "students".* FROM "students" /*action='index',application='DocRails',controller='students'*/
  ↳ app/views/students/index.html.erb:8
  Rendered students/_student.html.erb (Duration: 0.8ms | GC: 0.0ms)
  Rendered students/_student.html.erb (Duration: 0.3ms | GC: 0.0ms)
  Rendered students/_student.html.erb (Duration: 0.0ms | GC: 0.0ms)
  Rendered students/_student.html.erb (Duration: 0.0ms | GC: 0.0ms)
  Rendered students/_student.html.erb (Duration: 0.0ms | GC: 0.0ms)
  Rendered students/_student.html.erb (Duration: 0.0ms | GC: 0.0ms)
```

Remember this when you need to do some troubleshooting or debugging. It's very helpful for those tasks.

## Running tests

This application includes the `rspec` test framework and some starter tests. To run the full test suite...

In a terminal window, inside the root directory of your project:

```
bundle exec rspec spec
```

Prefixing with `bundle exec` ensures that the `rspec` executable is run using the gems specified in the Gemfile. The `spec` here, is the spec directory of the project, and passing this directory as an argument to `rspec` runs every spec file in the directory.

You can also run the tests in a file by passing the filename. And you can restrict further to one or more tests by including a line number following a colon after the filename.

```
bundle exec rspec spec/models/course_spec.rb:36
```
