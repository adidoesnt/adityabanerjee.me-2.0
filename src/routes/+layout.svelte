<script lang="ts">
	import Footer from '$lib/components/Footer.svelte';
	import Header from '$lib/components/Header.svelte';
	import '../app.css';
	import { theme } from '$lib/context/theme';

	let { children } = $props();

	const className = $derived(
		$theme === 'dark'
			? 'bg-darkBrown text-cream font-itim'
			: 'bg-cream text-darkBrown font-itim'
	);
</script>

<main>
	<div id="main-container" class={`grid-rows-[10%,80%,10%] m-0 px-16 py-8 grid w-[100dvw] h-[100dvh] ${className}`}>
		<Header />
		<div class="flex h-full w-full flex-col items-center justify-center overflow-hidden">
			{@render children()}
		</div>
		<Footer />
	</div>
</main>
