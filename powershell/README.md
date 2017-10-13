
   Powershell windows tarafından sistem ve sunucu yönetimi için geliştirilmiş bir komut satırı
uygulamasıdır(CLI).   Powershell içeriside Command-let(Cmdlet) özel komutlar dizisi bulunur. 
Bu komutları kullanarak sistem hakkında geniş bilgilere sahip olunabilir. Bunun yanı sıra sistemde
bulunan diğer programlar ile doğrudan ilişki içerisindedir ve bunları kullanarakta sistem içerisinde
yönetim ve bilgi toplama sağlanabilir. 

   ActiveDirectory Microsoft ağlarında kullanılan bir barındırma servisidir. Burada sunucular,
kullanıcılar ve diğer ortamlar yer alabilir. Bu cihazların merkezi yönetimni sağlar. Buranın en temel
bileşeni DOMAIN'dir. Burada bulunan diğer önemli yapı Domain Controller'dır. Active Directory'nin 
bir kopyasıdır ve AD güncellendikçe DC'de güncellenir. 

   Önce activedirectory ile ilgili fonksiyonları kullanabilmek için 'import-module activedirectory'
ile AD import ediyoruz.
1. Get-ADDomain : Bu fonksiyon ActiveDirectory içerisinde bulunan domain hakkında bilgileri getirmek
için kullanılıyor. 

2. Get-ADDomainController : Domain Controller bilgisini getiriyor. 

3. Get-ADUser  : ActiveDirectory içerisindeki kullanıcılar hakkında bilgileri görmemizi sağlıyor. 

4. Get-ADGroup : ActiveDirectory'de bulunan kullanıcı grupları hakkında bilgi veriyor. 

5. systeminfo | Where-Object { $_ -NotMatch "System Model*" -and $_ -NotMatch "S Version*"}
Bu komut tüm sistem bilgisini getirecek ve içerisinde System model ve version bilgisini 
hariç tutacak.  Bunları hariç tutması deneme amaçlı yapılmıştır. 

6.  gwmi -Class Win32_ComputerSystem | select name, domain
Bilgisayar ismini ve domain ismini getirir. 

7. query user /server:$SERVER 
Sistemdeki o an aktif olan kullanıcıları gösterir. 

8. schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
Sistemde bulunan zamanlanmış görevlerden o an hazır da ve çalışır durumda olanları getirir.

9. Get-Service | Where-Object {$_.Status -eq "Running"} 
Sistemden bulunan servislerden o an çalışanları listeler.

10. Get-Process
Sistemde çalışan süreçleri görmemizi sağlar. 

11. Get-History
Powershell üzerinde yapılmış olan girdileri getirir.

12. gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} | Sort Manufacturer,Description,DeviceID
Sistemde bulunan USB cihazlarını üretici, açıklama ve id numaralarına göre listeler. 

13. arp -a
Arp tablosunu getirir. 

14. netstat -n
Bağlantıların rakamsal görünümünü listeler. 

15. get-wmiobject Win32_Processor | select name, description
İşlemci modelini ve ilgili açıklamayı getirir.
