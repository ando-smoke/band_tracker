Band Tracker
======================

Tracks bands/music groups and the venues they have played.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
rake
sinatra
sinatra-contrib
sinatra-activerecord
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active session. At the time of
creation of this application, Postgres 9.4 was used. To create the necessary database schema, enter the following Rake statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.0.0 was used.

Database Schema
-----

The following database schema was used for this application:

```db_schema
DATABASES:
  point_of_sale_dev
  point_of_sale_test

TABLES:
  bands
    id (integer PRIMARY KEY)
    name (varchar)
    created_at (timestamp)
    updated_at (timestamp)

  venues
    id (integer PRIMARY KEY)
    name (varchar)
    created_at (timestamp)
    updated_at (timestamp)

  bands_venues
    band_id (integer FOREIGN KEY REFERENCES bands.id)
    venue_id (integer FOREIGN KEY REFERENCES venues.id)
```

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Initially populate the band tracker app with a list of
possible venues that bands can later choose to track
as "played". To add venues into the app, click on
the "Add Venues" button on the app's home page. Upon
entering a list of venues, the user can then go to the
home page and click on the "Bands" button to add bands
to be tracked. Finally, click on the link for each band
to get a band detail page allowing for one or more venues
played to be attributed to the band, editing of band name,
and deletion of the band from the app.

Known Bugs
----------

None as of 2015-01-30.

Author
------

Andy Uppendahl

License
-------

MIT license.
