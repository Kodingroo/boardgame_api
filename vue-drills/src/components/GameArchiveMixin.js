export const GameArchiveMixin = {
  data() {
    return {
      gameArchive: ['Mythotopia', 'Game of Thrones'],
      filterSearchGames: ''
    }
  },
  computed: {
    filteredGames() {
      return this.gameArchive.filter((ele) => {
        return ele.match(this.filterSearchGames)
      })
    }
  }
}
