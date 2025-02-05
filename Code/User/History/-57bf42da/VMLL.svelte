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
    })
</script>
<slot></slot>
