import { createRouter, createWebHistory } from 'vue-router'

import HomeView from '../views/HomeView.vue'
import AboutView from '../views/AboutView.vue'
import LoginView from '../views/LoginView.vue'
import SearchView from '../views/SearchView.vue'
import favoriteView from '../views/favoriteView.vue'

import CreateAccount from '../components/CreateAccount.vue'
import MovieDetail  from '../components/MovieDetail.vue'


const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/home',
    name: '/home',
    component: HomeView
  },
  {
    path: '/search',
    name: 'search',
    component: SearchView,
  },
  {
    path: '/details/:id',
    name: 'details',
    component: MovieDetail,
    props: true
  },
  {
    path: '/about',
    name: 'about',
    component: AboutView
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/CreateAccount',
    name: 'createaccount',
    component: CreateAccount
  },
  {
    path: '/home/:id',
    name: 'home/id',
    component: HomeView,
    props: true
  },
  {
    path: '/favorite',
    name: 'favorite',
    component: favoriteView,
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
