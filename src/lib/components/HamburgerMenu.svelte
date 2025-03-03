<script lang="ts">
	import DarkModeIcon from '$lib/assets/dark-mode-icon.svelte';
	import HamburgerIcon from '$lib/assets/hamburger-icon.svelte';
	import NavBar from './NavBar.svelte';
	import { showHamburgerMenu, toggleHamburgerMenu } from '$lib/context/hamburger';
</script>

<HamburgerIcon onclick={toggleHamburgerMenu} />

{#if $showHamburgerMenu}
	<div
		id="hamburger-menu"
		class="fixed left-0 top-0 z-10 flex h-full w-full flex-col items-center justify-center backdrop-blur-3xl"
	>
		<div class="fixed left-0 top-0 p-8">
			<DarkModeIcon hamburgerMenu={true} />
		</div>

		<div class="flex flex-col gap-4 text-center">
			<h1 class="text-3xl font-bold">Menu</h1>
			<br />

			<NavBar hamburgerMenu={true} />

			<br />
			<div class="flex flex-col gap-2">
				<button class="text-xl" onclick={toggleHamburgerMenu}>Close</button>
			</div>
		</div>
	</div>
{/if}
