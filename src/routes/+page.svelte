<script lang="ts">
	import config from '$lib/config.json';
	import DisplayPicture from '$lib/assets/display-picture.svelte';

	const { name } = config;
</script>

<div class="flex h-full w-full items-center justify-center overflow-auto">
	<div id="home-content" class="flex flex-col md:flex-row text-sm md:text-lg items-center justify-center py-8 gap-8 md:gap-16 overflow-auto">
		<DisplayPicture />
		<div class="flex flex-col gap-4 text-center">
			<h1 class="text-3xl lg:text-4xl font-bold">
				<a href="/">{name}</a>
			</h1>
			<div class="flex flex-col gap-2">
				{#each config.headline as headline}
					<p class="text-xl font-bold">
						{headline}
					</p>
				{/each}
			</div>
		</div>
	</div>
</div>
