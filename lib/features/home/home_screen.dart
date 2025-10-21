import 'package:flutter/material.dart';
import 'package:moody_app/core/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const _MoodTrackingTab(),
    const _BookingTab(),
    const _DiaryTab(),
    const _ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _screens[_currentIndex]), // Agregado SafeArea
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Moody',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Agendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            activeIcon: Icon(Icons.book),
            label: 'Diario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// Pestaña de Seguimiento de Ánimo
class _MoodTrackingTab extends StatelessWidget {
  const _MoodTrackingTab();

  @override
  Widget build(BuildContext context) {
    // Generar días dinámicamente (próximos 7 días)
    final now = DateTime.now();
    final days = List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      final dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];
      return '${date.day} ${dayNames[date.weekday % 7]}';
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          
          // Header con hora
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tampía', // Asumí que es correcto; si no, corrígelo
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '9:41', // Hardcodeado; usa DateTime.now() si quieres dinámico
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Días de la semana (dinámicos)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: days.take(3).map((day) => Container( // Muestra los primeros 3 días
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        day,
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ))
                .toList(),
          ),
          
          const SizedBox(height: 32),
          
          // Psicólogos disponibles (corregido)
          const Text(
            'Psicólogos disponibles',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Lista de psicólogos
          Column(
            children: [
              _PsychologistCard(
                name: 'Professional Master',
                schedule: '8:30 - 10:30 p.m.',
              ),
              const SizedBox(height: 16),
              _PsychologistCard(
                name: 'Professional Master',
                schedule: '9:30 - 10:30 p.m.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PsychologistCard extends StatelessWidget {
  final String name;
  final String schedule;

  const _PsychologistCard({
    required this.name,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
            child: Icon(
              Icons.person,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Horario: $schedule', // Corregido para combinar
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey[400],
            size: 16,
          ),
        ],
      ),
    );
  }
}

// Otras pestañas (placeholders)
class _BookingTab extends StatelessWidget {
  const _BookingTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Pantalla de Agendar'));
  }
}

class _DiaryTab extends StatelessWidget {
  const _DiaryTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Pantalla de Diario'));
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Pantalla de Perfil'));
  }
}