import 'package:customization/screens/divider_screen.dart';

import '../../../screens/loading_screen.dart';
import '../../../screens/switch_screen.dart';
import '../model/drawer.dart';
import '../../../screens/button_screen.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/textfield_screen.dart';
import '../../../screens/typography_screen.dart';

List<ModelDrawer> pages = [
  ModelDrawer('General', 'Home', child: const HomeScreen()),
  ModelDrawer('Views', 'Typography', child: const TypographyScreen()),
  ModelDrawer('Input', 'Button', child: const ButtonScreen()),
  ModelDrawer('Views', 'Divider', child: const DividerScreen()),
  ModelDrawer('Views', 'ListTile', child: const ButtonScreen()),
  ModelDrawer('Views', 'Stepper', child: const ButtonScreen()),
  ModelDrawer('Views', 'Tooltip', child: const ButtonScreen()),
  ModelDrawer('Animation Views', 'Loading', child: const LoadingScreen()),
  ModelDrawer('Views', 'DataTable', child: const ButtonScreen()),
  ModelDrawer('Views', 'Chip', child: const ButtonScreen()),
  ModelDrawer('Views', 'Card', child: const ButtonScreen()),
  ModelDrawer('Input', 'Switch', child: const SwitchScreen()),
  ModelDrawer('Input', 'Radio', child: const ButtonScreen()),
  ModelDrawer('Input', 'Checkbox', child: const ButtonScreen()),
  ModelDrawer('Input', 'Textfield', child: const TextFieldScreen()),
  ModelDrawer('Input', 'Date Picker', child: const ButtonScreen()),
  ModelDrawer('Input', 'Checkbox', child: const ButtonScreen()),
  ModelDrawer('Input', 'Pop up menu', child: const ButtonScreen()),
  ModelDrawer('Views', 'Dialog', child: const ButtonScreen()),
  ModelDrawer('Views', 'Snackbar', child: const ButtonScreen()),
  ModelDrawer('Views', 'Expansion Panel', child: const ButtonScreen()),
  ModelDrawer('Views', 'Bottom sheet', child: const ButtonScreen()),
];
