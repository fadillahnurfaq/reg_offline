# Register Offline

## Link Aplikasi
[https://drive.google.com/file/d/191dWj7asCLfHNHutTGVHfcNk7M5oLcPY/view?usp=sharing](https://drive.google.com/file/d/191dWj7asCLfHNHutTGVHfcNk7M5oLcPY/view?usp=sharing)

## Link Record Aplikasi
[https://drive.google.com/file/d/1JOy7tiLepl9_31ViBXoFwdnPEzirhzr3/view?usp=sharing](https://drive.google.com/file/d/1JOy7tiLepl9_31ViBXoFwdnPEzirhzr3/view?usp=sharing)

## Getting Started

Pastikan sudah menginstall Git dan Flutter pada environment kalian.

### Prerequisites

- Flutter
  ```sh
  https://docs.flutter.dev/get-started/install
  ```
- Git
  ```sh
  https://git-scm.com/downloads
  ```
  
### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/fadillahnurfaq/reg_offline.git
   ```
2. Install the dependencies
   ```sh
   flutter pub get
   ```
3. Run
   ```sh
   Run Without Debugging On Vs Code
   ```
## 📁 Struktur Folder

```
lib/
├── cubit/        # State management (Cubit/Bloc)
├── env/          # Konfigurasi environment (API, dll)
├── models/       # Model / struktur data
├── services/     # Akses API / database
├── utils/        # Helper, validator, dll
├── views/        # Halaman / screen UI
├── widgets/      # Komponen UI reusable
├── hive_registrar.g.dart  # Generated file Hive (jangan diubah)
└── main.dart     # Entry point aplikasi
```
