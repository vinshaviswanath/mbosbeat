import 'package:flutter/material.dart';
import 'package:mpos_beat/core/network/network_provider.dart';
import 'package:mpos_beat/core/utils/imports.dart';
import 'package:provider/provider.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final network = context.read<NetworkProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80),
            const SizedBox(height: 16),
            const Text("No Internet Connection"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: network.retryConnection,
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
