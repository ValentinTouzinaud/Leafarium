<template>
    <section class="galerie">
    <figure><img :src="props.image2" :alt="nom">
      <figcaption>{{ props.nom }}</figcaption>
    </figure>
  </section>
</template>

<script setup>

const props = defineProps({
  nom: String,
  image2: String,
})

</script>
