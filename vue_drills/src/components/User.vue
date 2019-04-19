<template>
    <div class="component">
        <h1>Parent:  The User Component</h1>
        <p>I'm an awesome User!</p>
        <button type="button" name="button" @click="changeName">Change my Name</button>
        <p>User Name: {{ name }}</p>
        <hr>
        <div class="row">
            <div class="col-xs-12 col-sm-6">
                <app-user-detail :myName="name" :hobby="hobby" @nameWasReset="name = $event"></app-user-detail>
            </div>
            <div class="col-xs-12 col-sm-6">
                <app-user-edit></app-user-edit>
            </div>
        </div>
    </div>
</template>

<script>
    import UserDetail from './UserDetail.vue';
    import UserEdit from './UserEdit.vue';

    export default {
      data: function() {
        return {
          name: 'Isaac',
          hobby: 'Board Games'
        }
      },
      methods: {
        changeName() {
          this.name = 'Yuki'
        }
      },
        components: {
            appUserDetail: UserDetail,
            appUserEdit: UserEdit
        }
    }
</script>

<style scoped>
    div {
        background-color: lightblue;
    }
</style>
