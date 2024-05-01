import 'package:flutter/material.dart';
import 'package:mobile_app/data/data_sources/checking_data_source.dart';
import 'package:mobile_app/data/data_sources/photo_picking_data_source.dart';
import 'package:mobile_app/data/data_sources/user_photo_data_source.dart';
import 'package:provider/provider.dart';

class DataSourcesProvider extends StatefulWidget {
  final Widget child;

  const DataSourcesProvider({
    required this.child,
    super.key,
  });

  @override
  State<DataSourcesProvider> createState() => _DataSourcesProvidersState();
}

class _DataSourcesProvidersState extends State<DataSourcesProvider> {
  late final UserPhotoDataSource userPhotoDataSource;
  late final CheckingDataSource checkingDataSource;
  late final PhotoPickingDataSource photoPickingDataSource;

  @override
  void initState() {
    super.initState();
    _initSources();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: userPhotoDataSource),
        Provider.value(value: checkingDataSource),
        Provider.value(value: photoPickingDataSource),
      ],
      child: widget.child,
    );
  }

  void _initSources() {
    userPhotoDataSource = UserPhotoDataSource(context.read());
    checkingDataSource = CheckingDataSource(context.read());
    photoPickingDataSource = PhotoPickingDataSource();
  }
}
