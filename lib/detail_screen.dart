import 'package:flutter/material.dart';
import 'explicit_collapse_expand.dart';
import 'explicit_favourite.dart';

const kAnimationDuration = Duration(milliseconds: 1000);

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isExpand = true;
  List<SizeChart> sizeChartList = [
    SizeChart("S", false),
    SizeChart("M", false),
    SizeChart("L", false),
    SizeChart("XL", false),
    SizeChart("XXL", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: kAnimationDuration,
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, double value, child) => Opacity(
          opacity: value,
          child: child,
        ),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  AppbarView(
                    onTapBack: () {
                      Navigator.pop(context);
                    },
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const TitleSection(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        DescriptionSection(
                          onTap: () {
                            setState(() {
                              isExpand = !isExpand;
                            });
                          },
                          isExpand: isExpand,
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        SizeSelection(
                          list: sizeChartList,
                          onSelect: (index) {
                            setState(() {
                              sizeChartList[index].isSelected =
                                  !sizeChartList[index].isSelected;
                            });
                          },
                        ),
                      ],
                    ),
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

class SizeSelection extends StatelessWidget {
  final List<SizeChart> list;
  final Function(int) onSelect;

  const SizeSelection({super.key, required this.list, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Size your size",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Text(
                "Size guide",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: list
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      onSelect(
                        list.indexOf(e),
                      );
                    },
                    child: Size(
                      sizeChart: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class Size extends StatelessWidget {
  final SizeChart sizeChart;

  const Size({super.key, required this.sizeChart});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        color: sizeChart.isSelected ? Colors.deepPurple : Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(
          13.0,
        ),
      ),
      child: Center(
        child: Text(
          sizeChart.size,
          style: TextStyle(
            color: sizeChart.isSelected ? Colors.white : Colors.grey,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final Function onTap;
  final bool isExpand;

  const DescriptionSection(
      {super.key, required this.onTap, required this.isExpand});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Descriptions",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              ExplicitCollapseExpand(
                onTap: () {
                  onTap();
                },
              )
            ],
          ),
          AnimatedSize(
            duration: kAnimationDuration,
            child: SizedBox(
              height: isExpand ? null : 0.0,
              child: const Text(
                "Fashion is most often thought of as a global industry that is invested in anticipating what we wear and how we wish to appear to others. But fashion isn’t just a business. It’s also a cultural and social phenomenon, driven by the desire for the new. As such, the industry can never fully control fashion: fashion is all about being open to change.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "OUTFIT IDEAS",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Modern Blue Jacket",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "\$ 19.39",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}

class AppbarView extends StatelessWidget {
  final Function onTapBack;

  const AppbarView({super.key, required this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      expandedHeight: 300,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/11/16/10/vswardrobe.jpg?width=968",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ExplicitFavourite(),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => onTapBack(),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: kToolbarHeight,
                        left: 10,
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SizeChart {
  String size;
  bool isSelected;

  SizeChart(this.size, this.isSelected);
}
