import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/routes/routes.gr.dart';
import 'package:crm/src/widget/svg_icon.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<PageRouteInfo<dynamic>> routes = [
    const Dashboard(),
    const Leads(),
    const Contacts(),
  ];

  final List<List<dynamic>> _option = [
    ['Dashboard', Icons.dashboard_rounded, 0],
    ['Leads', Icons.list_rounded, 1],
    ['Contacts', Icons.person_4_rounded, 2],
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        autoTabRouter = tabsRouter;
        return Scaffold(
          // endDrawer: const HospitalEndDrawer(),
          // key: _scaffoldKey,
          // drawer: CrmDrawer(
          //   tabsRouter: tabsRouter,
          //   scaffoldKey: _scaffoldKey,
          // ),
          body: Row(
            children: [
              Drawer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0.r),
                    SafeArea(
                      bottom: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SvgIcon('assets/icon.svg'),
                          SizedBox(width: 16.0.r),
                          Text(
                            'Sarvadhi CRM',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Palette.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0.r),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        itemCount: _option.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8.0.r),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () =>
                                  tabsRouter.setActiveIndex(_option[index][2]),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(12.0.r),
                                      decoration: (_option[index][2] !=
                                              tabsRouter.activeIndex)
                                          ? null
                                          : BoxDecoration(
                                              color: Palette.textBlue
                                                  .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            _option[index][1],
                                            color: (_option[index][2] ==
                                                    tabsRouter.activeIndex)
                                                ? Palette.textBlue
                                                : Palette.textGray,
                                          ),
                                          SizedBox(width: 16.0.r),
                                          Text(
                                            _option[index][0],
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: (_option[index][2] ==
                                                        tabsRouter.activeIndex)
                                                    ? Palette.textBlue
                                                    : Palette.textGray,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 70,
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    actions: const [],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
