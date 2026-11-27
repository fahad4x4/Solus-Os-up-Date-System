# Solus-Os-up-Date-System

**A simple Bash script that runs the routine eopkg and Flatpak maintenance commands on Solus in one go.**

![Shell: Bash](https://img.shields.io/badge/shell-Bash-4EAA25?logo=gnubash&logoColor=white)
![Platform: Solus](https://img.shields.io/badge/platform-Solus-5294E2?logo=solus&logoColor=white)

[English](#english) | [العربية](#arabic)

---

<a id="english"></a>

## English

### Overview

`update.sh` runs a fixed sequence of `eopkg` (the Solus package manager) and Flatpak commands to check, update, and tidy a Solus system. It asks for your `sudo` password once at the start (or runs the commands directly when started as root), answers each command automatically with `-y`, and prints a section header and an OK or error message for each step.

### What it does

1. **Clean:** `eopkg clean -y` clears stale eopkg locks left by an interrupted run, so they cannot block the steps below.
2. **Configure-pending:** `eopkg configure-pending -y` finishes configuring any packages left half-installed by an interrupted run.
3. **Rebuild-db:** `eopkg rebuild-db -y` rebuilds the eopkg package databases.
4. **Check:** `eopkg check -y` verifies the installed packages.
5. **Update-repo:** `eopkg update-repo -y` refreshes the repository index.
6. **Upgrade:** `eopkg upgrade -y` upgrades installed packages.
7. **Remove:** `eopkg rmo -y` (remove-orphans) removes orphaned packages that are no longer needed.
8. **Flatpak Update:** `flatpak update -y` updates installed Flatpak apps (skipped if Flatpak is not installed).

> **Error handling:** If an `eopkg` step fails, the script prints which step failed and stops with that step's exit code. The Check and Flatpak steps only print a warning and let the script continue; if any warning occurred, the script ends with exit code 2. It exits with 0 when every step succeeds.

### Requirements

- Solus
- Bash
- A user account with `sudo` privileges (you will be prompted for your password)
- Flatpak (optional; the Flatpak step is skipped without it)

### Installation

```bash
git clone https://github.com/fahad4x4/Solus-Os-up-Date-System.git
cd Solus-Os-up-Date-System
chmod +x update.sh
```

### Usage

Run it as your normal user; the script asks for your `sudo` password once and uses `sudo` for each command itself (running it as root also works):

```bash
./update.sh
```

### Project structure

```
Solus-Os-up-Date-System/
├── update.sh    # The maintenance script
└── README.md    # This file
```

### License

Released under the [MIT License](LICENSE). Copyright © 2026 Fahad ALGhathbar (فهد الغثبر).

### Author

**Fahad ALGhathbar**, GitHub: [@fahad4x4](https://github.com/fahad4x4)

---

<a id="arabic"></a>

## العربية

<div dir="rtl">

### نظرة عامة

ينفّذ السكربت `update.sh` تسلسلًا ثابتًا من أوامر `eopkg` (مدير الحزم في نظام Solus) وأوامر Flatpak لفحص النظام وتحديثه وتنظيفه. يطلب كلمة مرور `sudo` مرة واحدة في البداية (أو يشغّل الأوامر مباشرة إذا بدأته بصلاحيات root)، ويُشغّل كل أمر مع الخيار `-y` للموافقة التلقائية، ويطبع عنوانًا ورسالة نجاح أو خطأ لكل خطوة.

### ماذا يفعل

1. **التنظيف:** `eopkg clean -y` يزيل أقفال eopkg العالقة من تشغيل سابق انقطع، حتى لا تعطّل الخطوات التالية.
2. **إكمال الإعداد المعلّق:** `eopkg configure-pending -y` يُكمل إعداد الحزم التي بقيت دون إعداد بسبب تشغيل سابق انقطع.
3. **إعادة بناء قاعدة البيانات:** `eopkg rebuild-db -y` يعيد بناء قواعد بيانات الحزم.
4. **الفحص:** `eopkg check -y` يتحقق من سلامة الحزم المثبتة.
5. **تحديث المستودع:** `eopkg update-repo -y` يحدّث فهرس المستودع.
6. **الترقية:** `eopkg upgrade -y` يرقّي الحزم المثبتة.
7. **الإزالة:** `eopkg rmo -y` (remove-orphans) يزيل الحزم اليتيمة التي لم تعد مطلوبة.
8. **تحديث Flatpak:** `flatpak update -y` يحدّث تطبيقات Flatpak المثبتة (وتُتخطّى هذه الخطوة إذا لم يكن Flatpak مثبتًا).

> **معالجة الأخطاء:** إذا فشلت إحدى خطوات `eopkg` يطبع السكربت اسم الخطوة التي فشلت ويتوقف برمز الخروج نفسه. أما خطوتا الفحص وFlatpak فتطبعان تحذيرًا فقط ويتابع السكربت، وإذا ظهر أي تحذير ينتهي السكربت برمز الخروج 2. وينتهي بالرمز 0 عند نجاح كل الخطوات.

### المتطلبات

- نظام Solus
- Bash
- حساب مستخدم يملك صلاحيات `sudo` (ستُطلب منك كلمة المرور)
- Flatpak (اختياري؛ تُتخطّى خطوة Flatpak إذا لم يكن مثبتًا)

### التثبيت

```bash
git clone https://github.com/fahad4x4/Solus-Os-up-Date-System.git
cd Solus-Os-up-Date-System
chmod +x update.sh
```

### الاستخدام

شغّله بمستخدمك العادي، فالسكربت يطلب كلمة مرور `sudo` مرة واحدة ويستدعي `sudo` بنفسه لكل أمر (ويعمل أيضًا إذا شغّلته بصلاحيات root):

```bash
./update.sh
```

### هيكل المشروع

```
Solus-Os-up-Date-System/
├── update.sh    # سكربت الصيانة
└── README.md    # هذا الملف
```

### الرخصة

المشروع منشور برخصة [MIT](LICENSE). حقوق النشر © 2026 فهد الغثبر (Fahad ALGhathbar).

### المؤلف

**فهد الغثبر (Fahad ALGhathbar)**، على GitHub: [@fahad4x4](https://github.com/fahad4x4)

</div>
