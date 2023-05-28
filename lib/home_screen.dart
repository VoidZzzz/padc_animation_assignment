import 'package:flutter/material.dart';

import 'detail_screen.dart';

const kAnimationDuration = Duration(milliseconds: 1000);
const kAnimationDurationForScreenFadeIn = Duration(milliseconds: 2000);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChangeTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: kAnimationDuration,
        color: isChangeTheme ? Colors.black : Colors.white,
        child: Stack(
          children: [
            TweenAnimationBuilder(
              duration: kAnimationDurationForScreenFadeIn,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) => Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: value * 64,
                    left: 12.0,
                  ),
                  child: child,
                ),
              ),
              child: ProfileSection(
                onChange: () {
                  setState(() {
                    isChangeTheme = !isChangeTheme;
                  });
                },
                isChange: isChangeTheme,
              ),
            ),
            TweenAnimationBuilder(
              duration: kAnimationDurationForScreenFadeIn,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) => Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: value * 12.0,
                  ),
                  child: child,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: TrendingForUSection(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(),
                        ),
                      );
                    },
                    isChange: isChangeTheme,
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
              duration: kAnimationDurationForScreenFadeIn,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) => Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: value * 20,
                  ),
                  child: child,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RecommendedSection(
                    isChange: isChangeTheme,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecommendedSection extends StatelessWidget {
  final bool isChange;

  const RecommendedSection({super.key, required this.isChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                  color: isChange ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://cdn.thewirecutter.com/wp-content/media/2021/02/whitesneakers-2048px-4197.jpg?auto=webp&quality=75&width=320",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 150,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.meesho.com/images/products/24754944/09a48_512.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TrendingForUSection extends StatelessWidget {
  final bool isChange;
  final Function onTap;

  const TrendingForUSection(
      {super.key, required this.onTap, required this.isChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                "Trending For you",
                style: TextStyle(
                  color: isChange ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              padding: const EdgeInsets.all(
                15.0,
              ),
              height: 290,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/11/16/10/vswardrobe.jpg?width=968"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.pinkAccent,
                        child: Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "NEW 2023",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.lightGreen,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Modern Outfits\nCollection",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 13.0,
                                backgroundImage: NetworkImage(
                                  'https://www.whatsappimages.in/wp-content/uploads/2021/02/Beautiful-Girls-Whatsapp-DP-Profile-Images-pics-for-download-300x300.gif',
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Lily Sue",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  final Function onChange;
  final bool isChange;

  const ProfileSection(
      {super.key, required this.onChange, required this.isChange});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
            'https://techyatri.com/wp-content/uploads/2023/04/Anime-DP-Girl-22.jpg',
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Howdy,",
              style: TextStyle(
                fontSize: 18.0,
                color: isChange ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "Cristina Yota",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: isChange ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // change theme
            onChange();
          },
          icon: const Icon(
            Icons.lightbulb,
            size: 35.0,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
