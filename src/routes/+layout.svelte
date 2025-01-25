<script lang="ts">
	import Header from '$lib/components/header.svelte';
	import '../app.css';
	import { theme } from '$lib/context/theme';

	const className = $derived(
		$theme === 'dark'
			? 'grid-rows-[10%,80%,10%] m-0 px-16 py-8 grid min-w-[100dvw] min-h-[100dvh] bg-background text-text font-itim'
			: 'grid-rows-[10%,80%,10%] m-0 px-16 py-8 grid min-w-[100dvw] min-h-[100dvh] bg-text text-background font-itim'
	);

	let { children } = $props();
</script>

<main>
	<div
		id="main-container"
		class={className}
	>
		<Header />
		{@render children()}
		<div id="footer">
			<p>footer placeholder</p>
		</div>
	</div>
</main>
