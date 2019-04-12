import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.component('game-index-component', {
  data: {
    get_games: ''
  },
  template: '<div> {{ get_games.first }} </div>',
  created: function () {
    this.fetchData();
  },
  methods: {
    fetchData: function () {
      var vm = this
      this.get_games = 'Loading...';
      axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
      .then(function (response){
        vm.get_games = response.data;
      })
      .catch(function (error){
        vm.get_games = 'An error occured.' + error;
      });
    }
  }
});
