TR:
Swift dilinde Delegate Design Pattern kullanan bit ATM uygulama örneği.

Swift dilinde "Delegate Design Pattern" oldukça yaygın kullanılan bir tasarım desenidir.
Peki nedir bu Delegate Design Pattern'i?

Belirli bir olay gerçekleştiğinde, bir objenin diğer objeyi bilgilendirme işlemidir.

Örneğin bir ATM düşünelim. Bu ATM'yi çeşitli meslekten kullanıcılar kullanmaktadır (Örneğin mühendis, doktor, pilot).
Her kullanıcı ATM'den para çekme, para yatırma gibi işlemleri uygulamaktadır.
ATM nin bu işlemler gerçekleştiğinde her kullanıcıyı bilgilendirmesi gerekmektedir. Ancak böyle bir durumda her tipten kullanıcı için bir nesne yaratması gerekmektedir.
Böyle bir senaryoda üretilen her nesne için depositMoney, withdrawMoney metotlarını tek tek çağırması gerekmektedir.
Bu durum, kullanıcı tipi sayılamayacak kadar arttığında kontrol edilemez. Ayrıca kodda kullanılan teknik, clean code ve SOLID prensibine aykırıdır.
Bahsedilen durumları engellemek için, delegate design pattern kullanılmıştır.

1- Öncelikle, kullanıcı tiplerinin hepsi aynı metodu kullanacağından dolayı, User adında bir protocol oluşturulmuştur.
2- Her kullanıcı meslek tipi için sınıflar oluşturulmuştur ve bu sınıflar, User protocol'ünü inherit etmiştir.
3- Her sınıf, User protocol içerisinde yer alan metotları kendine göre implement etmiştir.
4- ATM adında bir sınıf oluşturulmuştur.
5- ATM sınıfı içinde User tipinde bir delegate property si oluşturulmuştur.
6- Kullanıcı sınıfları içinde init constructor u içerisinde ATM tipinde alınan atm parametresinin delegate property'sine, "self" yani Kullanıcı tipinin kendisi referans olarak verilmiştir.
7- ATM sınıfı içerisindeki withdrawMoney ve depositMoney adında metotlar oluşturulmuştur.
   Bu metotların içerisinde property ye atanan ve User protocol'ünün sahip olduğu metotlar çağırılmıştır.
8- Ana fonksiyonda ise atm ve sırasıyla kullanıcıların nesneleri oluşturulmuştur.
9- Oluşturulan nesneler, atm parametresi ile oluşturulmuştur. Bu sayede nesne oluşturulduğu anda atm nesnesinin delegate property'sine nesnenin kendisi atanmış olur.
10- atm nesnesinin withdrawMoney ve depositMoney metotları çağırıldığında artık üretilmiş olan nesneye göre bu metotlar işlevlerini gerçekleştirir.

Bu sayede ATM sınıfı bu metotları gerçekleştirirken (kullanıcıları bilgilendirirken), kullanıcı tipini, sayısını önemsemeden işlevlerini yerine getirebiliyor.
İleride atm kullanacak farklı kullanıcılar artsa bile, atm bu olaydan etkilenmeden çalışmaya devam edebilir. Tek koşul kullanıcıların User protocol'ünü implement etmesidir.

Swift dilinde ise karşılaştığımız örneklerden birisi, UITextField ile ViewController iletişiminde karşımıza çıkmaktadır. Örneğin kullanıcı ekranda yazı yazmaya başladığında ya da klavye
dışında herhangi bir yere tıkladığı zaman ViewController UITextField tarafından bilgilendiriliyor. Ancak UITextField aslında ViewController ın kim olduğunu, tipinin ne olduğunu bilmiyor.
Tek bildiği şey, ViewController ın UITextFieldDelegate protocol'ünü implement ettiğidir.
Böylece bu metotları çağırarak, bilgilendirdiği şey hangi tipten olursa olsun işlevini yerine getirebilmektedir.
