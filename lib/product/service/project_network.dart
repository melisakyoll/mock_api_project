import 'package:dio/dio.dart';

import '../../core/utils/base_url.dart';

class ProjectDioMixin {
  final dioUrlService = Dio(BaseOptions(baseUrl: baseUrl));
}
