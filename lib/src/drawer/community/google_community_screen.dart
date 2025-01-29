import 'package:oiot/src/drawer/community/community_list.dart';

import '../../../imports.dart';

// Active is "Google classroom", "Google Podcast", "Google Map"
class GoogleCommunity extends StatelessWidget {
  const GoogleCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding15,
        child: SafeArea(
          child: Column(
            children: [
              CustomHeader(
                title: AppLocalizations.of(context)!.google,
              ),
              height40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Google Duo",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/google_duo_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Google Maps",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/google_map_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Reviews",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/reviews_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Google Shops",
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assetst/community/google_shops_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                ],
              ),
              height30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Google Classroom",
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assetst/community/google_classroom_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Blogger",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/blogger_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Google Podcast",
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                        'assetst/community/google_podcast_logo.png',
                        width: 50.0,
                        height: 50.0),
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: transperentColor,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
