import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 64,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Profile Card App',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Versi 1.0.0',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),

              Text(
                'Deskripsi Aplikasi',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Card App adalah aplikasi Flutter yang mendemonstrasikan penggunaan berbagai widget dasar dan konsep pengembangan mobile.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Fitur Utama:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      _buildFeatureItem(
                        '📱',
                        'Tampilan profil yang interaktif',
                      ),
                      _buildFeatureItem(
                        '✏️',
                        'Form editing profil dengan TextField',
                      ),
                      _buildFeatureItem('🌙', 'Toggle tema gelap dan terang'),
                      _buildFeatureItem('🔄', 'Tema otomatis mengikuti sistem'),
                      _buildFeatureItem('📖', 'Halaman tentang aplikasi'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teknologi yang Digunakan:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      _buildFeatureItem('💙', 'Flutter Framework'),
                      _buildFeatureItem('🎯', 'Dart Programming Language'),
                      _buildFeatureItem('🎨', 'Material Design 3'),
                      _buildFeatureItem(
                        '📦',
                        'StatefulWidget & StatelessWidget',
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),

              Center(
                child: Text(
                  '© 2024 Profile Card App\nDikembangkan untuk pembelajaran Flutter',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String emoji, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
