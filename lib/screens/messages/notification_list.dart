import 'package:ewallet_app/app/app_link.dart';
import 'package:ewallet_app/constants/img_api.dart';
import 'package:ewallet_app/ui/themes/theme_button.dart';
import 'package:ewallet_app/utils/no_data.dart';
import 'package:flutter/material.dart';
import 'package:ewallet_app/models/notification.dart';
import 'package:ewallet_app/ui/themes/theme_spacing.dart';
import 'package:ewallet_app/widgets/notifications/filters.dart';
import 'package:ewallet_app/widgets/notifications/notif_item.dart';
import 'package:get/route_manager.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  List _filteredItems = [];
  String _selectedFilter = 'all';
  bool _isClear = false;

  void handleFilter(String type) {
    var result = notifList
      .where((item) => item.type == type)
      .toList();
    
    setState(() {
      _selectedFilter = type;
      if(type != 'all') {
        _filteredItems = result;
      } else {
         _filteredItems = notifList;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      _filteredItems = notifList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
              child: Text('${_filteredItems.length} Notifications'),
            ),
            TextButton(
              style: ThemeButton.textInvert(context),
              onPressed: () {
                setState(() {
                  _isClear = true;
                  _filteredItems = [];
                });
              },
              child: const Row(children: [
                Icon(Icons.clear_all_outlined, size: 18),
                SizedBox(width: 4,),
                Text('Clear All')
              ]),
            ),
          ],
        ),
        /// FILTER
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: NotificationFilters(
            selected: _selectedFilter,
            onChangeFilter: handleFilter,
          ),
        ),

        /// NOTIFICATION ITEMS
        _isClear ? _emptyList(context) : Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: _filteredItems.length,
            padding: EdgeInsets.only(bottom: spacingUnit(3)),
            itemBuilder: ((BuildContext context, int index){
              NotificationModel item = _filteredItems[index];
              return NotifItem(
                type: item.type,
                title: item.title,
                subtitle: item.subtitle,
                date: item.date,
                image: item.image,
                isRead: item.isRead,
                isLast: true,
                onTap: () {
                  if(item.type == 'info') {
                    Get.toNamed(AppLink.promoDetail);
                  } else {
                    Get.toNamed(AppLink.transactionDetail);
                  }
                },
              );
            })
          ),
        ),
      ],
    );
  }

  Widget _emptyList(BuildContext context) {
    return NoData(
      image: ImgApi.nodataNotif,
      title: 'All Clear Now',
      desc: 'Nulla condimentum pulvinar arcu a pellentesque.',
    );
  }
}