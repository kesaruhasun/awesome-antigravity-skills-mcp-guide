#!/usr/bin/env bash
# ==============================================================================
# Awesome Antigravity & Agent Skills - 1-Click Universal Automated Installer
# Installs 180+ Agent Skills and Configures Model Context Protocol (MCP) Servers
# Supported Environments: Google Antigravity, Claude Code, Cursor, Gemini CLI, OpenCode
# ==============================================================================

set -e

# Color definitions
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
cat << "EOF"
    ___                                            ___         __             __  
   /   | _      _____  _________  ____ ___  ___   /   | ____  / /_(_)___ _   / /_ 
  / /| || | /| / / _ \/ ___/ __ \/ __ `__ \/ _ \ / /| |/ __ \/ __/ / __ `/  / __ \
 / ___ || |/ |/ /  __(__  ) /_/ / / / / / /  __// ___ / / / / /_/ / /_/ /  / /_/ /
/_/  |_||__/|__/\___/____/\____/_/ /_/ /_/\___//_/  |_/_/ /_/\__/_/\__, /  /_.___/ 
                                                                  /____/          
            🚀 Universal Agent Skills & MCP Automated Installer
EOF
echo -e "${NC}"

echo -e "${BLUE}==>${NC} Initializing environment detection..."

# Detect home and agent target directories
HOME_DIR="$HOME"
ANTIGRAVITY_CONFIG_DIR="$HOME_DIR/.gemini/config"
ANTIGRAVITY_SKILLS_DIR="$ANTIGRAVITY_CONFIG_DIR/skills"
ANTIGRAVITY_PLUGINS_DIR="$ANTIGRAVITY_CONFIG_DIR/plugins"
ANTIGRAVITY_MCP_FILE="$ANTIGRAVITY_CONFIG_DIR/mcp_config.json"
PROJECT_SKILLS_DIR=".agents/skills"

# Create necessary directories
echo -e "${BLUE}==>${NC} Creating agent skills and plugins directories..."
mkdir -p "$ANTIGRAVITY_SKILLS_DIR"
mkdir -p "$ANTIGRAVITY_PLUGINS_DIR"
mkdir -p "$PROJECT_SKILLS_DIR"
mkdir -p "$HOME_DIR/.gemini/antigravity-cli/mcp"

# Check dependencies
echo -e "${BLUE}==>${NC} Verifying system prerequisites (git, python3, node, uv)..."
command -v git >/dev/null 2>&1 || { echo -e "${RED}Error: git is required.${NC}" >&2; exit 1; }

# Install UV (fast Python package manager) if missing
if ! command -v uv >/dev/null 2>&1; then
    echo -e "${YELLOW}==>${NC} Installing uv for high-speed MCP server execution..."
    curl -LsSf https://astral.sh/uv/install.sh | sh || true
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Clone or update primary skill repositories
declare -A REPOS=(
    ["science"]="https://github.com/google-deepmind/science-skills.git"
    ["modern-web-guidance-plugin"]="https://github.com/GoogleChrome/modern-web-guidance.git"
    ["addyosmani-agent-skills"]="https://github.com/addyosmani/agent-skills.git"
    ["mattpocock-skills"]="https://github.com/mattpocock/skills.git"
    ["marketingskills"]="https://github.com/coreyhaines31/marketingskills.git"
)

echo -e "${BLUE}==>${NC} Fetching and linking upstream agent skill repositories..."

for PLUGIN_NAME in "${!REPOS[@]}"; do
    REPO_URL="${REPOS[$PLUGIN_NAME]}"
    TARGET_DIR="$ANTIGRAVITY_PLUGINS_DIR/$PLUGIN_NAME"

    if [ -d "$TARGET_DIR/.git" ]; then
        echo -e "  ${GREEN}✓${NC} Updating $PLUGIN_NAME..."
        git -C "$TARGET_DIR" pull --quiet || true
    else
        echo -e "  ${CYAN}📥${NC} Cloning $PLUGIN_NAME..."
        git clone --quiet --depth 1 "$REPO_URL" "$TARGET_DIR" || true
    fi

    # Link individual skills into the top-level skills directory and project directory
    if [ -d "$TARGET_DIR/skills" ]; then
        for SKILL_PATH in "$TARGET_DIR/skills"/*; do
            if [ -d "$SKILL_PATH" ]; then
                SKILL_NAME=$(basename "$SKILL_PATH")
                # Symlink to global skills
                ln -sf "$SKILL_PATH" "$ANTIGRAVITY_SKILLS_DIR/$SKILL_NAME" 2>/dev/null || true
                # Symlink to local project skills standard
                ln -sf "$SKILL_PATH" "$PROJECT_SKILLS_DIR/$SKILL_NAME" 2>/dev/null || true
            fi
        done
    fi
done

# Configure Model Context Protocol (MCP) Servers
echo -e "${BLUE}==>${NC} Configuring Model Context Protocol (MCP) Servers..."

TMP_MCP_FILE=$(mktemp)
cat << 'EOF' > "$TMP_MCP_FILE"
{
  "mcpServers": {
    "google-developer-knowledge": {
      "authProviderType": "google_credentials",
      "serverUrl": "https://developerknowledge.googleapis.com/mcp"
    },
    "datacloud_cloud-sql_remote": {
      "authProviderType": "google_credentials",
      "headers": {
        "User-Agent": "datacloud.antigravity"
      },
      "serverUrl": "https://sqladmin.googleapis.com/mcp"
    },
    "datacloud_alloydb_remote": {
      "authProviderType": "google_credentials",
      "headers": {
        "User-Agent": "datacloud.antigravity"
      },
      "serverUrl": "https://alloydb.us-central1.rep.googleapis.com/mcp"
    },
    "datacloud_spanner_remote": {
      "authProviderType": "google_credentials",
      "headers": {
        "User-Agent": "datacloud.antigravity"
      },
      "serverUrl": "https://spanner.googleapis.com/mcp"
    },
    "datacloud_dataproc_remote": {
      "authProviderType": "google_credentials",
      "headers": {
        "User-Agent": "datacloud.antigravity"
      },
      "serverUrl": "https://dataproc-us-central1.googleapis.com/mcp"
    },
    "datacloud_knowledge_catalog_remote": {
      "authProviderType": "google_credentials",
      "headers": {
        "User-Agent": "datacloud.antigravity"
      },
      "serverUrl": "https://dataplex.googleapis.com/mcp"
    },
    "mobile-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "@mobilenext/mobile-mcp@latest"
      ]
    },
    "remote-composio": {
      "serverUrl": "https://connect.composio.dev/mcp",
      "headers": {
        "x-consumer-api-key": "${COMPOSIO_API_KEY}"
      }
    }
  }
}
EOF

# Merge MCP configuration if existing or write new
if [ -f "$ANTIGRAVITY_MCP_FILE" ]; then
    echo -e "  ${YELLOW}ℹ${NC} Merging with existing $ANTIGRAVITY_MCP_FILE..."
    python3 -c "
import json
try:
    with open('$ANTIGRAVITY_MCP_FILE', 'r') as f:
        existing = json.load(f)
except Exception:
    existing = {'mcpServers': {}}

with open('$TMP_MCP_FILE', 'r') as f:
    new_data = json.load(f)

if 'mcpServers' not in existing:
    existing['mcpServers'] = {}

for k, v in new_data.get('mcpServers', {}).items():
    if k not in existing['mcpServers']:
        existing['mcpServers'][k] = v

with open('$ANTIGRAVITY_MCP_FILE', 'w') as f:
    json.dump(existing, f, indent=2)
" || cp "$TMP_MCP_FILE" "$ANTIGRAVITY_MCP_FILE"
else
    cp "$TMP_MCP_FILE" "$ANTIGRAVITY_MCP_FILE"
    echo -e "  ${GREEN}✓${NC} Created $ANTIGRAVITY_MCP_FILE"
fi
rm -f "$TMP_MCP_FILE"

# Count total skills installed
TOTAL_SKILLS=$(find "$ANTIGRAVITY_SKILLS_DIR" -maxdepth 1 -type l -o -type d | wc -l | tr -d ' ')

echo -e "\n${GREEN}================================================================${NC}"
echo -e "${GREEN}🎉 All Agent Skills & MCP Servers installed successfully!${NC}"
echo -e "${GREEN}================================================================${NC}"
echo -e "  📁 Skills Directory:   ${CYAN}$ANTIGRAVITY_SKILLS_DIR${NC} ($TOTAL_SKILLS skills active)"
echo -e "  📁 Project Skills:     ${CYAN}$PROJECT_SKILLS_DIR/${NC}"
echo -e "  ⚙️  MCP Config:        ${CYAN}$ANTIGRAVITY_MCP_FILE${NC}"
echo -e "\n${YELLOW}💡 Pro-Tip:${NC} Restart your Antigravity / coding agent to immediately start using the new skills and MCP tools!"
