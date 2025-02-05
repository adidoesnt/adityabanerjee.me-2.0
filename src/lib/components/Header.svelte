<script lang="ts">
	import config from '../config.json';
	import NavBar from './NavBar.svelte';
	import DarkModeIcon from '$lib/assets/dark-mode-icon.svelte';
	import HamburgerMenu from './HamburgerMenu.svelte';

	const { name } = config;
</script>

<div id="header" class="flex items-center justify-between">
	<h1 class="flex w-fit text-2xl md:text-3xl lg:4xl font-bold text-center">
		<a href="/">{name}</a>
	</h1>
	<NavBar />
	<DarkModeIcon />
	<HamburgerMenu />
</div>
