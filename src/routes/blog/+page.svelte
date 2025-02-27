<script lang="ts">
	import config from '$lib/config.json';
	import { theme } from '$lib/context/theme';

	const cardBgAndTextClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);

	const mockPosts = [
		{
			title: 'How to build a blog with SvelteKit',
			date: 'Aug 2023'
		},
		{
			title: 'How to build a blog with SvelteKit',
			date: 'Aug 2023'
		},
		{
			title: 'SvelteKit is the future of web development',
			date: 'Jul 2023'
		},
		{
			title: 'Why SvelteKit is the future of web development',
			date: 'Jun 2023'
		},
		{
			title: 'The future of web development',
			date: 'May 2023'
		},
		{
			title: 'How to build a blog with SvelteKit',
			date: 'Aug 2023'
		},
		{
			title: 'How to build a blog with SvelteKit',
			date: 'Aug 2023'
		},
		{
			title: 'SvelteKit is the future of web development',
			date: 'Jul 2023'
		},
		{
			title: 'Why SvelteKit is the future of web development',
			date: 'Jun 2023'
		},
		{
			title: 'The future of web development',
			date: 'May 2023'
		}
	];
</script>

<div id="blog-page-container" class="flex flex-col w-full h-full justify-start items-center gap-8">
	<h1 class="text-xl opacity-50">{config.blog.tooltip}</h1>
	<div class="flex flex-wrap gap-4 overflow-auto justify-center">
		{#each mockPosts as post}
			<div class={`${cardBgAndTextClass} flex flex-col items-start justify-center gap-4 p-4 rounded-md w-60`}>
				<h1 class="text-lg md:text-xl">{post.title}</h1>
				<p class="text-sm">{post.date}</p>
			</div>
		{/each}
	</div>
</div>
