import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch, params }) => {
    const { slug } = params;
    const response = await fetch(`/blog/${slug}`);

    if (!response.ok) {
        throw new Error('Failed to fetch blog post from Directus');
    }

    const article = await response.json();
    return {
        article
    };
};
