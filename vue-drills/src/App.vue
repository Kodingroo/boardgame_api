<template>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <app-game-index></app-game-index>
            </div>
        </div>
    </div>
</template>

<script>
    import GameIndex from './components/GameIndex.vue';

    export default {
        components: {
            appGameIndex: GameIndex
        }
    }
</script>

<style>
    div.component {
        border: 1px solid black;
        padding: 30px;
    }
</style>
