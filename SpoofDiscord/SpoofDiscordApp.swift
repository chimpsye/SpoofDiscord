import SwiftUI

@main
struct DiscordSpooferApp: App {
    // Uygulamanın çalışıp çalışmadığını takip eden değişken (State)
    @State private var isRunning = false
    
    var body: some Scene {
        // MenuBarExtra: Uygulamanın sadece üst barda çalışmasını sağlar
        MenuBarExtra {
            // --- AÇILIR MENÜ İÇERİĞİ ---
            
            // 1. Durum Göstergesi
            Text(isRunning ? "Durum: AKTİF (Discord Açık)" : "Durum: KAPALI")
            
            Divider()
            
            // 2. Ana Buton (Aç/Kapat)
            Button(isRunning ? "Bağlantıyı Kes ve Temizle" : "Discord'u Aktif Et") {
                if isRunning {
                    stopSpoofDPI()
                } else {
                    startSpoofDPI()
                }
            }
            
            Divider()
            
            // 3. Çıkış Butonu
            Button("Programdan Çık") {
                // Çıkarken arkada pislik bırakmasın diye önce temizliyoruz
                stopSpoofDPI()
                NSApplication.shared.terminate(nil)
            }
            
        } label: {
            // --- ÜST BARDA GÖRÜNECEK İKON ---
            // iconRenderingMode(.original) renklerin bozulmamasını sağlar
            Image("AnimeIcon")
                .resizable()
                .frame(width: 18, height: 18) // Boyutu buradan ayarlayabilirsin
        }
        // Bu stil, ikonun yanına uygulama isminin yazılmasını engeller, sadece ikon kalır.
        .menuBarExtraStyle(.menu)
    }
    
    // --- FONKSİYONLAR ---
    
    func startSpoofDPI() {
        // SpoofDPI'ı başlatan komut.
        // > /dev/null kısmı logları susturur, & işareti arka plana atar.
        let script = """
        do shell script "sudo /opt/homebrew/bin/spoofdpi --dns-mode https --system-proxy --https-split-mode chunk --https-chunk-size 1 > /dev/null 2>&1 &" with administrator privileges
        """
        runAppleScript(script)
        isRunning = true
    }
    
    func stopSpoofDPI() {
        // BURASI ÇOK ÖNEMLİ: Hem programı kapatıyor hem de internetini düzeltiyor.
        let script = """
        do shell script "sudo pkill spoofdpi; sudo networksetup -setwebproxystate 'Wi-Fi' off; sudo networksetup -setsecurewebproxystate 'Wi-Fi' off" with administrator privileges
        """
        runAppleScript(script)
        isRunning = false
    }
    
    // AppleScript'i çalıştıran yardımcı fonksiyon
    func runAppleScript(_ source: String) {
        if let scriptObject = NSAppleScript(source: source) {
            var error: NSDictionary?
            scriptObject.executeAndReturnError(&error)
            if let error = error {
                print("Hata oluştu: \(error)")
            }
        }
    }
}
