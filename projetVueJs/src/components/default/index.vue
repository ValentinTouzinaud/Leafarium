<template>
  <main>
    <section class="introduction">
      <div class="texteIntro">
        <h1> BIENVENUE </h1>
        <p> Comprendre la richesse de la biodiversité végétale pour mieux la préserver. À travers notre encyclopédie sur la nature, nous souhaitons promouvoir la richesse de la biodiversité végétale afin de mieux la préserver. Car pour mieux la protéger, il est important de mieux la comprendre. Pour cela, nous vous avons selectionné différentes flores dans laquelle chacune d'elles possède diverses éspèces. </p>
        <a @click="goTo">
          <button type="button" class="btn btn-outline-light"> En savoir plus</button>
        </a>
      </div>
    </section>
    <section class="cube">
      <h2 id="titreExplorer"> EXPLORER </h2>
      <p id="texteExplorer"> Voici les différents type de flores mis à votre disposition. Pour en savoir d'avantage sur l'éspèce en question, il vous suffit de cliquer sur celle que vous voulez </p> 
      <div class="container">
        <div data-aos="fade-up" data-aos-duration="900"  class="photo" v-for="(p,index) in plantes" :key="index">
          <router-link :to="{ name: 'detail', params: { id: p.id } }"><img :src="'http://127.0.0.1:8000/img/' +p.image" alt="titre" class="transition"></router-link>
          <div class="presentation">
            <h2> {{p.nomImage}} </h2>
            <p> {{p.descImage}} </p>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup>

import Axios from '../../api/axios'
import { ref } from 'vue'
import AOS from "aos";

const plantes = ref()

Axios().get('plantes')
      .then(response =>  {
          plantes.value = response.data["hydra:member"]
      })

function goTo(){
            document.getElementById('titreExplorer').scrollIntoView({behavior: 'smooth'});
        }
AOS.init();
document.body.style.backgroundImage = "";
document.body.style.backgroundColor = "#F7F7F7";
</script>

<style>
</style>