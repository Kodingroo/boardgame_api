<template lang="html">
  <div class="">
    <app-server-status v-for="server in 5"/>
  </div>
</template>

<script>
import ServerStatus from './ServerStatus.vue'

export default {
  components: {
    'app-server-status': ServerStatus
  }
}
</script>

<style lang="css" scoped>
</style>
