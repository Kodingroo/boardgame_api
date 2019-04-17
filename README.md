## Board Game API documentation

An API (Application Programming Interface) is just like a web-site that communicates raw data (like JSON) instead of well structured and designed data (like HTML/CSS). You can see an API as the poor-version of a standard website meant to be used by computers, not by human beings.

#### Base URL

The base URL of the API is 'https://boardgameapi.herokuapp.com/'. Feel free to test the API using [Postman](https://www.getpostman.com/) or in the JS console directly.

#### Get games `GET ./api/v1/game_archives'`

Will get you the JSON file of all games by rank`. E.g:

```json
{
      "game_name": "Gloomhaven",
      "game_rank": 1,
      "playing_time": 120,
      "category": "Adventure",
      "mechanic": "Campaign / Battle Card Driven",
      "designer": "Isaac Childres",
      "image_url": "https://cf.geekdo-images.com/original/img/lDN358RgcYvQfYYN6Oy2TXpifyM=/0x0/pic2437871.jpg",
      "thumb_url": "https://cf.geekdo-images.com/thumb/img/e7GyV4PaNtwmalU-EQAGecwoBSI=/fit-in/200x150/pic2437871.jpg"
  },
  {
      "game_name": "Pandemic Legacy: Season 1",
      "game_rank": 2,
      "playing_time": 60,
      "category": "Environmental",
      "mechanic": "Action Point Allowance System",
      "designer": "Rob Daviau",
      "image_url": "https://cf.geekdo-images.com/original/img/P_SwsOtPLqgk2ScCgI2YrI9Rg6I=/0x0/pic2452831.png",
      "thumb_url": "https://cf.geekdo-images.com/thumb/img/WI5NmPd9C3PpRvHKoP4a0Ettlao=/fit-in/200x150/pic2452831.png"
}
```

#### Post a game `POST './api/v1/game_archives'`

Will post a new game on our API's database under `game_archives`.
In the request body, you have to include at minimum a unique game_name:

```json
{
  "game_name": "Your favorite game"
}
```
However, this is limited to users with admin access, along with the Update and Destroy actions.

#### Update a game `PATCH './api/v1/game_archives/:id'`
#### Remove a game `DELETE './api/v1/game_archives/:id'`

If you wish to do this using Postman, please be sure to include:
```
Content-Type: `application/json`
X-User-Email: `youremail@email.com`
X-User-Token: `your token from when your create your user in the terminal`
```

## Cloning the API locally

From Github, you may click Clone or Download, and then clone to your local harddrive.
https://github.com/Kodingroo/boardgame_api

Once cloned, run the following in the terminal:

```
Install:
$ bundle install
$ yarn install --check-files
$ rake db:create
$ rake db:migrate
$ rails c
  In the console > User.create(email: 'email', password: 'password')
$ rake db:seed

Run:
$ rails server -p 4000 (or any available/valid port)
```

## Board Game Vue project documentation

The Vue project folder is an example of Vue's ability to fetch data from an API and display it dynamically. For the purposes of this exercise, you will need to clone this project and follow these steps in order to run it locally:


Once cloned, run the following in the terminal from the boardgame_api/vue_project directory:
```
  Install:
  $ npm install

  Run:
  $ npm run dev

```
Enjoy the Vue project search features while browsing the current world top 100 board games. I also hope the API is useful for your own board game research purposes.

Let me know if either was useful and how you'd like it to be further improved.

Kodingroo@gmail.com
