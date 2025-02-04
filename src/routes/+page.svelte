<script lang="ts">
	import config from '$lib/config.json';
	import DisplayPicture from '$lib/assets/display-picture.svelte';

	const { name } = config;
</script>

<div class="flex h-full w-full items-center justify-center">
	<div id="home-content" class="flex items-center justify-center gap-16">
		<DisplayPicture />
		<div class="flex flex-col gap-4 text-center">
			<h1 class="text-4xl font-bold">
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
