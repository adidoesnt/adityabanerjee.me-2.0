<script lang="ts">
	import config from '$lib/config.json';
	import PromptIcon from '$lib/assets/prompt-icon.svelte';
	import { prompt as inputText, answer } from '../context/prompts';
	import { theme } from '$lib/context/theme';
	import NextIcon from '$lib/assets/next-icon.svelte';

	const inputClass = $derived(
		$theme === 'dark'
			? 'w-[50dvw] h-fit rounded-lg bg-primary p-2 text-2xl text-center'
			: 'w-[50dvw] h-fit rounded-lg bg-accent p-2 text-2xl text-center'
	);

    const answerClass = $derived(
        $answer
            ? 'flex w-full flex-1 flex-col items-start justify-start overflow-auto rounded-lg p-2'
            : 'flex w-full flex-1 flex-col items-center justify-center overflow-auto rounded-lg p-2'
    );

	const { prompts } = config;
</script>

<div class="flex w-full h-[50%] flex-col justify-center items-center gap-2">
	<div
		class={answerClass}
	>
		{#if $answer}
			<p class="text-xl">{$answer}</p>
		{:else}
			<PromptIcon />
			<p class="text-2xl">{prompts.info}</p>
		{/if}
	</div>
	<div class="flex items-center justify-center gap-2 py-4">
		<input type="text" bind:value={$inputText} class={inputClass} readonly />
		<NextIcon />
	</div>
</div>
