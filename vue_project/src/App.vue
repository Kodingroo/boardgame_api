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
        mechanic: ""
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
    fetchData() {
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
    }
  }
}
</script>

<style lang="scss">

</style>
