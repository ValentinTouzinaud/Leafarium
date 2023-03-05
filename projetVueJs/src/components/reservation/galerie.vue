<template>
    <section class="ReservationPlante">
        <h1> LEAFARIUM </h1>
        <p> RÉSERVATION DE NOS FLORES SELECTIONNER </p>
        <div class="flecheReserver">
            <p> RÉSERVATION </p>
            <img src="img/fleche.PNG" alt="fleche">
        </div>
    </section>



    <section class="reservGlr">
        <div v-if="plantesVisible">
            <div class="menuReservation">
                <!-- image à gauche -->
                <div class="imagePrincipale">
                    <img-vue class="imageCentre" :image2="'http://127.0.0.1:8000/img/' + plante.image2"/>
                </div>
                <!-- texte + bouton à droite -->
                <div class="partieTexteReserv">
                    <h2> {{ plante.nom }} </h2>
                    <div class="espacement"></div>
                    <p class="texteGalerie"> {{ plante.description }} </p>
                    <div class="espacement"></div>
                    <div class="btnGalerie">
                        <button @click="btnReserv()"> RÉSERVATION </button>
                    </div>
                </div>
            </div>



            <div class="vignettes">
                <ul>
                    <li v-for="(p, index) in plantesVisible" :key="index">
                        <img :src="'http://127.0.0.1:8000/img/' + p.image" :alt="p.nom" @click="changePhoto(p)" class="imgGalerie">
                    </li>
                </ul>
            </div>
        </div>
    </section>
</template>

<script setup>
import imgVue from "@/components/reservation/imgVue.vue"
import Axios from '../../api/axios'
import { ref, computed } from 'vue'
import { useDefaultStore } from '@/stores/index'


const store = useDefaultStore()
const plantes = ref()
const plante = ref();
const plantesVisible = computed(() => {return plantes.value.filter(plante=> plante.visible)})

Axios().get('plantes')
    .then(response =>  {
        plantes.value = response.data["hydra:member"]
        plante.value = plantesVisible.value[0]
    })


function changePhoto(p) {
    plante.value = p;
}


function btnReserv() {
    
    var  clientReserv = store.login

    Axios().get('clients?page=1&username='+clientReserv)
    .then(response =>  {
        var clientVar = response.data["hydra:member"][0]
        var reserv = {
                        "client": "/api/clients/"+clientVar.id,
                        "plante": "/api/plantes/"+plante.value.id,
                        "date": new Date()
                    }
        Axios().post('reservations', reserv)
            .then(response =>  {
                plante.value.visible = false
                Axios().put('plantes/'+plante.value.id, plante.value)
                    .then(response =>  {
                        changePhoto(plantesVisible.value[0])
                })
        })
        
    })


}

document.body.style.backgroundImage = "";
document.body.style.backgroundColor = "#F7F7F7";

</script>