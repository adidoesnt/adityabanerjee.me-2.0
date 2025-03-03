<script lang="ts">
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
	import '../app.css';
	import { theme } from '$lib/context/theme';
	import { onNavigate } from '$app/navigation';
	import { toggleHamburgerMenu } from '$lib/context/hamburger';

	let { children } = $props();

	const className = $derived(
		$theme === 'dark'
			? 'bg-darkBrown text-cream font-itim'
			: 'bg-cream text-darkBrown font-itim'
	);

	onNavigate((navigation) => {
		if (!document.startViewTransition) return;

		return new Promise((resolve) => {
			document.startViewTransition(async () => {
					resolve();
					toggleHamburgerMenu();
					await navigation.complete;
				});
			});
		});
</script>

<main>
	<div id="main-container" class={`grid-rows-[10%,80%,10%] m-0 px-8 md:px-16 py-8 grid w-[100dvw] h-[100dvh] ${className}`}>
		<Header />
		<div class="flex h-full w-full flex-col items-center justify-center overflow-hidden">
			{@render children()}
		</div>
		<Footer />
	</div>
</main>
