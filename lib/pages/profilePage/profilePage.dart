import 'package:_04_health_check/util/util.dart';
import 'package:_04_health_check/widgets/cbButton/cbButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final gender = useState("Male");
    final enabled = useState(false);
    final init =
        useState(DateTime.now().subtract(const Duration(days: 3650 * 2)));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: colorScheme.onBackground,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          enabled.value
              ? IconButton(
                  padding: const EdgeInsets.all(18),
                  icon: Icon(Icons.save_as_outlined),
                  onPressed: () => enabled.value = false,
                )
              : IconButton(
                  padding: const EdgeInsets.all(18),
                  icon: Icon(Icons.edit),
                  onPressed: () => enabled.value = true,
                ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              Center(
                child: Column(
                  children: [
                    Text("User Name",
                        style: TextStyle(
                            fontSize: 24, color: colorScheme.onBackground)),
                    Text("email@email.com",
                        style: TextStyle(
                            fontSize: 16, color: colorScheme.primary)),
                    const SizedBox(height: 12),
                    // SizedBox(
                    //   height: 28,
                    //   width: 87,
                    //   child: TextButton(
                    //     style: ButtonStyle(
                    //         padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    //         backgroundColor:
                    //             MaterialStatePropertyAll(colorScheme.surface)),
                    //     onPressed: () => debugPrint("pressed"),
                    //     child: Text(
                    //       "Edit",
                    //       style: TextStyle(
                    //         color: colorScheme.primary,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      disabledHint: Text(
                        gender.value,
                        style: TextStyle(
                            fontSize: 20,
                            color: colorScheme.secondaryContainer),
                      ),
                      iconDisabledColor: colorScheme.secondaryContainer,
                      style: TextStyle(
                          color: enableColor(
                              enabled.value,
                              colorScheme.onBackground,
                              colorScheme.secondaryContainer)),
                      value: enabled.value ? gender.value : null,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                            value: "Male",
                            child:
                                Text("Male", style: TextStyle(fontSize: 20))),
                        DropdownMenuItem(
                            value: "Female",
                            child:
                                Text("Female", style: TextStyle(fontSize: 20))),
                      ],
                      onChanged: enabled.value
                          ? (value) => gender.value = value ?? "Male"
                          : null,
                    ),
                    Builder(
                      builder: (context) {
                        final DateFormat df = DateFormat("yyyy/MM/dd");
                        return InkWell(
                            onTap: enabled.value
                                ? () async {
                                    init.value = (await showDatePicker(
                                            firstDate: init.value.subtract(
                                                const Duration(days: 36500)),
                                            initialDate: init.value,
                                            context: context,
                                            lastDate: DateTime.now())) ??
                                        init.value;
                                  }
                                : null,
                            child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: enableColor(
                                          enabled.value,
                                          colorScheme.secondaryContainer,
                                          colorScheme.tertiary)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      df.format(init.value),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: enableColor(
                                            enabled.value,
                                            colorScheme.onBackground,
                                            colorScheme.secondaryContainer),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.calendar_month_outlined,
                                      color: enableColor(
                                          enabled.value,
                                          colorScheme.onBackground,
                                          colorScheme.tertiary)),
                                ],
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 32,
            child: CBButton(
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => debugPrint("pressed"),
            ),
          ),
        ],
      ),
    );
  }
}
