<script lang="ts">
	import DarkModeIcon from '$lib/assets/dark-mode-icon.svelte';
	import HamburgerIcon from '$lib/assets/hamburger-icon.svelte';
	import NavBar from './NavBar.svelte';
	import { fade } from 'svelte/transition';
	import { onNavigate } from '$app/navigation';

	let show = $state(false);

	const onclick = () => {
		show = !show;
	};

	onNavigate((navigation) => {
		if (!document.startViewTransition) return;

		return new Promise((resolve) => {
			document.startViewTransition(async () => {
				resolve();
				await navigation.complete;
				show = false;
			});
		});
	});
</script>

<HamburgerIcon {onclick} />

{#if show}
	<div
		id="hamburger-menu"
		class="fixed left-0 top-0 flex h-full w-full flex-col items-center justify-center backdrop-blur-3xl z-10"
		transition:fade={{ duration: 300 }}
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
				<button class="text-xl" {onclick}>Close</button>
			</div>
		</div>
	</div>
{/if}
