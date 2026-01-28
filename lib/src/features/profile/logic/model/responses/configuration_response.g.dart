// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigurationResponse _$ConfigurationResponseFromJson(
        Map<String, dynamic> json) =>
    ConfigurationResponse(
      data: json['data'] == null
          ? null
          : ConfigurationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigurationResponseToJson(
        ConfigurationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ConfigurationData _$ConfigurationDataFromJson(Map<String, dynamic> json) =>
    ConfigurationData(
      organizationName: json['organization_name'] as String?,
      cover: json['cover'] as String?,
      logoLight: json['logo_light'],
      logoDark: json['logo_dark'],
      subdomain: json['subdomain'] as String?,
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description'] as Map<String, dynamic>),
      instagram: json['instagram'] as String?,
      facebook: json['facebook'],
      website: json['website'] as String?,
      privacyPolicyFile: json['privacy_policy_file'] as String?,
      termsOfServiceFile: json['terms_of_service_file'] as String?,
      appIcon: json['app_icon'],
      appStoreLink: json['app_store_link'],
      googlePlayLink: json['google_play_link'],
      coverUrl: json['cover_url'] as String?,
      privacyPolicyUrl: json['privacy_policy_url'] as String?,
      termsOfServiceUrl: json['terms_of_service_url'] as String?,
    );

Map<String, dynamic> _$ConfigurationDataToJson(ConfigurationData instance) =>
    <String, dynamic>{
      'organization_name': instance.organizationName,
      'cover': instance.cover,
      'logo_light': instance.logoLight,
      'logo_dark': instance.logoDark,
      'subdomain': instance.subdomain,
      'description': instance.description,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'website': instance.website,
      'privacy_policy_file': instance.privacyPolicyFile,
      'terms_of_service_file': instance.termsOfServiceFile,
      'app_icon': instance.appIcon,
      'app_store_link': instance.appStoreLink,
      'google_play_link': instance.googlePlayLink,
      'cover_url': instance.coverUrl,
      'privacy_policy_url': instance.privacyPolicyUrl,
      'terms_of_service_url': instance.termsOfServiceUrl,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      kz: json['kz'] as String?,
      ru: json['ru'] as String?,
      en: json['en'] as String?,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'kz': instance.kz,
      'ru': instance.ru,
      'en': instance.en,
    };
