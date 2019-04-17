<template>
  <div class="container">
    <div class="margin-top-bottom">
      <h1>Top 100 Board Games of 2019!!</h1>
      <input
        v-model="search"
        type="text"
        placeholder="search games"
        class="search-bar"
      />
      <div class="masonry">
        <div
          v-for="g in filterGames"
          :key="g.id"
          class="item card"
          @click="myFilter"
        >
          <img :src="g.thumb_url" class="card-img center-content" />
          <p v-if="game_archive.isVisible">
            {{ g.game_rank }}: {{ g.game_name }} - {{ g.designer }}
          </p>
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
      search: ""
    }
  },
  computed: {
    filterGames: function() {
      return this.game_archives.filter(GameArchive => {
        return GameArchive.game_name
          .toLowerCase()
          .match(this.search.toLowerCase())
      })
    }
  },
  created: function() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      const vm = this
      vm.$axios
        .get("https://boardgameapi.herokuapp.com/api/v1/game_archives")
        .then(function(response) {
          vm.game_archives = response.data
        })
        .catch(function(error) {
          vm.game_archives = "An error occured." + error
        })
    },
    myFilter: function() {
      this.game_archive.isVisible = !this.game_archive.isVisible
    }
  }
}
</script>

<style lang="scss">
h1 {
  text-align: center;
  font-family: "Raleway", sans-serif;
}

.masonry {
  /* Masonry container */
  column-count: 5;
  column-gap: 1.5em;
  @media only screen and (max-width: 600px) {
    column-count: 3;
  }
}

.item {
  /* Masonry bricks or child elements */
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
}

.margin-top-bottom {
  margin: 80px 0;
}

.search-bar {
  width: 80%;
  display: block;
  margin: 0 auto;
}
</style>
