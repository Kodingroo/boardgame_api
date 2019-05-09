<template lang="html">
  <div class="">

    <div class="overflow-auto">
      <input type="text" name="" value="" v-model="search">
      <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
      ></b-pagination>

      <p class="mt-3">Current Page: {{ currentPage }}</p>

      <b-table
      id="my-table"
      :items="filterGames"
      :per-page="perPage"
      :current-page="currentPage"
      small
      >
      </b-table>
    </div>
    <!--
    <div class="">
    <div class="heading">
    <h1>Infinite Scroll</h1>
    <h4>A simple infinite scroll example using Vue.js</h4>
  </div>

  <div class="container" id="app">
  <input type="text" name="" value="" v-model="search">

  <div class="list-group-wrapper">
  <transition name="fade">
  <div class="loading" v-show="loading">
  <span class="fa fa-spinner fa-spin"></span> Loading
</div>
</transition>
<ul class="list-group" id="infinite-list">
<li class="list-group-item" v-for="g in filterGames">{{ g.game_rank }}: {{ g.game_name }} - {{ g.mechanic }}</li>
</ul>
</div>
</div>

<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-8 col-sm-offset-2 cold-md-6 col-md-offset-3">
<h1>Game Search</h1>
<hr>
<input type="text" name="" value="" v-model="search">
<ul>
<li v-for="g in filterGames">{{ g.game_rank }}: {{ g.game_name }} - {{ g.mechanic }}</li>
</ul>
</div>
</div>
</div>
</div>
-->
</div>
</template>

<script>
import { GameArchiveMixin } from './GameArchiveMixin'
import InfiniteScroll from './InfiniteScroll.vue'
import { ScrollMixin } from './ScrollMixin'

export default {
  mixins: [ GameArchiveMixin, ScrollMixin ],
  components: {
    appInfiniteScroll: InfiniteScroll
  },
  computed: {
    filterGames: function() {
      return this.game_archives.filter((game_archive) => {
        return game_archive.game_name.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.category.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.mechanic.toLowerCase().match(this.search.toLowerCase()) ||
        game_archive.designer.toLowerCase().match(this.search.toLowerCase())
      })
    },
    rows() {
      return this.filterGames.length
    }
  },
  data() {
    return {
      perPage: 10,
      currentPage: 1
    }
  }
}
</script>

<style lang="css" scoped>
$purple: #5c4084;

body {
  background-color: $purple;
  padding: 50px;
}
.container {
  padding: 40px 80px 15px 80px;
  background-color: #fff;
  border-radius: 8px;
  max-width: 800px;
}
.heading {
  text-align: center;
  h1 {
    background: -webkit-linear-gradient(#fff, #999);
    -webkit-text-fill-color: transparent;
    -webkit-background-clip: text;
    text-align: center;
    margin: 0 0 5px 0;
    font-weight: 900;
    font-size: 4rem;
    color: #fff;
  }
  h4 {
    color: lighten(#5c3d86,30%);
    text-align: center;
    margin: 0 0 35px 0;
    font-weight: 400;
    font-size: 24px;
  }
}

.list-group-wrapper {
  position: relative;
}
.list-group {
  overflow: auto;
  height: 50vh;
  border: 2px solid #dce4ec;
  border-radius: 5px;
}
.list-group-item {
  margin-top: 1px;
  border-left: none;
  border-right: none;
  border-top: none;
  border-bottom: 2px solid #dce4ec;
}
.loading {
  text-align: center;
  position: absolute;
  color: #fff;
  z-index: 9;
  background: $purple;
  padding: 8px 18px;
  border-radius: 5px;
  left: calc(50% - 45px);
  top: calc(50% - 18px);
}

.fade-enter-active, .fade-leave-active {
  transition: opacity .5s
}
.fade-enter, .fade-leave-to {
  opacity: 0
}
</style>
