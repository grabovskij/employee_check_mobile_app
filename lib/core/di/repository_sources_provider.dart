import 'package:flutter/material.dart';
import 'package:mobile_app/data/data_sources/local_data_sources/employee_reports_data_source/employee_reports_data_source.dart';
import 'package:mobile_app/data/data_sources/photo_picking_data_source.dart';
import 'package:mobile_app/data/data_sources/remote_data_sources/files_data_source.dart';
import 'package:mobile_app/data/data_sources/remote_data_sources/profile_data_source/profile_data_source.dart';
import 'package:mobile_app/data/repositories/profile_repository.dart';
import 'package:provider/provider.dart';

class RepositoriesProvider extends StatefulWidget {
  final Widget child;

  const RepositoriesProvider({
    required this.child,
    super.key,
  });

  @override
  State<RepositoriesProvider> createState() => _DataSourcesProvidersState();
}

class _DataSourcesProvidersState extends State<RepositoriesProvider> {
  late final ProfileRepository profileRepository;

  @override
  void initState() {
    super.initState();
    _initSources();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: profileRepository),
      ],
      child: widget.child,
    );
  }

  void _initSources() {
    profileRepository = ProfileRepository(context.read())..init();
  }
}
