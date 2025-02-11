import 'package:oiot/src/drawer/favourites/add_favourite/add_favourite_controller.dart';

import '../../../../imports.dart';

class AddFavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: padding10,
              child: CustomHeader(
                title: AppLocalizations.of(context)!.myFavourites,
              ),
            ),
            Expanded(
              // Ensures the dropdown menu takes only the remaining space
              child: Consumer<FavouriteProvider>(
                builder: (context, myfavProvider, child) {
                  return _DropDownMenu(myfavProvider: myfavProvider);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Colors.white), // Adjusted white color with opacity
              backgroundColor: MaterialStateProperty.all(blueMain),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius here
                ),
              ),
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
            ),
            onPressed: () {
              final myfavProvider =
                  Provider.of<FavouriteProvider>(context, listen: false);
              myfavProvider.savedata();
              myfavProvider.sendMyFav(context);

              myfavProvider.fetchFavouritesList();
              // myfavProvider.fromAddPage == true;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            child: Text('Submit'),
          ),
        ),
      ),
    );
  }
}

class _DropDownMenu extends StatelessWidget {
  final FavouriteProvider myfavProvider;

  const _DropDownMenu({required this.myfavProvider});

  @override
  Widget build(BuildContext context) {
    final List<String> options = ['Home', 'Office', 'Other'];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Menu
            Container(
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  value: myfavProvider.label,
                  hint: const Text("Select an Option"),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      myfavProvider.setSelectedOption(newValue);
                    }
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SizedBox(
                        width: 100,
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ),
            if (myfavProvider.label == 'Other') ...[
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Please specify',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  myfavProvider.setCustomOption(value);
                },
              ),
            ],
            const SizedBox(height: 20),

            // Location Input Field with Suggestions
            TextField(
              controller: myfavProvider.destinationController,
              decoration: InputDecoration(
                labelText: 'Enter a Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                myfavProvider.fetchSuggestions(value);
              },
            ),
            const SizedBox(height: 10),
            if (myfavProvider.suggestions.isNotEmpty)
              Container(
                height: 300,
                child: ListView.builder(
                  itemCount: myfavProvider.suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = myfavProvider.suggestions[index];
                    return ListTile(
                      title: Text(suggestion),
                      onTap: () {
                        myfavProvider.destinationController.text = suggestion;
                        myfavProvider.clearSuggestions();
                        myfavProvider.fetchLatLngFromAddress();
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
