<script lang="ts">
	import { slide } from 'svelte/transition';
	import SidebarIcon from '$lib/assets/sidebar-icon.svelte';
	import { theme } from '$lib/context/theme';
	
	const sideBarClass = $derived(
		$theme === 'dark'
			? 'fixed left-0 flex flex-col items-center gap-8 w-fit min-w-[15dvw] max-w-[25dvw] p-8 h-full bg-primary text-text'
			: 'fixed left-0 flex flex-col items-center gap-8 w-fit min-w-[15dvw] max-w-[25dvw] p-8 h-full bg-accent text-background'
	);
	let show = $state(false);
	let { title, items } = $props();
</script>

<SidebarIcon
	className="fixed w-8 h-8 left-0 top-0 z-10 m-4"
	onclick={() => {
		show = !show;
	}}
	{show}
/>

{#if show}
	<div id="sidebar" class={sideBarClass} transition:slide={{ axis: 'x' }}>
		<h1 class="mt-16 text-4xl underline">{title}</h1>
		<div id="posts" class="flex flex-col gap-4 overflow-auto">
			{#each items as item}
				<div class="flex flex-col gap-2">
					<h1 class="text-xl">{item.name}</h1>
				</div>
			{/each}
		</div>
	</div>
{/if}
