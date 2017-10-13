
	Powershell windows tarafýndan sistem ve sunucu yönetimi için geliþtirilmiþ bir komut satýrý
uygulamasýdýr(CLI).   Powershell içeriside Command-let(Cmdlet) özel komutlar dizisi bulunur. 
Bu komutlarý kullanarak sistem hakkýnda geniþ bilgilere sahip olunabilir. Bunun yaný sýra sistemde
bulunan diðer programlar ile doðrudan iliþki içerisindedir ve bunlarý kullanarakta sistem içerisinde
yönetim ve bilgi toplama saðlanabilir. 

	ActiveDirectory Microsoft aðlarýnda kullanýlan bir barýndýrma servisidir. Burada sunucular,
kullanýcýlar ve diðer ortamlar yer alabilir. Bu cihazlarýn merkezi yönetimni saðlar. Buranýn en temel
bileþeni DOMAIN'dir. Burada bulunan diðer önemli yapý Domain Controller'dýr. Active Directory'nin 
bir kopyasýdýr ve AD güncellendikçe DC'de güncellenir. 

	Önce activedirectory ile ilgili fonksiyonlarý kullanabilmek için 'import-module activedirectory'
ile AD import ediyoruz.
1. Get-ADDomain : Bu fonksiyon ActiveDirectory içerisinde bulunan domain hakkýnda bilgileri getirmek
için kullanýlýyor. 

2. Get-ADDomainController : Domain Controller bilgisini getiriyor. 

3. Get-ADUser  : ActiveDirectory içerisindeki kullanýcýlar hakkýnda bilgileri görmemizi saðlýyor. 

4. Get-ADGroup : ActiveDirectory'de bulunan kullanýcý gruplarý hakkýnda bilgi veriyor. 

5. systeminfo | Where-Object { $_ -NotMatch "System Model*" -and $_ -NotMatch "S Version*"}
Bu komut tüm sistem bilgisini getirecek ve içerisinde System model ve version bilgisini 
hariç tutacak.  Bunlarý hariç tutmasý deneme amaçlý yapýlmýþtýr. 

6.  gwmi -Class Win32_ComputerSystem | select name, domain
Bilgisayar ismini ve domain ismini getirir. 

7. query user /server:$SERVER 
Sistemdeki o an aktif olan kullanýcýlarý gösterir. 

8. schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
Sistemde bulunan zamanlanmýþ görevlerden o an hazýr da ve çalýþýr durumda olanlarý getirir.

9. Get-Service | Where-Object {$_.Status -eq "Running"} 
Sistemden bulunan servislerden o an çalýþanlarý listeler.

10. Get-Process
Sistemde çalýþan süreçleri görmemizi saðlar. 

11. Get-History
Powershell üzerinde yapýlmýþ olan girdileri getirir.

12. gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} | Sort Manufacturer,Description,DeviceID
Sistemde bulunan USB cihazlarýný üretici, açýklama ve id numaralarýna göre listeler. 

13. arp -a
Arp tablosunu getirir. 

14. netstat -n
Baðlantýlarýn rakamsal görünümünü listeler. 

15. get-wmiobject Win32_Processor | select name, description
Ýþlemci modelini ve ilgili açýklamayý getirir.
