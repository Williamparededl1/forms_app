import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Ususario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 200,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombres',
              hintText: 'Nombre Completo',
              prefixIcon: const Icon(Icons.abc),
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null) return 'Campo Requerido';
                if (value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                if (value.length < 6) {
                  return 'El Nombre debe tener mas de 6 caracteres';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Correo Electronico',
              hintText: '****@correo.com',
              prefixIcon: const Icon(Icons.email_rounded),
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null) return 'Campo Requerido';
                if (value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';

                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if (!emailRegExp.hasMatch(value)) return 'Correo invalido';

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contrasena',
              hintText: '*********',
              prefixIcon: const Icon(Icons.lock_outline),
              obscureText: true,
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null) return 'Campo Requerido';
                if (value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                if (value.length < 8) {
                  return 'El Nombre debe tener mas de 8 caracteres';
                }

                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;
                print('$username , $email , $password');
              },
              label: const Text('Guardar'),
              icon: const Icon(Icons.save),
            ),
          ],
        ));
  }
}
