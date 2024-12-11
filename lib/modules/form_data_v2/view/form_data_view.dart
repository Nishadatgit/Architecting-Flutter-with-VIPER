import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:viper_form_app/modules/form_data/data/network/api_client.dart';
import 'package:viper_form_app/modules/form_data/entity/form_data_entity.dart';
import 'package:viper_form_app/modules/form_data/interactor/form_data_interactor.dart';
import 'package:viper_form_app/modules/form_data/presenter/form_data_presenter.dart';
import 'package:viper_form_app/modules/form_data/router/form_data_router.dart';
import 'package:viper_form_app/modules/form_data/view/form_data_view_contract.dart';
import 'package:viper_form_app/shared/form_fields/form_field.dart';
import 'package:viper_form_app/shared/form_fields/form_field_manager.dart';

class FormFieldManager implements IFormFieldManager<FormDataEntity> {
  @override
  List<FormFieldWidget> getFields(FormDataEntity formData) {
    return [
      TextFieldFormField(label: 'First Name', value: formData.firstName),
      CustomSpacingField(),
      TextFieldFormField(label: 'Last Name', value: formData.lastName),
      CustomSpacingField(),
      TextFieldFormField(label: 'Age', value: formData.age.toString()),
      CustomSpacingField(),
      TextFieldFormField(label: 'Address', value: formData.address),
      CustomSpacingField(),
      TextFieldFormField(label: 'City', value: formData.city),
      CustomSpacingField(),
      TextFieldFormField(label: 'Email Address', value: formData.emailAddress),
    ];
  }
}

class FormDataView extends StatefulWidget {
  const FormDataView({super.key});

  @override
  State<StatefulWidget> createState() => FormDataViewState();
}

@protected
class FormDataViewState extends State<FormDataView>
    implements FormDataViewContract {
  @protected
  late FormDataPresenter presenter;
  bool isLoading = false;
  String? errorMessage;
  FormDataEntity? data;
  late FormFieldManager fieldManager;

  @override
  void initState() {
    super.initState();

    presenter = FormDataPresenter(
      view: this,
      interactor:
          FormDataInteractorImpl(apiClient: GetIt.I<FormDataApiClient>()),
      router: FormDataRouterImpl(context),
    );
    fieldManager = FormFieldManager();
    presenter.fetchFormData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () => presenter.fetchFormData(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return buildView(data);
  }

  @protected
  Widget buildView(FormDataEntity? formData) {
    if (formData == null) {
      return const Center(child: Text('No data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buildFormFields(formData),
      ),
    );
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
  }

  @override
  void showData(FormDataEntity formData) {
    setState(() {
      isLoading = false;
      data = formData;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      isLoading = false;
      errorMessage = message;
    });
  }

  @protected
  List<Widget> buildFormFields(FormDataEntity formData) {
    return fieldManager
        .getFields(formData)
        .map((field) => field.build(context))
        .toList();
  }
}
