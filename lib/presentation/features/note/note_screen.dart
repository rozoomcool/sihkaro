import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/app_logo.dart';
import 'package:sihkaro/presentation/widgets/custom_divider.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

@RoutePage()
class NoteScreen extends HookConsumerWidget {
  const NoteScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    final options = useState(Set.of({}));
    final titleController = useTextEditingController(text: "Без названия");

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: themeMode.value == ThemeMode.dark
          ? Colors.black
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        notificationPredicate: (_) => false,
        flexibleSpace: GlossyCard(
          child: Container(),
          borderRadius: BorderRadius.all(Radius.zero),
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(
              width: 1,
              color: themeMode.value == ThemeMode.dark
                  ? Colors.white10
                  : Colors.black12,
            ),
          ),
        ),
        elevation: null,
        centerTitle: true,
        title: TextField(
          controller: titleController,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: InputDecoration.collapsed(hintText: ""),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture_rounded)),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                enableDrag: true,
                context: context,
                builder: (context) {
                  return GlossyCard(
                    blueStrength: 10,
                    color: themeMode.value == ThemeMode.dark
                        ? Colors.black
                        : Colors.white,
                    border: BoxBorder.fromLTRB(
                      top: BorderSide(
                        width: 1,
                        color: themeMode.value == ThemeMode.dark
                            ? Colors.white10
                            : Colors.black12,
                      ),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 200,
                        minWidth: double.infinity,
                      ),
                      child: ListView.separated(
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: Icon(Icons.web),
                            title: Text("stackoverflow.com"),
                            subtitle: Text(
                              "Как решить прблему hasSize в flutter",
                            ),
                          );
                        },
                        separatorBuilder: (context, i) => CustomDivider(),
                        itemCount: 10,
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.link_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                spacing: 16,
                children: [
                  SizedBox(height: 124),
                  Row(
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 6,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(12),
                            child: Text(
                              "Напиши мне справочник по golang, приводя примеры и пояснения. Сделай его емким и обширным.",
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 16,
                        children: [
                          CircleAvatar(child: AppLogo(size: 24)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Text(
                                "Прочитать 7 веб страниц",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: MarkdownWidget(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          config: MarkdownConfig(
                            configs: [
                              PreConfig(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              CodeConfig(
                                style: TextStyle(
                                  backgroundColor: Theme.of(context).cardColor,
                                ),
                              ),
                            ],
                          ),
                          data: mrtext,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 270),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: 24,
                // bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
              ),
              child: GlossyCard(
                padding: EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextField(
                            minLines: 1,
                            maxLines: 4,
                            decoration: InputDecoration(
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attachment_rounded),
                              ),
                              hintText: "Введите запрос",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_return_rounded),
                        ),
                      ],
                    ),
                    Flexible(
                      child: SegmentedButton(
                        emptySelectionAllowed: true,
                        showSelectedIcon: false,
                        multiSelectionEnabled: true,
                        segments: [
                          ButtonSegment(
                            label: Text("Think"),
                            icon: Icon(Icons.lightbulb_rounded),
                            value: "t",
                          ),
                          ButtonSegment(
                            label: Text("Context"),
                            icon: Icon(Icons.data_usage),
                            value: "co",
                          ),
                          ButtonSegment(
                            label: Text("Source"),
                            icon: Icon(Icons.link_rounded),
                            value: "s",
                          ),
                        ],
                        selected: options.value,
                        onSelectionChanged: (v) {
                          options.value = v;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const mrtext1 = "Hello World";

const mrtext =
    """Отлично, давай я дам тебе компактный, но практичный справочник по основам Go с примерами, включающий создание проекта, работу с пакетами, команды и хорошие практики.

---

# 📖 **Golang: Справочник по основам с примерами**

---

## 1️⃣ Создание проекта

### Установка Go (если еще не установлен):

```bash
# Linux / MacOS
brew install go

# Проверить версию
go version
```

### Создание рабочего каталога проекта

```bash
mkdir myproject
cd myproject
go mod init github.com/username/myproject
```

> `go mod init` — создает `go.mod` файл (модульную систему Go). С 1.11 модули — стандарт.

**Пример структуры проекта:**

```text
myproject/
  go.mod
  main.go
  pkg/
    utils/
      utils.go
```

---

## 2️⃣ Минимальный пример программы

**main.go**

```go
package main

import (
    "fmt"
)

func main() {
    fmt.Println("Hello, Go!")
}
```

Запуск:

```bash
go run main.go
```

Сборка:

```bash
go build
./myproject
```

---

## 3️⃣ Работа с пакетами

### Создание собственного пакета

**pkg/utils/utils.go**

```go
package utils

import "fmt"

func Greet(name string) {
    fmt.Printf("Hello, %s!\n", name)
}
```

### Использование собственного пакета

**main.go**

```go
package main

import (
    "github.com/username/myproject/pkg/utils"
)

func main() {
    utils.Greet("John")
}
```

> ❗ **Важно:** в Go имя папки = имя пакета (если не переопределяешь явно в `package`).

---

## 4️⃣ Стандартная структура пакетов

Хорошая структура:

```text
myproject/
  cmd/            - точка входа приложения
  internal/       - приватный код (не экспортируется)
  pkg/            - публичные библиотеки
  api/            - API схемы
  configs/        - конфигурации
  scripts/        - вспомогательные скрипты
  test/           - интеграционные тесты
```

---

## 5️⃣ Полезные команды Go

| Команда          | Описание            |
| ---------------- | ------------------- |
| `go run main.go` | запуск              |
| `go build`       | сборка              |
| `go test ./...`  | запуск всех тестов  |
| `go fmt ./...`   | автоформатирование  |
| `go vet ./...`   | статический анализ  |
| `go mod tidy`    | чистка зависимостей |
| `go get`         | установка пакетов   |
| `go list -m all` | список модулей      |

---

## 6️⃣ Работа с зависимостями

Добавление внешнего пакета:

```bash
go get github.com/stretchr/testify
```

Импорт в коде:

```go
import "github.com/stretchr/testify/assert"
```

---

## 7️⃣ Написание тестов

**math.go**

```go
package utils

func Sum(a, b int) int {
    return a + b
}
```

**math\_test.go**

```go
package utils

import "testing"

func TestSum(t *testing.T) {
    result := Sum(2, 3)
    if result != 5 {
        t.Errorf("Expected 5, got %d", result)
    }
}
```

Запуск:

```bash
go test ./...
```

---

## 8️⃣ Основные хорошие практики (Go idioms)

✅ **Минимализм** — пиши просто, избегай усложнений
✅ **Ошибки всегда обрабатывай**:

```go
file, err := os.Open("file.txt")
if err != nil {
    log.Fatal(err)
}
defer file.Close()
```

✅ \*\*Используй `defer` для освобождения ресурсов
✅ **Меньше OOP** — Go предпочитает композицию вместо наследования
✅ **Пиши понятные интерфейсы** — интерфейсы описывают поведение, а не классы:

```go
type Reader interface {
    Read(p []byte) (n int, err error)
}
```

✅ **Форматируй код `go fmt` всегда**
✅ **Документируй экспортируемые функции**:

```go
// Sum складывает два числа.
func Sum(a, b int) int {
    return a + b
}
```

✅ **Используй контекст (context.Context) в долгих операциях (сетевые вызовы, БД, таски)**

---

## 9️⃣ Советы по стилю кода

* Именуй коротко: `err`, `ctx`, `cfg`
* Не бойся повторять код вместо преждевременной генерализации
* Не используй магические числа — объявляй константы
* Делай маленькие, читаемые функции

---

## 10️⃣ Полезные ресурсы

* Официальное руководство: [https://go.dev/doc/effective\_go](https://go.dev/doc/effective_go)
* Стиль Go: [https://go.dev/doc/code](https://go.dev/doc/code)
* Go Proverbs (идеология Go): [https://go-proverbs.github.io/](https://go-proverbs.github.io/)
* Лучший линтер: `golangci-lint` — обязательно в каждый проект

---
""";
