<script lang="ts">
	import { acknowledgements } from '$lib/config.json';
	import Carousel from '$lib/components/carousel.svelte';
</script>

<div class="flex h-full w-full flex-col items-center justify-center gap-8">
	<h1 class="text-4xl">{acknowledgements.message}</h1>
	<Carousel items={acknowledgements.items} />
</div>
