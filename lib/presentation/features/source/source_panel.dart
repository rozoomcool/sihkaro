import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/widgets/collapsed_container.dart';

class SourcePanel extends StatelessWidget {
  const SourcePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsedContainer(
      size: 400,
      collapsedSize: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      alignment: Alignment.topLeft,
      axis: Axis.horizontal,
      builder: (context, isExtended, toggle) {
        return Column(
          spacing: 16,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: isExtended
                      ? const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0)
                      : const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isExtended)
                        Text(
                          "Источники",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      IconButton(
                        onPressed: toggle,
                        icon: Icon(isExtended ? Icons.view_sidebar_outlined : Icons.source_rounded),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isExtended ? 8.0 : 4.0,
                vertical: 8,
              ),
              child: isExtended
                  ? Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: FilledButton.icon(
                              onPressed: () {},
                              label: Text("Добавить"),
                              icon: Icon(Icons.add),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: FilledButton.tonalIcon(
                            onPressed: () {},
                            label: Text("Найти"),
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      spacing: 12,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      ],
                    ),
            ),
            if (isExtended)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  spacing: 12,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        spacing: 4,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Источники",
                                  style: Theme.of(context).textTheme.labelLarge
                                      ?.copyWith(
                                        color: Theme.of(context).disabledColor,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Checkbox(value: true, onChanged: (v) {}),
                            ],
                          ),
                          SizedBox(height: 0),
                          ...List<Widget>.generate(
                            10,
                            (i) => Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Иризация - Википедия",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelSmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Checkbox(value: true, onChanged: (v) {}),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
