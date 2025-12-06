import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple/Alertbox/AlertDialogBox.dart';
import 'package:simple/Alertbox/snackBarAlert.dart';
import 'package:simple/Bloc/AddCategory/add_edit_category_bloc.dart';
import 'package:simple/Bloc/AddProduct/add_edit_product_bloc.dart';
import 'package:simple/Bloc/Category/category_bloc.dart';
import 'package:simple/Bloc/CustomTabBar/dash_bloc.dart';
import 'package:simple/Bloc/Expense/expense_bloc.dart';
import 'package:simple/Bloc/Report/report_bloc.dart';
import 'package:simple/Bloc/ShiftClosing/shift_closing_bloc.dart';
import 'package:simple/Bloc/StockIn/stock_in_bloc.dart';
import 'package:simple/Bloc/Products/product_category_bloc.dart';
import 'package:simple/ModelClass/Order/Get_view_order_model.dart';
import 'package:simple/ModelClass/ShopDetails/getStockMaintanencesModel.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/UI/AddCategory/category_list.dart';
import 'package:simple/UI/AddProduct/product_list.dart';
import 'package:simple/UI/Authentication/login_screen.dart';
import 'package:simple/UI/CustomAppBar/custom_appbar.dart';
import 'package:simple/UI/Expenses/expense_page.dart';
import 'package:simple/UI/Home_screen/home_screen.dart';
import 'package:simple/UI/Order/order_list.dart';
import 'package:simple/UI/Order/order_tab_page.dart';
import 'package:simple/UI/Products/product_Category.dart';
import 'package:simple/UI/ShiftClosing/shift_closing.dart';
import 'package:simple/UI/StockIn/stock_in.dart';
import '../Report/report_order.dart';

class DashBoardScreen extends StatelessWidget {
  final int? selectTab;
  final GetViewOrderModel? existingOrder;
  final bool? isEditingOrder;
  const DashBoardScreen(
      {super.key, this.selectTab, this.existingOrder, this.isEditingOrder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashBloc(),
      child: DashBoard(
        selectTab: selectTab,
        existingOrder: existingOrder,
        isEditingOrder: isEditingOrder,
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  final int? selectTab;
  final GetViewOrderModel? existingOrder;
  final bool? isEditingOrder;

  const DashBoard({
    super.key,
    this.selectTab,
    this.existingOrder,
    this.isEditingOrder,
  });

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GetStockMaintanencesModel getStockMaintanencesModel =
      GetStockMaintanencesModel();
  bool stockLoad = false;
  final GlobalKey<OrderViewViewState> orderAllTabKey =
      GlobalKey<OrderViewViewState>();
  final GlobalKey<FoodOrderingScreenViewState> foodKey =
      GlobalKey<FoodOrderingScreenViewState>();
  final GlobalKey<ReportViewViewState> reportKey =
      GlobalKey<ReportViewViewState>();
  final GlobalKey<StockViewViewState> stockKey =
      GlobalKey<StockViewViewState>();
  final GlobalKey<OrderTabViewViewState> orderTabKey =
      GlobalKey<OrderTabViewViewState>();
  final GlobalKey<ProductViewViewState> productKey =
      GlobalKey<ProductViewViewState>();
  final GlobalKey<ExpenseViewViewState> expenseKey =
      GlobalKey<ExpenseViewViewState>();
  final GlobalKey<ShiftViewViewState> shiftKey =
      GlobalKey<ShiftViewViewState>();
  final GlobalKey<CategoryListViewState> catKey =
      GlobalKey<CategoryListViewState>();
  final GlobalKey<ProductListViewState> proKey =
      GlobalKey<ProductListViewState>();
  int selectedIndex = 0;
  bool orderLoad = false;
  bool hasRefreshedOrder = false;
  bool hasRefreshedReport = false;
  bool hasRefreshedStock = false;
  bool hasRefreshedProduct = false;
  bool hasRefreshedExpense = false;
  bool hasRefreshedShift = false;
  bool hasRefreshedCategory = false;
  bool hasRefreshedAddProduct = false;

  @override
  void initState() {
    super.initState();
    if (widget.selectTab != null) {
      selectedIndex = widget.selectTab!;
    }
    context.read<DashBloc>().add(StockDashDetails());
    setState(() {
      stockLoad = true;
    });
  }

  void _resetOrderTab() {
    final orderTabState = orderTabKey.currentState;
    if (orderTabState != null) {
      orderTabState.resetSelections();
    } else {
      debugPrint("orderTabState is NULL — check if key is assigned properly");
    }
  }

  void _refreshOrders() {
    final orderAllTabState = orderAllTabKey.currentState;
    if (orderAllTabState != null) {
      orderAllTabState.refreshOrders();
    }
  }

  void _refreshHome() {
    final foodKeyState = foodKey.currentState;
    if (foodKeyState != null) {
      foodKeyState.refreshHome();
    } else {
      debugPrint("foodKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshReport() {
    final reportKeyState = reportKey.currentState;
    if (reportKeyState != null) {
      reportKeyState.refreshReport();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshStock() {
    final stockKeyState = stockKey.currentState;
    if (stockKeyState != null) {
      stockKeyState.refreshStock();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshProduct() {
    final productKeyState = productKey.currentState;
    if (productKeyState != null) {
      productKeyState.refreshProduct();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshExpense() {
    final expenseKeyState = expenseKey.currentState;
    if (expenseKeyState != null) {
      expenseKeyState.refreshExpense();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshShift() {
    final shiftKeyState = shiftKey.currentState;
    if (shiftKeyState != null) {
      shiftKeyState.refreshShift();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshCategory() {
    final catKeyState = catKey.currentState;
    if (catKeyState != null) {
      catKeyState.refreshCategory();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  void _refreshAddProduct() {
    final proKeyState = proKey.currentState;
    if (proKeyState != null) {
      proKeyState.refreshAddProduct();
    } else {
      debugPrint("reportKeyState is NULL — check if key is assigned properly");
    }
  }

  Widget buildDrawerItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? appPrimaryColor : greyColor,
        size: 24,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? appPrimaryColor : greyColor,
        ),
      ),
      selected: isSelected,
      selectedTileColor: appPrimaryColor.withOpacity(0.1),
      onTap: onTap,
    );
  }

  // In your _DashBoardState class, replace the buildDrawer() method with this:

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 16),
          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildDrawerItem(
                  icon: Icons.home_outlined,
                  label: "Home",
                  index: 0,
                  isSelected:
                      selectedIndex == 0, // Use selectedIndex state variable
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.pop(context);

                    // Trigger refresh logic
                    hasRefreshedOrder = true;
                    hasRefreshedReport = false;
                    hasRefreshedStock = false;
                    hasRefreshedProduct = false;
                    hasRefreshedExpense = false;
                    hasRefreshedShift = false;
                    hasRefreshedCategory = false;
                    hasRefreshedAddProduct = false;
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => _refreshHome());
                  },
                ),
                buildDrawerItem(
                  icon: Icons.shopping_cart_outlined,
                  label: "Orders",
                  index: 1,
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    Navigator.pop(context);

                    hasRefreshedOrder = false;
                    hasRefreshedReport = false;
                    hasRefreshedStock = false;
                    hasRefreshedProduct = false;
                    hasRefreshedExpense = false;
                    hasRefreshedShift = false;
                    hasRefreshedCategory = false;
                    hasRefreshedAddProduct = false;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _refreshOrders();
                      _resetOrderTab();
                    });
                  },
                ),
                buildDrawerItem(
                  icon: Icons.note_alt_outlined,
                  label: "Report",
                  index: 2,
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedReport) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = true;
                      hasRefreshedStock = false;
                      hasRefreshedProduct = false;
                      hasRefreshedExpense = false;
                      hasRefreshedShift = false;
                      hasRefreshedCategory = false;
                      hasRefreshedAddProduct = false;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshReport();
                      });
                    }
                  },
                ),
                if (getStockMaintanencesModel.data?.stockMaintenance == true)
                  buildDrawerItem(
                    icon: Icons.inventory,
                    label: "Stockin",
                    index: 3,
                    isSelected: selectedIndex == 3,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                      Navigator.pop(context);

                      if (!hasRefreshedStock) {
                        hasRefreshedOrder = false;
                        hasRefreshedReport = false;
                        hasRefreshedStock = true;
                        hasRefreshedProduct = false;
                        hasRefreshedExpense = false;
                        hasRefreshedShift = false;
                        hasRefreshedCategory = false;
                        hasRefreshedAddProduct = false;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _refreshStock();
                        });
                      }
                    },
                  ),
                buildDrawerItem(
                  icon: Icons.shopping_bag_outlined,
                  label: "Products",
                  index: 4,
                  isSelected: selectedIndex == 4,
                  onTap: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedProduct) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = false;
                      hasRefreshedStock = false;
                      hasRefreshedExpense = false;
                      hasRefreshedProduct = true;
                      hasRefreshedShift = false;
                      hasRefreshedCategory = false;
                      hasRefreshedAddProduct = false;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshProduct();
                      });
                    }
                  },
                ),
                buildDrawerItem(
                  icon: Icons.pie_chart_outline,
                  label: "Expense",
                  index: 5,
                  isSelected: selectedIndex == 5,
                  onTap: () {
                    setState(() {
                      selectedIndex = 5;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedExpense) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = false;
                      hasRefreshedStock = false;
                      hasRefreshedProduct = false;
                      hasRefreshedExpense = true;
                      hasRefreshedShift = false;
                      hasRefreshedCategory = false;
                      hasRefreshedAddProduct = false;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshExpense();
                      });
                    }
                  },
                ),
                buildDrawerItem(
                  icon: Icons.south_east,
                  label: "ShiftClose",
                  index: 6,
                  isSelected: selectedIndex == 6,
                  onTap: () {
                    setState(() {
                      selectedIndex = 6;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedShift) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = false;
                      hasRefreshedStock = false;
                      hasRefreshedProduct = false;
                      hasRefreshedExpense = false;
                      hasRefreshedShift = true;
                      hasRefreshedCategory = false;
                      hasRefreshedAddProduct = false;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshShift();
                      });
                    }
                  },
                ),
                buildDrawerItem(
                  icon: Icons.folder_shared,
                  label: "Add Categories",
                  index: 7,
                  isSelected: selectedIndex == 7,
                  onTap: () {
                    setState(() {
                      selectedIndex = 7;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedCategory) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = false;
                      hasRefreshedStock = false;
                      hasRefreshedProduct = false;
                      hasRefreshedExpense = false;
                      hasRefreshedShift = false;
                      hasRefreshedCategory = true;
                      hasRefreshedAddProduct = false;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshCategory();
                      });
                    }
                  },
                ),
                buildDrawerItem(
                  icon: Icons.shopping_cart_outlined,
                  label: "Add Products",
                  index: 8,
                  isSelected: selectedIndex == 8,
                  onTap: () {
                    setState(() {
                      selectedIndex = 8;
                    });
                    Navigator.pop(context);

                    if (!hasRefreshedAddProduct) {
                      hasRefreshedOrder = false;
                      hasRefreshedReport = false;
                      hasRefreshedStock = false;
                      hasRefreshedProduct = false;
                      hasRefreshedExpense = false;
                      hasRefreshedShift = false;
                      hasRefreshedCategory = false;
                      hasRefreshedAddProduct = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _refreshAddProduct();
                      });
                    }
                  },
                ),
              ],
            ),
          ),

          // Logout at bottom
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              showLogoutDialog(context);
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget mainContainer() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          selectedIndex: selectedIndex,
          onTabSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
            if (index == 0 && !hasRefreshedOrder) {
              hasRefreshedOrder = true;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => _refreshHome());
            }
            if (index == 1) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshOrders();
                _resetOrderTab();
              });
            }
            if (index == 2 && !hasRefreshedReport) {
              hasRefreshedOrder = false;
              hasRefreshedReport = true;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshReport();
              });
            }
            if (index == 3 && !hasRefreshedStock) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = true;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshStock();
              });
            }
            if (index == 4 && !hasRefreshedProduct) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedExpense = false;
              hasRefreshedProduct = true;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshProduct();
              });
            }
            if (index == 5 && !hasRefreshedExpense) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = true;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshExpense();
              });
            }
            if (index == 6 && !hasRefreshedShift) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = true;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshShift();
              });
            }
            if (index == 7 && !hasRefreshedCategory) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = true;
              hasRefreshedAddProduct = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshCategory();
              });
            }
            if (index == 8 && !hasRefreshedAddProduct) {
              hasRefreshedOrder = false;
              hasRefreshedReport = false;
              hasRefreshedStock = false;
              hasRefreshedProduct = false;
              hasRefreshedExpense = false;
              hasRefreshedShift = false;
              hasRefreshedCategory = false;
              hasRefreshedAddProduct = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _refreshAddProduct();
              });
            }
          },
          onLogout: () {
            showLogoutDialog(context);
          },
        ),
        drawer: buildDrawer(),
        body: IndexedStack(
          index: selectedIndex,
          children: [
            hasRefreshedOrder == true
                ? BlocProvider(
                    create: (_) => FoodCategoryBloc(),
                    child: FoodOrderingScreenView(
                      key: foodKey,
                      existingOrder: widget.existingOrder,
                      isEditingOrder: widget.isEditingOrder,
                      hasRefreshedOrder: hasRefreshedOrder,
                    ))
                : BlocProvider(
                    create: (_) => FoodCategoryBloc(),
                    child: FoodOrderingScreen(
                      key: foodKey,
                      existingOrder: widget.existingOrder,
                      isEditingOrder: widget.isEditingOrder,
                      hasRefreshedOrder: hasRefreshedOrder,
                    ),
                  ),
            OrdersTabbedScreen(
              key: PageStorageKey('OrdersTabbedScreen'),
              orderAllKey: orderAllTabKey,
              orderResetKey: orderTabKey,
            ),
            hasRefreshedReport == true
                ? BlocProvider(
                    create: (_) => ReportTodayBloc(),
                    child: ReportViewView(
                      key: reportKey,
                      hasRefreshedReport: hasRefreshedReport,
                    ))
                : BlocProvider(
                    create: (_) => ReportTodayBloc(),
                    child: ReportView(
                      key: reportKey,
                      hasRefreshedReport: hasRefreshedReport,
                    ),
                  ),
            hasRefreshedStock == true
                ? BlocProvider(
                    create: (_) => StockInBloc(),
                    child: StockViewView(
                      key: stockKey,
                      hasRefreshedStock: hasRefreshedStock,
                    ))
                : BlocProvider(
                    create: (_) => StockInBloc(),
                    child: StockView(
                      key: stockKey,
                      hasRefreshedStock: hasRefreshedStock,
                    ),
                  ),
            hasRefreshedProduct == true
                ? BlocProvider(
                    create: (_) => ProductCategoryBloc(),
                    child: ProductViewView(
                      key: productKey,
                      hasRefreshedProduct: hasRefreshedProduct,
                    ))
                : BlocProvider(
                    create: (_) => ProductCategoryBloc(),
                    child: ProductView(
                      key: productKey,
                      hasRefreshedProduct: hasRefreshedProduct,
                    ),
                  ),
            hasRefreshedExpense == true
                ? BlocProvider(
                    create: (_) => ExpenseBloc(),
                    child: ExpenseViewView(
                      key: expenseKey,
                      hasRefreshedExpense: hasRefreshedExpense,
                    ))
                : BlocProvider(
                    create: (_) => ExpenseBloc(),
                    child: ExpenseView(
                      key: expenseKey,
                      hasRefreshedExpense: hasRefreshedExpense,
                    ),
                  ),
            hasRefreshedShift == true
                ? BlocProvider(
                    create: (_) => ShiftClosingBloc(),
                    child: ShiftViewView(
                      key: shiftKey,
                      hasRefreshedShift: hasRefreshedShift,
                    ))
                : BlocProvider(
                    create: (_) => ShiftClosingBloc(),
                    child: ShiftView(
                      key: shiftKey,
                      hasRefreshedShift: hasRefreshedShift,
                    ),
                  ),
            hasRefreshedCategory == true
                ? BlocProvider(
                    create: (_) => CategoryBloc(),
                    child: CategoryListView(
                      key: catKey,
                      hasRefreshedCategory: hasRefreshedCategory,
                    ))
                : BlocProvider(
                    create: (_) => CategoryBloc(),
                    child: CategoryList(
                      key: catKey,
                      hasRefreshedCategory: hasRefreshedCategory,
                    ),
                  ),
            hasRefreshedAddProduct == true
                ? BlocProvider(
                    create: (_) => ProductBloc(),
                    child: ProductListView(
                      key: proKey,
                      hasRefreshedAddProduct: hasRefreshedAddProduct,
                    ))
                : BlocProvider(
                    create: (_) => ProductBloc(),
                    child: ProductList(
                      key: proKey,
                      hasRefreshedAddProduct: hasRefreshedAddProduct,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBloc, dynamic>(
      buildWhen: (previous, current) {
        if (current is GetStockMaintanencesModel) {
          getStockMaintanencesModel = current;
          if (getStockMaintanencesModel.errorResponse?.isUnauthorized == true) {
            _handle401Error();
            return true;
          }
          if (getStockMaintanencesModel.success == true) {
            setState(() {
              stockLoad = false;
            });
          } else {
            setState(() {
              stockLoad = false;
            });
            showToast("No Stock found", context, color: false);
          }
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return mainContainer();
      },
    );
  }

  void _handle401Error() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("token");
    await sharedPreferences.clear();
    showToast("Session expired. Please login again.", context, color: false);

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
