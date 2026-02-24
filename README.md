# DiscordSpoofer

> Discord engelini aşan, macOS Menu Bar için tasarlanmış minimalist bir araç.

### Sistem Gereksinimleri

| Özellik | Durum | Not |
| :--- | :--- | :--- |
| **İşlemci** | Apple Silicon (M1/M2/M3/M4) | M1 ile test edildi, tüm seri mimari olarak uyumlu |
| **İşlemci** | Intel | Desteklenmiyor (Yol hatası verir) |
| **macOS** | 13.0+ (Ventura/Sonoma/Sequoia) | Ventura ve üzeri sürümler gereklidir |
| **macOS** | 12.0 ve altı | Çalışmaz |

<img width="231" height="136" alt="Ekran Resmi 2026-02-16 01 35 46" src="https://github.com/user-attachments/assets/b2ecfe9a-edf6-42a2-ac1b-2c69814aed77" />


* **Tek Tıkla Erişim:** Terminal komutlarıyla uğraşmadan Discord engelini aşar (`spoofdpi` kullanır).
* **Akıllı Temizlik:** Uygulamayı kapattığında sistem proxy ayarlarını temizler, internetin kesilmez.
* **Şık Tasarım:** Dock'ta yer kaplamaz, sadece Menu Bar'da durur.

## Kurulum

**Önemli: Bu uygulamanın çalışması için sisteminizde spoofdpi kurulu olmalıdır. Terminale brew install spoofdpi yazarak kurabilirsiniz.**

1.  **Releases** kısmından son sürümü indirin.
2.  Uygulamayı `Applications` klasörüne sürükleyin.
3.  Açın, üst barda ikon belirecek.
4.  "Discord'u Aktif Et" butonuna basın ve şifrenizi girin.

## Nasıl Çalışır?

Bu uygulama, arka planda `spoofdpi` aracını çalıştırarak DPI (Deep Packet Inspection) engellerini aşar. Swift ve AppleScript kullanılarak yazılmıştır.

> İkonlar pinterestten alınmıştır isimlerini bulamadığım için credit veremiyorum. <3
---

### Credits
Bu uygulama arka planda paket manipülasyonu için [SpoofDPI](https://github.com/xvzc/SpoofDPI) kullanmaktadır. Core mekanik için asıl geliştiricilere teşekkürler.
This application uses [SpoofDPI](https://github.com/xvzc/SpoofDPI) in the background for packet manipulation. Huge thanks to the original developers for the core mechanics.

**Developed by [Chimpsye](https://github.com/chimpsye)**
