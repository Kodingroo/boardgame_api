<template>

  <!-- <div id="app">
  <paginated-list :list-data="people"/>
</div> -->

<div class="component">
  <h1>The User Component</h1>
  <p>I'm an awesome User!</p>
  <button @click="changeName">Change my Name</button>
  <p>Name is {{ name }}</p>
  <p>Age is {{ age }}</p>
  <hr>
  <div class="row">
    <div class="col-xs-12 col-sm-6">
      <app-game-index-detail
      :myName="name"
      @nameWasReset="name = $event"
      :resetFn="resetName"
      :userAge="age"></app-game-index-detail>
    </div>
    <div class="col-xs-12 col-sm-6">
      <app-game-index-edit
      :userAge="age"
      @ageWasEdited="age = $event"
      ></app-game-index-edit>
    </div>
  </div>
</div>
</template>

<script>
import GameCard from './GameCard.vue';
import SearchBar from './SearchBar.vue';

export default {
  data: function () {
    return {
      name: 'Max',
      age: 27
    };
  },
  methods: {
    changeName() {
      this.name = 'Anna';
    },
    resetName() {
      this.name = 'Max';
    }
  },
  components: {
    appGameIndexDetail: GameCard,
    appGameIndexEdit: SearchBar
  }
}
</script>

<style scoped>
div {
  background-color: lightblue;
}
</style>
