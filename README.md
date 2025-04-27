# DartMCP

A Dart implementation of the Model Context Protocol (MCP) for AI agent interactions.

## Overview

DartMCP is a Model Context Protocol (MCP) implementation in Dart, providing both server and client components for building interoperable AI/LLM tools and services.

### Requirements

- Dart SDK 3.7.2 or later
- Works on any platform supported by Dart (macOS, Linux, Windows)

### Project Structure

The project is organized into two main components:

- `lib/src/server.dart`: The server implementation
- `lib/src/client.dart`: The client implementation

### Dependencies

- [MCP Dart SDK](https://pub.dev/packages/dart_mcp)

### Installation

1. Add DartMCP to your project:

```yaml
dependencies:
  dart_mcp: ^0.1.0
```

2. Install dependencies:

```bash
dart pub get
```

## Server

The DartMCP server component provides a Model Context Protocol server implementation in Dart. It enables AI agents and tools to interact with Dart applications using the standard MCP protocol.

### Features

- Built with Dart 3.7.2+
- Implements MCP protocol over standard I/O or custom channels
- Includes support for logging, prompts, resources, and tools
- Cross-platform support

### Getting Started

1. Implement your server logic using `Server` from `lib/src/server.dart`.
2. Run your server as a Dart application:

```bash
dart run path/to/your_server.dart
```

### Server Component Details

The server component is responsible for:

- Handling incoming MCP connections
- Managing model context and state
- Processing client requests
- Maintaining state synchronization

Location: `lib/src/server.dart`

## Client

The DartMCP client component allows Dart applications to connect to and interact with MCP-compatible AI agents and servers.

### Features

- Built with Dart 3.7.2+
- Implements MCP client over standard I/O or custom channels
- Simple API for initializing and communicating with MCP servers
- Streams for server notifications (tools, resources, logs, etc.)

### Getting Started

1. Use the `Client` class from `lib/src/client.dart` in your Dart application.
2. Example usage:

```dart
import 'package:dartmcp/dartmcp.dart';

void main() {
  var client = Client();
  client.main();
}
```

### Client Component Details

The client component provides:

- Connection management to MCP servers
- Model context synchronization
- Real-time updates handling
- Client-side state management

Location: `lib/src/client.dart`

## Example

See [`example/dartmcp_example.dart`](example/dartmcp_example.dart) for a minimal usage example.
