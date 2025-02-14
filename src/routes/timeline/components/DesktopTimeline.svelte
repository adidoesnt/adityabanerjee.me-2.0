<script lang="ts">
	import DesktopModal from '$lib/components/Modal/DesktopModal.svelte';

	const { timeline, cardClass, timelineClass } = $props();

	let showModal = $state(false);
	const toggleShowModal = () => {
		showModal = !showModal;
	};

	let currentIndex = $state<number | null>(null);
</script>

{#if currentIndex !== null}
	<DesktopModal toggle={toggleShowModal} show={showModal}>
		<div class="flex w-full flex-col items-center justify-center gap-4 p-4">
			<div class="flex w-full items-center justify-between">
				<h1 class="text-xl underline md:text-xl">{timeline[currentIndex]?.name}</h1>
				<p class="text-sm">{timeline[currentIndex]?.date}</p>
			</div>
			{#if timeline[currentIndex]?.imageHref}
				<img class="w-80 rounded-md" src={timeline[currentIndex]?.imageHref} alt={timeline[currentIndex]?.name} />
			{/if}
			<div class="flex flex-col gap-2">
				{#each timeline[currentIndex]?.longDescription as description}
					<p class="text-md">{description}</p>
				{/each}
			</div>
		</div>
	</DesktopModal>
{/if}

<div class="m-4 hidden w-full grid-cols-[45%,10%,45%] justify-center md:grid">
	{#each timeline as item, index}
		{#if index % 2 === 0}
			<div
				class="flex min-h-[20dvh] items-center justify-end justify-self-end md:w-[40dvw] lg:w-[30dvw]"
			>
				<div class="flex h-full w-full items-center justify-center">
					<h1 class="text-xl">{item.date}</h1>
				</div>
			</div>
			<div class="flex w-full flex-col items-center justify-center">
				<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
				<div class={`flex aspect-square h-6 rounded-full ${timelineClass}`}></div>
				<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
			</div>
			<button
				class={`flex min-h-[20dvh] w-[30dvw] items-center justify-start gap-2 justify-self-start ${cardClass}`}
				onclick={() => {
					currentIndex = index;
					toggleShowModal();
				}}
				aria-label="Show timeline item details"
			>
				<div class="flex h-full w-full flex-col items-center justify-center">
					<h1 class="text-center text-xl underline">{item.name}</h1>
					<p>{item.description}</p>
				</div>
			</button>
		{:else}
			<button
				class={`flex min-h-[20dvh] w-[30dvw] items-center justify-end justify-self-end ${cardClass}`}
				onclick={() => {
					currentIndex = index;
					toggleShowModal();
				}}
				aria-label="Show timeline item details"
			>
				<div class="flex h-full w-full flex-col items-center justify-center gap-2">
					<h1 class="text-center text-xl underline">{item.name}</h1>
					<p>{item.description}</p>
				</div>
			</button>
			<div class="flex w-full flex-col items-center justify-center">
				<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
				<div class={`flex aspect-square h-6 rounded-full ${timelineClass}`}></div>
				<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
			</div>
			<div class="flex min-h-[20dvh] w-[30dvw] items-center justify-start justify-self-start">
				<div class="flex h-full w-full items-center justify-center">
					<h1 class="text-xl">{item.date}</h1>
				</div>
			</div>
		{/if}
	{/each}
</div>
