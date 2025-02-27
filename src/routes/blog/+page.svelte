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
	<h1 class="text-xl opacity-50">{config.blog.tooltip}</h1>
	<div class="flex flex-wrap justify-center gap-4 overflow-auto">
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
	</div>
</div>
