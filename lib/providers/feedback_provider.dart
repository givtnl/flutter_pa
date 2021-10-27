import 'package:flutter/material.dart';
import 'package:openapi/api.dart';
import 'package:flutter_app/models/UserFeedback.dart' as Feedback;

class FeedbackProvider with ChangeNotifier {

  late FeedbackApi _feedbackApi;

  Future<void> sendFeedback(Feedback.UserFeedback feedback, String userId, {String? email}) async {
    await _feedbackApi.createFeedback(userId, CreateUserFeedbackRequest(userId: userId, email: email, userFeedback: UserFeedback.fromJson(feedback.index) ));
    // here we will send the feedback to the api
  }

  FeedbackProvider.withDependencies(ApiClient apiClient) {
    _feedbackApi = FeedbackApi(apiClient);
  }
}