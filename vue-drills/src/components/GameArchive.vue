<template lang="html">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 cold-md-6 col-md-offset-3">
        <h1>Game Search</h1>
        <input type="text" name="" value="" v-model="filterSearchGames">
        <hr>
        <ul>
          <li v-for="g in filteredGames">{{ g }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { GameArchiveMixin } from './GameArchiveMixin'

export default {
  mixins: [ GameArchiveMixin ],
  created: function () {
    this.fetchData();
  },
  methods: {
    fetchData() {
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

<style lang="css" scoped>
</style>
