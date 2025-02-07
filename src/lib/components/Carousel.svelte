<script lang="ts">
	import { theme } from '$lib/context/theme';
	import NextIcon from '$lib/assets/next-icon.svelte';
	import PrevIcon from '$lib/assets/prev-icon.svelte';

	let { items } = $props();
	let currentIndex = $state(0);

	const incrementWithModulus = (index: number, max: number) => {
		return (index + 1) % max;
	};

	const decrementWithModulus = (index: number, max: number) => {
		return (index - 1 + max) % max;
	};

	const prevIndex = $derived(decrementWithModulus(currentIndex, items.length));
	const nextIndex = $derived(incrementWithModulus(currentIndex, items.length));

	const centerItemClass = $derived(
		$theme === 'dark'
			? 'item center-item bg-beige text-darkBrown'
			: 'item center-item bg-brown text-cream'
	);
	const leftItemClass = $derived(
		$theme === 'dark'
			? 'item side-item left bg-beige text-darkBrown'
			: 'item side-item left bg-brown text-cream'
	);
	const rightItemClass = $derived(
		$theme === 'dark'
			? 'item side-item right bg-beige text-darkBrown'
			: 'item side-item right bg-brown text-cream'
	);
</script>

<div class="carousel-container">
	<PrevIcon
		className="w-16 h-16"
		onclick={() => {
			currentIndex = prevIndex;
		}}
	/>
	<div class={leftItemClass}>
		<h1>{items[prevIndex]?.name}</h1>
		<img
			class="h-24 w-24 rounded-md"
			src={items[prevIndex]?.imageSrc}
			alt={items[prevIndex]?.name}
		/>
	</div>
	<div class={centerItemClass}>
		<h1>{items[currentIndex]?.name}</h1>
		<img
			class="h-32 w-32 rounded-md"
			src={items[currentIndex]?.imageSrc}
			alt={items[currentIndex]?.name}
		/>
	</div>
	<div class={rightItemClass}>
		<h1>{items[nextIndex]?.name}</h1>
		<img
			class="h-24 w-24 rounded-md"
			src={items[nextIndex]?.imageSrc}
			alt={items[nextIndex]?.name}
		/>
	</div>
	<NextIcon
		className="w-16 h-16 relative absolute-2"
		onclick={() => {
			currentIndex = nextIndex;
		}}
	/>
</div>

<style>
	.carousel-container {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}

	.item {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		border-radius: 0.375rem;
		padding: 0.5rem;
		justify-content: center;
		align-items: center;

		h1 {
			font-size: 1rem;
		}
	}

	.side-item {
		width: 15rem;
		height: 12rem;
		z-index: 0;
		opacity: 50%;
	}

	.right {
		margin-left: -8rem;
		margin-right: 2rem;
	}

	.left {
		margin-left: 2rem;
		margin-right: -8rem;
	}

	.center-item {
		width: 20rem;
		height: 16rem;
		z-index: 1;
	}
</style>
