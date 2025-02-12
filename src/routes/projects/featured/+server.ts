import { env } from '$env/dynamic/private';
import { projects } from '$lib/config.json';

const { featured } = projects;
const { GH_TOKEN } = env;

export const GET = async () => {
	try {
		const projects = await Promise.all(
			featured.map(async (repo) => {
				const response = await fetch(`https://api.github.com/repos/adidoesnt/${repo.githubName}`, {
					headers: {
						Authorization: `token ${GH_TOKEN}`
					}
				});

				if (!response.ok) {
					throw new Error('Failed to fetch repository from GitHub');
				}

				const data = await response.json();

				return { ...data, ...repo };
			})
		);

		return new Response(JSON.stringify(projects), { status: 200 });
	} catch (error) {
		console.error('Error fteching repositories from GitHub:', error);
		return new Response('Internal Server Error', { status: 500 });
	}
};
