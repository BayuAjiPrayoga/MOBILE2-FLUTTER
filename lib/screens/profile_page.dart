import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Initial data
  String name = 'Bayu Aji Prayoga';
  String title = 'Desain Grafis & Video Editor';
  String description =
      'Desainer grafis dan video editor yang bersemangat menciptakan konten visual yang menarik dan bermakna.';
  String email = 'YogaDesain@gmail.com';
  String phone = '+62 812 3456 7890';
  final String imageUrl = 'https://flutter.dev/images/flutter-logo-sharing.png';

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    _nameController.text = name;
    _titleController.text = title;
    _descriptionController.text = description;
    _emailController.text = email;
    _phoneController.text = phone;
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _nameController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      if (isEditing) {
        // Save the changes
        name = _nameController.text;
        title = _titleController.text;
        description = _descriptionController.text;
        email = _emailController.text;
        phone = _phoneController.text;
      }
      isEditing = !isEditing;
    });
  }

  void _cancelEdit() {
    setState(() {
      // Reset controllers to original values
      _nameController.text = name;
      _titleController.text = title;
      _descriptionController.text = description;
      _emailController.text = email;
      _phoneController.text = phone;
      isEditing = false;
    });
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildDisplayText(String text, TextStyle? style) {
    return Text(
      text,
      style: style,
      textAlign: style == Theme.of(context).textTheme.bodyMedium
          ? TextAlign.center
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 3,
          margin: EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile Image: try local asset first, fallback to network
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'lib/assets/bayu.JPG',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // If asset not found or fails to load, show network image
                      return Image.network(
                        imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Final fallback: placeholder circle with icon
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),

                // Name
                isEditing
                    ? _buildTextField(_nameController, 'Name')
                    : _buildDisplayText(
                        name,
                        Theme.of(context).textTheme.headlineSmall,
                      ),
                SizedBox(height: 8),

                // Title
                isEditing
                    ? _buildTextField(_titleController, 'Title')
                    : _buildDisplayText(
                        title,
                        TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                SizedBox(height: 8),

                // Description
                isEditing
                    ? _buildTextField(
                        _descriptionController,
                        'Description',
                        maxLines: 2,
                      )
                    : _buildDisplayText(
                        description,
                        Theme.of(context).textTheme.bodyMedium,
                      ),

                Divider(height: 30),

                // Email
                Row(
                  children: [
                    Icon(Icons.email, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Expanded(
                      child: isEditing
                          ? _buildTextField(_emailController, 'Email')
                          : _buildDisplayText('Email: $email', null),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Phone
                Row(
                  children: [
                    Icon(Icons.phone, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Expanded(
                      child: isEditing
                          ? _buildTextField(_phoneController, 'Phone')
                          : _buildDisplayText('Telepon: $phone', null),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Edit/Save/Cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (isEditing) ...[
                      ElevatedButton.icon(
                        onPressed: _cancelEdit,
                        icon: Icon(Icons.cancel),
                        label: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _toggleEditMode,
                        icon: Icon(Icons.save),
                        label: Text('Save'),
                      ),
                    ] else
                      ElevatedButton.icon(
                        onPressed: _toggleEditMode,
                        icon: Icon(Icons.edit),
                        label: Text('Edit Profile'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
