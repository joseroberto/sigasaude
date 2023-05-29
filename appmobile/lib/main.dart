import 'package:covid_data_app/controller/appointments_provider.dart';
import 'package:covid_data_app/controller/form_provider.dart';
import 'package:covid_data_app/controller/maps_provider.dart';
import 'package:covid_data_app/screens/agendar_consulta_screen/agendar_consulta.dart';
import 'package:covid_data_app/screens/appointments_screen/appointments.dart';
import 'package:covid_data_app/screens/articles_screen/articles.dart';
import 'package:covid_data_app/screens/auth_screen/auth_screen.dart';
import 'package:covid_data_app/screens/auth_screen/login_screen.dart';
import 'package:covid_data_app/screens/auth_screen/register_screen.dart';
import 'package:covid_data_app/screens/emergency_screen/emergency.dart';
import 'package:covid_data_app/screens/faq_screen/faq.dart';
import 'package:covid_data_app/screens/forms_screen/forms.dart';
import 'package:covid_data_app/screens/home_screen/home.dart';
import 'package:covid_data_app/screens/locations_screen/locations.dart';
import 'package:covid_data_app/screens/notifications_screen/notifications.dart';
import 'package:covid_data_app/screens/on_boarding_screen/on_boarding.dart';
import 'package:covid_data_app/screens/prescriptions_screen/prescriptions.dart';
import 'package:covid_data_app/screens/profile_screen/profile.dart';
import 'package:covid_data_app/screens/vaccines_screen/vaccines.dart';
import 'package:covid_data_app/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FormProvider()),
    ChangeNotifierProvider(create: (context) => MapsProvider()),
    ChangeNotifierProvider(create: (context) => AppointmentsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'SIGA Saúde',
      theme: themeData,
      initialRoute: "home",
      routes: {
        "on_boarding": (context) => const OnBoardingScreen(),
        "auth": (context) => const AuthScreen(),
        "register": (context) => const RegisterScreen(),
        "login": (context) => const LoginScreen(),
        "home": (context) => const HomeScreen(),
        "profile": (context) => const ProfileScreen(),
        "locations": (context) => LocationsScreen(),
        "articles": (context) => const ArticlesScreen(),
        "appointments": (context) => const AppointmentsScreen(),
        "prescriptions": (context) => const PrescriptionsScreen(),
        "agendar_consulta": (context) => const AgendarConsulta(),
        "vaccines": (context) => const VaccinesScreen(),
        "emergency": (context) => const EmergencyScreen(),
        "notifications": (context) => const NotificationsScreen(),
        "faq": (context) => const FaqScreen()
      },
      onGenerateRoute: (settings) {
        if(settings.name == 'forms') {
          Map<String, dynamic> routeArgs =
          settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(builder: (context) {
            return FormsScreen(
                day: routeArgs["day"],
                month: routeArgs["month"],
                time: routeArgs["time"]
            );
          });
        }
      },
    );
  }
}
