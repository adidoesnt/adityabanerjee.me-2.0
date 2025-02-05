import { writable } from 'svelte/store';
import config from '$lib/config.json';

const { prompts } = config;

export const DEFAULT_PROMPT = prompts.info;

export const prompt = writable<string>(prompts.info);

export const getAnswer = async (query: string) => {
	const pair = prompts.prompts.find((prompt) => query === prompt.question);
	const responses = pair!.responses;

	const index = Math.floor(Math.random() * responses.length);
	
	// simulate network latency
	await new Promise((resolve) => setTimeout(resolve, 500));
    return responses[index];
};
