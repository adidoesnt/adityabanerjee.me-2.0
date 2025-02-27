<!-- TODO: Add missing fields like author, date, etc. -->
<!-- TODO: Fix fonts/layout especially for mobile -->

<script lang="ts">
	import type { PageProps } from './$types';
	import { theme } from '$lib/context/theme';
	import { blog } from '$lib/config.json';

	const { backToBlog } = blog;
	const { data }: PageProps = $props();
	const { article } = data;

	const cardBgAndTextClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);

	const proseHeadingTextClass = $derived(
		$theme === 'dark' ? 'prose-headings:text-cream prose-headings:text-2xl' : 'prose-headings:text-darkBrown prose-headings:text-2xl'
	);

	const proseATextClass = $derived(
		$theme === 'dark' ? 'prose-a:text-cream prose-a:underline prose-a:opacity-50' : 'prose-a:text-darkBrown prose-a:underline prose-a:opacity-50'
	);
</script>

<div id="blog-page-container" class="flex h-full w-full flex-col items-center justify-center gap-8">
	<div
		class={`${cardBgAndTextClass} flex w-fit flex-col items-center justify-start gap-4 rounded-md p-8 overflow-auto`}
	>
		<h1 class="text-4xl underline">{article.title}</h1>
		<div class={`prose text-lg ${proseHeadingTextClass} ${proseATextClass} ${cardBgAndTextClass}`}>
			{@html article.content}
		</div>
		<a href="/blog" class="underline hover:opacity-50 flex self-start">
			<h1 class="text-lg md:text-xl">{backToBlog}</h1>
		</a>
	</div>
</div>
