import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anime/view/admin/product_management_screen.dart';
import 'package:anime/view/admin/sales_management_screen.dart';

import '../../utils/common_func.dart';
import '../customer/blogs/blogs_screen.dart';

class AdminRootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminRootScreen();
}

class _AdminRootScreen extends State<AdminRootScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ProductManagementScreen(),
    SalesManagementScreen(),
    BlogsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void reloadView() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                            onPressed: () {
                              CommonFunc.goToChatScreen();
                            },  
                            icon: const Icon(
                              Icons.chat_outlined,
                              color: Colors.green,
                            )),
                  const Padding(
                    padding: EdgeInsets.only(left: 100.0),
                    child: Text(
                      'ADMIN',
                      style: TextStyle(color: Colors.black, fontSize: 26.0),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        CommonFunc.goToProfileScreen();
                      },
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        color: Colors.green,
                      ))
                ],
              ),
              Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits),
              label: 'Sản phẩm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.point_of_sale_rounded),
              label: 'Bán hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add_rounded),
              label: 'Bài viết',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
