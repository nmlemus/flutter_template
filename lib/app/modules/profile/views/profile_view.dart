import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final Uri imagelUrl = Uri.parse(
        "https://img1.wsimg.com/isteam/ip/66e6bd98-fc3c-4334-92c4-18186e69d392/play_store_512.png/:/rs=w:100,h:100,cg:true,m/cr=w:100,h:100/qt=q:95");
    final Uri nameUrl = Uri.parse('Pa\'Cuba');
    //final Uri designationUrl = Uri.parse(widget.designation);
    final Uri emailUrl = Uri.parse("mailto:" "pacuba.app@gmail.com");
    final Uri phoneUrl = Uri.parse("tel:" '+507 6364-4604');
    final Uri webUrl = Uri.parse("https://pacuba.info/");
    //final Uri smsUrl = Uri.parse("sms:" + widget.phone_number);
    void getUrlLauncher(Uri url) async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text(
          "Quienes Somos",
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                        'https://img1.wsimg.com/isteam/ip/66e6bd98-fc3c-4334-92c4-18186e69d392/play_store_512.png/:/rs=w:100,h:100,cg:true,m/cr=w:100,h:100/qt=q:95'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Pa\'Cuba',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tus compras a un clic. \n\n El precio mas bajo del mercado,'
                    ' \n si encuentras un precio mejor nos los envias y lo igualamos.',
                textAlign: TextAlign.center,
              ),
              TextButton(
                  onPressed: () async {
                    getUrlLauncher(emailUrl);
                  },
                  child: const Text('pacuba.app@gmail.com')),
              TextButton.icon(
                onPressed: () async {
                  launchWhatsApp();
                },
                label: const Text('+507 6364-4604'),
                icon: const Icon(
                  LineIcons.whatSApp,
                  color: Colors.green,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    getUrlLauncher(webUrl);
                  },
                  child: const Text('https://pacuba.info/')),
            ],
          ),
        ),
      ),
    );
  }

  launchWhatsApp() async {
    WhatsAppUnilink link = const WhatsAppUnilink(
      phoneNumber: "+50763644604",
      text: "Hola  *FluTemp \n"
          "\n"
          "Tengo una consulta que hacerles.\n"
          "\n",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }
}
