import 'package:oiot/src/drawer/community/community_list.dart';
import 'package:oiot/src/drawer/community/google_community_screen.dart';

import '../../../imports.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding15,
        child: SafeArea(
          child: Column(
            children: [
              const CustomHeader(title: 'Our Community'),
              height50,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GoogleCommunity(),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/google_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  //============== Facebook logo=======================================
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityGroups(
                              name: "Connect with F-Community",
                            ),
                          ),
                        );
                      },
                      child: Image.asset('assetst/community/facebook_logo.png',
                          width: 50.0, height: 50.0)),
                  //============== Whatsapp logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "WhatsApp",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/whatsapp_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  //============== Linkedin logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Linkedin",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/linkedin_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  //============== Telegaram logo=======================================
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Telegram",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/telegram_logo.png',
                        width: 50.0, height: 50.0),
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
                            name: "Google Meet",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/google_meet_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Clubhouse",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/clubhouse_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Youtube",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/youtube_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Koo",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/koo_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Playstore",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/play_store_logo.png',
                        width: 50.0, height: 50.0),
                  ),
                ],
              ),
              height15,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Mouthshut",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/mouthshut_logo.png',
                        width: 100.0, height: 100.0),
                  ),
                  height30,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "Justdial",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/just_dial_logo.png',
                        width: 100.0, height: 100.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assetst/community/chingari_logo.png',
                      width: 50.0, height: 50.0),
                  height30,
                  Image.asset('assetst/community/josh_logo.png',
                      width: 50.0, height: 50.0),
                  height30,
                  Image.asset('assetst/community/share_chat_logo.png',
                      width: 50.0, height: 50.0),
                  height30,
                  Image.asset('assetst/community/yellow_pages_logo.png',
                      width: 60.0, height: 60.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assetst/community/snapdragon_logo.png',
                      width: 50.0, height: 50.0),
                  height30,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunityGroups(
                            name: "",
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assetst/community/quikr_logo_com.png',
                        width: 120, height: 120),
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
