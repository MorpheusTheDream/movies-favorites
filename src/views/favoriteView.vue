<template>
    <div class="movieList" >
      <div class="movieBox" v-for="film in films" :key="film">
        <img :src="film['poster']">
               
        <router-link :to="{ name: 'details', params: { id: film['imdbid'] } }"><p>{{ film['title'] }}</p></router-link>
        <p>{{ film['year'] }}</p>
        
        <div class="userRating">
          <p>
            <img src="@/assets/icon/star-icon.webp">
            {{ film['userrating'] }}
          </p>
        </div>
      </div>
    </div>

    <div class="pages" >
      
      <div class="pagesButton" v-for="page in pages" :key="page">
        <button @click="movePage(page)">{{ page }}</button>
      </div>

    </div>

</template>

<script>

import axios from 'axios'
import { ref } from 'vue'
export default {
  inheritAttrs: false,

  setup() {
      const fullfilms = ref([])
      const films = ref([])
      const pages = ref([])

      axios.post("http://restapi.test/get.php", {
        "token": localStorage.getItem("token"),
        "status": "favoritelist"
      }).then ( function(res) {
        const pageCount = res["data"].length
        fullfilms.value = res["data"]
        let x = ref(0) 
        while( x.value < pageCount) {
          pages.value.push(x.value)
          x.value +=1
        }

        nowPage()
      })

    const nowPage = () => {
      const pageNumber = localStorage.getItem("noPage")

      if (pageNumber == false ) {
        localStorage.setItem("noPage", 0)
      }

      films.value = fullfilms.value[pageNumber]
    }

    const movePage = no => {
      localStorage.setItem("noPage", no)
      nowPage()
    }




    return { films, pages, movePage}
  }
}
</script>

<style scoped>

.pages {
  display: flex;
  justify-content: center;
  margin: 1rem;
}

.pagesButton {
  padding: 3px;
}

.pagesButton button{
  font-size: 1rem;
  padding: .3rem;
  border: none;
  box-shadow: 0 0 1px black;
}

.pagesButton button:hover{
  cursor: pointer;
  color: white;
  background-color: green;
  box-shadow: 0 0 1px green
}

.loading {
  width: 50%;
  font-size: 1em;
  margin: 0 auto;
  text-align: center;
  color: black;
  text-shadow: 0 0 1px black;
}

.movieList {
  display: flex;
  flex-wrap:wrap;
  justify-content: center;

  width: 90%;
  margin: 5em auto 0;
}

.movieBox {
  width: 250px;
  box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
  border-radius: 15px;
  overflow: hidden;
  color: black;
  font-size: 1em;
  background: white;
  text-align: center;

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
  cursor: pointer;
}

.userRating {
  display: flex;
  justify-content: center;
}

.userRating p {
  font-weight: bold;
}

.userRating p img {
  width: 1em;
  height: 1em;
  margin-right: 2px;
}

</style>
