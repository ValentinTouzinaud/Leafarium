<template>
  <main v-if="plante">
    <section class="pageDetail">
      <div data-aos="fade-left" data-aos-duration="900" class="zoneTexte">
        <h1> {{plante.nom}} </h1>
        <h3> {{plante.description}} </h3>
        <h2> FLORAISON </h2>
        <p> {{plante.descFlo}}  </p>
        <h2> SYMBOLIQUE</h2>
        <p> {{plante.descSymb}} </p>
        <h2> TAILLE </h2>
        <p> {{plante.descTaille}} </p>
      </div>
    </section>
  </main>
</template>

<script setup>

import Axios from '../../api/axios'
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import AOS from "aos";

const route = useRoute()

const plante = ref()

Axios().get('plantes/'+route.params.id)
      .then(response =>  {
          plante.value = response.data
          document.body.style.backgroundImage = "url('http://127.0.0.1:8000/img/"+plante.value.image2+"')"
          document.body.style.backgroundSize = "cover";
      })

AOS.init();

</script>

<style>
</style>