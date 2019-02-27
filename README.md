# Sweater Weather
A Module 3 Turing School solo project built with Ruby on Rails. APIs consumed in this project include the DarkSky, GoogleGeocode, and Flickr. I then created a customized weather api. Currently this project is purely backend except a small welcome page, the front end will be built in the next module. Project expectations are located here: http://backend.turing.io/module3/projects/sweater_weather

[SweaterWeather](https://my-sweater-weather.herokuapp.com)
![MySweaterWeather](/.readme/dailyweather.jpg)
## Getting Started && Prerequisites

###### API Keys Required:

* Google defined within as `ENV['GOOGLE_API_KEY']`
* DarkSky defined within as `ENV['DARKSKY_AIP_KEY']`
* Flickr defined within as `ENV['FLICKR_API_KEY']`

You will need Rails v 5.2.2.
```
gem install rails -v 5.2.2
```
Clone down this repo!

```
git clone https://github.com/mgoodhart5/sweater_weather
```

### Installing

From your terminal, navigate into the Range_society directory:

```
cd my-sweater-weather
```

Make sure your gemfile is up to date:

```
bundle
bundle update
```
Establish a database:

```
rake db:{drop,create,migrate}
```
Start your server:

```
rails s
```

Open your browser (best functionality in Chrome).

`localhost:3000`

Welcome to the dev environment!

![MySweaterWeather](/.readme/currentweather.jpg)

## API Endpoints

Current Weather:
`
GET https://my-sweater-weather.herokuapp.com/api/v1/forecast?location=<location>
`
Account Creation (this will return an api key):
`
POST https://my-sweater-weather.herokuapp.com/api/v1/users?email=<email>&password=<password>&password_confirmation=<password_confirmation>
`
Login (this will return an api key):
`
POST https://my-sweater-weather.herokuapp.com/api/v1/users?email=<email>&password=<password>
`
Favoriting Locations:
`
POST https://my-sweater-weather.herokuapp.com/api/v1/favorites?location=<location>&api_key=<api_key>
`
View Favorite Locations:
`
GET https://my-sweater-weather.herokuapp.com/api/v1/favorites?api_key=<api_key>
`
Delete a Favorite Location:
`
DELETE https://my-sweater-weather.herokuapp.com/api/v1/favorites?location=<location>&api_key=<api_key>
`

## Testing

Your location should be the root directory of the project (`Range_society`).

From the command line run `rspec`
(This can take a moment)

`Green` is passing.
`Red` is failing.

I used `rspec`, `capybara`, `launchy`, `vcr`, `shoulda-matchers`, and `simplecov` for testing.


## Deployment

The app is deployed on heroku at: [MySweaterWeather](https://my-sweater-weather.herokuapp.com)

## Created with

* `Rails`
* `Ruby`

### Gems:

* `faraday`
* `figaro`
* `travis`
