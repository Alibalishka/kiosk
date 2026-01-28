import 'package:qr_pay_app/src/core/server/interfaces/base_network_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_response.g.dart';

@JsonSerializable()
class ConfigurationResponse extends BaseModel<ConfigurationResponse> {
  ConfigurationData? data;

  ConfigurationResponse({this.data});

  factory ConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationResponseFromJson(json);

  @override
  ConfigurationResponse fromJson(Map<String, dynamic> json) =>
      ConfigurationResponse.fromJson(json);
}

@JsonSerializable()
class ConfigurationData extends BaseModel<ConfigurationData> {
  String? organizationName;
  String? cover;
  dynamic logoLight;
  dynamic logoDark;
  String? subdomain;
  Description? description;
  String? instagram;
  dynamic facebook;
  String? website;
  String? privacyPolicyFile;
  String? termsOfServiceFile;
  dynamic appIcon;
  dynamic appStoreLink;
  dynamic googlePlayLink;
  String? coverUrl;
  String? privacyPolicyUrl;
  String? termsOfServiceUrl;

  ConfigurationData({
    this.organizationName,
    this.cover,
    this.logoLight,
    this.logoDark,
    this.subdomain,
    this.description,
    this.instagram,
    this.facebook,
    this.website,
    this.privacyPolicyFile,
    this.termsOfServiceFile,
    this.appIcon,
    this.appStoreLink,
    this.googlePlayLink,
    this.coverUrl,
    this.privacyPolicyUrl,
    this.termsOfServiceUrl,
  });

  factory ConfigurationData.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationDataFromJson(json);

  @override
  ConfigurationData fromJson(Map<String, dynamic> json) =>
      ConfigurationData.fromJson(json);
}

@JsonSerializable()
class Description extends BaseModel<Description> {
  final String? kz;
  final String? ru;
  final String? en;

  Description({
    this.kz,
    this.ru,
    this.en,
  });

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  @override
  Description fromJson(Map<String, dynamic> json) => Description.fromJson(json);
}
