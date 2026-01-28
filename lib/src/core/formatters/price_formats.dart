String priceFormat(String price) => price.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ');
