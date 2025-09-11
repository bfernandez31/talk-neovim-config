# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim configuration built on top of LazyVim, a modern Neovim configuration framework. The configuration is designed for development with a focus on Java, Angular, JSON, Markdown, and other languages.

## Architecture

### Core Structure
- **init.lua**: Entry point that bootstraps the configuration by requiring `config.lazy`
- **lua/config/**: Core configuration files that customize LazyVim defaults
  - `lazy.lua`: Plugin manager setup and configuration
  - `options.lua`: Vim options overrides (currently disables tabline, sets spell languages)
  - `keymaps.lua`: Custom key mappings
  - `autocmds.lua`: Auto commands
- **lua/plugins/**: Custom plugin configurations and overrides
- **lazy-lock.json**: Locked plugin versions for reproducible installations
- **lazyvim.json**: LazyVim extras configuration and enabled features

### LazyVim Configuration
The configuration uses LazyVim's extras system with the following enabled:
- AI: Copilot integration and Copilot Chat
- Coding: Mini surround, Yanky (clipboard manager)
- DAP: Core debugging support
- Languages: Angular, Java, JSON, Markdown, TOML
- Testing: Core testing support
- Utilities: Mini hipatterns

### Custom Plugin Configurations
- **dap-java.lua**: Java debugging configuration with remote attach support on port 5005
- **disabled.lua**: Disables bufferline.nvim plugin
- **dashboard.lua**: Custom dashboard configuration
- **screenkey.lua**: Screen key display plugin

## Key Dependencies

The configuration relies on these major plugin ecosystems:
- **LazyVim**: Core framework providing sensible defaults
- **Mason**: LSP server, DAP adapter, and tool installer
- **nvim-dap**: Debug Adapter Protocol for debugging
- **nvim-lspconfig**: LSP configurations
- **nvim-treesitter**: Syntax highlighting and text objects
- **Copilot**: AI code completion and chat

## Development Workflow

### Plugin Management
- Plugins are managed by Lazy.nvim
- Custom plugins go in `lua/plugins/` directory
- Use the lazy-lock.json to ensure reproducible plugin versions
- Plugin updates are automatically checked but not auto-applied

### Configuration Changes
- Core LazyVim settings are inherited and can be overridden in `lua/config/`
- Custom options go in `lua/config/options.lua`
- Custom keymaps go in `lua/config/keymaps.lua`
- Plugin-specific configurations go in separate files in `lua/plugins/`

### Language Support
The configuration is optimized for:
- **Java**: Full LSP support with debugging capabilities (remote attach on port 5005)
- **Angular**: TypeScript and Angular-specific tooling
- **Markdown**: Enhanced rendering and editing
- **JSON**: Schema validation and formatting
- **TOML**: Configuration file support

### Code Formatting
- Uses StyLua for Lua code formatting (configured in stylua.toml)
- 2-space indentation, 120 character column width
- Conform.nvim handles formatting for other languages

### Debugging
Java debugging is pre-configured to attach to remote processes on localhost:5005. The configuration includes:
- Java Debug Adapter
- Java Test Runner support
- JUnit Platform Console Launcher integration

## File Locations

When modifying this configuration:
- Add new plugin configurations in `lua/plugins/[name].lua`
- Override LazyVim defaults in `lua/config/` files
- Language-specific configurations typically go in their own plugin files
- Disable unwanted LazyVim plugins in `lua/plugins/disabled.lua`