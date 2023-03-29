import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:reqress_app/models/support_model.dart';
import 'package:reqress_app/models/user_model.dart';

class ResponseModel extends Equatable {
  const ResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      page: map['page']?.toInt() ?? 0,
      perPage: map['perPage']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
      data: List<User>.from(map['data']?.map((x) => User.fromMap(x))),
      support: SupportModel.fromMap(map['support']),
    );
  }

  final List<User> data;
  final int page;
  final int perPage;
  final SupportModel support;
  final int total;
  final int totalPages;

  @override
  List<Object> get props {
    return [
      page,
      perPage,
      total,
      totalPages,
      data,
      support,
    ];
  }

  @override
  String toString() {
    return 'ResponseModel(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data, support: $support)';
  }

  ResponseModel copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<User>? data,
    SupportModel? support,
  }) {
    return ResponseModel(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'perPage': perPage,
      'total': total,
      'totalPages': totalPages,
      'data': data.map((x) => x.toMap()).toList(),
      'support': support.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
