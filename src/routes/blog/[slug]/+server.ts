import { getClient } from '$lib/server/directus';
import { readItem } from '@directus/sdk';

export const GET = async ({ fetch, params }) => {
	try {
		const client = getClient(fetch);
		const { slug } = params;

		console.log('Fetching article with slug:', slug);

		const article = await client.request(readItem('articles', slug, {
			fields: ['*', {
				author: ['name']
			}]
		}));

		return new Response(JSON.stringify(article), { status: 200 });
	} catch (error) {
		console.error('Error fetching article from Directus:', error);
		return new Response('Internal Server Error', { status: 500 });
	}
};
