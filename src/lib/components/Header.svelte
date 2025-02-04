<script lang="ts">
	import config from '../config.json';
	import NavBar from './NavBar.svelte';
	import DarkModeIcon from '$lib/assets/dark-mode-icon.svelte';

	const { name } = config;
</script>

<div id="header" class="flex items-center justify-between">
	<h1 class="text-4xl font-bold">
		<a href="/">{name}</a>
	</h1>
	<NavBar />
	<DarkModeIcon />
</div>
