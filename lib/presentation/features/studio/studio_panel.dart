import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/widgets/collapsed_container.dart';

class StudioPanel extends StatelessWidget {
  const StudioPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return CollapsedContainer(
      size: 400,
      collapsedSize: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      axis: Axis.horizontal,
      alignment: Alignment.topRight,
      builder: (context, isExtended, toggle) {
        return Material(
          type: MaterialType.transparency,
          child: SingleChildScrollView(
            child: Column(
              spacing: 12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: isExtended
                          ? const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0)
                          : EdgeInsetsGeometry.symmetric(
                              vertical: 8,
                              horizontal: 4,
                            ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (isExtended)
                            Text(
                              "Студия",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          IconButton(
                            onPressed: toggle,
                            icon: Icon(Icons.align_horizontal_left_rounded),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                if (isExtended)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Аудиопересказ"),
                            Icon(Icons.info_outline),
                          ],
                        ),
                        Card.outlined(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            side: BorderSide(
                              color: Theme.of(context).disabledColor,
                              width: 1,
                            ),
                          ),
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerLow,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              spacing: 16,
                              children: [
                                Row(
                                  spacing: 8,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      child: Icon(Icons.multitrack_audio_rounded),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 4,
                                      children: [
                                        Text("Глубокое обсуждение тем"),
                                        Text(
                                          "Двое ведущих",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).disabledColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 12,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text("Настроить"),
                                      ),
                                    ),
                                    Expanded(
                                      child: FilledButton(
                                        onPressed: () {},
                                        child: Text("Сгенерировать"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (isExtended) Divider(),
          
                if (isExtended)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Заметки"),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.more_vert_rounded),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 12,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 42,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                label: Text("Добавить заметку"),
                                icon: Icon(Icons.add),
                              ),
                            ),
                            Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    label: Text("Методичка"),
                                    icon: Icon(Icons.manage_search_rounded),
                                  ),
                                ),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    label: Text("Краткий обзор"),
                                    icon: Icon(Icons.auto_stories_rounded),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    label: Text("Вопросы"),
                                    icon: Icon(Icons.question_answer_rounded),
                                  ),
                                ),
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    label: Text("Хронология"),
                                    icon: Icon(Icons.timeline_rounded),
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      16,
                                    ),
                                  ),
                                  leading: Icon(Icons.auto_awesome_rounded),
                                  title: Text(
                                    "Иризация Облаков: Определение, Механизм, Наблюдение",
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                  subtitle: Text(
                                    "Уникальные атмосферные условия полярных широт способствуют формированию иризирующих облаков, которые также известны как полярные стратосферные облака или перламутровые облака",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (isExtended) Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
