<script lang="ts">
	import { timeline } from '$lib/config.json';
	import { theme } from '$lib/context/theme';
	import DesktopTimeline from './components/DesktopTimeline.svelte';
	import MobileTimeline from './components/MobileTimeline.svelte';

	const cardClass = $derived(
		$theme === 'dark'
			? 'py-4 px-8 bg-beige text-darkBrown rounded-md'
			: 'py-4 px-8 bg-brown text-cream rounded-md'
	);

	const timelineClass = $derived($theme === 'dark' ? 'bg-beige' : 'bg-brown');
</script>

<div class="flex h-full w-full items-start justify-center overflow-auto">
	<DesktopTimeline {timeline} {cardClass} {timelineClass} />
	<MobileTimeline {timeline} {cardClass} {timelineClass} />
</div>
