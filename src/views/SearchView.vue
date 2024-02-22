<template>

  <h1 id="h1">Search your favorites</h1>

  <div class="search">
    <input type="text" v-model="search" nama="search">
    <button v-on:click="searchButton" id="search">Search</button>
  </div>

  <div v-if="showResults">
    <div class="movieList" >
      <div class="movieBox" v-for="video in videos" :key="video">
        <img :src="video['#IMG_POSTER']">
        <router-link :to="{ name: 'details', params: { id: video['#IMDB_ID'] } }"> <p>{{ video["#TITLE"] }}</p> </router-link>
        <p> {{ video["#YEAR"] }}</p>
      </div>
    </div>
  </div>

  <div v-if="showResults == 'loading' ">
    <div class="loading">
          <h1>Please wait, Loading....</h1>
    </div>

  </div>

</template>

<script>

import axios from 'axios'
import { ref } from 'vue'
export default {
  inheritAttrs: false,
  setup() {
    const videos = ref()
    const search = ref("")
    const showResults = ref(false)

    const autoSearch = async () => {
      search.value = localStorage.getItem("userSearch")

      if (search.value != null) {
        showResults.value = "loading"
        const data = await axios.get("https://search.imdbot.workers.dev/?q=" + search.value)
      
        videos.value = data["data"]["description"];
        showResults.value = true
      }

    }

    autoSearch()

    const searchButton = async () => {
      localStorage.setItem("userSearch", search.value)
      autoSearch()
    }
    
    return { videos, search, searchButton, showResults}
  }
}
</script>

<style scoped>

.loading {
    display: flex;
    background-color: white;
    padding: 3em;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
    border-radius: 10px;
    width: 80%;
    justify-content: center;

    margin: 10em auto;
    color: black;
}

#h1 { 
  font-size: 2em;
  text-align: center;
  text-transform: uppercase;
  color: green;

  margin-top: 5rem;
}

.movieList {
  display: flex;
  flex-wrap:wrap;
  justify-content: center;
  margin-top: 4em;
  width: 90%;
  
  margin: 0 auto;
}

.movieBox {
  width: 250px;
  box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
  border-radius: 15px;
  overflow: hidden;
  text-align: center;
  color: black;
  font-size: 1em;
  background: white;

  margin: .5em;
}

.movieBox img {
  object-fit: cover;
  width: 250px;
  height: 350px;
}

.movieBox a {
  display: block;
  text-decoration: none;
  color: black;
  font-weight: bold;
}

.movieBox a:hover {
  color: green;
}

.search {
  display: flex;
  justify-content: center;
  margin: 1em auto 2em;
}

.search input {
  border: 1px solid black;
  width: 50%;
  font-size: 1.1em;
  border-radius: 10px 0 0 10px;
  border-right: none;
  outline: none;
  padding: 0 15px;
} 

.search button {
  background: black;
  padding: 10px 20px;
  border-radius: 0 10px 10px 0;
  border: none;
  color: white;
  font-size: 1em;
} 

.search button:hover {
    opacity: .5;
    cursor: pointer;
} 

.search input:focus {
    border: 1px solid green;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
} 


</style>
