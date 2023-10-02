
import 'package:flutter/material.dart' show IconData, Icons;

class ContactInfo {
  final String contact;
  final String title;
  final IconData icon;
  const ContactInfo({
    required this.contact,
    required this.title,
    required this.icon,
  });
}
const contactList = [
    ContactInfo(
      contact: 'Trivandrum, Kerala',
      icon: Icons.home,
      title: 'Location',
    ),
    ContactInfo(
      contact: '+91 7560951397',
      icon: Icons.phone,
      title: 'Phone number',
    ),
    ContactInfo(
      contact: 'ashim8696@gmail.com',
      icon: Icons.email,
      title: 'Email address',
    ),
];
