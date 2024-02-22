<template>
  <header>
      <h1>MOVIES</h1>

      <input type="checkbox" id="checkMenu"> 
      <label for=checkMenu id="menu">MENU</label>



    <nav>
      <router-link :to="{ name: 'home'}">Home</router-link>
      <router-link :to="{ name: 'about'}">About</router-link>
      <router-link :to="{ name: 'search'}">Search</router-link>

      <router-link :to="{ name: 'favorite'}" v-if="userShow" > favorite </router-link>

      <p v-if="userShow">Hi there, {{ firstName }}</p>
      <button @click="logOut" v-if="userShow">Logout</button>
      
      <router-link :to="{ name: 'login'}" v-else > Login</router-link>
    </nav>
  </header>

    <router-view @getlogin="getlogin"/>

</template>

<script>
import router from "@/router"
import axios from 'axios'
import { ref, defineComponent } from 'vue'

export default defineComponent({
  setup() {

    localStorage.setItem("noPage", 0)

    const firstName = ref(null)
    const userShow = ref(false)

    const getlogin = () => {
        const token = localStorage.getItem("token")

        axios.post( "http://restapi.test/get.php", {
          "token": token,
          "status": "login"
        } ).then( function(res) {
          if ( res["data"] != "failed") {
            firstName.value = res["data"]
            localStorage.setItem("user", res["data"])
            userShow.value = true
          } 
        })
    }

    getlogin()
    

    const logOut = () => {
      const confirmLogout = confirm("apakah anda yakin ingin logout ?")

      if ( confirmLogout == true ) {
        localStorage.removeItem("token")
        localStorage.removeItem("rememberMe", "false")
        alert("anda telah logout")
        getlogin()
        userShow.value = false
        router.push({name: "login"});
      }
    }

    return { logOut, getlogin, userShow, firstName }

  }

})

</script>



<style>


#menu {
  top: 1em;
  display: flex;
  align-items: center;
  width: 50px;
  height: 30px;
  padding: .7em;
  color: black;
  font-weight: bold;
  cursor: pointer;
  box-shadow: 0 0 7px black;
  border-radius: 10px;
  opacity: 0;

  transition: .7s;
}

#checkMenu {
  display: none;
}

body {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  color: green;
  background-color: whitesmoke;

}

.users {
  display: flex;
  align-items: center;
  font-size: .9em;
}

header  {
  padding: 1vh 2vh;
  display: flex;
  justify-content: space-between;
}

nav {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  text-align: center;
}

nav a {
  padding: .5em;
  margin-left: 1em;
  color: green;
  text-decoration: none;
  font-weight: bold;
  border: 2px solid whitesmoke;
}

nav a:hover {
  border-bottom: 2px solid green;
  box-sizing: border-box;
}

nav a.router-link-exact-active {
  border-bottom: 2px solid green;
  text-shadow: 0 0 2px lightgreen;
}

nav p {
  margin-left: 1em;
  box-shadow: 0 0 1px black;
  color: black;
  padding: 5px;
}

nav button {
  font-size: 1em;
  font-weight: bold;
  border: none;
  cursor: pointer;
  background: transparent;
  box-shadow: 0 0 1px black;
  margin-left: .5em;
  padding: 5px;

}

nav button:hover {
  color: green;
  box-shadow: 0 0 1px green;
}

@media screen and ( max-width: 800px ) {

nav {
  transform: scale(0);
  top: -5em;
  right: 0;
  position: absolute;
  justify-content: center;
  width: 100px;
  display: flex;
  background: whitesmoke;
  box-shadow: 0 0 7px green;
  border-radius: 30px 0 0 30px;
  padding: 2em;
  opacity: 1;
  transition: .3s;
}

nav a {
  padding: 1em;
  margin-bottom: 10px;
  box-sizing: border-box;
}

nav a:hover {
  border-bottom: none;
  border: 2px solid whitesmoke;
  border-radius: 15px;
  box-shadow: 0 0 7px green;

  transition: .3s;
}

nav a.router-link-exact-active {
  border-bottom: none;
  border-radius: 25px;
  box-shadow: 0 0 7px green;
}

nav p {
  color: black;

}

nav button {
  color: black;
  width: 100%;
}

#menu {
  position: relative;
  opacity: 1;
}

#menu:hover {
  color: green;
  box-shadow: 0 0 7px green;
}

#checkMenu:checked ~ #menu{
  color: green;
  box-shadow: 0 0 7px green;
  border-radius: 30px;
}

#checkMenu:checked ~ nav{
  top: 7em;
  z-index: 100;
  opacity: 1;
  transform: scale(1);
}


}

</style>
