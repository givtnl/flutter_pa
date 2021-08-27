import 'package:flutter/foundation.dart';
import 'package:openapi/api.dart';

class OrganisationProvider with ChangeNotifier {

  late String _currentSelectedProposal;

  String get currentSelectedProposal {
    return _currentSelectedProposal;
  }

  set currentSelectedProposal(id) {
    _currentSelectedProposal = id;
  }
}
