import { writable } from 'svelte/store';

export const theme = writable<'light' | 'dark'>('dark');

theme.subscribe((value) => {
	if (value === 'light') {
		document.documentElement.classList.remove('dark');
	} else {
		document.documentElement.classList.add('dark');
	}
});
