<script setup>

function deconnexion() {
        localStorage.removeItem('store')
        store.setConnecte(false, '', '')
        ouvrirBurger()
        router.push('/login')
    }

function ouvrirBurger(){
    
        let navLinks = document.querySelector(".nav-links")
        navLinks.classList.toggle('mobile-menu')
        
}

</script>

<template>
  <header>
    <nav class="navbar">
      <a href="#" class="logo"> LEAFARIUM </a>
      <div class="nav-links">
        <ul>
          <li><router-link :to="{ name: 'home' }" class="nav-link active" aria-current="page" @click="ouvrirBurger()"> Accueil </router-link></li>
          <li><router-link :to="{ name: 'app_register' }" class="nav-link" @click="ouvrirBurger()"> Register </router-link></li>
          <li><router-link :to="{ name: 'app_login' }" class="nav-link" @click="ouvrirBurger()"> Login </router-link></li>
          <li><a class="nav-link" href="http://127.0.0.1:8000/admin" @click="ouvrirBurger()"> Admin </a></li>
          <li><router-link :to="{ name: 'reservation' }" class="nav-link" @click="ouvrirBurger()"> Réservation </router-link></li>
          <li><a class="nav-link" href="" @click="deconnexion()"> Déconnexion </a></li>
        </ul>  
      </div> 
      <img src="../img/menu-btn.png" alt="menuHamburger" class="menu-hamburger" @click="ouvrirBurger()">
    </nav>
  </header>
  <router-view></router-view>
</template>

<style>

</style>