<script lang="ts">
	import { timeline } from '$lib/config.json';
	import { theme } from '$lib/context/theme';

	const cardClass = $derived(
		$theme === 'dark' ? 'bg-accent text-background rounded-md' : 'bg-primary text-text rounded-md'
	);

	const timelineClass = $derived(
		$theme === 'dark'
			? 'bg-accent'
			: 'bg-primary'
	);
</script>

<div class="flex h-full w-full items-start justify-center overflow-auto">
	<div class="grid w-full grid-cols-[45%,10%,45%] justify-center m-4">
		{#each timeline as item, index}
			{#if index % 2 === 0}
				<div class="flex min-h-[20dvh] w-[30dvh] items-center justify-end justify-self-end">
					<div class="flex h-full w-full items-center justify-center">
						<h1 class="text-xl">{item.date}</h1>
					</div>
				</div>
				<div class="flex w-full flex-col items-center justify-center">
					<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
					<div class={`flex aspect-square h-[15%] rounded-full ${timelineClass}`}></div>
					<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
				</div>
				<div
					class={`flex min-h-[20dvh] w-[30dvh] items-center justify-start justify-self-start ${cardClass}`}
				>
					<div class="flex h-full w-full flex-col items-center justify-center">
						<h1 class="text-xl">{item.name}</h1>
						<p>{item.description}</p>
					</div>
				</div>
			{:else}
				<div
					class={`flex min-h-[20dvh] w-[30dvh] items-center justify-end justify-self-end ${cardClass}`}
				>
					<div class="flex h-full w-full flex-col items-center justify-center">
						<h1 class="text-xl">{item.name}</h1>
						<p>{item.description}</p>
					</div>
				</div>
				<div class="flex w-full flex-col items-center justify-center">
					<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
					<div class={`flex aspect-square h-[15%] rounded-full ${timelineClass}`}></div>
					<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
				</div>
				<div class="flex min-h-[20dvh] w-[30dvh] items-center justify-start justify-self-start">
					<div class="flex h-full w-full items-center justify-center">
						<h1 class="text-xl">{item.date}</h1>
					</div>
				</div>
			{/if}
		{/each}
	</div>
</div>
