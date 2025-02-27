import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  String _selectedFilter = 'All';

  List<Map<String, dynamic>> _getFilteredCollections() {
    // Simulated collection data with fixed status assignments
    final List<Map<String, dynamic>> allCollections = [
      {
        'id': 1,
        'status': 'Ongoing',
        'location': 'Location 1',
        'date': DateTime.now().toString().split(' ')[0],
        'weight': '25 kg',
        'type': 'Plastic',
      },
      {
        'id': 2,
        'status': 'Completed',
        'location': 'Location 2',
        'date': DateTime.now().toString().split(' ')[0],
        'weight': '30 kg',
        'type': 'Paper',
      },
      {
        'id': 3,
        'status': 'Ongoing',
        'location': 'Location 3',
        'date': DateTime.now().toString().split(' ')[0],
        'weight': '15 kg',
        'type': 'Metal',
      },
      {
        'id': 4,
        'status': 'Completed',
        'location': 'Location 4',
        'date': DateTime.now().toString().split(' ')[0],
        'weight': '40 kg',
        'type': 'Glass',
      },
      {
        'id': 5,
        'status': 'Ongoing',
        'location': 'Location 5',
        'date': DateTime.now().toString().split(' ')[0],
        'weight': '20 kg',
        'type': 'Plastic',
      },
    ];

    if (_selectedFilter == 'All') return allCollections;
    return allCollections.where((collection) => collection['status'] == _selectedFilter).toList();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    
    return Container(
      color: theme.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header and Filter Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.collections,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('All', l10n.all),
                      const SizedBox(width: 8),
                      _buildFilterChip('Ongoing', l10n.ongoing),
                      const SizedBox(width: 8),
                      _buildFilterChip('Completed', l10n.completed),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Collections List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _getFilteredCollections().length,
              itemBuilder: (context, index) {
                final collection = _getFilteredCollections()[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Material(
                    elevation: 2,
                    shadowColor: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    color: theme.cardColor,
                    child: InkWell(
                      onTap: () {
                        // TODO: Navigate to collection details
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: collection['status'] == 'Ongoing'
                                        ? theme.colorScheme.primary.withOpacity(0.1)
                                        : theme.colorScheme.secondary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        collection['status'] == 'Ongoing'
                                            ? Icons.timelapse
                                            : Icons.check_circle,
                                        size: 16,
                                        color: collection['status'] == 'Ongoing'
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.secondary,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        collection['status'] == 'Ongoing' ? l10n.ongoing : l10n.completed,
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: collection['status'] == 'Ongoing'
                                              ? theme.colorScheme.primary
                                              : theme.colorScheme.secondary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getTypeColor(collection['type']).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    collection['type'],
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: _getTypeColor(collection['type']),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 18,
                                            color: theme.colorScheme.primary,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            collection['location'],
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 18,
                                            color: theme.colorScheme.primary,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            collection['date'],
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.scale,
                                        size: 16,
                                        color: theme.colorScheme.primary,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        collection['weight'],
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value, String label) {
    final theme = Theme.of(context);
    final isSelected = _selectedFilter == value;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() => _selectedFilter = value);
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
            border: Border.all(
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primary.withOpacity(0.3),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? Colors.white : theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}