import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker_app/router/app_router.dart';
import 'package:budget_tracker_app/theme/app_colors.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const selectedColor = AppColors.primary100;
    const unselectedColor = AppColors.disabled;
    return AutoTabsScaffold(
      routes: const [
        HomeNestedRouterRoute(),
        TransactionsListNestedRouterRoute(),
        AnalyticNestedRouterRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Material(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withOpacity(0.16),
                  blurRadius: 2,
                  offset: const Offset(0, -3), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: tabsRouter.activeIndex,
                selectedItemColor: AppColors.primary100,
                selectedLabelStyle: AppTextTheme.small,
                unselectedLabelStyle: AppTextTheme.smallDisabled,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  if (tabsRouter.activeIndex == index) {
                    final currentRouter = tabsRouter.stackRouterOfIndex(index);
                    if (currentRouter?.canPop() ?? false) {
                      currentRouter?.popUntilRoot();
                    }
                  } else {
                    tabsRouter.setActiveIndex(index);
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.other_houses_rounded,
                      color: selectedColor,
                    ),
                    icon: Icon(
                      Icons.other_houses_rounded,
                      color: unselectedColor,
                    ),
                    label: 'Главная',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.compare_arrows_rounded,
                      color: selectedColor,
                    ),
                    icon: Icon(
                      Icons.compare_arrows_rounded,
                      color: unselectedColor,
                    ),
                    label: 'Транзакции',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons. multiline_chart,
                      color: selectedColor,
                    ),
                    icon: Icon(
                      Icons.multiline_chart,
                      color: unselectedColor,
                    ),
                    label: 'Аналитика',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
