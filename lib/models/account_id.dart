class AccountId {
  final String id;
  final String? name;
  final String? avatar;
  final String userId;
  final bool isFavorited;
  final String category;

  AccountId({
    required this.id,
    required this.userId,
    this.name,
    this.avatar,
    this.isFavorited = false,
    required this.category
  });
}

final List<AccountId> savedAccountList = [
  AccountId(
    id: "1",
    userId: "johndoe@mail.com",
    name: "Google Play",
    category: "app",
    isFavorited: true,
  ),
  AccountId(
    id: "2",
    userId: "johndoe",
    name: "Netflix",
    category: "app",
  ),
  AccountId(
    id: "3",
    userId: "1234567890",
    name: "PLN Electricity",
    category: "electric",
    isFavorited: true,
  ),
  AccountId(
    id: "4",
    userId: "john_doe",
    name: "Steam Wallet",
    category: "game",
  ),
  AccountId(
    id: "5",
    userId: "joh_doe123",
    name: "Mobile Legends",
    category: "game",
  ),
  AccountId(
    id: "6",
    userId: "081234567890",
    name: "Telkomsel",
    category: "mobile",
    isFavorited: true,
  ),
  AccountId(
    id: "7",
    userId: "09876543210",
    name: "Indosat Ooredoo",
    category: "mobile",
  ),
  AccountId(
    id: "8",
    userId: "09876543210",
    name: "OVO",
    category: "payment",
  ),
  AccountId(
    id: "9",
    userId: "09876543211",
    name: "GoPay",
    category: "payment",
    isFavorited: true,
  ),
  AccountId(
    id: "10",
    userId: "011122233344",
    name: "Dana",
    category: "payment",
  ),
  AccountId(
    id: "11",
    userId: "0122333444455",
    name: "ShopeePay",
    category: "payment",
  ),
  AccountId(
    id: "12",
    userId: "john_doe@mail.com",
    name: "Google Play Voucher",
    category: "voucher",
  ),
  AccountId(
    id: "13",
    userId: "user_007",
    name: "Amazon Gift Card",
    category: "voucher",
    isFavorited: true,
  ),
  AccountId(
    id: "14",
    userId: "johndoe",
    name: "iTunes Gift Card",
    category: "voucher",
  ),
  AccountId(
    id: "15",
    userId: "johndoe",
    name: "Disney+ Hotstar",
    category: "member",
  ),
  AccountId(
    id: "16",
    userId: "johndoe@mail.com",
    name: "Spotify Premium",
    category: "member",
    isFavorited: true,
  ),
  AccountId(
    id: "17",
    userId: "johndoe@mail.com",
    name: "YouTube Premium",
    category: "member",
  ),
  AccountId(
    id: "18",
    userId: "johndoe@mail.com",
    name: "Xbox Game Pass",
    category: "member",
  ),
  AccountId(
    id: "19",
    userId: "johndoe",
    name: "Garena Shells",
    category: "game",
  ),
  AccountId(
    id: "20",
    userId: "098765432100",
    name: "Mobile Data Package XL",
    category: "mobile",
  ),
];
