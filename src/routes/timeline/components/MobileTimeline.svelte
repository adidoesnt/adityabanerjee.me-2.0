<script lang="ts">
	const { timeline, cardClass, timelineClass } = $props();
</script>

<div class="m-4 grid w-full grid-cols-[25%,75%] justify-center md:hidden">
	{#each timeline as item}
		<div class="flex w-full flex-col items-center justify-center">
			<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
			<div class={`flex aspect-square h-6 rounded-full ${timelineClass}`}></div>
			<div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
		</div>
		<div
			class={`flex min-h-[20dvh] flex-col items-start justify-center gap-2 justify-self-start ${cardClass} my-4`}
		>
			<div class="flex h-full w-full flex-col items-center justify-center gap-y-2">
                <div class="flex w-full justify-between items-center">
                    <h1 class="text-center text-xl underline">{item.name}</h1>
                    <p class="text-center text-sm">{item.date}</p>
                </div>
				<p>{item.description}</p>
			</div>
		</div>
	{/each}
</div>
