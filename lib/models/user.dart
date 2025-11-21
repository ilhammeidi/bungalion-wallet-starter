import 'package:ewallet_app/constants/img_api.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String title;
  final String avatar;
  final String idCard;
  final String dateOfBirth;
  final String phone;
  final String email;
  final String country;
  final String currency;
  final String currencySymbol;
  final bool isFavorited;

  User({
    required this.id,
    required this.name,
    this.username = '',
    required this.title,
    required this.avatar,
    required this.idCard,
    required this.dateOfBirth,
    required this.phone,
    required this.email,
    required this.country,
    this.currency = 'USD',
    this.currencySymbol = '\$',
    this.isFavorited = false
  });
}

final User userInit = User(
  id: '0',
  name: '',
  title: '',
  avatar: '',
  idCard: '',
  dateOfBirth: '',
  phone: '',
  email: '',
  country: '',
);

final List<User> userList = [
  User(
    id: '1',
    name: 'John Doe',
    title: 'Mr',
    avatar: ImgApi.avatar[10],
    idCard: '0123456789',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
    isFavorited: true
  ),
  User(
    id: '2',
    name: 'Jean Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[0],
    idCard: '0123098765',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
  User(
    id: '3',
    name: 'James Doe',
    title: 'Mr',
    avatar: ImgApi.avatar[9],
    idCard: '01234560987',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
    isFavorited: true
  ),
  User(
    id: '4',
    name: 'Jena Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[1],
    idCard: '01254387690',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
  User(
    id: '5',
    name: 'Jeni Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[2],
    idCard: '01254309876',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
    isFavorited: true
  ),
  User(
    id: '6',
    name: 'Jack Doe',
    title: 'Mr',
    avatar: ImgApi.avatar[8],
    idCard: '01234509899',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
    isFavorited: true
  ),
  User(
    id: '7',
    name: 'Joe Doe',
    title: 'Mr',
    avatar: ImgApi.avatar[7],
    idCard: '01209876543',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
  User(
    id: '8',
    name: 'Jean Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[3],
    idCard: '01235476980',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
  User(
    id: '9',
    name: 'Jihan Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[4],
    idCard: '01254376890',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
  User(
    id: '10',
    name: 'Joy Doe',
    title: 'Mrs',
    avatar: ImgApi.avatar[5],
    idCard: '01236549870',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
    isFavorited: true
  ),
  User(
    id: '11',
    name: 'Jack Doe',
    title: 'Mr',
    avatar: ImgApi.avatar[6],
    idCard: '012000034567',
    dateOfBirth: 'Jan 12, 1994',
    phone: '+628940391122',
    email: 'john_doe@mail.com',
    country: 'Mexico',
  ),
];
