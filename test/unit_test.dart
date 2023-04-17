import 'package:e_letter/service/content_api.dart';
import 'package:e_letter/helper/ToPdf/database_helper.dart';
import 'package:e_letter/Model/activity/activity_model.dart';
import 'package:e_letter/screen/activity/activity_viewModel.dart';
import 'package:e_letter/screen/content/content_viewModel.dart';
import 'package:test/test.dart';

void main() {
  group('test api content', () {
    test('change state', () {
      ContentViewModel cTviewModel = ContentViewModel();
      expect(cTviewModel.stateType, ContentViewState.loading);

      cTviewModel.changeState(ContentViewState.succes);
      expect(cTviewModel.stateType, ContentViewState.succes);

      cTviewModel.changeState(ContentViewState.error);
      expect(cTviewModel.stateType, ContentViewState.error);
    });
    test('get data', () async {
      var content = await ContentApi().getContent();
      expect(content.isNotEmpty, true);
    });
  });
}
