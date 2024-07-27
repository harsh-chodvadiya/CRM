import 'package:crm/src/constant/constant.dart';
import 'package:crm/src/routes/routes.gr.dart';
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
                    // SizedBox(height: 32,
                    // SafeArea(
                    //   bottom: false,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       FxBox.w16,
                    //       Text(
                    //         ConstString.crm,
                    //         style: GoogleFonts.poppins(
                    //           textStyle: TextStyle(
                    //             fontSize: 36,
                    //             fontWeight: FontWeight.w800,
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 32,
                    // SizedBox(height: 16,
                    Expanded(
                      child: ListView.separated(
                        itemCount: _option.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8.0.r),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () =>
                                  tabsRouter.setActiveIndex(_option[index][2]),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 40.0,
                                    top: 16.0,
                                    bottom: 16.0,
                                    right: 16.0),
                                decoration: (_option[index][2] !=
                                        tabsRouter.activeIndex)
                                    ? null
                                    : BoxDecoration(
                                        color:
                                            Palette.textBlue.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(10),
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
                          );
                        },
                      ),
                    ),
                    // SafeArea(
                    //   bottom: true,
                    //   top: false,
                    //   minimum: const EdgeInsets.only(bottom: 16.0),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Eres Hospital Admin Dashboard\n© 2020 All Rights Reserved",
                    //       style: GoogleFonts.poppins(
                    //         textStyle: const TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400,
                    //           color: CrmColor.mailTextDartColor,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SafeArea(
                    //   bottom: true,
                    //   top: false,
                    //   minimum: const EdgeInsets.only(bottom: 16.0),
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       "Made with ♥ by Sarvadhi",
                    //       style: GoogleFonts.poppins(
                    //         textStyle: const TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.w400,
                    //           color: CrmColor.mailTextDartColor,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: Scaffold(
                  // appBar: AppBar(
                  //   toolbarHeight: 70,
                  //   automaticallyImplyLeading: false,
                  //   centerTitle: false,
                  //   leading: HospitalResponsive.isLargeWeb(context) ||
                  //           HospitalResponsive.isMediumWeb(context)
                  //       ? null
                  //       : IconButton(
                  //           onPressed: () =>
                  //               _scaffoldKey.currentState?.openDrawer(),
                  //           icon: const SvgIcon(
                  //             icon: ConstIcons.menu,
                  //             color: Colors.black,
                  //             size: 25,
                  //           ),
                  //         ),
                  //   titleSpacing: 24.0,
                  //   title: Responsive.isWeb(context)
                  //       ? Text(
                  //           context.router.currentPath
                  //               .split('/')
                  //               .last
                  //               .route
                  //               .split('_')
                  //               .first,
                  //           style: GoogleFonts.poppins(
                  //               textStyle: const TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w600,
                  //           )),
                  //         )
                  //       : const Row(),
                  //   actions: [
                  //     _back(),
                  //     FxBox.w6,
                  //     _buyNow(),
                  //     FxBox.w6,
                  //     InkWell(
                  //       splashColor: Colors.transparent,
                  //       hoverColor: Colors.transparent,
                  //       highlightColor: Colors.transparent,
                  //       onTap: () => crmThemeMode.value = !crmThemeMode.value,
                  //       child: Icon(
                  //         !context.isDarkMode
                  //             ? Icons.light_mode_outlined
                  //             : Icons.dark_mode_outlined,
                  //       ),
                  //     ),
                  //     FxBox.w8,
                  //     _notification(
                  //         icons: ConstIcons.notification,
                  //         color: Theme.of(context).primaryColor,
                  //         count: "5"),
                  //     Responsive.isMobile(context) ? FxBox.w8 : FxBox.w8,
                  //     _headerIconView(
                  //         ConstIcons.chats, Theme.of(context).primaryColor, "5",
                  //         () {
                  //       log("tapp");
                  //       _scaffoldKey.currentState?.openEndDrawer();
                  //       const HospitalEndDrawer();
                  //     }),
                  //     Responsive.isMobile(context) ? FxBox.w8 : FxBox.w8,
                  //     // _headerIconView(ConstIcons.promos,
                  //     //     Theme.of(context).primaryColor, "2", () {}),
                  //     // Responsive.isMobile(context) ? FxBox.w8 : FxBox.w8,
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: Theme.of(context)
                  //               .primaryColor
                  //               .withOpacity(0.2)),
                  //       child: Row(
                  //         children: [
                  //           FxBox.w6,
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               border: Border.all(
                  //                 color: Theme.of(context).primaryColor,
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //             ),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(20),
                  //               child: Image.asset(
                  //                 Images.profileImage,
                  //                 height: HospitalResponsive.isMobile(context)
                  //                     ? 40.0
                  //                     : 30.0,
                  //                 width: HospitalResponsive.isMobile(context)
                  //                     ? 40.0
                  //                     : 30.0,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           if (!HospitalResponsive.isMobile(context) &&
                  //               !HospitalResponsive.isTablet(context))
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                   horizontal: 10, vertical: 10),
                  //               child: Text(
                  //                 "Hello, Sultads",
                  //                 style: GoogleFonts.poppins(
                  //                     textStyle: const TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w600,
                  //                 )),
                  //                 textAlign: TextAlign.center,
                  //               ),
                  //             ),
                  //         ],
                  //       ),
                  //     ),
                  //     FxBox.w12,
                  //   ],
                  // ),
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
