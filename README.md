# Solus-Os-up-Date-System

**A simple Bash script that runs the routine eopkg and Flatpak maintenance commands on Solus in one go.**

![Shell: Bash](https://img.shields.io/badge/shell-Bash-4EAA25?logo=gnubash&logoColor=white)
![Platform: Solus](https://img.shields.io/badge/platform-Solus-5294E2?logo=solus&logoColor=white)

[English](#english) | [العربية](#arabic)

---

<a id="english"></a>

## English

### Overview

`update.sh` runs a fixed sequence of `eopkg` (the Solus package manager) and Flatpak commands to check, update, and tidy a Solus system. Each command is run through `sudo` and answered automatically with `-y`, and a section header is printed before each step.

### What it does

1. **Rebuild-db:** `sudo eopkg rebuild-db -y` rebuilds the eopkg package databases.
2. **Check:** `sudo eopkg check -y` verifies the installed packages.
3. **Update-repo:** `sudo eopkg update-repo -y` refreshes the repository index.
4. **Upgrade:** `sudo eopkg upgrade -y` upgrades installed packages.
5. **Flatpak Update:** `sudo flatpak update -y` updates installed Flatpak apps.
6. **Remove:** `sudo eopkg rmo -y` (remove-orphans) removes orphaned packages that are no longer needed.
7. **Clean:** `sudo eopkg clean -y` clears stale eopkg locks.
8. **cp:** `sudo eopkg cp -y` (configure-pending) configures any packages still pending configuration.

> **Note:** The script has no error handling: every step runs even if an earlier one fails. The Flatpak step runs unconditionally, so on a system without Flatpak it prints an error and the script moves on.

### Requirements

- Solus
- Bash
- A user account with `sudo` privileges (you will be prompted for your password)
- Flatpak (for the Flatpak update step)

### Installation

```bash
git clone https://github.com/fahad4x4/Solus-Os-up-Date-System.git
cd Solus-Os-up-Date-System
chmod +x update.sh
```

### Usage

Run it as your normal user; the script calls `sudo` for each command itself:

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

This repository does not include a license file.

### Author

**Fahad ALGhathbar**, GitHub: [@fahad4x4](https://github.com/fahad4x4)

---

<a id="arabic"></a>

## العربية

<div dir="rtl">

### نظرة عامة

ينفّذ السكربت `update.sh` تسلسلًا ثابتًا من أوامر `eopkg` (مدير الحزم في نظام Solus) وأوامر Flatpak لفحص النظام وتحديثه وتنظيفه. يُشغَّل كل أمر عبر `sudo` مع الخيار `-y` للموافقة التلقائية، ويُطبع عنوان قبل كل خطوة.

### ماذا يفعل

1. **إعادة بناء قاعدة البيانات:** `sudo eopkg rebuild-db -y` يعيد بناء قواعد بيانات الحزم.
2. **الفحص:** `sudo eopkg check -y` يتحقق من سلامة الحزم المثبتة.
3. **تحديث المستودع:** `sudo eopkg update-repo -y` يحدّث فهرس المستودع.
4. **الترقية:** `sudo eopkg upgrade -y` يرقّي الحزم المثبتة.
5. **تحديث Flatpak:** `sudo flatpak update -y` يحدّث تطبيقات Flatpak المثبتة.
6. **الإزالة:** `sudo eopkg rmo -y` (remove-orphans) يزيل الحزم اليتيمة التي لم تعد مطلوبة.
7. **التنظيف:** `sudo eopkg clean -y` يزيل أقفال eopkg العالقة.
8. **cp:** `sudo eopkg cp -y` (configure-pending) يُكمل إعداد الحزم التي ما زالت بانتظار الإعداد.

> **ملاحظة:** لا يحتوي السكربت على معالجة للأخطاء، فكل خطوة تُنفَّذ حتى لو فشلت خطوة سابقة. كما تُنفَّذ خطوة Flatpak دون شرط، لذا إذا لم يكن Flatpak مثبتًا تظهر رسالة خطأ ويتابع السكربت.

### المتطلبات

- نظام Solus
- Bash
- حساب مستخدم يملك صلاحيات `sudo` (ستُطلب منك كلمة المرور)
- Flatpak (لخطوة تحديث Flatpak)

### التثبيت

```bash
git clone https://github.com/fahad4x4/Solus-Os-up-Date-System.git
cd Solus-Os-up-Date-System
chmod +x update.sh
```

### الاستخدام

شغّله بمستخدمك العادي، فالسكربت يستدعي `sudo` بنفسه لكل أمر:

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

لا يتضمن هذا المستودع ملف رخصة.

### المؤلف

**فهد الغثبر (Fahad ALGhathbar)**، على GitHub: [@fahad4x4](https://github.com/fahad4x4)

</div>
