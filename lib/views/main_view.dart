import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:test_task_tbr/providers/button_activation.dart';
import 'package:test_task_tbr/providers/selected_country.dart';
import 'package:test_task_tbr/views/sheet_view.dart';
import 'package:test_task_tbr/views/widgets/phone_number_field.dart';
import '../theme/constants.dart';

class MainView extends StatefulWidget {
  static const String screenHeading = "Get Started";

  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    final selectedCountry = context.watch<SelectedCountry>().country;
    return ChangeNotifierProvider<ButtonActivation>(
      create: (_) => ButtonActivation(),
      child: Consumer<ButtonActivation>(
        builder: (context, buttonActivation, _) {
          final isActivated = buttonActivation.isActivated;
          return CupertinoScaffold(
            body: Builder(
              builder: (context) => Scaffold(
                backgroundColor: primaryColor,
                floatingActionButton: FloatingActionButton(
                  disabledElevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                  backgroundColor: isActivated ? Colors.white : secondaryColor,
                  onPressed: isActivated ? () => {} : null,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    size: 32,
                    color: buttonActivation.isActivated
                        ? accentFontColor
                        : disabledAccentFontColor,
                  ),
                ),
                body: Container(
                  color: primaryColor,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(top: 40.0),
                              child: Text(
                                MainView.screenHeading,
                                style: TextStyle(
                                    fontSize: headingsFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () => CupertinoScaffold
                                      .showCupertinoModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const SheetView()),
                                  child: Container(
                                    height: inputsHeight,
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${selectedCountry.flag} ${selectedCountry.phoneCode}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: accentFontColor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Flexible(
                                  flex: 4,
                                  child: PhoneNumberField(),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
