<script lang="ts">
	import '../app.postcss';
	import { AppShell, AppBar } from '@skeletonlabs/skeleton';

	// Floating UI for Popups
	import { computePosition, autoUpdate, flip, shift, offset, arrow } from '@floating-ui/dom';
	import { storePopup } from '@skeletonlabs/skeleton';
	import { onMount } from 'svelte';
	import { authenticate } from '$lib/auth';
	import { user } from '../stores/stores';
	storePopup.set({ computePosition, autoUpdate, flip, shift, offset, arrow });


    let loaded = false;
    onMount(async () => {
        let userData = await authenticate();
        user.set(userData);
        setTimeout(()=> loaded = true, 1000);
    })
</script>
{#if loaded}
	<slot/>
{:else}
	<div class="flex justify-center align-middle h-full">
		<div class="my-auto">
			<ProgressRadial />
		</div>
	</div>
{/if}