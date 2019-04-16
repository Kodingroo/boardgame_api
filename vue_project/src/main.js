import Vue from 'vue'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import VueResource from 'vue-resource'
import axios from 'axios'

Vue.use(BootstrapVue)
Vue.use(VueResource)

new Vue({
  el: '#app',
  render: h => h(App)
})
