// ignore_for_file: library_private_types_in_public_api
import '../../../../../../imports.dart';

class BottomSheetContentScreen extends StatelessWidget {
  final String locationDescription;
  final Function(String) selectFavorite;

  const BottomSheetContentScreen({
    super.key,
    required this.locationDescription,
    required this.selectFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomSheetProvider(),
      child: Consumer<BottomSheetProvider>(
        builder: (context, controller, _) =>
            _buildBottomSheetContent(context, controller),
      ),
    );
  }

  Widget _buildBottomSheetContent(
      BuildContext context, BottomSheetProvider controller) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          height05,
          Padding(
            padding: padding16,
            child: Text(
              AppLocalizations.of(context)!.addToFavourites,
              style: tsRegularBold,
            ),
          ),
          height10,
          Padding(
            padding: horizontalPadding15,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${AppLocalizations.of(context)!.location}: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  TextSpan(
                    text: locationDescription,
                    style: tsSmall,
                  ),
                ],
              ),
            ),
          ),
          height10,
          if (!controller.isAddingCustom) ...[
            Padding(
              padding: horizontalPadding15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildFavoriteIconButton(
                    Icons.home,
                    'Home',
                    () => _onOptionSelected(context, controller, 'Home'),
                    controller.selectedOption == 'Home',
                  ),
                  _buildFavoriteIconButton(
                    Icons.work,
                    'Work',
                    () => _onOptionSelected(context, controller, 'Work'),
                    controller.selectedOption == 'Work',
                  ),
                  _buildFavoriteIconButton(
                    Icons.fitness_center,
                    'Gym',
                    () => _onOptionSelected(context, controller, 'Gym'),
                    controller.selectedOption == 'Gym',
                  ),
                  _buildAddNewButton(controller, context),
                ],
              ),
            ),
          ] else ...[
            Padding(
              padding: horizontalPadding15,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.customFavourite,
                        border: OutlineInputBorder(
                          borderRadius: circularBorderRadius10,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!
                              .pleaseEnterYourCustomFavorite;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.selectOption(value);
                      },
                    ),
                  ),
                  _buildAddNewButton(controller, context),
                ],
              ),
            ),
          ],
          height10,
          Padding(
            padding: padding16,
            child: ElevatedButton(
              onPressed: controller.isElevatedButtonEnabled
                  ? () {
                      Navigator.pop(context);
                      if (controller.isAddingCustom) {
                        selectFavorite(controller.selectedOption);
                      } else {
                        selectFavorite(controller.selectedOption);
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    controller.isElevatedButtonEnabled ? blueMain : textGrey,
                foregroundColor: whiteColor,
                padding: verticalPadding16,
                shape: RoundedRectangleBorder(
                  borderRadius: circularBorderRadius8,
                ),
              ),
              child: Text(AppLocalizations.of(context)!.addToFavourites),
            ),
          ),
          height05,
        ],
      ),
    );
  }

  void _onOptionSelected(
      BuildContext context, BottomSheetProvider controller, String option) {
    controller.selectOption(option);
  }

  Widget _buildFavoriteIconButton(
    IconData iconData,
    String label,
    VoidCallback onPressed,
    bool isSelected,
  ) {
    return Column(
      children: [
        IconButton(
          icon: Icon(iconData, color: isSelected ? blueMain : null),
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }

  Widget _buildAddNewButton(
    BottomSheetProvider controller,
    BuildContext context,
  ) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            if (controller.isAddingCustom) {
              controller.disableCustomInput();
            } else {
              controller.enableCustomInput();
            }
          },
          icon: Icon(controller.isAddingCustom
              ? Icons.remove_circle
              : Icons.add_circle),
          tooltip: controller.isAddingCustom
              ? 'Hide Custom Favourites'
              : 'Add Custom Favourites',
        ),
        if (!controller.isAddingCustom)
          Text(AppLocalizations.of(context)!.addNew),
      ],
    );
  }
}
