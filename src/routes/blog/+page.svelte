<script lang="ts">
	import Sidebar from '$lib/components/sidebar.svelte';
	import { blog } from '$lib/config.json';
</script>

<div class="flex h-full w-full items-center justify-center">
	<Sidebar title="Posts" items={blog.posts} />
	<h1 class="text-4xl">👷🏽‍♂️ Under Construction... 🚧</h1>
</div>
