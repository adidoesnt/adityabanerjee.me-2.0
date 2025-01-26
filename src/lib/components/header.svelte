<script lang="ts">
	import config from '../config.json';
	import Navbar from '$lib/components/navbar.svelte';
	import DarkModeIcon from '$lib/assets/dark-mode-icon.svelte';

	const { name } = config;
</script>

<div id="header" class="flex items-center justify-between">
	<h1 class="text-4xl font-bold">
		<a href="/">{name}</a>
	</h1>
	<Navbar />
	<DarkModeIcon />
</div>
