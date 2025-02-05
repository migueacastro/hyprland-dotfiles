import { apiURL } from './api_url';
import Cookies from 'js-cookie';



export async function fetchLogin(data: any) {
    const url = apiURL + "login";
    const response = await window.fetch(url, {
        method: 'POST',
        headers: {
            'content-type': 'application/json',
        },
        body: JSON.stringify(data)
    });
    return response;
} 

export async function authenticate() {
    const url = apiURL + "user";
    const token = Cookies.get("token");
    if (token) {
        const response = await window.fetch(url, {
            method: 'GET',
            headers: {
                'content-type': 'application/json',
            },
        });
        const data = await response.json()
        if (response.ok) {
            return data;
        }
        return null;
    }
}