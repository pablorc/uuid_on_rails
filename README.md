# UUID ON RAILS

## Introduction

This is a plugin for Rails to use UUIDs as primary keys in your apps transparently. 
This field is used as primary key, so isn't needed a id field and a uuid field to have the rails' id and the uuid.

If you like performance, don't worry. You can use this plugin without any fear.

# Usage

1. Install the plugin.
1. If you use methods in your migrations like TableDefinition#references, TableDefinition#belongs_to, change it to #relationship (without change any parameter)
1. Run all the migrations (rake db:migrate:reset).
1. Continue your work.
