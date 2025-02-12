import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { env } from '$env/dynamic/private';

const { DATABASE_URL } = env;

if (DATABASE_URL) {
    throw new Error('DATABASE_URL is not set');
}

const client = postgres(DATABASE_URL);
export const db = drizzle(client);
