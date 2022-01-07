

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_apps/service/display/change_display.dart';
import 'package:github_apps/service/paginate/paginate_event.dart';
import 'package:github_apps/service/search/search_bloc.dart';
import 'package:github_apps/service/tabbar/tab_bar_cubit.dart';
import 'package:github_apps/service/user/bloc.dart';
import 'package:github_apps/view/home/fragment/issues_fragment.dart';
import 'package:github_apps/view/home/fragment/repository_fragment.dart';
import 'package:github_apps/view/home/fragment/user_fragment.dart';
import 'package:github_apps/view/home/component/issue_component.dart';
import 'package:github_apps/view/home/component/repo_component.dart';
import 'package:github_apps/view/home/search_bar.dart';
import 'package:github_apps/view/home/top_widget.dart';
import 'package:github_apps/view/home/component/user_component.dart';
import 'package:github_apps/view/tabbar/md2_tab_indicator.dart';
import 'package:github_apps/view/utils/helpers.dart';
import 'package:github_apps/view/utils/loading_indicator.dart';
import 'package:github_apps/view/utils/ui_lib.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget  {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TabBarCubit tabBarCubit;
  late ScrollController scrollController;
  late ChangeDisplay changeDisplay;

  List<Widget> listWidget = [
    const UserFragment(),
    const RepositoryFragment(),
    const IssuesFragment()
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    tabBarCubit = context.read<TabBarCubit>();
    changeDisplay = context.read<ChangeDisplay>();

    _tabController.addListener(() {
      tabBarCubit.changeIndex(_tabController.index);
    });

    scrollController.addListener(() {
        if ((scrollController.position.pixels == scrollController.position.maxScrollExtent)) {
          if (changeDisplay.state == DisplayState.loadingState) {
          eventBus.fire(PaginateEventBus(
              _tabController.index
          ));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiLib.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: Helpers.getWidthPageSize(context),
          height: Helpers.getHeightPageSize(context),
          child: RefreshIndicator(
            backgroundColor: const Color(0xff26282F),
            color: Colors.white,
            onRefresh: () async {
              eventBus.fire(RefreshEventBus(_tabController.index));
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopWidget(),
                    const SizedBox(height: 24,),
                    Row(
                      children: [
                        const Expanded(child: SearchBar()),
                        const SizedBox(width: 8,),
                        InkWell(
                          onTap: showSettingModal,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                            decoration: BoxDecoration(
                              color: const Color(0xff26282F),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Icon(
                              CupertinoIcons.settings,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    TabBar(
                      labelStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w700
                      ),
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.white,
                      unselectedLabelColor: const Color(0xff5f6368),
                      isScrollable: false,
                      indicator: const MD2Indicator(
                          indicatorHeight: 3,
                          indicatorColor: Colors.white,
                          indicatorSize: MD2IndicatorSize.full
                      ),
                      tabs: const [
                        Tab(
                          text: "User",
                        ),
                        Tab(
                          text: "Repositories",
                        ),
                        Tab(
                          text: "Issues",
                        ),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    BlocBuilder<TabBarCubit, int>(
                      builder: (context, state) {
                        return listWidget[state];
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }

  void showSettingModal() {
    showCupertinoModalBottomSheet(
      context: context,
      expand: true,
      bounce: true,
      builder: (context) => Scaffold(
        backgroundColor: const Color(0xff26282F),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ChangeDisplay, DisplayState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(height: 8,),
                    Center(
                      child: Text(
                        "Change Display",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(height: 32,),
                    InkWell(
                      onTap: () {
                        changeDisplay.changeState(DisplayState.loadingState);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: Helpers.getWidthPageSize(context),
                        decoration: BoxDecoration(
                            color: state == DisplayState.loadingState ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            const LoadingIndicator(),
                            const SizedBox(height: 32,),
                            Text(
                              "Lazy Loading",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    InkWell(
                      onTap: () {
                        changeDisplay.changeState(DisplayState.indexState);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: Helpers.getWidthPageSize(context),
                        decoration: BoxDecoration(
                            color: state == DisplayState.indexState ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              "1, 2, 3",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 21,),
                            Text(
                              "With Index",
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
