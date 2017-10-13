
	Powershell windows taraf�ndan sistem ve sunucu y�netimi i�in geli�tirilmi� bir komut sat�r�
uygulamas�d�r(CLI).   Powershell i�eriside Command-let(Cmdlet) �zel komutlar dizisi bulunur. 
Bu komutlar� kullanarak sistem hakk�nda geni� bilgilere sahip olunabilir. Bunun yan� s�ra sistemde
bulunan di�er programlar ile do�rudan ili�ki i�erisindedir ve bunlar� kullanarakta sistem i�erisinde
y�netim ve bilgi toplama sa�lanabilir. 

	ActiveDirectory Microsoft a�lar�nda kullan�lan bir bar�nd�rma servisidir. Burada sunucular,
kullan�c�lar ve di�er ortamlar yer alabilir. Bu cihazlar�n merkezi y�netimni sa�lar. Buran�n en temel
bile�eni DOMAIN'dir. Burada bulunan di�er �nemli yap� Domain Controller'd�r. Active Directory'nin 
bir kopyas�d�r ve AD g�ncellendik�e DC'de g�ncellenir. 

	�nce activedirectory ile ilgili fonksiyonlar� kullanabilmek i�in 'import-module activedirectory'
ile AD import ediyoruz.
1. Get-ADDomain : Bu fonksiyon ActiveDirectory i�erisinde bulunan domain hakk�nda bilgileri getirmek
i�in kullan�l�yor. 

2. Get-ADDomainController : Domain Controller bilgisini getiriyor. 

3. Get-ADUser  : ActiveDirectory i�erisindeki kullan�c�lar hakk�nda bilgileri g�rmemizi sa�l�yor. 

4. Get-ADGroup : ActiveDirectory'de bulunan kullan�c� gruplar� hakk�nda bilgi veriyor. 

5. systeminfo | Where-Object { $_ -NotMatch "System Model*" -and $_ -NotMatch "S Version*"}
Bu komut t�m sistem bilgisini getirecek ve i�erisinde System model ve version bilgisini 
hari� tutacak.  Bunlar� hari� tutmas� deneme ama�l� yap�lm��t�r. 

6.  gwmi -Class Win32_ComputerSystem | select name, domain
Bilgisayar ismini ve domain ismini getirir. 

7. query user /server:$SERVER 
Sistemdeki o an aktif olan kullan�c�lar� g�sterir. 

8. schtasks | Where-Object { $_ -Match "Ready*" -or $_ -Match "Running*"}
Sistemde bulunan zamanlanm�� g�revlerden o an haz�r da ve �al���r durumda olanlar� getirir.

9. Get-Service | Where-Object {$_.Status -eq "Running"} 
Sistemden bulunan servislerden o an �al��anlar� listeler.

10. Get-Process
Sistemde �al��an s�re�leri g�rmemizi sa�lar. 

11. Get-History
Powershell �zerinde yap�lm�� olan girdileri getirir.

12. gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} | Sort Manufacturer,Description,DeviceID
Sistemde bulunan USB cihazlar�n� �retici, a��klama ve id numaralar�na g�re listeler. 

13. arp -a
Arp tablosunu getirir. 

14. netstat -n
Ba�lant�lar�n rakamsal g�r�n�m�n� listeler. 

15. get-wmiobject Win32_Processor | select name, description
��lemci modelini ve ilgili a��klamay� getirir.
