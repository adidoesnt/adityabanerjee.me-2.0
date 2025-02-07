<script lang="ts">
	import config from '$lib/config.json';
	import PromptIcon from '$lib/assets/prompt-icon.svelte';
	import { prompt as inputText, DEFAULT_PROMPT, getAnswer } from '../context/prompts';
	import { theme } from '$lib/context/theme';
	import NextIcon from '$lib/assets/next-icon.svelte';
	import LoadingSpinner from '$lib/assets/loading-spinner.svelte';
	import { delay } from '$lib/utils/delay';

	$inputText = DEFAULT_PROMPT;

	let loading = $state<boolean>(false);
	let answer = $state<string[]>([]);

	const inputClass = $derived(
		$theme === 'dark'
			? 'md:w-[50dvw] h-fit rounded-lg bg-brown md:p-2 text-2xl text-center'
			: 'md:w-[50dvw] h-fit rounded-lg bg-beige md:p-2 text-2xl text-center'
	);

	const answerClass = $derived(
		answer.length
			? 'flex w-full flex-1 flex-col items-start justify-start overflow-auto rounded-lg p-2'
			: 'flex w-full flex-1 flex-col items-center justify-center overflow-auto rounded-lg p-2'
	);

	const { prompts } = config;

	const onClickSubmit = async () => {
		loading = true;
		answer = [];

		const response = await getAnswer($inputText);

		for (let i = 0; i < response.length; i++) {
			answer.push(response[i]);
			await delay(Math.random() * 20);
		}

		loading = false;
	};

	const isDisabled = $derived($inputText === DEFAULT_PROMPT || loading);
</script>

<div class="flex min-h-[50%] w-full flex-col items-center justify-center gap-2 text-center md:text-left">
	<div class={answerClass}>
		{#if answer.length}
			<p class="text-xl">
				{#each answer as part}
					<span class="animated-text">{part}</span>
				{/each}
			</p>
		{:else if loading}
			<LoadingSpinner />
		{:else}
			<PromptIcon />
			<p class="text-2xl">{prompts.info}</p>
		{/if}
	</div>
	<div class="flex md:w-fit w-full items-center justify-center gap-2 md:py-4">
		<input type="text" bind:value={$inputText} class={inputClass} readonly />
		<NextIcon
			disabled={isDisabled}
			onclick={onClickSubmit}
			className={isDisabled ? 'w-12 h-12 opacity-50' : 'w-12 h-12'}
		/>
	</div>
</div>
