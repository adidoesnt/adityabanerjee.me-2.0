<script lang="ts">
	import { acknowledgements } from '$lib/config.json';
	import DesktopCarousel from '$lib/components/Carousel/DesktopCarousel.svelte';
	import MobileCarousel from '$lib/components/Carousel/MobileCarousel.svelte';
</script>

<div class="flex h-full w-full flex-col items-center justify-center gap-2 overflow-auto">
	<h1 class="text-lg md:text-2xl lg:text-4xl">{acknowledgements.message}</h1>
	<DesktopCarousel items={acknowledgements.items} />
	<MobileCarousel items={acknowledgements.items} />
	<p class="block text-center md:hidden opacity-50">
		{acknowledgements.tooltip}
	</p>
</div>
