import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:old_style_flutter_hfm/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  HomeViewDesktop({super.key});

  ValueNotifier<bool> onTap = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 197, 197, 197),
          border: Border(
            top: BorderSide(color: Colors.white, width: 2),
          ),
        ),
        height: 32,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              ValueListenableBuilder(
                  valueListenable: onTap,
                  builder: (context, x, child) {
                    return onTap.value == false
                        ? InkWell(
                            onTap: () {
                              SystemSound.play(SystemSoundType.click);

                              onTap.value = true;
                              Future.delayed(Duration(
                                seconds: 1,
                              )).then((value) => onTap.value = false);
                            },
                            child: Container(
                              width: 42,
                              decoration: const BoxDecoration(
                                  border: Border(
                                top: BorderSide(color: Colors.white, width: 2),
                                left: BorderSide(color: Colors.white, width: 2),
                                bottom:
                                    BorderSide(color: Colors.black87, width: 2),
                                right:
                                    BorderSide(color: Colors.black87, width: 2),
                              )),
                              child: const Text(
                                'Start',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : Container(
                            width: 42,
                            decoration: const BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  width: 2),
                              left: BorderSide(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  width: 2),
                              bottom: BorderSide(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  width: 2),
                              right: BorderSide(
                                  color: Color.fromARGB(255, 197, 197, 197),
                                  width: 2),
                            )),
                            child: const Text(
                              'Start',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                  }),
              const Spacer(),
              Container(
                width: 42,
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.white, width: 2),
                  left: BorderSide(color: Colors.white, width: 2),
                  bottom: BorderSide(color: Colors.black87, width: 2),
                  right: BorderSide(color: Colors.black87, width: 2),
                )),
                child: StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Text(
                      DateFormat('HH:mm').format(DateTime.now()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 57, 129, 130),
        width: 2560,
        height: kdDesktopMaxContentHeight,
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [],
        ),
      ),
    );
  }
}
