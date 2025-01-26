<script lang="ts">
	import { theme } from '$lib/context/theme';
	import { acknowledgements } from '$lib/config.json';
	import NextIcon from '$lib/assets/next-icon.svelte';
	import PrevIcon from '$lib/assets/prev-icon.svelte';

	const { items } = acknowledgements;
	let currentIndex = $state(0);

    const incrementWithModulus = (index: number, max: number) => {
        return (index + 1) % max;
    }

    const decrementWithModulus = (index: number, max: number) => {
        return (index - 1 + max) % max;
    }

    const prevIndex = $derived(decrementWithModulus(currentIndex, items.length));
    const nextIndex = $derived(incrementWithModulus(currentIndex, items.length));

    const centerItemClass = $derived($theme === 'dark' ? 'item center-item bg-accent text-background' : 'item center-item bg-primary text-text');
    const leftItemClass = $derived($theme === 'dark' ? 'item side-item left bg-accent text-background' : 'item side-item left bg-primary text-text');
    const rightItemClass = $derived($theme === 'dark' ? 'item side-item right bg-accent text-background' : 'item side-item right bg-primary text-text');
</script>

<div class="carousel-container">
	<PrevIcon className="w-16 h-16" onclick={() => {
        currentIndex = prevIndex;
    }} />
	<div class={leftItemClass}>
		<h1>{items[prevIndex]?.name}</h1>
	</div>
	<div class={centerItemClass}>
		<h1>{items[currentIndex]?.name}</h1>
	</div>
	<div class={rightItemClass}>
		<h1>{items[nextIndex]?.name}</h1>
	</div>
	<NextIcon className="w-16 h-16 relative absolute-2" onclick={() => {
        currentIndex = nextIndex;
    }} />
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
		border-radius: 0.375rem;
        padding: 0.5rem;
		justify-content: center;
		align-items: center;

        h1 {
            font-size: 1.5rem;
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
