// @ts-check
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';
import tailwindcss from '@tailwindcss/vite';
import cloudflare from "@astrojs/cloudflare";

// https://astro.build/config
export default defineConfig({
  // Enable React to support React JSX components.
  integrations: [react()],
  i18n: {
    locales: ["es", "en", "pt-br"],
    defaultLocale: "pt-br",
  },
  vite: {
    plugins: [tailwindcss()],
  },
  experimental: {
    session:true
  },
  adapter: cloudflare(
    {
      imageService:'passthrough',
      platformProxy: {
        enabled: true,
        configPath: 'wrangler.toml',
        persist: {
          path: './.cache/wrangler/v3'
        },
      },
      routes: {
        extend: {
          include: [
            { pattern: '/api/*' },
            { pattern: '/blog/*' },
          ],
          exclude: [{ pattern: '/**' }],
        }
      }
    }
  ),
});