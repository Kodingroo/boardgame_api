<template lan<div id="app">
  <paginated-list :list-data="people"/>
</div>
</template>

<script>
export default {
}
</script>

<style lang="css" scoped>
#app{
  width:80%;
  margin:auto;
}
ul{
  padding: 4px 4px;
  border: 1px solid black;

}
li{
  list-style-type:none;
  padding:4px 4px;
}
li:hover{
  background-color:#eee;
}
li:nth-child(2n){
  background-color:#ddd;
}
li:nth-child(2n):hover{
  background-color:#ccc;
}

button{
  width:100px;
  height:40px;
  background-color:#eef;
}

button:hover{
  cursor:pointer;
}
button:hover:disabled{
  cursor:not-allowed;
}
</style>


Vue.component('paginated-list', {
  data() {
    return {
      pageNumber: 0 };

  },
  props: {
    listData: {
      type: Array,
      required: true },

    size: {
      type: Number,
      required: false,
      default: 10 } },


  methods: {
    nextPage() {
      this.pageNumber++;
    },
    prevPage() {
      this.pageNumber--;
    } },

  computed: {
    pageCount() {
      let l = this.listData.length,
      s = this.size;
      return Math.floor(l / s);
    },
    paginatedData() {
      const start = this.pageNumber * this.size,
      end = start + this.size;
      return this.listData.
      slice(start, end);
    } },

  template: `<div>
               <ul>
                  <li v-for="p in paginatedData">
                    {{p.first}}
                    {{p.last}}
                    {{p.suffix}}
                  </li>
               </ul>
              <button
                  :disabled="pageNumber === 0"
                  @click="prevPage">
                  Previous
              </button>
              <button
                  :disabled="pageNumber >= pageCount -1"
                  @click="nextPage">
                  Next
              </button>
             </div>
  ` });






function createFakeData() {
  let data = [];
  for (let i = 0; i < 100; i++) {if (window.CP.shouldStopExecution(0)) break;if (window.CP.shouldStopExecution(0)) break;
    data.push({ first: 'John',
      last: 'Doe',
      suffix: '#' + i });
  }window.CP.exitedLoop(0);window.CP.exitedLoop(0);
  return data;
}



new Vue({
  el: '#app',
  data: {
    people: createFakeData() } });
