// ignore_for_file: library_private_types_in_public_api

import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/rental_package_list_modal.dart';

import '../../../../imports.dart';

class CustomRentalPackageDropdown extends StatefulWidget {
  final List<PackageDetail> items;
  final PackageDetail? selectedItem;
  final ValueChanged<PackageDetail>? onChanged;
  final String? hint;
  final FormFieldValidator<String>? validator;

  const CustomRentalPackageDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.hint,
    this.validator,
  });

  @override
  _CustomRideDropdownState createState() => _CustomRideDropdownState();
}

class _CustomRideDropdownState extends State<CustomRentalPackageDropdown> {
  PackageDetail? _selectedItem;

  @override
  void initState() {
    super.initState();
    // _selectedItem = widget.selectedItem ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _showDropdown(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: textGrey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: horizontalPadding10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedItem?.name ?? AppLocalizations.of(context)!.package,
                  style: tsSmall,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 35,
                  color: blackColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index];
                bool isSelected = item.id == widget.selectedItem?.id;
                return ListTile(
                  leading:  Icon(
                      isSelected==true?
                          Icons.radio_button_checked_sharp
                          :
                      Icons.radio_button_off),

                  title: Text(item.name.toString()),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(item);
                    }
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
