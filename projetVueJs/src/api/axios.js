import axios from 'axios'
import { useDefaultStore } from '../stores'

export default() => {
    const store = useDefaultStore()
    return axios.create({
        baseURL: 'http://127.0.0.1:8000/api',
        withCredentials: false,
        headers: {
            'Accept': 'application/ld+json',
            'Content-Type': 'application/ld+json',
            'Authorization': 'Bearer ' + store.token
        }
    })
}
