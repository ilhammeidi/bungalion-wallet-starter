class Bank {

  final String id;
  final String logo;
  final String name;
  final String number;
  final String? description;

  Bank({
    required this.id,
    required this.logo,
    required this.name,
    required this.number,
    this.description
  });
}

final List<Bank> bankList = [
  Bank(
    id: '0',
    logo: 'assets/images/logos/logo1.png',
    name: 'Bank 1',
    number: '01234567890',
    description: ''
  ),
  Bank(
    id: '1',
    logo: 'assets/images/logos/logo2.png',
    name: 'Bank Central',
    number: '1234567890',
    description: 'Primary account for daily transactions.',
  ),
  Bank(
    id: '2',
    logo: 'assets/images/logos/logo3.png',
    name: 'Bank Mandiri',
    number: '9876543210',
    description: 'Used for salary and payments.',
  ),
  Bank(
    id: '3',
    logo: 'assets/images/logos/logo4.png',
    name: 'Bank Lorem Ipsum',
    number: '5678901234',
    description: 'Business account for vendor payments.',
  ),
  Bank(
    id: '4',
    logo: 'assets/images/logos/logo5.png',
    name: 'Bank Dolor Sit Amet',
    number: '9988776655',
    description: 'Linked for e-wallet top-ups.',
  ),
  Bank(
    id: '5',
    logo: 'assets/images/logos/logo6.png',
    name: 'CIMB',
    number: '7788990011',
    description: 'Secondary account for online purchases.',
  ),
  Bank(
    id: '6',
    logo: 'assets/images/logos/logo7.png',
    name: 'OCBC NISP',
    number: '3344556677',
    description: 'Savings account for travel expenses.',
  ),
  Bank(
    id: '7',
    logo: 'assets/images/logos/logo8.png',
    name: 'Maybank',
    number: '2233445566',
    description: 'Backup account for international transfers.',
  ),
];
