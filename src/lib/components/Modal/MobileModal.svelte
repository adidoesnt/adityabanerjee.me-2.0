<script lang="ts">
	import CloseIcon from '$lib/assets/close-icon.svelte';
	import { theme } from '$lib/context/theme';

	const backgroundClass = $derived(
		$theme === 'dark' ? 'bg-brown text-cream' : 'bg-beige text-darkBrown'
	);

	const { children, show, toggle } = $props();
</script>

{#if show}
	<div
		id="modal-container"
		class={`fixed z-50 lg:hidden left-0 top-0 flex h-[100dvh] w-[100dvw] flex-col items-center justify-start gap-4 p-4 px-8 text-left ${backgroundClass} overflow-auto`}
	>
		<div class="flex w-full items-center justify-end">
			<button class="flex" onclick={toggle} aria-label="Close Modal">
				<CloseIcon />
			</button>
		</div>
		<div id="modal-content" class="flex w-full flex-col items-center justify-center">
			{@render children()}
		</div>
	</div>
{/if}
