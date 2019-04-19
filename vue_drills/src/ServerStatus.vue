<template lang="html">
  <div class="">
    <p>Server Status: {{ status }}</p>
    <hr>
    <button type="button" name="button" @click="changeStatus">Change Status</button>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      status: 'Critical'
    }
  },
  methods: {
    changeStatus() {
      this.status = 'Normal'
    }
  }
}
</script>

<style lang="css" scoped>
</style>
