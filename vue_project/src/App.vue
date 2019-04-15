<template>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <h1>Hello</h1>
        <div class="form-group">
          <label>Game Name</label>
          <input class="form-control" type="text" v-model="game_archive.game_name">
        </div>
        <div class="form-group">
          <label>Game Mechanic</label>
          <input class="form-control" type="text" v-model="game_archive.mechanic">
        </div>
        <button class="btn btn-primary" @click="submit">Submit</button>
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
        mechanic: ""
      }
    }
  },
  methods: {
    submit() {
      console.log(this.game_archive)
    }
  }
}
</script>

<style lang="scss">

</style>
