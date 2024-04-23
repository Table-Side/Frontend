import 'package:flutter/material.dart';
import 'package:table_side/components/async_builder.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/partials/edit_menu.dart';
import 'package:table_side/provider/menu_provider.dart';

class MenuView extends StatefulWidget {
  final String restaurantId;

  const MenuView({
    super.key,
    required this.restaurantId,
  });

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  late final TextEditingController _itemNameController;
  late final TextEditingController _itemPriceController;

  @override
  void initState() {
    _itemNameController = TextEditingController();
    _itemPriceController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Menu'),
      body: SingleChildScrollView(
        child: AsyncBuilder(
          selector: (final ref) =>
              ref.watch(menusProvider(widget.restaurantId)),
          builder: (context, final menus) {
            return EditMenu(
              restaurantId: widget.restaurantId,
              menuId: menus.first.id,
            );
          },
        ),
      ),
    );
  }
}
