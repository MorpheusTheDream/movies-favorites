<template>

<div v-if="showSuccessBox" class="successBox">
    <h3>Berhasil Login</h3>
    <router-link :to="{ name : 'home'}">Back to Home</router-link>
</div>

<div v-else class="box">
    <form @submit.prevent="handleSubmit" autocomplete="off">

    <h1>LOGIN</h1>

    <div class="inputBox" >
      <input type="text" id="username" v-model="username" required>
      <label for="username">Username</label>
    </div>

    <div class="inputBox">
      <input type="password" id="password" v-model="password" required>
      <label for="password">Password</label>
    </div>

    <button>Login</button>

    <div class="createAccount">
      <p>Don't have an account ? <router-link :to="{ name : 'createaccount'}">Signup</router-link></p>
    </div>


    <p>{{ fail }}</p>
    </form>
</div>


</template>

<script>
import router from "@/router"
import axios from 'axios'
import { ref, defineComponent } from 'vue'

export default defineComponent ({
  emits: ["getlogin"],
  setup(props, {emit}) {
    const username = ref(null)
    const password = ref(null)
    const showSuccessBox = ref(false)

    const fail = ref(null)

    const handleSubmit = async () => {
      await axios.post('http://restapi.test/get.php', {
        username: username.value,
        password: password.value,
        status: "checklogin"
      }
      ). then( function(res) {
        if(res["data"] == "failed") {
          alert("gagal login")
        } else {
          localStorage.setItem("token", res["data"])
          emit('getlogin')
          showSuccessBox.value = true
        }
      })
    }

    return { username, password, fail, showSuccessBox, handleSubmit}
  }
  
  
})
</script>

<style scoped>
  .box {
    width: 300px;
    padding: 3em;
    background: white;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
    border-radius: 10px;
    text-align: center;
    margin: 5rem auto;
  }

  h1 {
    margin-bottom: 2em;
  }

  .inputBox {
    position: relative;
  }

  .inputBox label {
    color: darkgray;
    position: absolute;
    top: 0;
    left: 0;
    transition: 0.5s;
  }

  .inputBox input {
    width: 100%;
    outline: none;
    border: none;
    border-bottom: 1px solid darkgray;
    padding: 5px 3px;
    font-size: 1em;

    margin-bottom: 2em;
  }

  .inputBox input:focus ~ label {
    color: green;
    top: -1.4em;
  }

  .inputBox input:valid ~ label {
    color: green;
    top: -1.4em;
  }

  button {
    width: 100%;
    height: 2em;
    border-radius: 15px;
    border: none;
    background: black;
    color: white;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 1em;

    margin: 1em 0;
  }

  button:hover {
    opacity: .5;
    cursor: pointer;
  }

  p {
    color: red;
    font-size: 1em;
  }

  .createAccount p {
    margin-top: 0;
    color: black;
  }

  .createAccount a {
    text-decoration: none;
    color: darkgray;
    font-weight: bold;
  }

  .createAccount a:hover {
    color: green;
  }

  .successBox {
    width: 50%;

    padding: 1em 2em 2em;
    box-sizing: border-box;
    border-radius: 15px;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
    background-color: white;

    text-align: center;

    margin: 4em auto;
  }

  .successBox h3 {
    font-size: 1.3em;
  }

  .successBox a {
    text-decoration: none;

    padding: .5em 1em;
    color: white;
    background-color: black;
    border-radius: 10px;
  }

  .successBox a:hover {
    background-color: darkgray;
  }



</style>