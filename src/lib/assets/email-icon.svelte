<script lang="ts">
	import config from '../config.json';
	import { theme } from '$lib/context/theme';

	const { footer } = config;
</script>

<a aria-label="Email" href={footer.email} target="_blank" rel="noopener noreferrer">
	{#if $theme === 'dark'}
		<svg
			fill="#f7e4d2"
			xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 64 64"
			class="h-10 w-10 lg:h-16 lg:w-16"
			><path
				d="M55,10H9c-2.209,0-4,1.791-4,4v34c0,2.209,1.791,4,4,4h46c2.209,0,4-1.791,4-4V14C59,11.791,57.209,10,55,10z M55,45.738 C54.954,47,53.901,48,52.618,48H49.5L51,21L32,33L13,22l1.5,26h-3.118C10.099,48,9.046,47,9,45.738V16.289 c0-1.25,1.03-2.263,2.3-2.263h1.2L32,29l19.5-14.974h1.2c1.27,0,2.3,1.013,2.3,2.263V45.738z"
			/></svg
		>
	{:else}
		<svg
			fill="#311e12"
			xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 64 64"
			class="h-10 w-10 lg:h-16 lg:w-16"
			><path
				d="M55,10H9c-2.209,0-4,1.791-4,4v34c0,2.209,1.791,4,4,4h46c2.209,0,4-1.791,4-4V14C59,11.791,57.209,10,55,10z M55,45.738 C54.954,47,53.901,48,52.618,48H49.5L51,21L32,33L13,22l1.5,26h-3.118C10.099,48,9.046,47,9,45.738V16.289 c0-1.25,1.03-2.263,2.3-2.263h1.2L32,29l19.5-14.974h1.2c1.27,0,2.3,1.013,2.3,2.263V45.738z"
			/></svg
		>
	{/if}
</a>
