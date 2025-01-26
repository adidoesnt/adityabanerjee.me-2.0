<script lang="ts">
	import Header from '$lib/components/header.svelte';
	import Footer from '$lib/components/footer.svelte';
	import '../app.css';
	import { theme } from '$lib/context/theme';

	const className = $derived(
		$theme === 'dark'
			? 'grid-rows-[10%,80%,10%] m-0 px-16 py-8 grid w-[100dvw] h-[100dvh] bg-background text-text font-itim'
			: 'grid-rows-[10%,80%,10%] m-0 px-16 py-8 grid w-[100dvw] h-[100dvh] bg-text text-background font-itim'
	);

	let { children } = $props();
</script>

<main>
	<div id="main-container" class={className}>
		<Header />
		<div class="flex h-full w-full flex-col items-center justify-center overflow-hidden">{@render children()}</div>
		<Footer />
	</div>
</main>
