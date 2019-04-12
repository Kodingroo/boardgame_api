import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#my-target-element',
    data: {
      board_game_ref: '',
      games: [{varName: null}],
      characters: ['Isaac', 'Yuki', 'Junki', 'Patrick']
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
    },
    beforeMount: function () {
      this.varName = this.$el.attributes['data-var-name'].value;
    },
  });
})
