<script lang="ts">
	import { page } from '$app/state';
	import config from '$lib/config.json';

	const { emojis } = config;
</script>

<div class="flex h-full w-full flex-col items-center justify-center gap-2">
	<h1 class="text-3xl">Error: {page.status}</h1>
	<p class="text-2xl">{page.error?.message} {emojis.sad}</p>
</div>
