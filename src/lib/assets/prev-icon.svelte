<script lang="ts">
	import NextIcon from './next-icon.svelte';
	let { className = 'w-12 h-12', onclick, disabled = false } = $props();
	className = `${className} rotate-180`;
</script>

<NextIcon {className} {onclick} {disabled} />
