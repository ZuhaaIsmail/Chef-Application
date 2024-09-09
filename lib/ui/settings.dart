import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List generalList = [
    {
      'title': 'App Language',
      'subTitle': 'Language',
      'icon': Icons.language,
      'containerColor': Colors.blue,
    },
    {
      'title': 'Remove ads',
      'subTitle': 'Remove unnecessary ads',
      'icon': Icons.remove_circle_outline,
      'containerColor': Colors.green,
    },
  ];

  final List othersList = [
    {
      'title': 'Rate Us',
      'subTitle': 'Share your experience',
      'icon': Icons.star_border,
      'containerColor': Colors.pink,
    },
    {
      'title': 'Feedback',
      'subTitle': 'Add your suggestions',
      'icon': Icons.feed_outlined,
      'containerColor': Colors.orange,
    },
    {
      'title': 'Privacy Policy',
      'subTitle': 'Learn privacy policy',
      'icon': Icons.privacy_tip_outlined,
      'containerColor': Colors.blue,
    },
    {
      'title': 'Version',
      'subTitle': '1.0.0',
      'icon': Icons.layers_outlined,
      'containerColor': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 29,
            child: SettingsCard(
              mainTitle: 'General',
              settings: generalList,
            ),
          ),
          Expanded(
            flex: 50,
            child: SettingsCard(
              mainTitle: 'Others',
              settings: othersList,
            ),
          ),
          const Expanded(flex: 23, child: SizedBox()),
        ],
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String mainTitle;
  final List settings;

  const SettingsCard({
    required this.mainTitle,
    required this.settings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Card(
          elevation: 0.8,
          surfaceTintColor: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5, bottom: 5),
                child: Text(
                  mainTitle,
                  style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 18, right: 10),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: settings[index]['containerColor'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        settings[index]['icon'],
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Text(settings[index]['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Text(settings[index]['subTitle'], style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey.shade500, size: 20),
                    onTap: (){},
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    height: 4,
                    color: Colors.grey.shade300,
                  ),
                ),
                itemCount: settings.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
