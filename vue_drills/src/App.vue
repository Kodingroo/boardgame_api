<template>
  <div id="app">
    <h1>Hello World</h1>
    <my-component></my-component>
  </div>
</template>

<script>
Vue.component('my-component', {
  data: function() {
    return {
      status: 'Critical'
    }
  },
  template: '<p> Server Status: {{ status }}</p>'
});

</script>

<style lang="scss">

</style>
