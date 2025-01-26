import { writable } from "svelte/store";
import config from '$lib/config.json';

const { prompts } = config;

export const prompt = writable<string>(prompts.info);
export const answer = writable<string | null>(null);
