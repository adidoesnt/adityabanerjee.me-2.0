import { writable } from 'svelte/store';

export const showHamburgerMenu = writable(false);

export const toggleHamburgerMenu = () => {
	showHamburgerMenu.update((show) => !show);
};
