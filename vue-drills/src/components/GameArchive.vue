<template lang="html">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-8 col-sm-offset-2 cold-md-6 col-md-offset-3">
        <h1>Game Search</h1>
        <input type="text" name="" value="" v-model="search">
        <hr>
        <ul>
          <li v-for="g in filterGames">{{ g.game_rank }}: {{ g.game_name }} - {{ g.mechanic }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { GameArchiveMixin } from './GameArchiveMixin'

export default {
  mixins: [ GameArchiveMixin ],
  computed: {
    filterGames: function() {
      return this.game_archives.filter((game_archive) => {
        return game_archive.game_name.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.category.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.mechanic.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.designer.toLowerCase().match(this.search.toLowerCase())
      })
    }
  }
}
</script>

<style lang="css" scoped>
</style>
