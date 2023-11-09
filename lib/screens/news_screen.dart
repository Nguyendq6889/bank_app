import 'package:bank_app/app_assets/app_styles.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_icons.dart';
import '../app_assets/app_images.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final PageController _bannerPageController = PageController(initialPage: 0);

  int _selectedBannerPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        title: Text(
          'Tin tức',
          style: AppStyles.titleAppBarBlack.copyWith(height: 1.2),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.iconBack, colorFilter: const ColorFilter.mode(Color(0xff4380F4), BlendMode.srcIn)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Colors.black.withOpacity(0.25),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  ExpandablePageView(
                    controller: _bannerPageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (index){
                      setState(() {
                        _selectedBannerPage = index;
                      });
                    },
                    children: [
                      _banner(AppImages.imageBanner, size),
                      _banner(AppImages.imageBanner2, size),
                      _banner(AppImages.imageBanner3, size),
                      _banner(AppImages.imageBanner4, size),
                    ]
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
                    child: Text(
                      'Ngân hàng đồng hành cùng doanh nghiệp, doanh nhân và người dân vượt "bão" Covid-19',
                      style: AppStyles.textButtonBlack
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.iconClock),
                        const SizedBox(width: 8),
                        Text(
                          "09:00 - 19/03/2020",
                          style: AppStyles.textFeatures.copyWith(color: const Color(0xffA1A1A1)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            _bannerPageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                          },
                          child: AnimatedContainer(
                            width: _selectedBannerPage == index ? 28 : 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _selectedBannerPage == index ? const Color(0xff5289F4) : const Color(0xffDDDDDD),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Tin tức gần đây",
                style: AppStyles.textButtonBlack
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  _recentNews(AppImages.imageNews1, 'Ngân hàng dành nhiều ưu đãi cho khách hàng mở và giao dịch thẻ trực tuyến'),
                  _recentNews(AppImages.imageNews2, 'Các ngân hàng liên kết tạo quỹ chống suy thoái trước tiền cảnh kinh tế ảnh hưởng dịch'),
                  _recentNews(AppImages.imageNews3, 'Bản tin Kinh tế - Tình hình kinh tế Quý I năm 2020')
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _banner(String image, Size size) {
    return Container(
      height: size.height * 26.108 / 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image), fit: BoxFit.cover,
          )
      ),
    );
  }

  Widget _recentNews(String image, String title) {
    return Row(
      children: [
        Container(
          height: 74,
          width: 112,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(image), fit: BoxFit.cover,
            )
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textFeatures,
              ),
              const SizedBox(height: 6),
              Text(
                "09:00 - 19/03/2020",
                style: AppStyles.textFeatures.copyWith(color: const Color(0xffA1A1A1)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
