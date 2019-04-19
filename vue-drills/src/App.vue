<template>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <app-game-index></app-game-index>
                <app-game-archive></app-game-archive>
            </div>
        </div>
    </div>
</template>

<script>
    import GameIndex from './components/GameIndex.vue';
    import GameArchive from './components/GameArchive.vue'

    export default {
        components: {
            appGameIndex: GameIndex,
            appGameArchive: GameArchive
        }
    }


</script>

<style>
    div.component {
        border: 1px solid black;
        padding: 30px;
    }
</style>
