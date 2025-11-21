class Faq {
  Faq({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

final List<Faq> faqData = [
    Faq(
      expandedValue: 'The first address on the page will be the default address when you check out, but you can also select any of the other addresses or add a new one at checkout. If you’re trying to add a new address, but are receiving an error message, here are some helpful tips for',
      headerValue: 'Updating Your Account Information',
    ),
    Faq(
      expandedValue: 'Surprise someone special with the gift of experiences with a Groupon Gift Card! Here\'s a quick guide to walk you through the process of purchasing, personalizing, and sending your gift card',
      headerValue: 'Gift cards - how to buy and give?',
    ),
    Faq(
      expandedValue: 'To redeem your gift card, you\'ll need a Groupon account.  If you haven\'t already, creating an account is quick and easy during the redemption process.',
      headerValue: 'How to redeem a gift card?',
    ),
    Faq(
      expandedValue: 'We design every deal page to give you all the information you\'ll need before purchasing, in distinct sections so you know where to find it. Here\'s a tour of those different sections to help you make the most of your Groupon shopping experience.',
      headerValue: 'Finding Deal Details',
    ),
    Faq(
      expandedValue: 'If you can\'t find what you\'re looking for, or you still have questions, it\'s best to check with the business directly. You can find the merchant\'s website or contact information at the bottom of the deal page.',
      headerValue: 'Questions About a Business or Deal',
    ),
    Faq(
      expandedValue: 'On a computer, you can find our deal categories to the left of the search bar—just select the category that interests you to see offers. On the mobile app, simpy tap the Categories icon at the bottom of the page.',
      headerValue: 'How to Leave a Review Through Our Surveys?',
    ),
    Faq(
      expandedValue: 'You can find your Groupon Credits balance by visiting the Account page on a computer or the My Stuff menu on mobile. From here, you can select Groupon Credits to view your',
      headerValue: 'Where to Find Groupon Credits in Your Account?',
    )
  ];