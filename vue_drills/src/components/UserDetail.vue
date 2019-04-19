<template>
    <div class="component">
        <h3>Child: You may view the User Details here</h3>
        <p>Many Details</p>
        <p>User Name: {{ switchName() }}</p>
        <p>Hobby: {{ hobby }}</p>
        <button type="button" name="button" @click="resetName">Reset Name</button>
    </div>
</template>

<script>
export default {
  props: {
    myName: {
      String,
      required: true,
      default: 'Patrick'
    },
    hobby: String
  },
  methods: {
    switchName() {
      return this.myName.split("").reverse().join("")
    },
    resetName() {
        this.myName = 'Makoto'
        this.$emit('nameWasReset', this.myName)
    }
  }
}
</script>

<style scoped>
    div {
        background-color: lightcoral;
    }
</style>
