<script lang="ts">
	import '../app.css';
	let { children } = $props();
</script>

<main>
	<div id="main-container" class="grid-rows-[10%,80%,10%] m-0 grid min-w-[100dvw] min-h-[100dvh]">
		<div id="header">
			<p>header placeholder</p>
		</div>
		{@render children()}
		<div id="footer">
			<p>footer placeholder</p>
		</div>
	</div>
</main>
