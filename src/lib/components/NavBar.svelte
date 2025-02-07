<script lang="ts">
	import config from '../config.json';
	import { page } from '$app/state';

	const { navbar } = config;
	const pathname = $derived(page.url.pathname);

	const { hamburgerMenu = false, closeHamburgerMenu = null } = $props();
</script>

<div id="navbar" class={`${hamburgerMenu ? 'flex flex-col max-h-[50dvh] overflow-auto' : 'hidden'} lg:flex`}>
	<ul
		class={`${hamburgerMenu ? 'flex flex-col gap-4' : 'flex gap-16'} items-center justify-between`}
	>
		{#if hamburgerMenu}
			<li>
				<a
					href="/"
					class={`bg-transparent text-xl font-bold ${pathname === '/' ? 'underline' : ''}`}
					onclick={closeHamburgerMenu}>Home</a
				>
			</li>
		{/if}

		{#each navbar.items as item}
			{#if item.href === pathname}
				<li>
					<a
						href={item.href}
						class="bg-transparent text-xl font-bold underline"
						onclick={closeHamburgerMenu}>{item.name}</a
					>
				</li>
			{:else}
				<li>
					<a href={item.href} class="bg-transparent text-xl font-bold" onclick={closeHamburgerMenu}
						>{item.name}</a
					>
				</li>
			{/if}
		{/each}
	</ul>
</div>
