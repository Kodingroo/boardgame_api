<template>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <h1>Top 100 Board Games</h1>
        <!-- <div class="form-group">
          <label>Game Name</label>
          <input class="form-control" type="text" v-model="game_archive.game_name">
        </div>
        <div class="form-group">
          <label>Game Mechanic</label>
          <input class="form-control" type="text" v-model="game_archive.mechanic">
        </div>
        <button class="btn btn-primary" @click="submit">Submit</button> -->
        <hr>
        <button class="btn btn-primary" @click="fetchData">Get Data</button>
        <ul class="list-group">
          <li class="list-group-item" v-for="g in game_archives">{{g.game_rank}}: {{ g.game_name }} - {{ g.mechanic}}</li>
        </ul>
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
