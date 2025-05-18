# Windows PowerShell setup script

# Create .cursor directory if it doesn't exist
if (-not (Test-Path -Path ".cursor")) {
    New-Item -Path ".cursor" -ItemType Directory
}

# Install dependencies using npm instead of bun (alternatively use bun if available on Windows)
npm install

# Create mcp.json with the current directory path
$mcpJson = @"
{
  "mcpServers": {
    "TalkToFigma": {
      "command": "npx",
      "args": [
        "cursor-talk-to-figma-mcp@latest"
      ]
    }
  }
}
"@

$mcpJson | Out-File -FilePath ".cursor\mcp.json" -Encoding utf8 