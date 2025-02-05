<script lang="ts">
    const { timeline, cardClass, timelineClass } = $props();
</script>

<div class="hidden md:grid w-full grid-cols-[45%,10%,45%] justify-center m-4">
    {#each timeline as item, index}
        {#if index % 2 === 0}
            <div class="flex min-h-[20dvh] md:w-[40dvw] lg:w-[30dvw] items-center justify-end justify-self-end">
                <div class="flex h-full w-full items-center justify-center">
                    <h1 class="text-xl">{item.date}</h1>
                </div>
            </div>
            <div class="flex w-full flex-col items-center justify-center">
                <div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
                <div class={`flex aspect-square h-6 rounded-full ${timelineClass}`}></div>
                <div class={`z-0 flex h-[45%] w-2 opacity-50 ${timelineClass}`}></div>
            </div>
            <div
                class={`flex gap-2 min-h-[20dvh] w-[30dvw] items-center justify-start justify-self-start ${cardClass}`}
            >
                <div class="flex h-full w-full flex-col items-center justify-center">
                    <h1 class="text-xl text-center underline">{item.name}</h1>
                    <p>{item.description}</p>
                </div>
            </div>
        {:else}
            <div
                class={`flex min-h-[20dvh] w-[30dvw] items-center justify-end justify-self-end ${cardClass}`}
            >
                <div class="flex gap-2 h-full w-full flex-col items-center justify-center">
                    <h1 class="text-xl text-center underline">{item.name}</h1>
                    <p>{item.description}</p>
                </div>
            </div>
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