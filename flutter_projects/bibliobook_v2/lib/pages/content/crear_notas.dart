import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CrearNota extends StatefulWidget {
  const CrearNota({Key? key}) : super(key: key);

  @override
  _CrearNotaState createState() => _CrearNotaState();
}

class _CrearNotaState extends State<CrearNota> {
  final _formKey = GlobalKey<FormState>();
  String _titulo = '';
  String _url = '';
  String _notaDeVoz = '';
  String _texto = '';
  late File _imageFile;
  
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear nota'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                    child: (_imageFile != null)
                        ? Image.file(_imageFile)
                        : Placeholder(),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un título';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _titulo = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'URL',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _url = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nota de voz',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor graba una nota de voz';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _notaDeVoz = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Texto',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un texto';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _texto = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final nota = '$_titulo\n$_url\n$_notaDeVoz\n$_texto';
                    Navigator.pop(context, nota);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
