import 'package:flutter/material.dart';
import 'package:mobile_app/data/data_sources/local_data_sources/employee_reports_data_source/employee_reports_data_source.dart';
import 'package:mobile_app/data/data_sources/photo_picking_data_source.dart';
import 'package:mobile_app/data/data_sources/remote_data_sources/files_data_source.dart';
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
  late final FilesDataSource userPhotoDataSource;
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
    userPhotoDataSource = FilesDataSource(context.read());
    checkingDataSource = CheckingDataSource(context.read());
    photoPickingDataSource = PhotoPickingDataSource();
  }
}
