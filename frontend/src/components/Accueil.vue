<template>
    <v-app id="homePage">
        <top-header/>
            <div class="logo">
                <v-img src="../assets/icon-left-font-monochrome-black.png" id ="logo"></v-img>
            </div>  
            <h1 class="ml-12">Bienvenue sur l'Intranet de Groupomania !</h1>
            <router-view></router-view>
            <v-carousel
                id="carousel" cycle height="auto" hide-delimiters :show-arrows="false">
                <v-carousel-item v-for="(item,i) in items" :key="i" :src="item.src"></v-carousel-item>
            </v-carousel>      
    </v-app>
</template>
<script>
import Header from "./Header"

export default {
    name: "Accueil",
    data(){
        return{
            items: [
            {
                src: require("../assets/images/halloween.jpg"),
            },
            {
                src: require("../assets/images/teletravail.png"),
            },
            {
                src: require("../assets/images/vacances.jpg"),
            },
            ]
            
        }
    },
    components: {
        "top-header": Header,
    },
}
</script>
<style lang="scss">
    #homePage{
        background-color: #fcdcdc;
    }
    #carousel{
        width: 60%;
        margin-top: 5%;
        margin-bottom: 5%;
        margin-left: 20%;
    }
    .header{
        background-color: rgb(253,45,1);
        color: white;
    }
    @media screen and (min-width: 200px) and (max-width: 640px) {
    #carousel {
    padding-right: 15%;
    width: 80%;
    } 
}
        
    
</style>