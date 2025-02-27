import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch, params }) => {
    const { id } = params;
    const response = await fetch(`/blog/${id}`);

    if (!response.ok) {
        throw new Error('Failed to fetch blog post from Directus');
    }

    const article = await response.json();
    return {
        article
    };
};
