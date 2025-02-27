import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cbc_collector/utils/number_formatter.dart';
import 'package:cbc_collector/features/main/screens/today_collections_screen.dart';
import 'package:cbc_collector/features/main/screens/weight_stats_screen.dart';
import 'package:cbc_collector/features/main/screens/active_requests_screen.dart';
import 'package:cbc_collector/features/main/screens/rating_details_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // Format current date
    final now = DateTime.now();
    final dateFormatter = DateFormat.yMMMMd(
      Localizations.localeOf(context).languageCode,
    );
    final formattedDate = dateFormatter.format(now);

    return Container(
      color: theme.colorScheme.background,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.welcomeBackUser,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            formattedDate,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurface.withOpacity(
                                0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Container(
                      //   padding: const EdgeInsets.all(12),
                      //   decoration: BoxDecoration(
                      //     color: theme.colorScheme.primary.withOpacity(0.1),
                      //     shape: BoxShape.circle,
                      //   ),
                      //   child: Icon(
                      //     Icons.notifications_none,
                      //     color: theme.colorScheme.primary,
                      //     size: 24,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  //   decoration: BoxDecoration(
                  //     color: theme.colorScheme.primary.withOpacity(0.1),
                  //     borderRadius: BorderRadius.circular(16),
                  //   ),
                  //   // child: Row(
                  //   //   children: [
                  //   //     Icon(
                  //   //       Icons.location_on_outlined,
                  //   //       color: theme.colorScheme.primary,
                  //   //       size: 20,
                  //   //     ),
                  //   //     // const SizedBox(width: 8),
                  //   //     // Expanded(
                  //   //     //   child: Text(
                  //   //     //     'Current Area: Sector G-8, Islamabad',
                  //   //     //     style: theme.textTheme.bodyMedium?.copyWith(
                  //   //     //       color: theme.colorScheme.primary,
                  //   //     //     ),
                  //   //     //   ),
                  //   //     // ),
                  //   //     // Icon(
                  //   //     //   Icons.chevron_right,
                  //   //     //   color: theme.colorScheme.primary,
                  //   //     //   size: 20,
                  //   //     // ),
                  //   //   ],
                  //   // ),
                  // ),
                ],
              ),
            ),
            // Stats Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      l10n.statistics,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildStatCard(
                        context,
                        title: l10n.todayCollections,
                        value: NumberFormatter.toLocalizedNumber(l10n, '12'),
                        icon: Icons.today,
                        gradientColors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withOpacity(0.7),
                        ],
                      ),
                      _buildStatCard(
                        context,
                        title: l10n.totalWeight,
                        value: NumberFormatter.toLocalizedNumberWithUnit(
                          l10n,
                          '250',
                          'kg',
                        ),
                        icon: Icons.scale,
                        gradientColors: [
                          theme.colorScheme.secondary,
                          theme.colorScheme.secondary.withOpacity(0.7),
                        ],
                      ),
                      _buildStatCard(
                        context,
                        title: l10n.activeRequests,
                        value: NumberFormatter.toLocalizedNumber(l10n, '5'),
                        icon: Icons.pending_actions,
                        gradientColors: [
                          theme.colorScheme.tertiary,
                          theme.colorScheme.tertiary.withOpacity(0.7),
                        ],
                      ),
                      _buildStatCard(
                        context,
                        title: l10n.rating,
                        value: '4.8 ★',
                        icon: Icons.star,
                        gradientColors: [
                          const Color(0xFFFFA000),
                          const Color(0xFFFFB74D),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Recent Activity Section
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 16.0),
            //         child: Text(
            //           l10n.collections,
            //           style: theme.textTheme.titleLarge?.copyWith(
            //             fontWeight: FontWeight.bold,
            //             color: theme.colorScheme.primary,
            //           ),
            //         ),
            //       ),
            //       ListView.builder(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: 3,
            //         itemBuilder: (context, index) {
            //           return Card(
            //             margin: const EdgeInsets.only(bottom: 12),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //             child: ListTile(
            //               contentPadding: const EdgeInsets.all(16),
            //               leading: Container(
            //                 width: 48,
            //                 height: 48,
            //                 decoration: BoxDecoration(
            //                   color: theme.colorScheme.primary.withOpacity(0.1),
            //                   borderRadius: BorderRadius.circular(12),
            //                 ),
            //                 child: Icon(
            //                   Icons.recycling,
            //                   color: theme.colorScheme.primary,
            //                 ),
            //               ),
            //               title: Text(
            //                 'Collection #${index + 1}',
            //                 style: theme.textTheme.titleMedium?.copyWith(
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               subtitle: Text(
            //                 '2 hours ago • Location ${index + 1}',
            //                 style: theme.textTheme.bodyMedium?.copyWith(
            //                   color: theme.colorScheme.onSurface.withOpacity(0.6),
            //                 ),
            //               ),
            //               trailing: Container(
            //                 padding: const EdgeInsets.symmetric(
            //                   horizontal: 12,
            //                   vertical: 6,
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: theme.colorScheme.primary.withOpacity(0.1),
            //                   borderRadius: BorderRadius.circular(30),
            //                 ),
            //                 child: Text(
            //                   '25 kg',
            //                   style: theme.textTheme.bodySmall?.copyWith(
            //                     color: theme.colorScheme.primary,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradientColors,
  }) {
    // Determine which screen to navigate to based on the title
    void onTap() {
      final l10n = AppLocalizations.of(context)!;

      if (title == l10n.todayCollections) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TodayCollectionsScreen(),
          ),
        );
      } else if (title == l10n.totalWeight) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WeightStatsScreen()),
        );
      } else if (title == l10n.activeRequests) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ActiveRequestsScreen()),
        );
      } else if (title == l10n.rating) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RatingDetailsScreen()),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
                const Spacer(),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
