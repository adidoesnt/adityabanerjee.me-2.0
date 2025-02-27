import { getClient } from "$lib/server/directus";
import { readItems } from "@directus/sdk";

export const GET = async ({ fetch }) => {
	try {
        const client = getClient(fetch);
        const articles = await client.request(readItems('articles', {
            fields: ['id', 'title', 'lastUpdated'],
            sort: '-lastUpdated',
            filter: {
                publish: true
            }
        }));
    
        return new Response(JSON.stringify(articles), { status: 200 });
	} catch (error) {
		console.error('Error fetching articles from Directus:', error);
		return new Response('Internal Server Error', { status: 500 });
	}
};
