// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:setup_provider/application/home_provider.dart';
import 'package:setup_provider/domain/model/restaurant_model.dart';
import 'package:setup_provider/presentation/components/loading.dart';
import 'package:setup_provider/presentation/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().getInfos(context: context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final event = context.read<HomeProvider>();
    final state = context.watch<HomeProvider>();
    return Scaffold(
        backgroundColor: Color(0xffF4F5F8),
        body: state.isLoading
            ? const Center(child: Loading())
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Restaurants',
                        style: Style.bold(size: 20, color: Style.black),
                      ),
                      12.verticalSpace,
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.restaurantModel?.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Container(
                                height: 248.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Style.white,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 118.h,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                '${state.restaurantModel?.data?[index].backgroundImg}'),
                                          ),
                                          color: Style.primaryColor,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24))),
                                    ),
                                    27.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Text(
                                        '${state.restaurantModel?.data?[index].status}',
                                        style: Style.bold(),
                                      ),
                                    ),
                                    3.verticalSpace,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Text(
                                        '${state.restaurantModel?.data?[index].translation?.description ?? 'No thing'}',
                                        maxLines: 2,
                                        style: Style.regular(),
                                      ),
                                    ),
                                    16.verticalSpace,
                                    const Divider(
                                      color: Style.textColor,
                                    )
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
              ));
  }
}
