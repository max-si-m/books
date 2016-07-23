[![Build Status](https://travis-ci.org/max-si-m/books.svg?branch=master)](https://travis-ci.org/max-si-m/books)

# Books

Some funny app =)

[view on heroku](https://lit-wildwood-84405.herokuapp.com/)


Default user:

```
email: user@user.user
password: 1111111111
```

# Deploy to Heroku
You need to sign up in heroku.com

Login in CLI

```
$ heroku login
```

Create new app:

```
$ heroku create
```

Push to heroku(via git):

```
$ git push heroku master
```
Run migrations:

```
$ heroku run rails db:migrate
```
Install seeds:
```
$ heroku run rake db:seed
```

Well done.
