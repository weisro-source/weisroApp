import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/auth/data/models/worker_tags_model.dart';
import 'package:weisro/feature/auth/register/presentation/manager/get_all_worker_tags_cubit/get_all_worker_tags_cubit.dart';

class WorkerTagsDropDown extends StatelessWidget {
  const WorkerTagsDropDown({super.key, required this.allTags});
  final List<Doc> allTags;

  @override
  Widget build(BuildContext context) {
    GetAllWorkerTagsCubit tagsCubit = GetAllWorkerTagsCubit.get(context);
    return DropdownSearch<Doc>.multiSelection(
      items: (filter, loadProps) => allTags,
      itemAsString: (Doc u) => u.name ?? "Unnamed tags",
      onChanged: (List<Doc> tags) {
        tagsCubit.selectedTags = tags;
      },
      compareFn: (item1, item2) {
        return (item1.name == item2.name);
      },
      filterFn: (Doc tag, String filter) {
        return tag.name!.toLowerCase().contains(filter.toLowerCase());
      },
      dropdownBuilder: (context, selectedItems) {
        return Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: selectedItems
              .map((tag) => Chip(
                    label: Text(tag.name ?? ""),
                    onDeleted: () {
                      selectedItems.remove(tag);
                      tagsCubit.selectedTags = List.from(selectedItems);
                      (context as Element).markNeedsBuild();
                    },
                  ))
              .toList(),
        );
      },
      popupProps: const PopupPropsMultiSelection.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              labelText: 'Search tags',
              iconColor: AppColors.orangeColor,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.orangeColor),
                  borderRadius: BorderRadius.all(Radius.circular(4)))),
        ),
        listViewProps: ListViewProps(
          physics: BouncingScrollPhysics(), // For smoother scrolling
        ),
      ),
      validator: (List<Doc>? tags) {
        if (tags == null || tags.isEmpty) {
          return "Please select at least one user";
        }
        return null;
      },
      // dropdownDecoratorProps: const DropDownDecoratorProps(
      //   dropdownSearchDecoration: InputDecoration(
      //     labelText: "Select Users",
      //     hintText: "Select one or more users",
      //   ),
      // ),
    );
  }
}
