<script lang="ts">
	import InstagramLogo from '$lib/assets/instagram-logo.svelte';
	import EmailIcon from '$lib/assets/email-icon.svelte';
	import LinkedinLogo from '$lib/assets/linkedin-logo.svelte';
	import GithubLogo from '$lib/assets/github-logo.svelte';
	import FacebookLogo from '$lib/assets/facebook-logo.svelte';
</script>

<div id="footer" class="flex flex-col items-center gap-4 md:px-16">
	<ul class="flex w-full items-center justify-between gap-4">
		<li><GithubLogo /></li>
		<li><LinkedinLogo /></li>
		<li><EmailIcon /></li>
		<li><FacebookLogo /></li>
		<li><InstagramLogo /></li>
	</ul>
</div>

<p class="absolute bottom-0 right-0 m-2 mx-4 text-xs opacity-50 md:text-base">
	Icons by <a class="underline hover:opacity-50" href="https://icons8.com" target="_blank">Icons8</a
	>
</p>
