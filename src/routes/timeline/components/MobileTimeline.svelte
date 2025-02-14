<script lang="ts">
	import MobileModal from '$lib/components/Modal/MobileModal.svelte';

	const { timeline, cardClass, timelineClass } = $props();

	let showModal = $state(false);
	const toggleShowModal = () => {
		showModal = !showModal;
	};

	let currentIndex = $state<number | null>(null);
</script>

{#if currentIndex !== null}
	<MobileModal toggle={toggleShowModal} show={showModal}>
		<div class="flex flex-col items-center justify-center gap-4 w-full">
			<div class="flex w-full items-center justify-between">
				<h1 class="text-xl underline md:text-xl">{timeline[currentIndex]?.name}</h1>
				<p class="text-sm">{timeline[currentIndex]?.date}</p>
			</div>
			{#if timeline[currentIndex]?.imageHref}
				<img class="w-full rounded-md" src={timeline[currentIndex]?.imageHref} alt={timeline[currentIndex]?.name} />
			{/if}
			<div class="flex flex-col gap-2">
				{#each timeline[currentIndex]?.longDescription as description}
					<p class="text-md">{description}</p>
				{/each}
			</div>
		</div>
	</MobileModal>
{/if}

<div class="m-4 grid w-full grid-cols-[10%,auto] justify-center gap-x-4 md:hidden">
	{#each timeline as item, index}
		<div class="flex w-full flex-col items-start justify-center">
			<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
			<div class={`flex aspect-square h-6 -translate-x-2 rounded-full ${timelineClass}`}></div>
			<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
		</div>
		<div
			class={`flex min-h-[20dvh] flex-col items-start justify-center gap-2 justify-self-start ${cardClass} my-4`}
		>
			<button
				onclick={() => {
					currentIndex = index;
					toggleShowModal();
				}}
				class="flex h-full w-full flex-col items-center justify-center gap-y-2"
				aria-label="Show timeline item details"
			>
				<div class="flex w-full items-center justify-between">
					<h1 class="text-left text-xl underline">{item.name}</h1>
					<p class="text-right text-sm">{item.date}</p>
				</div>
				<p class="text-left">{item.description}</p>
			</button>
		</div>
	{/each}
</div>
