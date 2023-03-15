<template>
    <section class="formulaire">
        <form>
            <img src="public/img/logoFormulaire.png" alt="" class="logo"> 
            <p type="error" v-if="resultat">{{ resultat }}</p>
            <label for="inputUsername"> Username </label>
            <input v-model="username" prepend-inner-icon="mdi-account" @keyup.enter="checkLogin" autofocus>
            <label for="inputPassword">Password</label>
            <input v-model="password" prepend-inner-icon="mdi-lock" type="password" @keyup.enter="checkLogin">
            <button color="blue-grey" block  plain @click="checkLogin"> LOGIN </button>
        </form>
    </section>
</template>


<script setup>

import Axios from '../../api/axios'
import { ref } from 'vue'
import { useDefaultStore } from '@/stores/index'
import { useRouter } from 'vue-router'

Axios()

const store = useDefaultStore()
const router = useRouter()

const username = ref('')
const password = ref('')
const token = ref('')
const resultat = ref('')
const saveConnection = ref(false)

function checkLogin() {
    Axios().post('login_check',{username: username.value, password: password.value})
        .then(response =>  {
            token.value=response.data
            store.setConnecte(true, username.value, token.value.token)
            if (saveConnection.value) {
                localStorage.setItem('store', JSON.stringify(store.$state));
            }
            router.push('/')
        })
        .catch( e => {
            if (e.response) {
                console.log(e.response)
                resultat.value = ''
                password.value = ''
            }
        })
}



</script>

<style>
</style>




