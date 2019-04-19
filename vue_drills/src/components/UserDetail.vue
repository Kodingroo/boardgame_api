<template>
    <div class="component">
        <h3>Parent: You may view the User Details here</h3>
        <p>Many Details</p>
        <p>User Name: {{ name }}</p>
        <p>Hobby: {{ hobby }}</p>
    </div>
</template>

<script>
export default {
  props: [
    'name',
    'hobby'
  ]
}
</script>

<style scoped>
    div {
        background-color: lightcoral;
    }
</style>
