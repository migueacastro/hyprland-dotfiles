import { apiURL } from './api_url';

export async function fetchLogin(formData: FormData) {
    const url = apiURL + "login"
    const response = await window.fetch(url, {
        method: 'POST',
        headers: {
            'content-type': 'application/json;charset=UTF-8',
        },
        body: formData
    });
    
    const data = await response.json();
    if (response.ok) {
        const token = data?.token
    } else {
        return data;
    }
} 
