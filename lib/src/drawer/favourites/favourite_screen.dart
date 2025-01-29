import '../../../imports.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
              child: Padding(
                padding: padding8,
                child: Consumer<FavouriteProvider>(
                  builder: (BuildContext context, provider, Widget? child) {
                    List<FavouriteItemModel> favouriteList =
                        provider.favouriteList;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return height10;
                      },
                      itemCount: favouriteList.length,
                      itemBuilder: (context, index) {
                        FavouriteItemModel favourite = favouriteList[index];
                        return Card(
                          elevation: 2,
                          color: whiteColor,
                          child: ListTile(
                            leading: Icon(Icons.favorite, color: redColor),
                            title: Text(
                              favourite.category,
                              style: tsRegularBold,
                            ),
                            subtitle: Text(favourite.location),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(AppLocalizations.of(context)!
                                          .confirmation),
                                      content: Text(
                                        AppLocalizations.of(context)!
                                            .areYouSureWantToDeleteThisFavourite,
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .no,
                                                style: tsSmall,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .yes,
                                                style: tsSmall,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete_sweep),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PickUpScreen(flag: 1),
            ),
          );
        },
        label: Text(
          AppLocalizations.of(context)!.addMore,
          style: TextStyle(
            color: blackColor,
          ),
        ),
        icon: Icon(Icons.add_circle, color: blackColor),
        backgroundColor: whiteColor,
      ),
    );
  }
}
