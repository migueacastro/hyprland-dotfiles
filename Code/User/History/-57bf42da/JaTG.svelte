<script lang="ts">
	import '../app.postcss';
	import { AppShell, AppBar } from '@skeletonlabs/skeleton';
    import { onMount } from 'svelte';
    import { user } from '../stores/stores';
    import { authenticate } from '$lib/auth';
	// Floating UI for Popups
	import { computePosition, autoUpdate, flip, shift, offset, arrow } from '@floating-ui/dom';
	import { storePopup } from '@skeletonlabs/skeleton';
	storePopup.set({ computePosition, autoUpdate, flip, shift, offset, arrow });
    $:loaded = false;
	onMount(async () => {
		let userData = await authenticate();
		user.set(userData);
		setTimeout(()=> loaded = true, 1000);
	});
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

<style lang="postcss" global></style>