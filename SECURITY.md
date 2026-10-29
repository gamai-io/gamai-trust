# Security

- `proofgate` and `agent-immunity` are local, deterministic checks. They are not an authorization boundary; pair them with real permission checks.
- The antibody database (`~/.gamai/trust.db` by default) may contain blocked prompt text. Treat it as sensitive and do not commit it.
- `crossnode-bench` runs commands on configured nodes. Run it only against machines you own or are authorized to test.
- The MCP server speaks plain JSON-RPC on stdio. Do not expose it on a network socket without authentication.
- No secrets are read or logged by the library.
