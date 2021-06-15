# README

This web service accepts HTTP requests and returns responses.

## Technologies
* ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin20]
* Rails 5.2.6
* PostgreSQL

## Installation Instructions
### rbenv

* install rbenv
```
  brew install rbenv
```
* add to PATH
```
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```
* initialize rbenv everytime you open a new console window (to prevent our system ruby version from taking over)
```
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```
* update current console window with new settings
```
  source ~/.bashrc
```
* source .bashrc from .bash_profile (necessary on some machines)
```
  echo 'source ~/.bashrc' >> ~/.bash_profile
```

### Ruby
* install Ruby version 2.5.1
```
  rbenv install 2.5.1
```
* set version 2.5.1 to be your global default
```
  rbenv global 2.5.1
```
* update the environment to your configuration
```
  rbenv rehash
```
* verify ruby version
```
  ruby -v
```
* check installation location of the version of ruby you are using
```
  which ruby
```

### Gems
* use bundler to define project dependencies inside a Gemfile.
```
  gem install bundler
```

## Initial setup after cloning repo
1. Remove Existing Gemfile.lock
2. Install dependencies to create a new Gemfile.lock
```
  bundle install
```
3. Create db
```
  bundle exec rails db:setup
```
  ^ this command runs `db:create`, `db:schema:load` and `db:seed`

4. Start Rails server
```
  bundle exec rails s
```
  Rails will be running on localhost:3000
   
## Routes
Check all routes by running `bundle exec rails routes`

* `GET  /users` - users index
* `GET  /users/:id` - return user's current balance
* `GET  /transactions` - transactions index
* `GET  /transactions/new` - new transaction form
* `POST /transactions` - create transaction for a specific user
* `POST /spends` - declare spending amount and create the necessary transactions

## Test API calls and responses

If you want to reset the database, stop the running server with ctrl + C, and run
```
  bundle exec rails db:reset
```
then restart the server
```
  bundle exec rails s
```

### Setting up example data from your brower
1. Enter `localhost:3000` in the url, which will redirect you to the users index page
2. Click on `All Transactions` then `New Transaction`

<img width="500" alt="image" src="#"><img width="500" alt="image" src="#">

3. Input `dannon` for payer and `300` for points, Click `Create this transaction` to create the transaction and redirect back to the Transaction index page.

<img width="500" alt="image" src="#"><img width="500" alt="image" src="#">

4. Repeat the previous step for creating new transactions with exactly the following data:
  payer: `unilever` points: `200`
  payer: `dannon` points: `-200`
  payer: `miller coors` points: `10000`
  payer: `dannon` points: `1000`

5. After creating the 5 transactions, on the bottom of the transaction index page, Enter `5000` in Spend Points and click `Generate transactions`

<img width="500" alt="image" src="#">

6. Three new transactions are created according to the rules:
  * Oldest points to be spent first (oldest based on transaction timestamp, not the order they’re received)
  * No payer's points to go negative.
  
<img width="500" alt="image" src="#">