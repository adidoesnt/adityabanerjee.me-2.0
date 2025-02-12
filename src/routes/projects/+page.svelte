<script lang="ts">
	import DesktopCarousel from '$lib/components/Carousel/DesktopCarousel.svelte';
	import MobileCarousel from '$lib/components/Carousel/MobileCarousel.svelte';
	import type { PageProps } from './$types';
	import { theme } from '$lib/context/theme';
	import { projects } from '$lib/config.json';

	const { data }: PageProps = $props();
	const { featuredProjects, allProjects } = data;

	const backgroundClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);
</script>

<div
	id="projects-page-container"
	class="flex flex-col items-center justify-start gap-8 overflow-auto py-4"
>
	<div
		id="featured-projects-container"
		class="grid grid-rows-[min-content_1fr] items-center justify-center gap-4"
	>
		<div class="flex w-full items-center justify-center">
			<h1 class="text-2xl md:text-3xl lg:text-4xl">Featured Projects</h1>
		</div>
		<p class="block text-center opacity-50 md:hidden">
			{projects.tooltips.carousel}
		</p>
		<DesktopCarousel items={featuredProjects} />
		<MobileCarousel items={featuredProjects} />
	</div>
	<div
		id="all-projects-container"
		class="grid grid-rows-[min-content_1fr] items-center justify-center gap-4"
	>
		<div class="flex w-full items-center justify-center">
			<h1 class="text-2xl md:text-3xl lg:text-4xl">All Projects</h1>
		</div>
		<p class="block text-center opacity-50">
			{projects.tooltips.allProjects}
		</p>
		<div class="grid grid-flow-row grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
			{#each allProjects as project}
				<div
					class={`flex flex-col items-center justify-center gap-4 rounded-md p-8 text-center ${backgroundClass}`}
				>
					<a
						class="text-lg underline hover:opacity-50 md:text-xl"
						href={project.html_url}
						target="_blank"
						rel="noopener noreferrer"
					>
						{project.name}
					</a>
					<p class="text-sm md:text-base">{project.description ?? projects.fallbackDescription}</p>
				</div>
			{/each}
		</div>
	</div>
</div>
