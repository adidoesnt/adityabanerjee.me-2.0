<script lang="ts">
	import { theme } from '$lib/context/theme';
	let { className = 'w-12 h-12', onclick, disabled = false } = $props();
</script>

<button aria-label="Send Prompt" {onclick} {disabled}>
	{#if $theme === 'dark'}
		<svg fill="#f7e4d2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" class={className}>
			<path
				d="M9,46h32c2.761,0,5-2.239,5-5V9c0-2.761-2.239-5-5-5H9C6.239,4,4,6.239,4,9v32C4,43.761,6.239,46,9,46z M34,25l-14,9V16 L34,25z"
			/></svg
		>
	{:else}
		<svg fill="#311e12" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" class={className}>
			<path
				d="M9,46h32c2.761,0,5-2.239,5-5V9c0-2.761-2.239-5-5-5H9C6.239,4,4,6.239,4,9v32C4,43.761,6.239,46,9,46z M34,25l-14,9V16 L34,25z"
			/></svg
		>
	{/if}
</button>
