import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:viper_form_app/data/network/api_client.dart';
import 'package:viper_form_app/modules/form_data/presenter/form_data_presenter.dart';
import 'package:viper_form_app/modules/form_data/router/form_data_router.dart';
import 'package:viper_form_app/modules/form_data/view/form_data_view.dart';
import 'package:viper_form_app/modules/form_data_v2/entity/form_data_entity.dart';
import 'package:viper_form_app/modules/form_data_v2/interactor/form_data_interactor.dart';
import 'package:viper_form_app/modules/form_data_v2/view/form_data_form_field_manager_v2.dart';
import 'package:viper_form_app/modules/form_data_v2/view/form_data_view_contract.dart';

class FormDataViewV2 extends FormDataView {
  @override
  State<StatefulWidget> createState() => FormDataViewV2State();
}

class FormDataViewV2State extends FormDataViewState
    implements FormDataViewContractV2 {
  @override
  void initState() {
    super.initState();

    presenter = FormDataPresenter(
      view: this,
      interactor:
          FormDataInteractorImplV2(apiClient: GetIt.I<FormDataApiClient>()),
      router: FormDataRouterImpl(context),
    );
    fieldManager = FormDataFormFieldManagerV2();
    presenter.fetchFormData();
  }

  @override
  void showDataV2(FormDataEntityV2 formData) {
    setState(() {
      data = formData;
    });
  }
}
