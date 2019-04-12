<template>
  <div id="app">
    <p>{{ board_game_ref }}</p>
  </div>
</template>

<script>
export default {
  data: {
    board_game_ref: '',
  },
  created: function () {
    this.fetchData();
  },
  methods: {
    fetchData: function () {
      var vm = this
      this.$http.get('https://boardgameapi.herokuapp.com/api/v1/game_archives'),
      function (data) {
        vm.board_game_ref = data.game_name;
      }
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
