import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/generated/l10n.dart';

import 'rent_widget.dart';

class RentTime extends StatefulWidget {
  const RentTime({super.key});

  @override
  State<RentTime> createState() => _RentTimeState();
}

class _RentTimeState extends State<RentTime> {
  String _selectedRentTime = '';

  void _onRentTimeSelected(String rentTime) {
    setState(() {
      _selectedRentTime = rentTime;
    });
    BlocProvider.of<AddServiceCubit>(context).updateRentTime(rentTime);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        24.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Daily,
            isSelected: _selectedRentTime == S.of(context).Daily,
            onSelected: _onRentTimeSelected,
          ),
        ),
        6.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Hours,
            isSelected: _selectedRentTime == S.of(context).Hours,
            onSelected: _onRentTimeSelected,
          ),
        ),
        6.kw,
        Expanded(
          child: RentWidget(
            rentTime: S.of(context).Both,
            isSelected: _selectedRentTime == S.of(context).Both,
            onSelected: _onRentTimeSelected,
          ),
        ),
        24.kw,
      ],
    );
  }
}
