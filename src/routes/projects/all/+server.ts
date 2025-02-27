import { env } from '$env/dynamic/private';

const { GH_TOKEN, REPOS_PER_PAGE = '100' } = env;
const reposPerPage = parseInt(REPOS_PER_PAGE);

export const GET = async () => {
	try {
		const response = await fetch(
			`https://api.github.com/users/adidoesnt/repos?per_page=${reposPerPage}`,
			{
				headers: {
					Authorization: `token ${GH_TOKEN}`
				}
			}
		);

		if (!response.ok) {
			throw new Error('Failed to fetch repositories from GitHub');
		}

		const data = await response.json();

		return new Response(JSON.stringify(data), { status: 200 });
	} catch (error) {
		console.error('Error fetching repositories from GitHub:', error);
		return new Response('Internal Server Error', { status: 500 });
	}
};
