class GardenModel {
  String id;
  String gornusi;
  String firmasy;
  String blogy;
  String imageUrl;
  GardenModel({
    required this.id,
    required this.gornusi,
    required this.firmasy,
    required this.blogy,
    required this.imageUrl,
  });
}

List<GardenModel> gardens = [
  GardenModel(
    id: 'A182hdn',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A1',
    imageUrl: 'assets/images/banana.png',
  ),
  GardenModel(
    id: 'A2dheu8',
    gornusi: "Alma",
    firmasy: "Saýa",
    blogy: 'A2',
    imageUrl: 'assets/images/apple_garden.png',
  ),
  GardenModel(
    id: 'A3jncoui',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A3',
    imageUrl: 'assets/images/banana.png',
  ),
  GardenModel(
    id: 'A5g673y',
    gornusi: "Alma",
    firmasy: "Saýa",
    blogy: 'A4',
    imageUrl: 'assets/images/apple_garden.png',
  ),
  GardenModel(
    id: 'Auch92',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A5',
    imageUrl: 'assets/images/banana.png',
  ),
  GardenModel(
    id: 'A182hdn',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A1',
    imageUrl: 'assets/images/banana.png',
  ),
  GardenModel(
    id: 'A2dheu8',
    gornusi: "Alma",
    firmasy: "Saýa",
    blogy: 'A2',
    imageUrl: 'assets/images/apple_garden.png',
  ),
  GardenModel(
    id: 'A3jncoui',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A3',
    imageUrl: 'assets/images/banana.png',
  ),
  GardenModel(
    id: 'A5g673y',
    gornusi: "Alma",
    firmasy: "Saýa",
    blogy: 'A4',
    imageUrl: 'assets/images/apple_garden.png',
  ),
  GardenModel(
    id: 'Auch92',
    gornusi: "Banan",
    firmasy: "Saýa",
    blogy: 'A5',
    imageUrl: 'assets/images/banana.png',
  ),
];


class GardenStatusMap {
  final int row;
  final int column;
  final String status;
  final GardenModel gardenModel;

  GardenStatusMap({
    required this.gardenModel,
    required this.row,
    required this.column,
    required this.status,
  });
}

final List<GardenStatusMap> gardenListStatus = [
  // 0-nji hatar
  GardenStatusMap(row: 0, column: 0, status: 'Gowy', gardenModel: gardens[0]),
  GardenStatusMap(row: 0, column: 1, status: 'Suwsyz', gardenModel: gardens[1]),
  GardenStatusMap(row: 0, column: 2, status: 'Keselli', gardenModel: gardens[1]),
  GardenStatusMap(
    row: 0,
    column: 3,
    status: 'Bellenmedik',
    gardenModel: gardens[0],
  ),
  GardenStatusMap(row: 0, column: 4, status: 'Guran', gardenModel: gardens[0]),

  // 1-nji hatar
  GardenStatusMap(row: 1, column: 0, status: 'Keselli', gardenModel: gardens[1]),
  GardenStatusMap(row: 1, column: 1, status: 'Suwsyz', gardenModel: gardens[1]),
  GardenStatusMap(row: 1, column: 2, status: 'Gowy', gardenModel: gardens[0]),
  GardenStatusMap(
    row: 1,
    column: 3,
    status: 'Bellenmedik',
    gardenModel: gardens[0],
  ),
  GardenStatusMap(row: 1, column: 4, status: 'Guran', gardenModel: gardens[1]),

  // 2-nji hatar
  GardenStatusMap(row: 2, column: 0, status: 'Gowy', gardenModel: gardens[1]),
  GardenStatusMap(row: 2, column: 1, status: 'Suwsyz', gardenModel: gardens[1]),
  GardenStatusMap(
    row: 2,
    column: 2,
    status: 'Bellenmedik',
    gardenModel: gardens[0],
  ),
  GardenStatusMap(row: 2, column: 3, status: 'Keselli', gardenModel: gardens[1]),
  GardenStatusMap(row: 2, column: 4, status: 'Gowy', gardenModel: gardens[0]),

  // 3-nji hatar
  GardenStatusMap(row: 3, column: 0, status: 'Guran', gardenModel: gardens[0]),
  GardenStatusMap(row: 3, column: 1, status: 'Suwsyz', gardenModel: gardens[1]),
  GardenStatusMap(row: 3, column: 2, status: 'Keselli', gardenModel: gardens[1]),

  // 4-nji hatar
  GardenStatusMap(row: 4, column: 4, status: 'Guran', gardenModel: gardens[0]),
  GardenStatusMap(row: 4, column: 7, status: 'Gowy', gardenModel: gardens[0]),

  // 5-njy hatar
  GardenStatusMap(row: 5, column: 5, status: 'Suwsyz', gardenModel: gardens[1]),
  GardenStatusMap(row: 5, column: 6, status: 'Keselli', gardenModel: gardens[0]),

  // 6-nji hatar
  GardenStatusMap(
    row: 6,
    column: 3,
    status: 'Bellenmedik',
    gardenModel: gardens[0],
  ),
  GardenStatusMap(row: 6, column: 5, status: 'Keselli', gardenModel: gardens[1]),

  // 7-nji hatar
  GardenStatusMap(
    row: 7,
    column: 6,
    status: 'Bellenmedik',
    gardenModel: gardens[0],
  ),

  // 8-njy hatar
  GardenStatusMap(row: 8, column: 0, status: 'Gowy', gardenModel: gardens[0]),

  // 10-nji hatar
  GardenStatusMap(row: 10, column: 4, status: 'Keselli', gardenModel: gardens[0]),
];

