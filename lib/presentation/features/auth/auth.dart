import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/auth/auth.dart';

@RoutePage()
class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenController = useTextEditingController();
    final authAsync = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    final isLoading = authAsync.isLoading;
    final isAuthenticated = authAsync.value == AuthStatus.authenticated;

    // Реактивно ловим изменение статуса авторизации
    ref.listen<AsyncValue<AuthStatus>>(authProvider, (prev, next) {
      final status = next.value;
      if (status == AuthStatus.authenticated && context.mounted) {
        context.router.replaceAll([const HomeRoute()]);
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              if (!isAuthenticated)
                TextField(
                  controller: tokenController,
                  // enabled: !isLoading,
                  decoration: InputDecoration(
                    hintText: "Введите токен",
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: FilledButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (isAuthenticated) {
                            await authNotifier.logout();
                            if (context.mounted) {
                              context.router.replaceAll([const AuthRoute()]);
                            }
                          } else {
                            final token = tokenController.text.trim();
                            if (token.isNotEmpty) {
                              await authNotifier.login(token);
                              // redirect произойдет через ref.listen
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Введите токен')),
                              );
                            }
                          }
                        },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(isAuthenticated ? "Выйти" : "Войти"),
                ),
              ),
              if (authAsync.hasError)
                Text(
                  authAsync.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
