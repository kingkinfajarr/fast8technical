import 'package:fast8technical/cores/constants/app_color.dart';
import 'package:flutter/material.dart';
import '../address/presentation/address.dart';
import '../cart/presentation/cart_screen.dart';
import '../friends/presentation/friends_screen.dart';
import '../home/presentation/home_screen.dart';
import '../list_transaction/presentation/list_tansaction_screen.dart';
import '../search/presentation/search_screen.dart';
import '../voucher/presentation/voucher_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _initialChildSize = 0.11;
  final _minChildSize = 0.11;
  late double _maxChildSize;

  int _selectedIndex = 0;
  bool _isExpanded = false;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ListTrxScreen(),
    const VoucherScreen(),
    const AddressScreen(),
    const FriendsScreen(),
  ];

  static const List<BottomNavigationBarItem> _navItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Beranda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Keranjang',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'Transaksi',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Voucher',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on),
      label: 'Alamat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: 'Teman',
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    double itemHeight = 80.0;
    double gridHeight = (itemHeight * (1 + (_navItems.length / 3)).ceil());
    _maxChildSize = gridHeight / MediaQuery.of(context).size.height;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleExpansion(double offset) {
    if (offset > _initialChildSize) {
      setState(() {
        _isExpanded = true;
      });
    } else {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_isExpanded)
            Container(
              color: Colors.black.withOpacity(0.2),
            ),
          DraggableScrollableSheet(
            initialChildSize: _initialChildSize,
            minChildSize: _minChildSize,
            maxChildSize: _maxChildSize,
            snap: true,
            builder: (context, controller) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  _toggleExpansion(notification.extent);
                  return true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: clrWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: clrBlack.withOpacity(0.1),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: GridView.count(
                    controller: controller,
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    padding: const EdgeInsets.only(top: 15.0),
                    children: _navItems.map((item) {
                      final index = _navItems.indexOf(item);
                      final isSelected = _selectedIndex == index;

                      return GestureDetector(
                        onTap: () {
                          _onItemTapped(index);
                        },
                        child: Column(
                          children: [
                            Icon(
                              (item.icon as Icon).icon,
                              color: isSelected ? clrYellow : clrGray,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              item.label!,
                              style: TextStyle(
                                color: isSelected ? clrYellow : clrGray,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
