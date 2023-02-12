class ProductList {
  final String? pName;
  final int? pQuantity;
  final int? pPrice;
  final String? pImage;
  final String? cImage;
  final String? cName;

  ProductList(
      {this.pName,
      this.pQuantity,
      this.pPrice,
      this.pImage,
      this.cImage,
      this.cName});
}

List myProductList = [
  {
    "pQuantity": 1,
    "pPrice": 2000,
    "pName": "Baby Lotion",
    "pImage": "images/bby.jpg",
  },
  {
    "pQuantity": 1,
    "pPrice": 240,
    "pName": "Men Polo T-shirt",
    "pImage": "assets/motornew.jpg",
  },
  {
    "pQuantity": 1,
    "pPrice": 2050,
    "pName": "Sophia Campos",
    "pImage": "assets/psharee1.jpg",
  }
];
List newArrivalProducts = [
  {
    "pQuantity": 1,
    "pPrice": 550,
    "pName": "Polo t-shirt",
    "pImage": "assets/ptshirt.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 1900,
    "pName": "Saree",
    "pImage": "assets/psharee.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2050,
    "pName": "Sophia Campos",
    "pImage": "assets/psharee1.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2900,
    "pName": "Sherwani",
    "pImage": "assets/test2.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 1050,
    "pName": "Similar Product",
    "pImage": "assets/hearlds.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 950,
    "pName": "Desirae Paul",
    "pImage": "assets/panjabi.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 920,
    "pName": "Quentin ",
    "pImage": "assets/babycute.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 300,
    "pName": "Uma Locas",
    "pImage": "assets/uma.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 602,
    "pName": "Raya Melendez",
    "pImage": "assets/raya.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 750,
    "pName": "Aline Garrette",
    "pImage": "assets/aline.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 22445,
    "pName": "Ladis shirt",
    "pImage": "assets/shirt.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 918,
    "pName": "Mackenise Mejia",
    "pImage": "assets/mejia.jpeg"
  },
  {
    "pQuantity": 1,
    "pPrice": 3300,
    "pName": "Ladis-tops",
    "pImage": "assets/test.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 250,
    "pName": "Chandler Wilcox",
    "pImage": "assets/wilcox.jpeg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2200,
    "pName": "Punjabi",
    "pImage": "assets/ashely.jpg"
  },
];
List allProducts = [
  {
    "pQuantity": 1,
    "pPrice": 2000,
    "pName": "Baby Lotion",
    "pImage": "images/bby.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 5050,
    "pName": "Motor Engine",
    "pImage": "assets/motornew.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 550,
    "pName": "Men t-shirt",
    "pImage": "assets/ptshirt.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 1900,
    "pName": "Saree",
    "pImage": "assets/psharee.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2050,
    "pName": "Sophia Campos",
    "pImage": "assets/psharee1.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2900,
    "pName": "Sherwani",
    "pImage": "assets/test2.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 1050,
    "pName": "Similar Product",
    "pImage": "assets/hearlds.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 950,
    "pName": "Desirae Paul",
    "pImage": "assets/panjabi.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 920,
    "pName": "Quentin Mccormick",
    "pImage": "assets/babycute.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 300,
    "pName": "Uma Locas",
    "pImage": "assets/uma.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 602,
    "pName": "Raya Melendez",
    "pImage": "assets/raya.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 750,
    "pName": "Aline Garrette",
    "pImage": "assets/aline.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 22445,
    "pName": "Ladis shirt",
    "pImage": "assets/shirt.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 918,
    "pName": "Mackenise Mejia",
    "pImage": "assets/mejia.jpeg"
  },
  {
    "pQuantity": 1,
    "pPrice": 3300,
    "pName": "Ladis-tops",
    "pImage": "assets/test.jpg"
  },
  {
    "pQuantity": 1,
    "pPrice": 250,
    "pName": "Chandler Wilcox",
    "pImage": "assets/wilcox.jpeg"
  },
  {
    "pQuantity": 1,
    "pPrice": 2200,
    "pName": "Punjabi",
    "pImage": "assets/ashely.jpg"
  },
];
List allgridProduct = [
    {
    "pQuantity": 1,
    "pPrice": 2000,
    "pName": "Baby Lotion",
    "pImage": "images/bby.jpg",
  },
    {
    "pQuantity": 1,
    "pPrice": 1900,
    "pName": "Saree",
    "pImage": "assets/psharee.jpg"
  },
   {
    "pQuantity": 1,
    "pPrice": 1050,
    "pName": "Similar Product",
    "pImage": "assets/hearlds.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 5050,
    "pName": "Motor Engine",
    "pImage": "assets/motornew.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 2050,
    "pName": "Sophia Campos",
    "pImage": "assets/psharee1.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 950,
    "pName": "Desirae Paul",
    "pImage": "assets/panjabi.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 550,
    "pName": "Polo t-shirt",
    "pImage": "assets/ptshirt.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 2900,
    "pName": "Sherwani",
    "pImage": "assets/test2.jpg"
  },
    {
    "pQuantity": 1,
    "pPrice": 920,
    "pName": "Quentin",
    "pImage": "assets/babycute.jpg"
  },
];
List categoryList = [
  {
    "catItemName": "Care",
    "catItemImage": "assets/care.jpg",
    "pList": [
      {
        "pQuantity": "1",
        "pPrice": "245",
        "pName": "Cute Baby",
        "pImage": "assets/babycute.jpg"
      },
    ]
  },
  {
    "catItemName": "Kids",
    "catItemImage": "assets/kids.webp",
    "pList": [
      {
        "pQuantity": 1,
        "pPrice": 750,
        "pName": "Aline Garrette",
        "pImage": "assets/aline.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 602,
        "pName": "Raya Melendez",
        "pImage": "assets/raya.jpg"
      },
    ]
  },
  {
    "catItemName": "Women",
    "catItemImage": "assets/wmen.webp",
    'pList': [
      {
        "pQuantity": 1,
        "pPrice": 250,
        "pName": "Chandler Wilcox",
        "pImage": "assets/wilcox.jpeg"
      },
      {
        "pQuantity": 1,
        "pPrice": 300,
        "pName": "Uma Locas",
        "pImage": "assets/uma.jpg"
      },
    ]
  },
  {
    "catItemName": "Men",
    "catItemImage": "assets/men.jpg",
    'pList': [
      {
        "pQuantity": 1,
        "pPrice": 920,
        "pName": "Quentin Mccormick",
        "pImage": "assets/babycute.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 550,
        "pName": "Polo t-shirt",
        "pImage": "assets/ptshirt.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 5050,
        "pName": "Motor Engine",
        "pImage": "assets/motornew.jpg"
      },
    ]
  },
  {
    "catItemName": "New Arrival",
    "catItemImage": "assets/na.jpg",
    'pList': [
      {
        "pQuantity": 1,
        "pPrice": 3300,
        "pName": "Ladis-tops",
        "pImage": "assets/test.jpg"
      },
    ]
  },
  {
    "catItemName": "Tranding",
    "catItemImage": "assets/trndn.jpg",
    'pList': [
      {
        "pQuantity": 1,
        "pPrice": 2200,
        "pName": "Punjabi",
        "pImage": "assets/ashely.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 918,
        "pName": "Mackenise Mejia",
        "pImage": "assets/mejia.jpeg"
      },
      {
        "pQuantity": 1,
        "pPrice": 22445,
        "pName": "Ladis shirt",
        "pImage": "assets/shirt.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 950,
        "pName": "Desirae Paul",
        "pImage": "assets/panjabi.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 1050,
        "pName": "Test Similar Product",
        "pImage": "assets/hearlds.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 2900,
        "pName": "Sherwani",
        "pImage": "assets/test2.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 2050,
        "pName": "Sophia Campos",
        "pImage": "assets/psharee1.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 1900,
        "pName": "Saree",
        "pImage": "assets/psharee.jpg"
      },
      {
        "pQuantity": 1,
        "pPrice": 2000,
        "pName": "Baby Lotion",
        "pImage": "images/bby.jpg"
      },
    ]
  }
];
