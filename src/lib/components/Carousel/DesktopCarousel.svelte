<script lang="ts">
	import { theme } from '$lib/context/theme';
	import NextIcon from '$lib/assets/next-icon.svelte';
	import PrevIcon from '$lib/assets/prev-icon.svelte';
	import { decrementWithModulus, incrementWithModulus } from './utils';
	import Modal from '../Modal/DesktopModal.svelte';

	let { items, centerItemModal = false } = $props();
	let currentIndex = $state(0);

	const prevIndex = $derived(decrementWithModulus(currentIndex, items.length));
	const nextIndex = $derived(incrementWithModulus(currentIndex, items.length));

	const bgAndTextClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);

	let showModal = $state(false);
	const toggleShowModal = () => {
		showModal = !showModal;
	};
</script>

<div id="desktop-carousel" class="hidden h-fit w-fit items-center justify-center lg:flex">
	<PrevIcon onclick={() => (currentIndex = prevIndex)} className={'w-16 h-16'} />
	<div id="cards-container" class="flex items-center justify-center text-center">
		<div
			id="left-item"
			class={`z-0 flex h-52 w-60 flex-col items-center justify-center gap-4 rounded-md ${bgAndTextClass} translate-x-20 p-4 opacity-50`}
		>
			<h1 class="text-md">{items[prevIndex]?.name}</h1>
			<img
				class="h-24 w-24 rounded-md"
				src={items[prevIndex]?.imageSrc}
				alt={items[prevIndex]?.name}
			/>
		</div>
		<button
			id="center-item"
			class={`z-10 flex h-60 w-72 flex-col items-center justify-center gap-4 rounded-md ${bgAndTextClass} p-4`}
			onclick={() => {
				if (centerItemModal) {
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
		<div
			id="right-item"
			class={`z-0 flex h-52 w-60 flex-col items-center justify-center gap-4 rounded-md ${bgAndTextClass} -translate-x-20 p-4 opacity-50`}
		>
			<h1 class="text-md">{items[nextIndex]?.name}</h1>
			<img
				class="h-24 w-24 rounded-md"
				src={items[nextIndex]?.imageSrc}
				alt={items[nextIndex]?.name}
			/>
		</div>
	</div>
	<NextIcon onclick={() => (currentIndex = nextIndex)} className={'w-16 h-16'} />
	<Modal show={showModal} toggle={toggleShowModal}>
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
	</Modal>
</div>
