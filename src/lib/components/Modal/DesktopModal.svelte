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
		id="modal-overlay"
		class="fixed left-0 top-0 z-50 md:hidden lg:flex h-[100dvh] w-[100dvw] items-center justify-center backdrop-blur-lg"
	>
		<div
			id="modal-container"
			class={`flex h-fit w-fit min-w-[25dvw] max-w-[50dvw] flex-col items-center justify-center gap-4 rounded-md p-4 text-left ${backgroundClass}`}
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
	</div>
{/if}
