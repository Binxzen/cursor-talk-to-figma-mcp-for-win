# Cursor Talk to Figma MCP

This project implements a Model Context Protocol (MCP) integration between Cursor AI and Figma, allowing Cursor to communicate with Figma for reading designs and modifying them programmatically.

https://github.com/user-attachments/assets/129a14d2-ed73-470f-9a4c-2240b2a4885c

## Project Structure

- `src/talk_to_figma_mcp/` - TypeScript MCP server for Figma integration
- `src/cursor_mcp_plugin/` - Figma plugin for communicating with Cursor
- `src/socket.ts` - WebSocket server that facilitates communication between the MCP server and Figma plugin

## Complete Beginner's Guide

If you're completely new to programming or don't have any development tools installed on your computer yet, follow these steps to get started:

### Prerequisites

Before you begin, you need to install these essential tools:

1. **Install Cursor** - Download and install Cursor AI from [https://cursor.sh/](https://cursor.sh/)

2. **Install Node.js and npm** - This is required for running JavaScript code
   - Download from [https://nodejs.org/](https://nodejs.org/) (install the LTS version)
   - The installer will install both Node.js and npm (Node Package Manager)
   - After installation, verify it's working by opening Command Prompt (Windows) or Terminal (Mac) and typing:
     ```
     node --version
     npm --version
     ```

3. **For Windows users only**: You'll need Git installed
   - Download from [https://git-scm.com/download/win](https://git-scm.com/download/win)
   - Use default installation options

### Download and Setup

1. **Download this project**:
   - Click the green "Code" button on GitHub and select "Download ZIP"
   - Extract the ZIP file to a folder on your computer

2. **Open Command Prompt or Terminal**:
   - Navigate to the extracted project folder
   - For Windows, use `cd` command, for example:
     ```
     cd C:\Users\YourUsername\Downloads\cursor-talk-to-figma-mcp
     ```

3. **Install dependencies**:
   ```
   npm install
   ```

### Windows Setup

1. Run the setup script:
   ```
   npm run setup:win
   ```

2. Start the WebSocket server (keep this terminal window open):
   ```
   npm run socket:win
   ```

3. Open a new Command Prompt and run the MCP server (keep this terminal window open too):
   ```
   npx cursor-talk-to-figma-mcp
   ```

### macOS Setup

1. Install Bun if you haven't already:
   ```bash
   curl -fsSL https://bun.sh/install | bash
   ```

2. Run setup:
   ```bash
   bun setup
   ```

3. Start the Websocket server:
   ```bash
   bun socket
   ```

4. Start the MCP server:
   ```bash
   bunx cursor-talk-to-figma-mcp
   ```

### Figma Plugin Setup

To connect Cursor with Figma, you need to install the Figma plugin:

1. **Recommended:** Install from [Figma Community Page](https://www.figma.com/community/plugin/1485687494525374295/cursor-talk-to-figma-mcp-plugin)

2. **For Development:** Install locally
   - In Figma, go to Plugins > Development > New Plugin
   - Choose "Link existing plugin"
   - Select the `src/cursor_mcp_plugin/manifest.json` file

### Connecting Cursor to Figma

1. In Figma, open the Cursor Talk to Figma plugin
2. Note the generated channel ID (a random string like "abc123")
3. In Cursor, type and run:
   ```
   join_channel("your-channel-id")
   ```
   Replace "your-channel-id" with the actual channel ID from step 2
4. Now you can use all the Talk to Figma commands from Cursor

### Troubleshooting

- **"Command not found" errors**: Make sure you've installed Node.js correctly and are in the right folder
- **Connection issues**: Ensure both the WebSocket server and MCP server are running
- **Plugin not appearing**: Restart Figma after installing the plugin
- **Channel connection failing**: Double-check the channel ID for typos

## Get Started

### macOS / Linux

1. Install Bun if you haven't already:

```bash
curl -fsSL https://bun.sh/install | bash
```

2. Run setup, this will also install MCP in your Cursor's active project:

```bash
bun setup
```

3. Start the Websocket server:

```bash
bun socket
```

4. Start the MCP server:

```bash
bunx cursor-talk-to-figma-mcp
```

### Windows

#### Using PowerShell (Native Windows)

1. Run the setup script:

```powershell
npm run setup:win
```

2. Start the WebSocket server:

```powershell
npm run socket:win
```

3. Run the MCP server:

```powershell
npx cursor-talk-to-figma-mcp
```

#### Using WSL

1. Install Bun via PowerShell:

```powershell
powershell -c "irm bun.sh/install.ps1|iex"
```

2. Enable external connections by modifying `src/socket.ts` and uncommenting:

```typescript
// uncomment this to allow connections in windows wsl
hostname: "0.0.0.0",
```

3. Start the Websocket server:

```bash
bun socket
```

4. Run the MCP server:

```bash
bunx cursor-talk-to-figma-mcp
```

### Figma Plugin Setup

To connect Cursor with Figma, you need to install the Figma plugin. Choose one of these options:

1. **Recommended:** Install from [Figma Community Page](https://www.figma.com/community/plugin/1485687494525374295/cursor-talk-to-figma-mcp-plugin)

2. **For Development:** Install locally
   - In Figma, go to Plugins > Development > New Plugin
   - Choose "Link existing plugin"
   - Select the `src/cursor_mcp_plugin/manifest.json` file

### Connecting Cursor to Figma

1. In Figma, open the Cursor Talk to Figma plugin
2. Note the generated channel ID
3. In Cursor, use the `join_channel` command with your channel ID:
```
join_channel("your-channel-id")
```
4. Now you can use all the Talk to Figma MCP commands from Cursor

## Quick Video Tutorial

[Video Link](https://www.linkedin.com/posts/sonnylazuardi_just-wanted-to-share-my-latest-experiment-activity-7307821553654657024-yrh8)

## Design Automation Example

**Bulk text content replacement**

Thanks to [@dusskapark](https://github.com/dusskapark) for contributing the bulk text replacement feature. Here is the [demo video](https://www.youtube.com/watch?v=j05gGT3xfCs).

**Instance Override Propagation**
Another contribution from [@dusskapark](https://github.com/dusskapark)
Propagate component instance overrides from a source instance to multiple target instances with a single command. This feature dramatically reduces repetitive design work when working with component instances that need similar customizations. Check out our [demo video](https://youtu.be/uvuT8LByroI).

## Manual Setup and Installation

### MCP Server: Integration with Cursor

Add the server to your Cursor MCP configuration in `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "TalkToFigma": {
      "command": "bunx",
      "args": ["cursor-talk-to-figma-mcp@latest"]
    }
  }
}
```

### WebSocket Server

Start the WebSocket server:

```bash
bun socket
```

### Figma Plugin

1. In Figma, go to Plugins > Development > New Plugin
2. Choose "Link existing plugin"
3. Select the `src/cursor_mcp_plugin/manifest.json` file
4. The plugin should now be available in your Figma development plugins

## Usage

1. Start the WebSocket server
2. Install the MCP server in Cursor
3. Open Figma and run the Cursor MCP Plugin
4. Connect the plugin to the WebSocket server by joining a channel using `join_channel`
5. Use Cursor to communicate with Figma using the MCP tools

## MCP Tools

The MCP server provides the following tools for interacting with Figma:

### Document & Selection

- `get_document_info` - Get information about the current Figma document
- `get_selection` - Get information about the current selection
- `read_my_design` - Get detailed node information about the current selection without parameters
- `get_node_info` - Get detailed information about a specific node
- `get_nodes_info` - Get detailed information about multiple nodes by providing an array of node IDs

### Annotations

- `get_annotations` - Get all annotations in the current document or specific node
- `set_annotation` - Create or update an annotation with markdown support
- `set_multiple_annotations` - Batch create/update multiple annotations efficiently
- `scan_nodes_by_types` - Scan for nodes with specific types (useful for finding annotation targets)

### Prototyping & Connections

- `get_reactions` - Get all prototype reactions from nodes with visual highlight animation
- `set_default_connector` - Set a copied FigJam connector as the default connector style for creating connections (must be set before creating connections)
- `create_connections` - Create FigJam connector lines between nodes, based on prototype flows or custom mapping

### Creating Elements

- `create_rectangle` - Create a new rectangle with position, size, and optional name
- `create_frame` - Create a new frame with position, size, and optional name
- `create_text` - Create a new text node with customizable font properties

### Modifying text content

- `scan_text_nodes` - Scan text nodes with intelligent chunking for large designs
- `set_text_content` - Set the text content of a single text node
- `set_multiple_text_contents` - Batch update multiple text nodes efficiently

### Auto Layout & Spacing

- `set_layout_mode` - Set the layout mode and wrap behavior of a frame (NONE, HORIZONTAL, VERTICAL)
- `set_padding` - Set padding values for an auto-layout frame (top, right, bottom, left)
- `set_axis_align` - Set primary and counter axis alignment for auto-layout frames
- `set_layout_sizing` - Set horizontal and vertical sizing modes for auto-layout frames (FIXED, HUG, FILL)
- `set_item_spacing` - Set distance between children in an auto-layout frame

### Styling

- `set_fill_color` - Set the fill color of a node (RGBA)
- `set_stroke_color` - Set the stroke color and weight of a node
- `set_corner_radius` - Set the corner radius of a node with optional per-corner control

### Layout & Organization

- `move_node` - Move a node to a new position
- `resize_node` - Resize a node with new dimensions
- `delete_node` - Delete a node
- `delete_multiple_nodes` - Delete multiple nodes at once efficiently
- `clone_node` - Create a copy of an existing node with optional position offset

### Components & Styles

- `get_styles` - Get information about local styles
- `get_local_components` - Get information about local components
- `create_component_instance` - Create an instance of a component
- `get_instance_overrides` - Extract override properties from a selected component instance
- `set_instance_overrides` - Apply extracted overrides to target instances

### Export & Advanced

- `export_node_as_image` - Export a node as an image (PNG, JPG, SVG, or PDF) - limited support on image currently returning base64 as text

### Connection Management

- `join_channel` - Join a specific channel to communicate with Figma

### MCP Prompts

The MCP server includes several helper prompts to guide you through complex design tasks:

- `design_strategy` - Best practices for working with Figma designs
- `read_design_strategy` - Best practices for reading Figma designs
- `text_replacement_strategy` - Systematic approach for replacing text in Figma designs
- `annotation_conversion_strategy` - Strategy for converting manual annotations to Figma's native annotations
- `swap_overrides_instances` - Strategy for transferring overrides between component instances in Figma
- `reaction_to_connector_strategy` - Strategy for converting Figma prototype reactions to connector lines using the output of 'get_reactions', and guiding the use 'create_connections' in sequence

## Development

### Building the Figma Plugin

1. Navigate to the Figma plugin directory:

   ```
   cd src/cursor_mcp_plugin
   ```

2. Edit code.js and ui.html

## Best Practices

When working with the Figma MCP:

1. Always join a channel before sending commands
2. Get document overview using `get_document_info` first
3. Check current selection with `get_selection` before modifications
4. Use appropriate creation tools based on needs:
   - `create_frame` for containers
   - `create_rectangle` for basic shapes
   - `create_text` for text elements
5. Verify changes using `get_node_info`
6. Use component instances when possible for consistency
7. Handle errors appropriately as all commands can throw exceptions
8. For large designs:
   - Use chunking parameters in `scan_text_nodes`
   - Monitor progress through WebSocket updates
   - Implement appropriate error handling
9. For text operations:
   - Use batch operations when possible
   - Consider structural relationships
   - Verify changes with targeted exports
10. For converting legacy annotations:
    - Scan text nodes to identify numbered markers and descriptions
    - Use `scan_nodes_by_types` to find UI elements that annotations refer to
    - Match markers with their target elements using path, name, or proximity
    - Categorize annotations appropriately with `get_annotations`
    - Create native annotations with `set_multiple_annotations` in batches
    - Verify all annotations are properly linked to their targets
    - Delete legacy annotation nodes after successful conversion
11. Visualize prototype noodles as FigJam connectors:
    - Use `get_reactions` to extract prototype flows,
    - set a default connector with `set_default_connector`,
    - and generate connector lines with `create_connections` for clear visual flow mapping.

## License

MIT

## FAQ - 常见问题解答

### 基本问题

1. **这个项目是做什么的？**
   - 这是一个连接Cursor AI与Figma的工具，允许你通过Cursor的AI助手直接在Figma中读取和创建设计。

2. **我需要编程知识才能使用吗？**
   - 不需要深入的编程知识，但你需要能够基本操作命令行和按照指南安装软件。使用Cursor AI的设计命令不需要编程知识。

3. **免费还是付费？**
   - 此工具本身是免费开源的，但你需要有Cursor AI和Figma账户。Figma有免费版本，Cursor也有免费使用额度。

### 安装问题

4. **为什么我需要安装Node.js？**
   - Node.js是运行JavaScript代码的环境，此项目是用JavaScript/TypeScript编写的，所以需要Node.js来运行。

5. **在Windows上，如何确认我安装了必要的依赖？**
   - 打开命令提示符(CMD)，输入以下命令来检查版本：
     ```
     node --version
     npm --version
     git --version
     ```

6. **我可以在Linux上运行吗？**
   - 是的，请按照macOS的说明操作，安装Bun并运行相应命令。

### 连接问题

7. **为什么我必须同时运行WebSocket服务器和MCP服务器？**
   - WebSocket服务器负责Cursor和Figma之间的通信桥接，而MCP服务器则处理从Cursor发出的命令。两者必须同时运行才能正常工作。

8. **如果我关闭了终端窗口会怎样？**
   - 如果关闭了任何一个终端窗口(WebSocket或MCP服务器)，连接将中断，你需要重新启动服务器。

9. **每次使用都需要重新设置吗？**
   - 安装部分只需要做一次，但每次使用都需要启动WebSocket和MCP服务器。

### 使用问题

10. **在Cursor中如何使用Figma命令？**
    - 连接成功后，你可以在Cursor中使用各种Figma命令，如`get_document_info()`、`create_rectangle`等。

11. **如何批量修改Figma中的文本？**
    - 使用`scan_text_nodes`查找文本节点，然后使用`set_multiple_text_contents`进行批量更新。

12. **能否将我的Figma交互原型转为可视化连接线？**
    - 是的，使用`get_reactions`获取原型交互，然后用`create_connections`创建连接线。

### 故障排除

13. **连接到Figma失败怎么办？**
    - 确保两个服务器都在运行
    - 验证你输入的频道ID是否正确
    - 检查Figma插件是否正确安装并运行
    - 尝试重新启动Figma和服务器

14. **"Error: EADDRINUSE"错误如何解决？**
    - 这表示端口已被占用，可能是之前的服务实例仍在运行
    - 找到并关闭使用相同端口的进程，或修改代码使用不同端口

15. **Windows WSL用户需要注意什么？**
    - 需要修改`src/socket.ts`，取消注释"hostname: "0.0.0.0""行
    - 确保WSL和Windows主机之间的网络连接正常

16. **命令在Cursor中不起作用怎么办？**
    - 检查你是否已经使用`join_channel`命令连接了正确的频道
    - 确认服务器终端窗口是否显示收到命令的日志信息
    - 尝试简单命令如`get_document_info()`来测试连接

### 最佳实践

17. **如何备份我的设计自动化工作？**
    - 将你在Cursor中使用的命令序列保存为文本文件
    - 考虑使用Figma的版本历史功能

18. **如何学习更多Figma设计自动化？**
    - 阅读本文档中的"MCP Tools"和"Best Practices"部分
    - 观看文档中提供的视频教程
    - 尝试简单命令，逐步构建更复杂的自动化工作流