import 'package:flutter/material.dart';

class RefundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'İade ve İptal Politikası',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0x0ff023240), // Arka plan rengi
        elevation: 0, // App Bar gölge efekti kaldırma
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'İade Politikası',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '-Rezervasyon değişiklikleri ve iade işlemleri için müşterilerimiz, uçuş biletleri satın alırken belirtilen bilet kurallarına uymak zorundadır.\n\n'
              '-Yolcu adına yapılan bilet iade ve değişiklik işlemleri, sadece biletin satın alındığı acentede gerçekleştirilebilir.'
              '-İade işlemleri, biletin satın alındığı ülkenin para birimi cinsinden yapılır ve kredi kartı ile yapılan ödemeler, aynı kart üzerinden iade edilir.\n\n'
              '-İade talepleri, biletin ilk seferinin hareket tarihinden önce yapıldığında kabul edilir. Uçuş tarihi geçtikten sonra yapılan iade talepleri, biletin satın alındığı kurallara göre işleme alınır.\n\n'
              '-İade işlem ücretleri, biletin satın alındığı ülkenin para birimi cinsinden hesaplanır ve uygulanır. İade işlem ücretleri, biletin satın alındığı kurallara göre farklılık gösterebilir.\n\n'
              '-Bazı özel bilet tipleri iade edilemez veya değiştirilemez. Yolcularımız, satın alacakları biletlerin iade edilebilir veya değiştirilebilir olup olmadığını kontrol etmelidirler.\n\n'
              '-İade talepleri, ilgili biletin ve yolcu bilgilerinin tam ve doğru olarak verilmesi koşuluyla işleme alınır.'
              '-Uçuş iptallerinde ve gecikmelerinde, yolcularımızın hakları, ilgili düzenlemelere göre belirlenir ve yolcularımızın bu haklarından yararlanmaları sağlanır.\n\n'
              '-Uçuş iptalleri veya gecikmeleri durumunda, yolcularımızın uçuşlarına alternatif çözümler sunmak için elimizden gelen her şeyi yapacağız. Bu çözümler arasında, başka bir uçuşa yer ayırma, bilet ücretinin tamamının iadesi veya ilgili duruma göre başka bir çözüm yer alabilir.\n\n'
              ' Lütfen dikkat!!!\nBu sadece genel bir örnek politikadır. Her uçuş firmasının kendi iade politikası olabilir ve bu politikalar şirketler arasında farklılık gösterebilir.\n\n',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            Text(
              'İptal Politikası',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '-Yolcu tarafından yapılan iptallerde, ücretin tamamı iade edilir.\n\n'
              '-Yolcu tarafından yapılan iptaller, seyahatten en az 24 saat önce yapılmalıdır.\n\n'
              '-Havayolu şirketi tarafından iptal edilen uçuşlarda, yolculara alternatif bir uçuş sunulacak veya ücretin tamamı iade edilecektir.\n\n'
              '-Havayolu şirketi, hava koşulları, grev, teknik sorunlar veya diğer zorunlu durumlar nedeniyle uçuş iptali yapmak zorunda kalırsa, yolculara mümkün olan en kısa sürede alternatif bir uçuş sunulacak veya ücretleri tamamen iade edilecektir.\n\n'
              '-Havayolu şirketi, yolculara herhangi bir zarar vermekten kaçınmak için her türlü makul tedbiri alacaktır. Ancak, iptal edilen bir uçuştan kaynaklanan herhangi bir maddi zarar veya kayıptan havayolu şirketi sorumlu değildir.\n\n',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
