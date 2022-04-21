# README

Versions:
Ruby 2.7.5p203 (2021-11-24 revision f69aeb8314) [x86_64-darwin20]
Rails 7.0.2.3

This is the back end of an app for querying the [Ravelry API](https://www.ravelry.com/api) and displaying results. [The front end, done in Vue, lives here](https://github.com/graceolivia/yarn-detective-8-front-end).

## Cloning and starting the application

Clone the repository. To run after cloning:
```
cd yarnDetectiveBackend8
bundle
rails s
```

To test:
```
rake
```

## Connecting to the Ravelry API

In order to work with the Ravelry API, this app uses Read-Only HTTP Basic Auth access. Instructions for how to get the correct credentails are available at the [Ravelry API documentation](https://www.ravelry.com/api). In order to create these credentials, users need a free Ravelry account and a free Developer account, which can be gotten [here](https://www.ravelry.com/pro/developer).

This will give you a username and password. To enter them into the app, run the command:

`EDITOR="vim" rails credentials:edit`

Then, in the file, enter:
```
ravelry:
  username: {INSERT HERE}
  password: {INSERT HERE}
```

This will allow access to the read-only routes that we need for this app.

To lint:

```
rubocop --require rubocop-rails
```

To lint with autocorrect:

```
rubocop --auto-correct-all
```

## Instructions for use

This project is a back end server serving JSON data from the Yarn search from the Ravelry API.

To query the API, use this route:

`http://127.0.0.1:3000/api/yarns.json?query={QUERY GOES HERE}`

The intended use is with [the Vue front end](https://github.com/graceolivia/yarn-detective-8-front-end).