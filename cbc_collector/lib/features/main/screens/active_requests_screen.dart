import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActiveRequestsScreen extends StatelessWidget {
  const ActiveRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Simulated data for active requests
    final List<Map<String, String>> activeRequests = [
      {
        'id': '#1234',
        'location': 'Location 1',
        'time': '10:30 AM',
        'date': '2024-03-20',
        'type': 'Plastic',
        'status': 'Pending',
        'estimatedWeight': '20 kg',
      },
      {
        'id': '#1235',
        'location': 'Location 2',
        'time': '02:00 PM',
        'date': '2024-03-20',
        'type': 'Paper',
        'status': 'Accepted',
        'estimatedWeight': '15 kg',
      },
      {
        'id': '#1236',
        'location': 'Location 3',
        'time': '11:45 AM',
        'date': '2024-03-21',
        'type': 'Metal',
        'status': 'En Route',
        'estimatedWeight': '30 kg',
      },
      {
        'id': '#1237',
        'location': 'Location 4',
        'time': '03:30 PM',
        'date': '2024-03-21',
        'type': 'Glass',
        'status': 'Pending',
        'estimatedWeight': '25 kg',
      },
      {
        'id': '#1238',
        'location': 'Location 5',
        'time': '09:15 AM',
        'date': '2024-03-22',
        'type': 'Plastic',
        'status': 'Accepted',
        'estimatedWeight': '18 kg',
      },
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          l10n.activeRequests,
          style: TextStyle(color: theme.colorScheme.onBackground),
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onBackground),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Summary Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.tertiary,
                    theme.colorScheme.tertiary.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.tertiary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryItem(
                    context,
                    title: 'Total Requests',
                    value: '5',
                    icon: Icons.list_alt,
                  ),
                  _buildSummaryItem(
                    context,
                    title: 'Pending',
                    value: '2',
                    icon: Icons.pending_actions,
                  ),
                  _buildSummaryItem(
                    context,
                    title: 'En Route',
                    value: '1',
                    icon: Icons.local_shipping,
                  ),
                ],
              ),
            ),
            // Requests List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: activeRequests.length,
                itemBuilder: (context, index) {
                  final request = activeRequests[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      onTap: () {
                        // TODO: Navigate to request details
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Request ${request['id']}',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                _buildStatusChip(context, request['status']!),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildInfoRow(
                                        context,
                                        Icons.location_on_outlined,
                                        request['location']!,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildInfoRow(
                                        context,
                                        Icons.access_time,
                                        '${request['time']} - ${request['date']}',
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getTypeColor(
                                          request['type']!,
                                        ).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        request['type']!,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: _getTypeColor(
                                                request['type']!,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: theme.colorScheme.primary
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        request['estimatedWeight']!,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context, String status) {
    final theme = Theme.of(context);

    Color getStatusColor() {
      switch (status) {
        case 'Pending':
          return Colors.orange;
        case 'Accepted':
          return Colors.blue;
        case 'En Route':
          return Colors.green;
        default:
          return Colors.grey;
      }
    }

    IconData getStatusIcon() {
      switch (status) {
        case 'Pending':
          return Icons.pending;
        case 'Accepted':
          return Icons.check_circle;
        case 'En Route':
          return Icons.local_shipping;
        default:
          return Icons.help;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(getStatusIcon(), size: 16, color: getStatusColor()),
          const SizedBox(width: 4),
          Text(
            status,
            style: theme.textTheme.bodySmall?.copyWith(
              color: getStatusColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
      ],
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Plastic':
        return Colors.blue;
      case 'Paper':
        return Colors.brown;
      case 'Metal':
        return Colors.grey;
      case 'Glass':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }
}
