<template lang="html">
  <div>
    <div class="item card" v-for="g in filterGames" @click="myFilter">
      <img :src="g.image_url" class="card-img center-content">
      <p v-if="game_archive.isVisible">{{ g.game_rank }}: {{ g.game_name }} - {{ g.designer}}</p>
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
      search: ""
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
    myFilter: function(){
      this.game_archive.isVisible = !this.game_archive.isVisible;
      // some code to filter users
    }
  },
  computed: {
    filterGames: function() {
      return this.game_archives.filter((game_archive) => {
        return game_archive.game_name.toLowerCase().match(this.search.toLowerCase())
      })
    }
  }
}
</script>

<style lang="css" scoped>
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
  margin: 10px;
  overflow: hidden;
  cursor: pointer;
  & .card-img {
    width: 100%;
  }
  &:hover {
    outline: 2px solid red;
  }
}
</style>
