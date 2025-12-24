import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Claude Code AI Agent Starter',
  description: 'Documentation for Claude Code AI Agent development framework',

  // Clean URLs (no .html extension)
  cleanUrls: true,

  // Code highlighting
  markdown: {
    theme: {
      light: 'github-light',
      dark: 'github-dark'
    },
    lineNumbers: true
  },

  themeConfig: {
    // Logo and site title
    logo: '/logo.svg',
    siteTitle: 'AI Agent Starter',

    // Top navigation
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Getting Started', link: '/getting-started/installation' },
      { text: 'Commands', link: '/commands/planning' },
      { text: 'Guides', link: '/guides/sparc-methodology' },
      { text: 'Reference', link: '/reference/skills' }
    ],

    // Sidebar configuration (path-based)
    sidebar: {
      '/getting-started/': [
        {
          text: 'Getting Started',
          items: [
            { text: 'Installation', link: '/getting-started/installation' },
            { text: 'First Project', link: '/getting-started/first-project' },
            { text: 'Configuration', link: '/getting-started/configuration' }
          ]
        }
      ],
      '/commands/': [
        {
          text: 'Commands',
          items: [
            { text: 'Planning', link: '/commands/planning' },
            { text: 'Coding', link: '/commands/coding' },
            { text: 'Fixing', link: '/commands/fixing' },
            { text: 'Git', link: '/commands/git' },
            { text: 'SPARC Agents', link: '/commands/sparc' }
          ]
        }
      ],
      '/guides/': [
        {
          text: 'Guides',
          items: [
            { text: 'SPARC Methodology', link: '/guides/sparc-methodology' },
            { text: 'Workflows', link: '/guides/workflows' },
            { text: 'Claude-Flow', link: '/guides/claude-flow' },
            { text: 'Pair Programming', link: '/guides/pair-programming' }
          ]
        }
      ],
      '/reference/': [
        {
          text: 'Reference',
          items: [
            { text: 'Skills', link: '/reference/skills' },
            { text: 'Output Styles', link: '/reference/output-styles' },
            { text: 'Hooks', link: '/reference/hooks' }
          ]
        }
      ],
      '/concepts/': [
        {
          text: 'Concepts',
          items: [
            { text: 'Architecture', link: '/concepts/architecture' },
            { text: 'Design Principles', link: '/concepts/design-principles' }
          ]
        }
      ]
    },

    // Social links
    socialLinks: [
      { icon: 'github', link: 'https://github.com/anthropics/claude-code' }
    ],

    // Footer
    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright 2024'
    },

    // Search
    search: {
      provider: 'local'
    },

    // Edit link
    editLink: {
      pattern: 'https://github.com/anthropics/claude-code/edit/main/docs/:path',
      text: 'Edit this page on GitHub'
    }
  }
})
