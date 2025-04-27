import 'package:dart_mcp/client.dart';

class Client {
  void main() async {
    final client = MCPClient(
      ClientImplementation(name: 'DartMCPClient', version: '0.1.0'),
    );

    print('Connecting to server...');
    final server = await client.connectStdioServer('dart', [
      'run',
      'lib/src/server.dart',
    ]);
    print('Server started');

    print('Initializing server...');
    final initializeResult = await server.initialize(
      InitializeRequest(
        protocolVersion: '2024-11-05',
        capabilities: client.capabilities,
        clientInfo: client.implementation,
      ),
    );

    print('Initialized: $initializeResult');
    if (initializeResult.protocolVersion != '2024-11-05') {
      throw StateError(
        'Protocol version mismatch, expected ${'2024-11-05'}, '
        'got ${initializeResult.protocolVersion}',
      );
    }

    if (initializeResult.capabilities.tools == null) {
      await server.shutdown();
      throw StateError('Server doesn\'t support tools!');
    }

    server.notifyInitialized(InitializedNotification());
    print('Sent initialized notification');

    print('Listing tools from server');
    final toolsResult = await server.listTools(ListToolsRequest());
    for (final tool in toolsResult.tools) {
      print('Found Tool: ${tool.name}');

      if (tool.name == 'greet') {
        print('Calling `greet` tool');
        final result = await server.callTool(CallToolRequest(name: 'greet'));
        if (result.isError == true) {
          throw StateError('Tool call failed: ${result.content}');
        } else {
          print('Tool call succeeded: ${result.content}');
        }
      }
    }

    await client.shutdown();
  }
}
