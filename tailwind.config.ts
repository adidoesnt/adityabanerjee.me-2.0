import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';
import type { Config } from 'tailwindcss';

export default {
	content: ['./src/**/*.{html,js,svelte,ts}'],

	theme: {
		extend: {
			fontFamily: {
				itim: ['Itim', 'cursive'] // Custom font
			},
			colors: {
				darkBrown: '#311E12', // background
				brown: '#462B19', // primary
				lightBrown: '#A68B6A', // secondary
				beige: '#D9C2A3', // accent
				cream: '#F7E4D2', // text
				white: '#FFFFFF',
				black: '#000000'
			},
			dropShadow: {
				glow: '0 0 15px #D9C2A3', // Soft beige glow
				strong: '0 0 25px #D9C2A3', // Stronger glow
				neon: '0 0 15px #ffcc00' // Neon yellow glow
			}
		}
	},

	plugins: [typography, forms]
} satisfies Config;
