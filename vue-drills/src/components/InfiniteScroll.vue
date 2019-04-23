<template lang="html">
  <div class="">
    <header>
      Hacker News header
    </header>

    <div v-for="(item, $index) in list" :key="$index">
      <p>{{ $index }} {{ item }}</p>
    </div>

    <infinite-loading @infinite="infiniteHandler"></infinite-loading>
  </div>
</template>

<script>
import axios from 'axios';

const api = '//hn.algolia.com/api/v1/search_by_date?tags=story';

export default {
  data() {
    return {
      page: 1,
      list: [],
    };
  },
  methods: {
    infiniteHandler($state) {
      axios.get(api, {
        params: {
          page: this.page,
        },
      }).then(({ data }) => {
        if (data.hits.length) {
          this.page += 1;
          this.list.push(...data.hits);
          $state.loaded();
        } else {
          $state.complete();
        }
      });
    },
  },
};

</script>

<style lang="css" scoped>
</style>
