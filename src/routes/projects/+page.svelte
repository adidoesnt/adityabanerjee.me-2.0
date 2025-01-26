<script lang="ts">
	import Carousel from '$lib/components/carousel.svelte';
	import { projects } from '$lib/config.json';
	import { theme } from '$lib/context/theme';

	const { featured, other } = projects;
	const otherCardClass = $derived(
		$theme === 'dark'
			? 'flex p-12 rounded-md items-center justify-center gap-4 bg-accent text-background'
			: 'flex p-12 rounded-md items-center justify-center gap-4 bg-primary text-text'
	);
</script>

<div class="flex h-full w-full flex-col items-center justify-start gap-8">
	<div class="flex flex-col items-center justify-center gap-8">
		<h1 class="text-4xl">Featured Projects</h1>
		<Carousel items={featured} />
	</div>
	<div class="flex w-full flex-col items-center gap-8 overflow-auto">
		<h1 class="text-4xl">Other Projects</h1>
		<div class="grid grid-cols-4 gap-8 pb-4">
			{#each other as project}
				<div class={otherCardClass}>
					<a href={project.href} target="_blank" rel="noreferrer">
						<h1 class="text-xl">{project.name}</h1>
					</a>
				</div>
			{/each}
		</div>
	</div>
</div>
