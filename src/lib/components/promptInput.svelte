<script lang="ts">
	import config from '$lib/config.json';
    import NextIcon from '$lib/assets/next-icon.svelte';
    import { theme } from '$lib/context/theme';

	const { prompts } = config;
	let inputText = $state(config.prompts.info);

    const buttonClass = $derived(
        $theme === 'dark'
            ? 'flex w-fit flex-col items-center justify-center rounded-lg bg-primary p-2'
            : 'flex w-fit flex-col items-center justify-center rounded-lg bg-accent p-2'
    );

    const inputClass = $derived(
        $theme === 'dark'
            ? 'w-1/2 h-fit rounded-lg bg-primary p-2 text-2xl'
            : 'w-1/2 h-fit rounded-lg bg-accent p-2 text-2xl'
    );
</script>

<main>
	<div class="flex h-full w-full flex-col items-center justify-center gap-4">
		<div class="flex gap-2 justify-center items-center w-full">
			<input type="text" bind:value={inputText} class={inputClass} readonly />
            <NextIcon />
		</div>
		<div class="flex h-full w-full flex-wrap items-center justify-center gap-x-4 gap-y-2">
			{#each prompts.prompts as prompt}
				<button class={buttonClass} onclick={() => inputText = prompt.question}>
					<p class="text-2xl">{prompt.question}</p>
				</button>
			{/each}
		</div>
	</div>
</main>
