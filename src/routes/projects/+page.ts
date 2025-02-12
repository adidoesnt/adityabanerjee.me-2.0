import type { PageLoad } from './$types';

export const load: PageLoad = async ({ fetch }) => {
	const featuredProjectsResponse = await fetch('/projects/featured');
	const allProjectsResponse = await fetch('/projects/all');

	const featuredProjects = await featuredProjectsResponse.json();
	const allProjects = await allProjectsResponse.json();

	console.log('Received projects from server:', {
		featuredProjects: featuredProjects.length,
		allProjects: allProjects.length
	});

	return {
		featuredProjects,
		allProjects
	};
};
