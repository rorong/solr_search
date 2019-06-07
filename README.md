# Using Solr search engine with Sunspot gem in Rails app
# Solr search engine
http://lucene.apache.org/solr/

# Sunspot
Sunspot is a Ruby library for interaction with the Solr search engine. Sunspot is built on top of the RSolr library, which provides a low-level interface for Solr interaction.

## Prerequisites:
You will need the following things properly installed on your computer.
* ruby -v ~ 2.6.2
* rails -v ~ 5.2.3

## Installation:
* git clone https://github.com/rorong/solr_search.git
* bundle install
* rails db:setup && rails db:seed

## Running / Development:
* rails s

# Integrate Solr with Rails app
Add to Gemfile:

```
gem 'sunspot_rails'
gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development. Please find a section below explaining other options for running Solr in production
```
Bundle it!

```
bundle install
```
Generate a default configuration file:

```
rails generate sunspot_rails:install
```
If sunspot_solr was installed, start the packaged Solr distribution with:

```
bundle exec rake sunspot:solr:start

or to start in foreground:
sunspot:solr:run
```

This will generate a ```/solr``` folder with default configuration files and indexes.

access server from browser:

```
bundle exec rake sunspot:solr:start

http://localhost:8982/solr/#/
```

## Run Solr in production
config/sunspot.yml:
```
production:
  solr:
    hostname: localhost
    port: 8983
    log_level: WARNING
    path: /solr/production
```
remove folder solr:
```
cd app/path

rm -rf solr
```
Start Solr server:
```
RAILS_ENV=production rake sunspot:solr:start
```
It will create directories in solr/:
```
data/production
test/data
development/data
default/data
```
Edit solr/solr.xml:
```
<?xml version="1.0" encoding="UTF-8" ?>
<solr persistent="false">
  <cores adminPath="/admin/cores" host="${host:}" hostPort="${jetty.port:}">
    <core name="production" instanceDir="." dataDir="production/data"/>

  </cores>
</solr>
```

Remove unnecessary folders:
```
cd solr

rm -rf default test
```

Create folders for 'production' data:
```
mv development production
cd data
rmdir production
ln -s ../production/data production
```

Now we are ready to start Solr server:
```
# start in background
RAILS_ENV=production bundle exec  rake sunspot:solr:start


# run in foreground:
RAILS_ENV=production bundle exec  rake sunspot:solr:run


# to stop server:
RAILS_ENV=production bundle exec rake sunspot:solr:stop

# reindex
RAILS_ENV=production bundle exec rake sunspot:solr:reindex
```

## Reindex

Anytime a model is created, updated, or destroyed, Sunspot in Rails will automatically update data in its index (as a part of the save callbacks). You only need to do a full reindex if you added or changed a searchable definition for a model.

Reindex using rake:
```
bundle exec rake sunspot:reindex

# for a specific  model
bundle exec rake sunspot:reindex[500,Post]

# to skip the prompt asking you if you want to proceed with the reindexing:
bundle exec rake sunspot:reindex[,,true]
```
