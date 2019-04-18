<template>
  <div id="my-target-element">
    <div class="container">
      <div class="margin-top-bottom">
        <h1>Top 100 Board Games of 2019!!</h1>
        <input type="text" v-model="search" placeholder="search games" class="search-bar">
        <div class=checkboxes>
          <div>
            <label>Game Names </label>
            <input type="checkbox" name="game_name" :checked="filterNames" @click="filterNames">
          </div>
          <div>
            <label>Game Ranks </label>
            <input type="checkbox" name="game_rank" :checked="isAllSelected" @change="filterRanks">
          </div>
          <div>
            <label>Playing Times </label>
            <input type="checkbox" name="playing_time" :checked="isAllSelected" @click="filterTimes">
          </div>
          <div>
            <label>Categories </label>
            <input type="checkbox" name="category" :checked="isAllSelected" @click="filterCategories">
          </div>
          <div>
            <label>Mechanics </label>
            <input type="checkbox" name="mechanic" :checked="isAllSelected" @click="filterMechanics">
          </div>
          <div>
            <label>Designers </label>
            <input type="checkbox" name="designer" :checked="isAllSelected" @click="filterDesigners">
          </div>
          <div>
            <label>Select All </label>
            <input type="checkbox" :checked="isAllSelected" @click="selectAllCheckboxes">
          </div>
        </div>

        <div class="masonry">
          <div class="item card" v-for="g in filterGames">
            <img :src="g.thumb_url" class="card-img center-content">
            <span v-if="game_archive.game_name"><b>{{ g.game_name }}</b></span>
            <span v-if="game_archive.game_rank"><i>Rank:</i> {{ g.game_rank }}</span>
            <span v-if="game_archive.playing_time">{{ g.playing_time }} <i>minutes</i></span>
            <span v-if="game_archive.category"><i>Category:</i> {{ g.category}}</span>
            <span v-if="game_archive.mechanic"><i>Mechanic:</i> {{ g.mechanic}}</span>
            <span v-if="game_archive.designer"><i>Designer:</i> {{ g.designer}}</span>
          </div>
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
        designer: "",
        isVisible: false
      },
      game_archives: [],
      search: "",
      isAllSelected: false
    }
  },
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
    },
    filterRanks: function(){
      this.game_archive.game_rank = !this.game_archive.game_rank;
    },
    filterNames: function(){
      this.game_archive.game_name = !this.game_archive.game_name;
    },
    filterTimes: function(){
      this.game_archive.playing_time = !this.game_archive.playing_time;
    },
    filterCategories: function(){
      this.game_archive.category = !this.game_archive.category;
    },
    filterMechanics: function(){
      this.game_archive.mechanic = !this.game_archive.mechanic;
    },
    filterDesigners: function(){
      this.game_archive.designer = !this.game_archive.designer;
    },
    selectAllCheckboxes () {
      if (this.isAllSelected) {
        this.isAllSelected = false
      } else {
        this.isAllSelected = true
      }
    }
  },
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

<style lang="scss">
h1 {
  text-align: center;
  font-family: 'Raleway', sans-serif;
}

.masonry { /* Masonry container */
  column-count: 5;
  column-gap: 1.5em;
  @media only screen and (max-width: 600px) {
    column-count: 3;
  }
}

.item { /* Masonry bricks or child elements */
  background-color: white;
  display: inline-block;
  margin: 0 0 1em;
  width: 100%;
}

.card {
  outline: 2px solid black;
  margin: 10px;
  overflow: hidden;
  cursor: pointer;
  & .card-img {
    width: 100%;
  }
  &:hover {
    outline: 2px solid red;
  }
  span {
    display: block;
  }
}

.margin-top-bottom {
  margin: 80px 0;
}

.search-bar {
  width: 80%;
  display: block;
  margin: 0 auto;
}

.checkboxes {
  display: flex;
  flex-direction:row;
  justify-content: center;
  width: 100%; /*Optional*/
  padding: 20px;
  div {
    justify-content: space-between;
    padding-right: 20px;
  }
}
</style>
