import { createRouter, createWebHashHistory } from 'vue-router'
import indexVue from '../components/default/index.vue'
import detailVue from '../components/default/detail.vue'
import registerVue from '../components/registration/register.vue'
import loginVue from '../components/security/login.vue'
import galerieVue from '../components/reservation/galerie.vue'
import { useDefaultStore } from '../stores'


const routes = [
    {
      path: '/',
      name : 'home',
      component : indexVue
    },
    {
      path: '/plante/:id',
      name : 'detail',
      component : detailVue
    },
    {
      path: '/register',
      name : 'app_register',
      component : registerVue
    },
    {
      path: '/login',
      name : 'app_login',
      component : loginVue
    },
    {
      path: '/reservation',
      name : 'reservation',
      component : galerieVue
    }

]

const router = createRouter({
    history: createWebHashHistory(),
    routes,
  })

export default router

router.beforeEach((to, from, next) => {
  const store = useDefaultStore()
  
  // on redirige sur la page login si on n'est pas authentifié...
  const publicPages = ['app_login', 'home', 'app_register', 'detail'];

  // le reste sont les pages dans lequel la connexion est obligatoire
  const authRequired = !publicPages.includes(to.name);
  const loggedIn = store.token;

  if (authRequired && !loggedIn) {
    return next('/login');
  }
  next();
})
