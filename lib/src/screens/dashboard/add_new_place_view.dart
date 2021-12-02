import 'package:flutter/material.dart';
import 'package:places/src/core/base_widget.dart';
import 'package:places/src/core/locator/service_locator.dart';
import 'package:places/src/viewmodels/dashboard/add_new_place_view_model.dart';
import 'package:places/src/widgets/input_name.dart';
import 'package:places/src/widgets/shared/app_colors.dart';

class AddNewPlaceView extends StatelessWidget {
  AddNewPlaceView({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _monumentController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: locator<AddNewPlaceViewModel>(),
      onModelReady: _onModelReady,
      builder:
          (BuildContext context, AddNewPlaceViewModel model, Widget? child) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: _buildBody(context, model),
          ),
        );
      },
    );
  }
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Add New Place",
        style: TextStyle(color: blackColor87),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: blackColor87,
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: whiteColor,
    );
  }
  Widget _buildBody(BuildContext context, AddNewPlaceViewModel model) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          InputName(
            controller: _titleController,
            text: "Place Name",
            hint: "e.g Lalitpur",
            icon: Icons.place,
          ),
          InputName(
            controller: _monumentController,
            text: "Nearby monument ",
            hint: "e.g Dharahara",
            icon: Icons.place,
          ),
          InputName(
            controller: _descriptionController,
            text: "Place description",
            hint: "describe this place",
            icon: Icons.message,
            lines: 3,
          ),
        ],
      ),
    );
  }

  }
  void _onModelReady(AddNewPlaceViewModel model) {}
