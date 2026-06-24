import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';
import fs from 'fs';

function getHtmlEntries() {
  const entries: Record<string, string> = {};
  // Using process.cwd() is safer in ESM than __dirname
  const root = process.cwd();
  const files = fs.readdirSync(root).filter(file => file.endsWith('.html'));
  files.forEach(file => {
    const name = file.replace('.html', '');
    entries[name] = resolve(root, file);
  });
  return entries;
}

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  // Root domain configuration (Crucial for kinantouch.com)
  base: '/techtouch.com-v2/',
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    sourcemap: false,
    rollupOptions: {
      input: getHtmlEntries(),
      output: {
        manualChunks(id) {
          if (id.includes('node_modules')) {
            return 'vendor';
          }
        },
      },
    },
  },
});
