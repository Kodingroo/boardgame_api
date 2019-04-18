import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#my-target-element',
    data() {
      return {
        game_archive: {
          game_name: "",
          game_rank: "",
          playing_time: "",
          category: "",
          mechanic: "",
          designer: "",
          isVisible: false
        },
        game_archives: [],
        search: ""
      }
    },
    created: function () {
      this.fetchData();
    },
    methods: {
      fetchData() {
        var vm = this
        axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
        .then(function (response){
          vm.game_archives = response.data;
        })
        .catch(function (error){
          vm.game_archives = 'An error occured.' + error;
        });
      },
      filterRanks: function(){
        this.game_archive.game_rank = !this.game_archive.game_rank;
      },
      filterNames: function(){
        this.game_archive.game_name = !this.game_archive.game_name;
      },
      filterTimes: function(){
        this.game_archive.playing_time = !this.game_archive.playing_time;
      },
      filterCategories: function(){
        this.game_archive.category = !this.game_archive.category;
      },
      filterMechanics: function(){
        this.game_archive.mechanic = !this.game_archive.mechanic;
      },
      filterDesigners: function(){
        this.game_archive.designer = !this.game_archive.designer;
      }
    },
    computed: {
      filterGames: function() {
        return this.game_archives.filter((game_archive) => {
          return game_archive.game_name.toLowerCase().match(this.search.toLowerCase())
        })
      }
    }
  })
})

//
// Vue.component('game-index-component', {
//   data: function() {
//     return {
//       get_games: ''
//     }
//   },
//   template: '<ul><li v-for="g in get_games"> {{g.game_rank}} : {{ g.game_name }}, <img :src="g.thumb_url"></li></ul>',
//   created: function () {
//     this.fetchData();
//   },
//   methods: {
//     fetchData: function () {
//       var vm = this
//       this.get_games = 'Loading...';
//       axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
//       .then(function (response){
//         vm.get_games = response.data;
//       })
//       .catch(function (error){
//         vm.get_games = 'An error occured.' + error;
//       });
//     }
//   }
// });
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#my-target-element',
//     data: {
//       get_games: ''
//     },
//     created: function () {
//       this.fetchData();
//     },
//     methods: {
//       fetchData: function () {
//         var vm = this
//         this.get_games = 'Loading...';
//         axios.get('https://boardgameapi.herokuapp.com/api/v1/game_archives')
//         .then(function (response){
//           vm.get_games = response.data;
//         })
//         .catch(function (error){
//           vm.get_games = 'An error occured.' + error;
//         });
//       }
//     }
//   });
// })


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#my-target-element',
//     template: '<div>Just an example with {{varName}}</div>',
//     data: {varName: null},
//     beforeMount: function () {
//         this.varName = this.$el.attributes['data-var-name'].value;
//     },
// });
// })

/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const el = document.body.appendChild(document.createElement('hello'))
//   const app = new Vue({
//     el,
//     render: h => h(App)
//   })
//
//   console.log(app)
// })


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello to me?"
//     },
//     components: { App }
//   })
// })



// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
