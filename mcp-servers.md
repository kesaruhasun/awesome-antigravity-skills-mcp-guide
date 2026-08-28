# 🔌 Model Context Protocol (MCP) Servers Architecture & Configuration

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io/) provides an open standard for LLMs and coding agents to safely access databases, developer tools, mobile emulators, and SaaS platforms.

---

## 📑 Configured MCP Servers Inventory

| Server Name | Protocol Type | Primary Function | Source / Endpoint |
| :--- | :--- | :--- | :--- |
| **`google-developer-knowledge`** | Remote (HTTPS/SSE) | Live Google Cloud & Android API documentation | `https://developerknowledge.googleapis.com/mcp` |
| **`datacloud_alloydb_remote`** | Remote (HTTPS/SSE) | Google Cloud AlloyDB PostgreSQL administration & SQL | `https://alloydb.us-central1.rep.googleapis.com/mcp` |
| **`datacloud_cloud-sql_remote`** | Remote (HTTPS/SSE) | Cloud SQL (PostgreSQL, MySQL, SQL Server) ops & queries | `https://sqladmin.googleapis.com/mcp` |
| **`datacloud_spanner_remote`** | Remote (HTTPS/SSE) | Cloud Spanner global database DDL & transactional SQL | `https://spanner.googleapis.com/mcp` |
| **`datacloud_dataproc_remote`** | Remote (HTTPS/SSE) | Spark cluster lifecycle, batch jobs, and sessions | `https://dataproc-us-central1.googleapis.com/mcp` |
| **`datacloud_knowledge_catalog_remote`** | Remote (HTTPS/SSE) | Dataplex enterprise data catalog & schema search | `https://dataplex.googleapis.com/mcp` |
| **`mobile-mcp`** | Local (NPX / Stdio) | Real device & emulator UI automation & crash logs | `@mobilenext/mobile-mcp` |
| **`remote-composio`** | Remote (HTTPS/SSE) | 100+ SaaS connectors (Canva, GitHub, Slack, Gmail) | `https://connect.composio.dev/mcp` |
| **`whatsapp`** | Local Bridge (Python / UV) | Real-time WhatsApp messaging, media, and chat ops | Local Python Server + WhatsApp Bridge |

---

## 🛠️ Detailed Server Breakdown & Capabilities

### 1. `google-developer-knowledge`
Provides verified, real-time documentation directly from Google's engineering portal.
* **Tools Available:**
  - `search_documents`: Search across official GCP, Firebase, and Android documentation.
  - `answer_query`: Grounded technical answers backed by documentation citations.
  - `get_documents`: Retrieve complete documentation pages.

### 2. Google Cloud Database MCP Suite (`alloydb`, `cloud-sql`, `spanner`)
Allows coding agents to inspect schemas, execute migrations, optimize queries, and manage instances directly without leaving the editor.
* **Key Tools:**
  - `execute_sql` / `execute_sql_readonly`: Run parameterized SQL queries.
  - `list_instances` / `get_instance` / `create_instance`: Cloud resource lifecycle.
  - `create_backup` / `restore_backup`: Automated database snapshot operations.
  - `get_database_ddl` / `update_database_schema`: Manage Spanner and AlloyDB DDL.

### 3. `mobile-mcp` (Mobile Device Automation)
Automates mobile app testing on local Android emulators, iOS simulators, or remote device farms.
* **Package:** `@mobilenext/mobile-mcp`
* **Key Tools:**
  - `mobile_list_elements_on_screen`: Dumps the visual accessibility/UI tree of the current screen.
  - `mobile_click_on_screen_at_coordinates`: Precision tap execution.
  - `mobile_swipe_on_screen`: Multi-directional touch gestures.
  - `mobile_take_screenshot`: Captures high-res screen captures for agent visual evaluation.
  - `mobile_list_crashes` / `mobile_get_crash`: Retrieves real-time application crash traces.

### 4. `remote-composio` (SaaS & Tool Ecosystem)
Connects coding agents to over 100 enterprise and consumer SaaS tools.
* **Endpoint:** `https://connect.composio.dev/mcp`
* **Integrations Supported:** Canva, GitHub, Linear, Jira, Slack, Discord, Notion, Google Drive, Gmail, Stripe, Airtable, HubSpot, and Salesforce.

### 5. `whatsapp` (WhatsApp Automation MCP)
Enables secure, agentic messaging and notifications via a localized WhatsApp bridge.
* **Capabilities:** Sending chat messages, sending media attachments (images, PDFs), monitoring incoming chats, adding reactions, downloading received media.

---

## ⚙️ Complete `mcp_config.json` Template

Place this configuration in `~/.gemini/config/mcp_config.json` (or your agent's MCP settings file):

```json
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
        "x-consumer-api-key": "YOUR_COMPOSIO_API_KEY"
      }
    },
    "whatsapp": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "/path/to/whatsapp-mcp-server",
        "python",
        "main.py"
      ],
      "env": {
        "API_KEY": "YOUR_SECURE_BRIDGE_API_KEY",
        "BRIDGE_HOST": "127.0.0.1:8180",
        "WA_STORE_PATH": "/path/to/whatsapp-store"
      }
    }
  }
}
```

---

## 🔒 Security & Best Practices

1. **Authentication:** Remote Google Cloud MCP servers authenticate automatically using Google Application Default Credentials (`gcloud auth application-default login`).
2. **Environment Variables:** Never commit API keys or auth tokens to public Git repositories. Use environment variable interpolation or safe local config files.
3. **Sandbox Restrictions:** Restrict high-privilege MCP execution (such as `execute_sql` with write access) to staging and development database instances.
