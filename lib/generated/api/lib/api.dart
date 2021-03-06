//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/answers_api.dart';
part 'api/feedback_api.dart';
part 'api/matches_api.dart';
part 'api/organisation_matches_api.dart';
part 'api/organisation_tags_api.dart';
part 'api/organisations_api.dart';
part 'api/questions_api.dart';

part 'model/create_answer_detail_request.dart';
part 'model/create_answer_request.dart';
part 'model/create_organisation_request.dart';
part 'model/create_organisation_response.dart';
part 'model/create_question_category_request_options.dart';
part 'model/create_question_request.dart';
part 'model/create_question_response.dart';
part 'model/create_question_statement_request_options.dart';
part 'model/create_user_feedback_request.dart';
part 'model/get_organisation_tags_response.dart';
part 'model/get_questions_list_response.dart';
part 'model/get_user_organisation_matches_list_response.dart';
part 'model/get_user_organisation_tag_matches_list_response.dart';
part 'model/organisation_detail_model.dart';
part 'model/organisation_tag_match_list_model.dart';
part 'model/question_category_option_model.dart';
part 'model/question_list_model.dart';
part 'model/question_statement_model.dart';
part 'model/question_type.dart';
part 'model/user_feedback.dart';
part 'model/user_organisation_match_list_model.dart';
part 'model/user_organisation_tag_match_list_model.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
