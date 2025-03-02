<script lang="ts">
	import type { PageProps } from './$types';
	import { theme } from '$lib/context/theme';
	import { blog } from '$lib/config.json';
	import { getDateWithTime } from '$lib/utils/date';

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

	const hrBorderClass = $derived(
		$theme === 'dark' ? 'border-[1px] border-cream' : 'border-[1px] border-darkBrown'
	);
</script>

<div id="blog-page-container" class="flex h-full w-full flex-col items-center justify-center gap-8">
	<div
		class={`${cardBgAndTextClass} flex w-fit flex-col items-center justify-start gap-4 rounded-md p-8 overflow-auto`}
	>
		<h1 class="text-4xl">{article.title}</h1>
		<div class="flex w-full justify-between">
			<p class="text-sm">{article.author.name}</p>
			<p class="text-sm">{getDateWithTime(article.date_updated)}</p>
		</div>
		<hr class={`${hrBorderClass} w-full`} />
		<p class="prose text-lg italic">{article.headline}</p>
		<div class={`prose text-lg ${proseHeadingTextClass} ${proseATextClass} ${cardBgAndTextClass} overflow-x-hidden break-words`}>
			{@html article.content}
		</div>
		<a href="/blog" class="underline hover:opacity-50 flex self-start">
			<h1 class="text-lg md:text-xl">{backToBlog}</h1>
		</a>
	</div>
</div>
