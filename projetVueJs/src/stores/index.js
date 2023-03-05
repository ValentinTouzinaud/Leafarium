import { defineStore } from 'pinia'

export const useDefaultStore = defineStore({
  id: 'default',
  state: () => ({
    connecte: false,
    login: '',
    token: ''
  }),
  getters: {
    
  },
  actions: {
    initialiseStore() {
      if(localStorage.getItem('store')) {
        console.log('store initialisé par session Storage')
        this.$state =  JSON.parse(localStorage.getItem('store'))
      }
    },
    setConnecte(connect, login, token) {
      this.connecte = connect
      this.login = login
      this.token = token
    },
  }
})

new kursor({
  type: 4,
  removeDefaultCursor: false,
  color: "#fff",
})

