<script lang="ts">
	import { onMount } from "svelte";
	import { user } from "../stores/stores";
	import Cookies from "js-cookie";
	import { goto } from "$app/navigation";
	onMount(async () => {
		goto("/dashboard")
	});
</script>

<div class="m-[6rem]">
	<button type="button" class="btn btn-xl variant-filled-primary">Hola {$user?.name}</button>
</div>