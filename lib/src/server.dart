import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:async/async.dart';
import 'package:dart_mcp/server.dart';
import 'package:stream_channel/stream_channel.dart';

void main() {
  DartMCPServer(
    channel: StreamChannel.withCloseGuarantee(io.stdin, io.stdout)
        .transform(StreamChannelTransformer.fromCodec(utf8))
        .transformStream(const LineSplitter())
        .transformSink(
          StreamSinkTransformer.fromHandlers(
            handleData: (data, sink) {
              sink.add('$data\n');
            },
          ),
        ),
  );
}

base class DartMCPServer extends MCPServer with ToolsSupport {
  DartMCPServer({required super.channel})
    : super.fromStreamChannel(
        implementation: ServerImplementation(
          name: 'DartMCPServer',
          version: '0.1.0',
        ),
        instructions: 'A basic tool that can respond with "greet!"',
      );

  @override
  FutureOr<InitializeResult> initialize(InitializeRequest request) {
    registerTool(
      Tool(name: 'greet', inputSchema: ObjectSchema()),
      (_) => CallToolResult(content: [TextContent(text: 'greet!')]),
    );
    return super.initialize(request);
  }
}
