import type { PageLoad } from './$types';

// TODO: fetch from Directus
export const load: PageLoad = async (/* { fetch } */) => {
	// const response = await fetch('/blog');

	// if (!response.ok) {
	// 	throw new Error('Failed to fetch blog posts from Directus');
	// }

	// const articles = await response.json();
	return {
		articles: []
	};
};
