<template>
        <div v-if="showResults == 'show' ">
            <div class="filmBox" >
                <img :src="details.image">

                <div class="detailBox">
                    <h1>{{ details.name }}</h1>
                    <p>Description : <span> {{ details.description }} </span></p>
                    <p>Date Published : <span>{{ details.datePublished}}</span></p>
                    <p>Content Rating : <span>{{ details.contentRating }}</span></p>
                    <p>Genre : 
                        <span v-for="genre in details.genre" :key="genre" class="genre">
                            {{ genre }}
                        </span>
                    </p>
                    <p>Type : <span>{{ details["@type"]}}</span></p>
                    <p>Imdb Rating : <img src="@/assets/icon/star-icon.webp"><span>{{ ratingValue }}</span></p>
                    <p v-if="!favoriteButton">Your Rating : <img src="@/assets/icon/star-icon.webp"><span>{{ userRating }}</span></p>


                    <button v-if="favoriteButton" @click="favorite">Add to Favorite</button>
                    <button v-if="!favoriteButton" @click="Unfavorite">Unfavorite</button>
                    
                    <button v-if="!favoriteButton" @click="updateRating">Add your Rating</button>
                </div>
            </div>
        </div>

        <div v-if="showResults == 'loading'">
            <div class="loading">
                <h1>Please wait, Loading...</h1>
            </div>
        </div>
</template>

<script>
import axios from 'axios'
import { ref } from 'vue'

export default {
    inheritAttrs: false,
    props: ['id'],
    setup(props) {
        const favoriteButton = ref(true)
        const showResults = ref(false)
        const details = ref([])
        const ratingValue = ref(null)
        const userRating = ref(null)

        const getDetail = async () => {

            showResults.value = "loading"
            const data = await axios.get("https://search.imdbot.workers.dev/?tt=" + props.id)
            details.value = data["data"]["short"];
 
            if (details.value.aggregateRating == null) {
                ratingValue.value = 0;
            } else {
                ratingValue.value = details.value.aggregateRating["ratingValue"]
            }

            showResults.value = "show"

            const checking = async () => {
                await axios.post( 'http://restapi.test/get.php', {
                    "token": localStorage.getItem("token"),
                    "imdbid": props.id,
                    "status": "checking"
                }).then ( function(res) {
                    if ( res["data"] == "no") {
                        favoriteButton.value = true
                    } else {
                        userRating.value = res["data"]["userrating"]
                        favoriteButton.value = false
                    }
                })
            }

            checking()
        }

        const updateRating = async () => {
            const Rating = prompt("Please input your Rating")
            const checkRating = Rating-Rating

            if (checkRating == 0) {
                await axios.post('http://restapi.test/get.php', {
                    "imdbId": props.id,
                    "rating": Rating,
                    "status": "updateRating"
                })
                userRating.value = Rating
            } else {
                alert("Please input number")
            }
        }

        const favorite = async () => {

            const tokenUser = localStorage.getItem("token")

            if (tokenUser != null) {

                await axios.post( 'http://restapi.test/get.php', {
                    "token": localStorage.getItem("token"),
                    "poster": details.value["image"],
                    "title": details.value["name"],
                    "year": details.value["datePublished"],
                    "imdbId": props.id,
                    "status": "favorite"
                })

            favoriteButton.value = false

            }

        }

        const Unfavorite = async () => {
            await axios.post( 'http://restapi.test/get.php', {
                "imdbId": props.id,
                "status": "unfavorite"
            })

            favoriteButton.value = true
        }

        getDetail()

        return { details, ratingValue, showResults, favorite, Unfavorite, updateRating, favoriteButton, userRating }

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

.filmBox {
    display: flex;
    padding: 1rem;
    width: 90%;
    box-sizing: border-box;
    background: white;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
    border-radius: 10px;

    margin: 5rem auto;
}

img {
    width: 400px;
    box-shadow: 1px 1px 10px rgba(99, 98, 98, 0.5);
    border-radius: 10px;
}

.detailBox {
    padding: 2em;
}

.detailBox img {
    width: 1em;
    margin-right: 2px;
    box-shadow: none;
}

.detailBox h1 {
    color: black;
    text-shadow: 0 0 1px black;
    margin-bottom: 1em;
}

.detailBox p {
    color: black;
    font-weight: bold;
}

.detailBox p span {
    font-weight: normal;
}

.genre {
    margin: 0 4px;
    padding: .3em .8em;
    color: black;
    box-shadow: 0 0 1px black;
}

button {
    padding: 0.5em 1em;
    border-radius: 10px;
    border: none;
    background: black;
    color: white;
    font-size: 1em;
    margin: 1em 0.7em 1em 0;
    box-shadow: 0 0 10px rgba(99, 98, 98, 0.5);
}

button:hover {
    opacity: .5;
    cursor: pointer;
}

button:active {
    opacity: 1;
    color: black;
    background: white;
    box-shadow: 0 0 1px black;
}

@media screen and ( max-width : 900px) {

.filmBox {
    flex-wrap: wrap;
}

img {
    width: 350px;
    margin: 0 auto;
}

.detailBox {
    padding: 1em;
}

.detailBox h1 {
    text-align: center;
}

}

</style>