<script lang="ts">
	import config from '$lib/config.json';
	import { theme } from '$lib/context/theme';
	import { getDateWithTime } from '$lib/utils/date';
	import type { PageProps } from './$types';

	const cardBgAndTextClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);

	const { data }: PageProps = $props();
	const { articles } = data;
</script>

<div id="blog-page-container" class="flex h-full w-full flex-col items-center justify-start gap-8">
	<!-- TODO: fetch from Directus -->
	<!-- <h1 class="text-xl opacity-50">{config.blog.tooltip}</h1>
	<div class="flex flex-wrap justify-center gap-4 overflow-auto">
		{#if articles.length > 0}
			{#each articles as post}
				<div
					class={`${cardBgAndTextClass} flex w-60 flex-col items-start justify-center gap-4 rounded-md p-4`}
				>
					<a href={`/blog/${post.slug}`} class="underline hover:opacity-50">
						<h1 class="text-lg md:text-xl">{post.title}</h1></a
					>
					<p class="text-sm">{post.author.name}</p>
					<p class="text-sm">{getDateWithTime(post.date_updated)}</p>
				</div>
			{/each}
		{:else}
			<div class="flex w-60 flex-col items-center justify-center gap-4 rounded-md p-4">
				<h1 class="text-lg md:text-xl">{config.blog.empty}</h1>
			</div>
		{/if}
	</div> -->

	<!-- TODO: Remove maintenance mode -->
	<div class="flex h-full w-full flex-col items-center justify-center gap-4">
		<div class="flex flex-wrap justify-center gap-4 overflow-auto w-full h-full ">
			<div class="flex flex-col items-start justify-center gap-4 rounded-md p-4 text-center">
				<h1 class="text-xl md:text-2xl">{config.blog.underMaintenance}</h1>
			</div>
		</div>
	</div>
</div>