import 'package:app/di/service.dart';
import 'package:app/features/domain/repository/tokens_repository.dart';
import 'package:app/features/presentation/bloc/theme/theme_cubit.dart';
import 'package:app/features/presentation/widget/base_container.dart';
import 'package:app/features/presentation/widget/settings_button_card.dart';
import 'package:app/features/presentation/widget/settings_switch_card.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Text(
              'Настройки',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsSwitchCard(
              title: 'Темная тема',
              value: isDark,
              onChanged: (value) {
                context.read<ThemeCubit>().setThemeBrightness(
                      value ? Brightness.dark : Brightness.light,
                    );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: SettingsButtonCard(
              title: 'Выход',
              value: isDark,
              onPressed: () async {
                TokensRepository tokensRepository = service<TokensRepository>();
                tokensRepository.logOut();
                context.router.push(const SplashRoute());
              }, 
              cardChild: Text(
                "Выход",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseConatiner(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
