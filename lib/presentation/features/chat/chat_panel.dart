import 'package:flutter/material.dart';

class ChatPanel extends StatelessWidget {
  const ChatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(12),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Чат", style: Theme.of(context).textTheme.titleMedium),
                    IconButton(onPressed: null, icon: Icon(Icons.chat)),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(fit: FlexFit.tight, child: Container()),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).disabledColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 12,
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: TextField(
                              expands: false,
                              maxLines: null,
                              decoration: InputDecoration(
                                label: Text("Задайте любой вопрос..."),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.surface,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Wrap(
                                      spacing: 4,
                                      direction: Axis.horizontal,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.search),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.cyclone),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.lightbulb_rounded),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Theme.of(context).colorScheme.surface,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Wrap(
                                      spacing: 4,
                                      direction: Axis.horizontal,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.memory),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.language),
                                        ),
                                        IconButton.filled(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.multitrack_audio_rounded,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
