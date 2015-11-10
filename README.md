PARCC - Protected Areas Resilient to Climate Change
===========================

[![Code Climate](https://codeclimate.com/github/unepwcmc/parcc/badges/gpa.svg)](https://codeclimate.com/github/unepwcmc/parcc)
[![Test Coverage](https://codeclimate.com/github/unepwcmc/parcc/badges/coverage.svg)](https://codeclimate.com/github/unepwcmc/parcc/coverage)
[![Build Status](https://travis-ci.org/unepwcmc/parcc.svg?branch=master)](https://travis-ci.org/unepwcmc/parcc)

The main objective of the project is to help countries design protected area
systems resilient to the effects of climate change by:

* Providing the tools for assessing the vulnerability of PAs to climate change
* Helping design strategies to strengthen the resilience of PAs
* Building capacity in the region for using the tools and implement the strategies

# Installation

PARCC is a pretty standard Rails application, backed by a Postgres database. To install PARCC, proceed with the usual commands:
```
git clone https://github.com/unepwcmc/parcc.git parcc
cd parcc
bundle install
bundle exec rake db:create db:migrate
```

PARCC uses the `dotenv` gem to manage environment variables. Before starting the server, create a copy of the file `.env.example` (removing the `.example` bit) and edit the needed variables. After this final step, `bundle exec rails server` should work like a charm.

# Importing

When new versions of the CSV files are provided, the importing process can be started by calling the rake task `parcc:import`. This will read the CSV files in the `lib/data` subfolders, and import their content.

Note that this task will initially fill the CSV file `lib/data/protected_areas.csv` with a subset of the information contained in one of the CSV files in the folder `lib/data/turnover` (doesn't matter which one). These information are then used to identify, and merge, with the information coming from the Protected Planet API.
