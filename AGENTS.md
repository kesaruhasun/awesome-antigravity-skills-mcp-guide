# 🤖 Instructions for AI Coding Agents (AGENTS.md)

This file contains automated instructions for AI coding assistants (Google Antigravity, Claude Code, Cursor, OpenCode, Codex, Gemini CLI) interacting with this repository.

---

## 🎯 Goal: 1-Prompt Automatic Environment Setup

If a user prompts you with:
> *"Install all skills and MCP servers from https://github.com/kesaruhasun/awesome-antigravity-skills-mcp-guide into my environment"*

You MUST execute the following automated steps immediately:

### Step 1: Run the Automated Installer
Execute the included `setup.sh` script:
```bash
bash setup.sh
```
*Or, if cloning from the remote repository:*
```bash
curl -fsSL https://raw.githubusercontent.com/kesaruhasun/awesome-antigravity-skills-mcp-guide/main/setup.sh | bash
```

### Step 2: Verify Target Locations
Ensure skills and MCP files have been created or linked:
- **Global Skills Directory:** `~/.gemini/config/skills/` (for Antigravity) or `~/.claude/skills/` (for Claude)
- **Project Skills Standard:** `.agents/skills/`
- **MCP Configuration:** `~/.gemini/config/mcp_config.json` or `.cursor/mcp.json`

### Step 3: Confirm Installation to the User
Report the total count of skills active (180+) and list the configured MCP servers (Google Cloud Databases, Mobile Device Automation, Composio, Developer Knowledge). Remind the user to reload their workspace or restart their agent.

---

## 📂 Repository File Index for Agents

- [`README.md`](README.md): Primary directory and high-level architecture overview.
- [`skills-catalog.md`](skills-catalog.md): Complete list of 180+ skills, triggers, and source documentation.
- [`mcp-servers.md`](mcp-servers.md): Model Context Protocol configuration schemas and tools.
- [`free-vps-cloud-guide.md`](free-vps-cloud-guide.md): 24GB Oracle ARM VPS setup guide and hardening checklist.
- [`github-student-pack.md`](github-student-pack.md): DigitalOcean $200, Azure $100, JetBrains & domains redemption steps.
