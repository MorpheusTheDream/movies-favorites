<template>

<div class="box">
    <form @submit.prevent="handleSubmit" autocomplete="off">

    <h1>Sign Up</h1>

    <div class="inputBox" >
      <input type="text" id="firstName" v-model="firstName" required>
      <label for="firstName ">First name</label>
    </div>

    <div class="inputBox" >
      <input type="text" id="lastName" v-model="lastName" required>
      <label for="lastName">Last name</label>
    </div>

    <div class="inputBox" >
      <input type="text" id="username" v-model="username" required>
      <label for="username">Username</label>
    </div>

    <div class="inputBox" >
      <input type="text" id="email" v-model="email" required>
      <label for="email">Email</label>
    </div>

    <div class="inputBox">
      <input type="password" id="password" v-model="password" required>
      <label for="password">Password</label>
    </div>

    <div class="inputBox">
      <input type="password" id="confirmpass" v-model="confirmPassword" required>
      <label for="confirmpass">Confirm Password</label>
    </div>

    <button>Sign Up</button>

    <div class="already">
      <p>Already have an account ? <router-link :to="{ name : 'login'}">Login</router-link></p>
    </div>

    <p>{{ fail }}</p>
    </form>
</div>


</template>

<script>

import router from "@/router"
import axios from 'axios'
import { ref, defineComponent} from 'vue'

export default defineComponent ({

  setup() {
    const firstName = ref(null)
    const lastName = ref(null)
    const email = ref(null)
    const username = ref(null)
    const password = ref(null)
    const confirmPassword = ref(null)
    const fail = ref(null)
    const token = ref()

    const generateString = () => {
      const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
      let result = '';

      for ( let i = 0; i < 50; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
      }

      return result;
    }


    const handleSubmit = async () => {

        if ( password.value == confirmPassword.value ) {

            token.value = generateString();

            await axios.post('http://restapi.test/get.php', {
                "firstname": firstName.value,
                "lastname": lastName.value,
                "username": username.value,
                "password": password.value,
                "token": token.value,
                "email": email.value,
                "status": "create"
            }). then( function(res) {
              console.log(res)
              if ( res["data"] == "success") {
                alert("Akun berhasil di buat")
                router.push({name: "login"});
              }
            })

        } else {
            fail.value = "Passwordnya tidak sama"
        }

    }

    return { firstName, lastName, username, password, email, confirmPassword, fail, handleSubmit}
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
    margin: 5em auto;
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

  .remember {
    text-align: left;
    color: black;
    font-size: .9em;
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

  a {
    color: black;
    text-decoration: none;
  }

  a:hover {
    color: green;
  }

  p {
    color: red;
    margin-top: 2em;
    font-size: 1em;
  }

  .already p {
    margin-top: 0;
    color: black;
  }

  .already a {
    text-decoration: none;
    color: darkgray;
    font-weight: bold;
  }

  .already a:hover {
    color: green;
  }
</style>