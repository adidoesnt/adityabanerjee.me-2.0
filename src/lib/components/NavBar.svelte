<script lang="ts">
	import config from '../config.json';
	import { page } from '$app/state';

	const { navbar } = config;
	const pathname = $derived(page.url.pathname);
</script>

<div id="navbar" class="flex">
	<ul class="flex items-center justify-between gap-16">
		{#each navbar.items as item}
			{#if item.href === pathname}
				<li>
					<a href={item.href} class="bg-transparent text-xl font-bold underline">{item.name}</a>
				</li>
			{:else}
				<li>
					<a href={item.href} class="bg-transparent text-xl font-bold">{item.name}</a>
				</li>
			{/if}
		{/each}
	</ul>
</div>
