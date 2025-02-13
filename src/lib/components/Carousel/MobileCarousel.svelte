<script lang="ts">
	import { swipe, type SwipeCustomEvent } from 'svelte-gestures';
	import { theme } from '$lib/context/theme';
	import { decrementWithModulus, incrementWithModulus } from './utils';
	import PrevIcon from '$lib/assets/prev-icon.svelte';
	import NextIcon from '$lib/assets/next-icon.svelte';
	import MobileModal from '../Modal/MobileModal.svelte';

	let { items, modal = false } = $props();
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

	let showModal = $state(false);
	const toggleShowModal = () => {
		showModal = !showModal;
	};
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
	<button
		class={`flex flex-col items-center justify-center gap-4 rounded-md p-8 text-center ${$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'}`}
		onclick={() => {
			if (modal) {
				toggleShowModal();
			}
		}}
	>
		<h1 class="text-lg md:text-xl">{items[currentIndex]?.name}</h1>
		<img
			class="h-[25dvh] w-[25dvh] rounded-md md:h-[20dvh] md:w-[20dvh] lg:h-32 lg:w-32"
			src={items[currentIndex]?.imageSrc}
			alt={items[currentIndex]?.name}
		/>
	</button>
	<NextIcon
		onclick={() => (currentIndex = nextIndex)}
		{disabled}
		className={'hidden w-12 h-12 md:flex'}
	/>
	<MobileModal show={showModal} toggle={toggleShowModal}>
		<div class="flex flex-col items-center justify-center gap-4">
			{#if items[currentIndex]?.date}
				<div class="flex w-full items-center justify-between">
					<h1 class="text-lg md:text-xl">{items[currentIndex]?.name}</h1>
					<p class="text-sm">{items[currentIndex]?.date}</p>
				</div>
			{:else}
				<div class="flex w-full items-center justify-center">
					<h1 class="text-lg md:text-xl">{items[currentIndex]?.name}</h1>
				</div>
			{/if}
			<img
				class="aspect-square w-60 rounded-md"
				src={items[currentIndex]?.imageSrc}
				alt={items[currentIndex]?.name}
			/>
			{#if items[currentIndex]?.longDescription}
				<div class="flex w-full flex-col items-start justify-center gap-2">
					{#each items[currentIndex]?.longDescription as description}
						<p class="text-sm md:text-base">{@html description}</p>
					{/each}
				</div>
			{/if}
		</div>
	</MobileModal>
</div>
