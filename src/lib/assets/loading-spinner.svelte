<script lang="ts">
	import { theme } from '$lib/context/theme';
</script>

{#if $theme === 'dark'}
	<svg
		fill="#f7e4d2"
		xmlns="http://www.w3.org/2000/svg"
		viewBox="0 0 30 30"
		class="spinner h-12 w-12"
	>
		<path
			d="M 13 3 A 2 2 0 0 0 11 5 A 2 2 0 0 0 13 7 A 2 2 0 0 0 15 5 A 2 2 0 0 0 13 3 z M 20 4 A 2 2 0 0 0 18 6 A 2 2 0 0 0 20 8 A 2 2 0 0 0 22 6 A 2 2 0 0 0 20 4 z M 7 7 A 2 2 0 0 0 5 9 A 2 2 0 0 0 7 11 A 2 2 0 0 0 9 9 A 2 2 0 0 0 7 7 z M 24.5 10 A 2.5 2.5 0 0 0 22 12.5 A 2.5 2.5 0 0 0 24.5 15 A 2.5 2.5 0 0 0 27 12.5 A 2.5 2.5 0 0 0 24.5 10 z M 5 13.75 A 1.25 1.25 0 0 0 3.75 15 A 1.25 1.25 0 0 0 5 16.25 A 1.25 1.25 0 0 0 6.25 15 A 1.25 1.25 0 0 0 5 13.75 z M 23 17 A 3 3 0 0 0 20 20 A 3 3 0 0 0 23 23 A 3 3 0 0 0 26 20 A 3 3 0 0 0 23 17 z M 7 19 A 1 1 0 0 0 6 20 A 1 1 0 0 0 7 21 A 1 1 0 0 0 8 20 A 1 1 0 0 0 7 19 z M 14.5 20 A 3.5 3.5 0 0 0 11 23.5 A 3.5 3.5 0 0 0 14.5 27 A 3.5 3.5 0 0 0 18 23.5 A 3.5 3.5 0 0 0 14.5 20 z"
		/></svg
	>
{:else}
	<svg
		fill="#311e12"
		xmlns="http://www.w3.org/2000/svg"
		viewBox="0 0 30 30"
		class="spinner h-12 w-12"
	>
		<path
			d="M 13 3 A 2 2 0 0 0 11 5 A 2 2 0 0 0 13 7 A 2 2 0 0 0 15 5 A 2 2 0 0 0 13 3 z M 20 4 A 2 2 0 0 0 18 6 A 2 2 0 0 0 20 8 A 2 2 0 0 0 22 6 A 2 2 0 0 0 20 4 z M 7 7 A 2 2 0 0 0 5 9 A 2 2 0 0 0 7 11 A 2 2 0 0 0 9 9 A 2 2 0 0 0 7 7 z M 24.5 10 A 2.5 2.5 0 0 0 22 12.5 A 2.5 2.5 0 0 0 24.5 15 A 2.5 2.5 0 0 0 27 12.5 A 2.5 2.5 0 0 0 24.5 10 z M 5 13.75 A 1.25 1.25 0 0 0 3.75 15 A 1.25 1.25 0 0 0 5 16.25 A 1.25 1.25 0 0 0 6.25 15 A 1.25 1.25 0 0 0 5 13.75 z M 23 17 A 3 3 0 0 0 20 20 A 3 3 0 0 0 23 23 A 3 3 0 0 0 26 20 A 3 3 0 0 0 23 17 z M 7 19 A 1 1 0 0 0 6 20 A 1 1 0 0 0 7 21 A 1 1 0 0 0 8 20 A 1 1 0 0 0 7 19 z M 14.5 20 A 3.5 3.5 0 0 0 11 23.5 A 3.5 3.5 0 0 0 14.5 27 A 3.5 3.5 0 0 0 18 23.5 A 3.5 3.5 0 0 0 14.5 20 z"
		/></svg
	>
{/if}

<style>
	.spinner {
		animation: rotate 2s linear infinite;
	}

	@keyframes rotate {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}
</style>
