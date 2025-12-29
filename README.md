# 🎯 Karar Ver (Decision Maker)

Kararsız kaldığınız anlarda size yardımcı olan, şık ve tatlı tasarıma sahip bir Flutter uygulaması. "Hızlı Karar" ve "Ağırlıklı Seçim" modları ile hem rastgele hem de mantıklı seçimler yapmanızı sağlar.

## ✨ Özellikler

*   **⚡ Hızlı Karar (1 vs 2):** İki seçenek arasında kaldığınızda hızlıca seçim yapın.
*   **⚖️ Ağırlıklı Seçim:** Seçeneklere "olasılık puanı" vererek, daha çok istediğiniz şeylerin çıkma şansını artırın. (OOP tabanlı Rastgele Seçim Algoritması).
*   **📜 Geçmiş:** Yaptığınız seçimleri kaydedin ve geriye dönüp bakın.
*   **🎨 Sweet UI:** Pastel tonlar ve yumuşak animasyonlarla modern tasarım.

## 🛠️ Teknik Detaylar

Bu proje **Clean Architecture** prensiplerine uygun olarak geliştirilmiştir.

*   **Dil:** Dart / Flutter
*   **Mimari:** Clean Architecture (Presentation, Domain, Data)
*   **State Management:** `setState` (Basitlik için) & `Provider` (Hazırlık yapıldı)
*   **Veri:** Mock Repository (Firebase entegrasyonuna hazır arayüzler)
*   **Tasarım:** Custom Theme & Google Fonts (Poppins)

## 🚀 Kurulum

1.  Repoyu klonlayın.
2.  Bağımlılıkları yükleyin:
    ```bash
    flutter pub get
    ```
3.  Uygulamayı çalıştırın:
    ```bash
    flutter run
    ```

## 📝 Geliştirme Süreci (To-Do List)

Bu proje aşağıdaki adımlar takip edilerek geliştirilmiştir:

- [x] **Planlama**
    - [x] Gereksinim analizi ve özellik belirleme.
    - [x] Clean Architecture klasör yapısının kurulması.
    - [x] Renk paleti ve tasarım dilinin (Sweet UI) oluşturulması.

```markdown
# 🎯 Karar Ver (Decision Maker)

Kısa açıklama: Kararsız kaldığınızda yardım eden, Flutter ile yazılmış küçük ve anlaşılır bir "karar verme" uygulaması. Uygulamada "Hızlı Karar" ve "Ağırlıklı Seçim" (weighted choice) modları, ayrıca yapılan seçimleri gösteren bir geçmiş ekranı bulunur.

## ✨ Öne çıkan özellikler

- **Hızlı Karar:** Hızlıca iki seçenek arasında seçim yapma.
- **Ağırlıklı Seçim:** Her seçeneğe ağırlık (olasılık) verip olasılığa dayalı seçim yapma.
- **Geçmiş (History):** Yapılan seçimleri kaydetme ve görüntüleme.
- **Tema & UI:** `AppTheme` ve `AppColors` ile tutarlı bir tasarım.

## 🛠 Teknik Detaylar

- Dil: Dart & Flutter
- Mimari: Clean Architecture (Presentation / Domain / Data)
- State management: Basit `setState` ve bazı alanlarda `Provider` kullanımı için altyapı
- Veri: Şu an mock repository / arayüz, Firestore entegrasyonuna hazır

## 🚀 Kurulum ve çalıştırma

1. Repoyu klonlayın:

```bash
git clone https://github.com/atakanwiea/Karar_verme_app.git
cd Karar_verme_app
```

2. Bağımlılıkları yükleyin:

```bash
flutter pub get
```

3. Uygulamayı çalıştırın (cihaz veya emulator bağlıyken):

```bash
flutter run
```

## Repo Durumu — Kısa Özet (Benim yaptıklarım)

- Bu çalışma dizininde `origin` remote şu adrese eklendi: https://github.com/atakanwiea/Karar_verme_app.git
- `master` dalı ilk kez `origin/master` olarak push edildi ve upstream ayarlandı.
- Not: Yerelde hâlâ commitlenmemiş değişiklikler bulunuyor — örnek olarak:

- `README.md` (şu dosya güncellendi ve şimdi commitleyip pushladım)
- `lib/core/constants/app_colors.dart`
- `lib/core/theme/app_theme.dart`
- `lib/features/decision/presentation/pages/weighted_decision_page.dart`
- `lib/features/history/presentation/pages/history_page.dart`
- `lib/features/home/presentation/pages/home_page.dart`
- `macos/Flutter/GeneratedPluginRegistrant.swift`
- `windows/flutter/generated_plugin_registrant.cc`
- `windows/flutter/generated_plugins.cmake`

Bu dosyalar yerelde değişmiş olarak görünüyor; isterseniz ben bunları da commitleyip pushlayabilirim.

## İleri Adımlar / Öneriler

- Firestore/Firebase entegrasyonu yapılacaksa `DecisionRepository` yerine gerçek veri katmanını bağlayın.
- `main` dalı (branch) kullanmak isterseniz, `master`'dan `main` oluşturup GitHub'da varsayılan dal yapabilirsiniz.

## İletişim

- Geliştirici: Atakan Avcılar
- Repo: https://github.com/atakanwiea/Karar_verme_app.git

```
