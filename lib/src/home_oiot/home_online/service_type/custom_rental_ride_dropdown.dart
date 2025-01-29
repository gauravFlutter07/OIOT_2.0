// ignore_for_file: library_private_types_in_public_api

import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/rental_fare_list_modal.dart';

import '../../../../imports.dart';

class CustomRentalRideDropdown extends StatefulWidget {
  final List<RentalVehicleModal> items;
  final RentalVehicleModal? selectedItem;
  final ValueChanged<RentalVehicleModal>? onChanged;
  final String? hint;
  final FormFieldValidator<String>? validator;

  const CustomRentalRideDropdown({
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

class _CustomRideDropdownState extends State<CustomRentalRideDropdown> {
   RentalVehicleModal? _selectedItem;

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
            child: _selectedItem==null?
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(AppLocalizations.of(context)!.pleaseSelectVehicleType,
                        style: tsSmall,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 35,
                        color: blackColor,
                      ),
                    ],
                  )
                :
            ListTile(
              leading: Utils.showImg(_selectedItem?.file ?? '', 40, 40),
              title: Text(
                _selectedItem?.type ?? '',
                style: tsSmall,
              ),
              trailing: Text(
                "₹${_selectedItem?.fare ?? ''}",
                style: tsSmall,
              ),
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
                return ListTile(
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(item);
                    }
                    Navigator.pop(context);
                  },
                  leading: Utils.showImg(item.file ?? '', 40, 40),
                  title: Text(
                    item.type ?? '',
                    style: tsSmall,
                  ),
                  trailing: Text(
                    "₹${item.fare ?? ''}",
                    style: tsSmall,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
