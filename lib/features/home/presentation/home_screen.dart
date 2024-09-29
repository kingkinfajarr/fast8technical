import 'package:fast8technical/features/profile/presentation/main_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/constants/app_color.dart';
import 'blocs/get_explore_wellness/get_explore_wellness_bloc.dart';
import 'widgets/card_explore_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> financialPdc = [
      {
        'icon': Icons.people,
        'colorIcon': clrGreen,
        'title': 'Urun',
      },
      {
        'icon': Icons.people,
        'colorIcon': clrGreen,
        'title': 'Pembiayaan Porsi Haji',
      },
      {
        'icon': Icons.money,
        'colorIcon': clrYellow,
        'title': 'Financial Check Up',
      },
      {
        'icon': Icons.car_crash,
        'colorIcon': clrGray,
        'title': 'Asuransi Mobil',
      },
      {
        'icon': Icons.home_work_rounded,
        'colorIcon': clrRed,
        'title': 'Asuransi Properti',
      },
    ];

    final List<Map<String, dynamic>> selectedCategory = [
      {
        'icon': Icons.people,
        'colorIcon': clrBlue,
        'title': 'Hobi',
      },
      {
        'icon': Icons.people,
        'colorIcon': clrBlue,
        'title': 'Merchandise',
      },
      {
        'icon': Icons.money,
        'colorIcon': clrYellow,
        'title': 'Gaya Hidup Sehat',
      },
      {
        'icon': Icons.bookmark_border_outlined,
        'colorIcon': clrPurple,
        'title': 'Konseling & Rohani',
      },
      {
        'icon': Icons.home_work_rounded,
        'colorIcon': clrPurple,
        'title': 'Self Development',
      },
      {
        'icon': Icons.credit_card,
        'colorIcon': clrGreen,
        'title': 'Perencanaan Keuangan',
      },
      {
        'icon': Icons.masks,
        'colorIcon': clrGreen,
        'title': 'Konsultasi Medis',
      },
      {
        'icon': Icons.menu_open,
        'colorIcon': clrGray,
        'title': 'Lihat Semua',
      },
    ];

    String selectedFilter = 'cheap';

    Future<void> refreshData() async {
      BlocProvider.of<GetExploreWellnessBloc>(context)
          .add(LoadExploreWellnessItems());
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Column(
          children: [
            Container(
              color: clrYellow,
              padding: const EdgeInsets.only(
                left: 20,
                top: 50,
                right: 20,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Siang',
                        style: TextStyle(
                          color: clrWhite,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Kingkin',
                        style: TextStyle(
                          color: clrWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Badge.count(
                          count: 0,
                          child: const Icon(Icons.notifications),
                        ),
                        color: clrWhite,
                        onPressed: () {},
                        iconSize: 30,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const MainProfileScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin =
                                    Offset(1.0, 0.0); // Mulai dari kanan
                                const end = Offset(0.0, 0.0);
                                const curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: clrBlue.withOpacity(0.8),
                          child: Text(
                            'K',
                            style: TextStyle(
                              fontSize: 20,
                              color: clrWhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Scrollable content section
            Expanded(
              child: Container(
                color: clrYellow,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: clrWhite,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Add your content here
                      children: [
                        Text(
                          'Produk Keuangan',
                          style: TextStyle(
                            color: clrBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 220,
                          margin: const EdgeInsets.only(top: 20),
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            padding: EdgeInsets.zero,
                            children:
                                List.generate(financialPdc.length, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    financialPdc[index]['icon'],
                                    size: 35,
                                    color: financialPdc[index]['colorIcon'],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    financialPdc[index]['title'],
                                    style: TextStyle(color: clrGray),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Kategori Pilihan',
                              style: TextStyle(
                                color: clrBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Wishlist',
                                    style: TextStyle(
                                      color: clrGray,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: clrYellow,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '0',
                                      style: TextStyle(color: clrWhite),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 220,
                          margin: const EdgeInsets.only(top: 20),
                          child: GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            padding: EdgeInsets.zero,
                            children:
                                List.generate(selectedCategory.length, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    selectedCategory[index]['icon'],
                                    size: 35,
                                    color: selectedCategory[index]['colorIcon'],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    selectedCategory[index]['title'],
                                    style: TextStyle(color: clrGray),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Explore Wellness',
                                style: TextStyle(
                                  color: clrBlack,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 170,
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: selectedFilter,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'cheap',
                                    child: FittedBox(
                                      fit: BoxFit
                                          .scaleDown, // Menyesuaikan ukuran teks
                                      child: Text(
                                        'Harga Terendah',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'expensive',
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Harga Termahal',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'ASC',
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'A to Z',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'DESC',
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Z to A',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      selectedFilter = value;
                                    });
                                    BlocProvider.of<GetExploreWellnessBloc>(
                                            context)
                                        .add(
                                      SortExploreWellnessItems(
                                        selectedFilter,
                                      ),
                                    );
                                  }
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                ),
                                dropdownColor: Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1200,
                          margin: const EdgeInsets.only(top: 20),
                          child: BlocBuilder<GetExploreWellnessBloc,
                              GetExploreWellnessState>(
                            builder: (context, state) {
                              if (state is GetExploreWellnessLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (state is GetExploreWellnessSuccess) {
                                return GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.4),
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  padding: EdgeInsets.zero,
                                  children:
                                      state.exploreWellnessItems.map((item) {
                                    return CardExplore(
                                      title: item.title,
                                      price: item.price,
                                      discountPct: item.discountPct,
                                      discountPrice: item.discountPrice,
                                    );
                                  }).toList(),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
