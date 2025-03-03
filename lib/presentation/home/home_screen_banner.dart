part of 'home_screen.dart';

class HomeScreenBanner extends StatelessWidget {

  final List<String> bannerList;

  const HomeScreenBanner({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: CarouselSlider.builder(
          itemCount: bannerList.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
            return _bannerItem(bannerList[itemIndex]);
          },
          options: CarouselOptions(
            aspectRatio: 16 / 6,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          )
      ),
    );
  }

  _bannerItem(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(url, fit: BoxFit.cover, width: 400,),
    );
  }

}