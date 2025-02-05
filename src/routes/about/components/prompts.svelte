<script lang="ts">
	import config from '$lib/config.json';
	import { theme } from '$lib/context/theme';
	import { prompt as inputText } from '../context/prompts';

	const { prompts } = config;

	const buttonClass = $derived(
		$theme === 'dark'
			? 'flex w-full md:w-fit flex-col items-center justify-center rounded-lg bg-brown p-2'
			: 'flex w-full md:w-fit flex-col items-center justify-center rounded-lg bg-beige p-2'
	);
</script>

<div class="flex flex-wrap items-center justify-center gap-2 overflow-auto">
	{#each prompts.prompts as prompt}
		<button
			class={buttonClass}
			onclick={() => {
				$inputText = prompt.question;
			}}
		>
			<p class="text-xl">{prompt.question}</p>
		</button>
	{/each}
</div>
