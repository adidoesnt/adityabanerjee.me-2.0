<script lang="ts">
	import { swipe, type SwipeCustomEvent } from 'svelte-gestures';
	import { theme } from '$lib/context/theme';
	import { decrementWithModulus, incrementWithModulus } from './utils';
	import PrevIcon from '$lib/assets/prev-icon.svelte';
	import NextIcon from '$lib/assets/next-icon.svelte';

	let { items } = $props();
	let currentIndex = $state(0);
	const prevIndex = $derived(decrementWithModulus(currentIndex, items.length));
	const nextIndex = $derived(incrementWithModulus(currentIndex, items.length));

	const disabled = $derived([0, 1].includes(items.length));

	function handleSwipe(e: SwipeCustomEvent) {
		if (e.detail.direction === 'left') {
			currentIndex = prevIndex;
		} else if (e.detail.direction === 'right') {
			currentIndex = nextIndex;
		}
	}

    let showHelp = $state(false);
</script>

<div
	id="mobile-carousel"
	class="flex max-w-[95dvw] flex-col items-center justify-center gap-4 md:flex-row lg:hidden"
	use:swipe={() => ({ minSwipeDistance: 25 })}
	onswipe={handleSwipe}
>
	<PrevIcon
		onclick={() => (currentIndex = prevIndex)}
		{disabled}
		className={'hidden w-12 h-12 md:flex'}
	/>
	<div
		class={`flex flex-col items-center justify-center gap-4 rounded-md p-8 text-center ${$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'}`}
	>
		<h1 class="text-lg md:text-xl">{items[currentIndex]?.name}</h1>
		<img
			class="h-[25dvh] w-[25dvh] rounded-md md:h-[20dvh] md:w-[20dvh] lg:h-32 lg:w-32"
			src={items[currentIndex]?.imageSrc}
			alt={items[currentIndex]?.name}
		/>
	</div>
	<NextIcon
		onclick={() => (currentIndex = nextIndex)}
		{disabled}
		className={'hidden w-12 h-12 md:flex'}
	/>
</div>
