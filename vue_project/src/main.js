import Vue from 'vue'
import App from './App.vue'
import axios from 'axios'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import Base from './Base.vue'

Vue.use(BootstrapVue)

new Vue({
  el: '#app',
  render: h => h(App)
})
