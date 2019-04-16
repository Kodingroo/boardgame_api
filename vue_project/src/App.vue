<template>
  <div class="container">
    <div class="margin-top-bottom">

      <h1>Top 100 Board Games</h1>
      <button class="btn btn-primary" @click="fetchData">Get Data</button>

      <div class="masonry">
        <div class="item">
          <div class="card" v-for="g in game_archives"><img :src="g.thumb_url" class="card-img"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      game_archive: {
        game_name: "",
        game_rank: "",
        playing_time: "",
        category: "",
        mechanic: "",
        designer: ""
      },
      game_archives: []
    }
  },
  methods: {
    submit() {
      this.$http.post('https://boardgameapi.herokuapp.com/api/v1/game_archives.json', this.game_archive)
      .then(response => {
        console.log(response)
      }, error => {
        console.log(error)
      })
    },
    fetchData: function () {
      var vm = this
      axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
      .then(function (response){
        vm.game_archives = response.data;
      })
      .catch(function (error){
        vm.game_archives = 'An error occured.' + error;
      });
    }
  }
}
</script>

<style lang="scss">
.masonry { /* Masonry container */
  column-count: 4;
  column-gap: 1em;
}

.item { /* Masonry bricks or child elements */
  background-color: white;
  display: inline-block;
  margin: 0 0 1em;
  width: 100%;
}

.card {
  position: relative;
  outline: 2px solid black;
  width: 100%;
  background-size: cover;
  box-shadow: pink;
  margin: 10px;
  overflow: hidden;
  cursor: pointer;
  & .card-img {
    width: 100%;
  }
  &:hover {
    outline: 2px solid yellow;
  }
}

.margin-top-bottom {
  margin: 80px 0;
}
</style>


<!-- fetchData: function () {
var vm = this
this.get_games = 'Loading...';
axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
.then(function (response){
vm.get_games = response.data;
})
.catch(function (error){
vm.get_games = 'An error occured.' + error;
});
} -->

<!-- fetchData() {
this.$http.get('https://boardgameapi.herokuapp.com/api/v1/game_archives.json')
.then(response => {
return response.json()
})
.then(data => {
const resultArray = []
for (let key in data) {
resultArray.push(data[key]);
}
this.game_archives = resultArray
})
} -->


<!-- <div class="form-group">
<label>Game Name</label>
<input class="form-control" type="text" v-model="game_archive.game_name">
</div>
<div class="form-group">
<label>Game Mechanic</label>
<input class="form-control" type="text" v-model="game_archive.mechanic">
</div>
<button class="btn btn-primary" @click="submit">Submit</button> -->
