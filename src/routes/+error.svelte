<script lang="ts">
    import { page } from "$app/state";
    import config from '$lib/config.json';

    const { emojis } = config;
</script>

<main>
	<div class="flex flex-col gap-2 h-full w-full items-center justify-center">
		<h1 class="text-3xl">Error: {page.status}</h1>
		<p class="text-2xl">{page.error?.message} {emojis.sad}</p>
	</div>
</main>
