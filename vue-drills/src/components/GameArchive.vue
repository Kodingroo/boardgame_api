<template lang="html">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 cold-md-6 col-md-offset-3">
        <h1>Game Search</h1>
        <input type="text" name="" value="" v-model="search">
        <hr>
        <ul>
          <li v-for="g in filterGames">{{ g }}</li>
          <li v-for="g in game_archives">{{ g.game_name }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { GameArchiveMixin } from './GameArchiveMixin'

export default {
  mixins: [ GameArchiveMixin ],
  data() {
    return {
      game_archives: []
    }
  },
  computed: {
    filterGames: function() {
      return this.gameArchive.filter((game_archive) => {
        return game_archive.toLowerCase().match(this.search.toLowerCase())
      })
    }
  }
}
</script>

<style lang="css" scoped>
</style>
