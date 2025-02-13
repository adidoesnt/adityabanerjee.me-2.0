<script lang="ts">
	import { theme } from '$lib/context/theme';

	const { className = 'w-6 h-6' } = $props();
</script>

{#if $theme === 'dark'}
	<svg
		xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		viewBox="0,0,256,256"
		width="100px"
		height="100px"
		fill-rule="nonzero"
		class={className}
		><g
			fill="#f7e4d2"
			fill-rule="nonzero"
			stroke="none"
			stroke-width="1"
			stroke-linecap="butt"
			stroke-linejoin="miter"
			stroke-miterlimit="10"
			stroke-dasharray=""
			stroke-dashoffset="0"
			font-family="none"
			font-weight="none"
			font-size="none"
			text-anchor="none"
			style="mix-blend-mode: normal"
			><g transform="scale(5.12,5.12)"
				><path
					d="M9,4c-2.74952,0 -5,2.25048 -5,5v32c0,2.74952 2.25048,5 5,5h32c2.74952,0 5,-2.25048 5,-5v-32c0,-2.74952 -2.25048,-5 -5,-5zM9,6h32c1.66848,0 3,1.33152 3,3v32c0,1.66848 -1.33152,3 -3,3h-32c-1.66848,0 -3,-1.33152 -3,-3v-32c0,-1.66848 1.33152,-3 3,-3zM16.70703,15.29297l-1.41406,1.41406l8.29297,8.29297l-8.29297,8.29297l1.41406,1.41406l8.29297,-8.29297l8.29297,8.29297l1.41406,-1.41406l-8.29297,-8.29297l8.29297,-8.29297l-1.41406,-1.41406l-8.29297,8.29297z"
				></path></g
			></g
		></svg
	>
{:else}
	<svg
		class={className}
		xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		viewBox="0,0,256,256"
		width="100px"
		height="100px"
		fill-rule="nonzero"
		><g
			fill="#311e12"
			fill-rule="nonzero"
			stroke="none"
			stroke-width="1"
			stroke-linecap="butt"
			stroke-linejoin="miter"
			stroke-miterlimit="10"
			stroke-dasharray=""
			stroke-dashoffset="0"
			font-family="none"
			font-weight="none"
			font-size="none"
			text-anchor="none"
			style="mix-blend-mode: normal"
			><g transform="scale(5.12,5.12)"
				><path
					d="M9,4c-2.74952,0 -5,2.25048 -5,5v32c0,2.74952 2.25048,5 5,5h32c2.74952,0 5,-2.25048 5,-5v-32c0,-2.74952 -2.25048,-5 -5,-5zM9,6h32c1.66848,0 3,1.33152 3,3v32c0,1.66848 -1.33152,3 -3,3h-32c-1.66848,0 -3,-1.33152 -3,-3v-32c0,-1.66848 1.33152,-3 3,-3zM16.70703,15.29297l-1.41406,1.41406l8.29297,8.29297l-8.29297,8.29297l1.41406,1.41406l8.29297,-8.29297l8.29297,8.29297l1.41406,-1.41406l-8.29297,-8.29297l8.29297,-8.29297l-1.41406,-1.41406l-8.29297,8.29297z"
				></path></g
			></g
		></svg
	>
{/if}
