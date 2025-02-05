<script lang="ts">
	import { goto } from "$app/navigation";
import Cookies from "js-cookie";
	import { onMount } from "svelte";

onMount(async () => {
    if (Cookies.get('token')) {
        Cookies.remove('token');
    }
    goto("/");
})

</script>