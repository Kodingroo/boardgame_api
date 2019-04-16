import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import axios from 'axios'

import game_card from './game_card.vue'

Vue.use(BootstrapVue)
Vue.use(VueResource)

Vue.component('game-card', game_card)

new Vue({
  el: '#app',
  render: h => h(App)
})
