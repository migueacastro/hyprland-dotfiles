<script lang="ts">
    import { apiURL } from "$lib/api_url";
	import { fetchLogin } from "$lib/auth";
    import 'js-cookie';

    let email = "";
    let password = "";

    async function handleLogin() {
        
        let formData = new FormData();
        formData.append('email', email);
        formData.append('password', password);
        const response = await fetchLogin(formData);
        const data = await response.json();
        if (response.ok) {
            const token = data?.token;
            
        }
    }
</script>

<div class="flex flex-col">
    
    <ol class="breadcrumb mb-[3rem]">
        <li class="crumb"><a class="anchor" href="/start">Inicio</a></li>
        <li class="crumb-separator" aria-hidden>/</li>
        <li class="crumb">Vendedor</li>
    </ol>
					
    <form>
        <h3 class="text-4xl mb-[2rem]">Iniciar Sesión</h3>
        <input class="input my-2" title="Email" type="text" placeholder="Email" bind:value={email}/>
        <input class="input my-2" title="Contraseña" type="password" placeholder="Contraseña" bind:value={password}/>
        <button class="btn btn-xl variant-filled-primary my-2 w-full shadow-xl">Iniciar Sesión</button>
        <p class="mt-4">¿Eres nuevo vendedor? <a class="anchor no-underline" href="/register">Registrarse</a></p>
    </form>
</div>