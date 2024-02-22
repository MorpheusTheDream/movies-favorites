<template>

  <div class="homebox">

    <div id="searchWall" class="boxBg">
      <div class="boxBlur">
        <div class="text">
          <p>Let's start looking for the movie you want to watch</p>
          <router-link :to="{ name : 'search'}">Search movies</router-link>
        </div>
      </div>
    </div>

    <div v-if="showOptions" id="favoriteWall" class="boxBg">
      <div class="boxBlur">
        <div class="text">
          <p>Hello {{ user }}, checkout your favorite movies</p>
          <router-link :to="{ name : 'favorite'}">My Favorites</router-link>
        </div>
      </div>
    </div>

    <div id="aboutWall" class="boxBg">
      <div class="boxBlur">
        <div class="text">
          <p>Click here to know about this website.</p>
          <router-link :to="{ name : 'about'}">About me</router-link>
        </div>
      </div>
    </div>

  </div>
 
</template>

<script>

import { ref, defineComponent, onMounted } from 'vue'

export default defineComponent({
  setup() {
    
    const showOptions = ref(false)
    const user = ref(null)

    onMounted ( () => {
      user.value = localStorage.getItem("user")
      showOptions.value = false

      const getToken = localStorage.getItem("token")
        if ( getToken != null) {
          showOptions.value = true
        }
    })

    return { showOptions, user }

  }

})



</script>

<style scoped>

.homebox {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;

  margin: 4em auto 0;
}

#searchWall {
  background-image: url("@/assets/img/1198137.jpg");
}

#aboutWall {
  background-image: url("@/assets/img/5668712.jpg");
}

#favoriteWall {
  background-image: url("@/assets/img/1134920.jpg");
}

.boxBg {
  background-size: cover;
  background-position: center;

  width: 400px;
  height: 300px;
  border-radius: 10px;
  box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);

  margin: .5em;
}

.boxBlur {
  background-color: rgba(26, 25, 25, 0.7);
  display: flex;
  align-items: center;
  border-radius: 10px;
  backdrop-filter: blur(2px);
  padding: 0 2em;

  height: 100%;
}

.text {
  text-align: center;
  margin: 0 auto;
}

.text p {
  color: white;
}

.text a {
  color: white;
  text-decoration: none;
  border-radius: 10px;
  background-color: green;
  padding: .5em 1em;
  margin: 0 auto;
}

.text a:hover {
  background-color: darkgreen;
}

@media screen and ( max-width: 900px) {
  .homebox {
    display: block;
    width: 100%;
    box-sizing: border-box;
  }

  .boxBg {
    width: 70%;
    margin: 1em auto;
  }
}

</style>