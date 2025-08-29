import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _remember = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    // Simulación de login (reemplaza con tu servicio)
    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;
    setState(() => _loading = false);

    // Navega a tu Home (aún no implementado)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login correcto (demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, c) {
          final isWide = c.maxWidth >= 900;
          final sidePadding = isWide ? c.maxWidth * 0.12 : 24.0;

          return SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(sidePadding, 65, sidePadding, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Encabezado con logo y título
                Center(
                  child: 
                    Hero(
                      tag: 'logo',
                      child: Image.asset('assets/logo.png', height: 50),
                    ),
                ),
                const SizedBox(height: 18),
                // Card de formulario
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.black.withOpacity(0.06)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                      key: _formKey,
                      child: AutofillGroup(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Iniciar sesión',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 16), //Espacio debajo del título  
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                                  Text(
                                        'DNI',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                          ), 
                                  ),
                            ),
                            const SizedBox(height: 6), // pequeño espacio entre texto e input

                            //Campo de correo
                            TextFormField(
                              controller: _emailCtrl,
                              autofillHints: const [AutofillHints.username, AutofillHints.email],
                              keyboardType: TextInputType.emailAddress,                            
                              validator: (v) {
                                final val = (v ?? '').trim();
                                if (val.isEmpty) return 'Ingresa tu correo';
                                // validación básica
                                final emailRx = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                                if (!emailRx.hasMatch(val)) return 'Correo no válido';
                                return null;
                              },
                            ),
                            const SizedBox(height: 14),
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                             Text(
                                  'Contraseña',
                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[800],
                                    ), 
                            ),
                            ),
                            const SizedBox(height: 6), // pequeño espacio entre texto e input

                            TextFormField(
                              controller: _passCtrl,
                              autofillHints: const [AutofillHints.password],
                              obscureText: _obscure,
                              decoration: InputDecoration(                                
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() => _obscure = !_obscure),
                                  icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                                  tooltip: _obscure ? 'Mostrar' : 'Ocultar',
                                ),
                              ),
                              validator: (v) {
                                final val = (v ?? '');
                                if (val.isEmpty) return 'Ingresa tu contraseña';
                                if (val.length < 6) return 'Mínimo 6 caracteres';
                                return null;
                              },
                            ),
                            TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Recuperación: pendiente de implementar')),
                                    );
                                  },
                                  
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text('¿Olvidaste tu contraseña?'),
                                  ) 
                                ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Switch(
                                  value: _remember,
                                  onChanged: (v) => setState(() => _remember = v),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                const SizedBox(width: 4),
                                const Text('Recordarme en este dispositivo'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _loading ? null : _onLogin,
                                child: _loading
                                    ? const SizedBox(
                                        height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
                                    : const Text('INICIAR SESIÓN'),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String title;
  const _FeatureChip({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Chip(
      avatar: Icon(icon, size: 18, color: cs.primary),
      label: Text(title),
      side: BorderSide(color: Colors.black.withOpacity(0.08)),
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
