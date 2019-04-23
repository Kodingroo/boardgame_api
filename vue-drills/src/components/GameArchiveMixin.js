import axios from 'axios'

export const GameArchiveMixin = {
  data() {
    return {
      game_archives: [],
      game_archive: {
        game_name: "",
        game_rank: "",
        playing_time: "",
        category: "",
        mechanic: "",
        designer: "",
        isVisible: false
      },
      search: "",
      isAllSelected: false,
      gameArchive: ['Mythotopia', 'Game of Thrones', 'Dragonfire'],
      filterSearchGames: ''
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
        vm.game_archives = response.data
      })
      .catch(function (error){
        vm.game_archives = 'An error occured.' + error;
      });
    }
  }
}
