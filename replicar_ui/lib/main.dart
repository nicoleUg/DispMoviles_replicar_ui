import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF727FC2),
        ).copyWith(primary: const Color(0xFF727FC2), onPrimary: Colors.white),
      ),
      home: const ProfileMockScreen(),
    );
  }
}

class ProfileMockScreen extends StatelessWidget {
  const ProfileMockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surfaceContainer,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: cs.surface, 
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: cs.shadow.withOpacity(0.18),
                    blurRadius: 28,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Column(
                  children: const [
                    SizedBox(height: 10),
                    _TopBar(),
                    Expanded(child: _ProfileBody()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: cs.surface,
        elevation: 2,
        shadowColor: cs.shadow.withOpacity(0.12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SizedBox(
          height: 54,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: cs.primary),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
              const Expanded(
                child: Text(
                  'Perfil de Usuario',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
      child: Column(
        children: [
          const SizedBox(height: 6),
          CircleAvatar(
            radius: 58,
            backgroundColor: cs.primary,
            child: Icon(Icons.person, size: 58, color: cs.onPrimary),
          ),
          const SizedBox(height: 18),
          Text(
            'Ana García',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Mobile Developer',
            style: theme.textTheme.titleMedium?.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 22),

          Material(
            color: cs.surface,
            elevation: 3,
            shadowColor: cs.shadow.withOpacity(0.10),
            borderRadius: BorderRadius.circular(18),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  _InfoRow(
                    icon: Icons.mail_outline,
                    text: 'Correo Electrónico',
                    emphasis: false,
                  ),
                  Divider(
                    height: 18,
                    color: cs.outlineVariant.withOpacity(0.6),
                  ),
                  _InfoRow(
                    icon: Icons.alternate_email,
                    text: 'ana_garcia@example.com',
                    emphasis: true,
                  ),
                  Divider(
                    height: 18,
                    color: cs.outlineVariant.withOpacity(0.6),
                  ),
                  _InfoRow(
                    icon: Icons.cake_outlined,
                    text: 'Edad 30 años',
                    emphasis: false,
                  ),
                  Divider(
                    height: 18,
                    color: cs.outlineVariant.withOpacity(0.6),
                  ),
                  _InfoRow(
                    icon: Icons.person_outline,
                    text: 'Mobile Developer',
                    emphasis: true,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
              child: const Text(
                'Editar Perfil',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool emphasis;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.emphasis,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Row(
      children: [
        Icon(icon, size: 22, color: cs.primary.withOpacity(0.85)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style:
                (emphasis
                        ? theme.textTheme.titleMedium
                        : theme.textTheme.bodyLarge)
                    ?.copyWith(
                      color: emphasis ? cs.onSurface : cs.onSurfaceVariant,
                      fontWeight: emphasis ? FontWeight.w600 : FontWeight.w500,
                    ),
          ),
        ),
      ],
    );
  }
}
