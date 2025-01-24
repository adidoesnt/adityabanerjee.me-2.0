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
				background: '#311E12', // Dark brown background
				primary: '#462B19', // Medium brown
				secondary: '#A68B6A', // Light brown
				accent: '#D9C2A3', // Beige
				text: '#F7E4D2', // Light cream for text
				white: '#FFFFFF', // White
				black: '#000000' // Black
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
