import 'package:flutter/material.dart';
import 'package:mobile_app/data/repositories/profile_repository.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: context.read<ProfileRepository>().profile,
          builder: (context, snapshot) {
            final profile = snapshot.data;

            if (profile == null) {
              return const Center(
                child: Text('Что-то пошло не так'),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: RefreshIndicator(
                onRefresh: context.read<ProfileRepository>().init,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: profile.firstName,
                      enabled: profile.isAdmin,
                      decoration: const InputDecoration(labelText: 'Имя'),
                    ),
                    TextFormField(
                      initialValue: profile.lastName,
                      enabled: profile.isAdmin,
                      decoration: const InputDecoration(labelText: 'Фамилия'),
                    ),
                    TextFormField(
                      initialValue: profile.secondName,
                      enabled: profile.isAdmin,
                      decoration: const InputDecoration(labelText: 'Отчество'),
                    ),
                    TextFormField(
                      initialValue: profile.email,
                      enabled: profile.isAdmin,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    if (profile.isAdmin)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: FilledButton(
                            onPressed: () {},
                            child: const Text('Сохранить'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
