class CategoryModel {
  final String iconfile;
  final String title;
  final String id;

  CategoryModel(
      {required this.id, required this.iconfile, required this.title});
}

CategoryModel findcategoryobject(String title) {
  for (CategoryModel i in categorylist) {
    if (title == i.title) {
      return i;
    }
  }
  return categorylist[0];
}

List<CategoryModel> categorylist = [
  CategoryModel(
    id: "any",
    iconfile: "random.png",
    title: "Random",
  ),
  CategoryModel(
    id: "9",
    iconfile: "general_knowledge.png",
    title: "General Knowledge",
  ),
  CategoryModel(
    id: "10",
    iconfile: "books.png",
    title: "Entertainment: Books",
  ),
  CategoryModel(
    id: "11",
    iconfile: "film.png",
    title: "Entertainment: Film",
  ),
  CategoryModel(
    id: "12",
    iconfile: "music.png",
    title: "Entertainment: Music",
  ),
  CategoryModel(
    id: "13",
    iconfile: "musicals_theatres.png",
    title: "Entertainment: Musicals & Theatres",
  ),
  CategoryModel(
    id: "14",
    iconfile: "television.png",
    title: "Entertainment: Television",
  ),
  CategoryModel(
    id: "15",
    iconfile: "videogames.png",
    title: "Entertainment: Video Games",
  ),
  CategoryModel(
    id: "16",
    iconfile: "board_games.png",
    title: "Entertainment: Board Games",
  ),
  CategoryModel(
    id: "17",
    iconfile: "science_nature.png",
    title: "Science & Nature",
  ),
  CategoryModel(
    id: "18",
    iconfile: "computers.png",
    title: "Science: Computers",
  ),
  CategoryModel(
    id: "19",
    iconfile: "mathematics.png",
    title: "Science: Mathematics",
  ),
  CategoryModel(
    id: "20",
    iconfile: "mythology.png",
    title: "Mythology",
  ),
  CategoryModel(
    id: "21",
    iconfile: "sports.png",
    title: "Sports",
  ),
  CategoryModel(
    id: "22",
    iconfile: "geography.png",
    title: "Geography",
  ),
  CategoryModel(
    id: "23",
    iconfile: "history.png",
    title: "History",
  ),
  CategoryModel(
    id: "24",
    iconfile: "politics.png",
    title: "Politics",
  ),
  CategoryModel(
    id: "25",
    iconfile: "art.png",
    title: "Art",
  ),
  CategoryModel(
    id: "26",
    iconfile: "celebrities.png",
    title: "Celebrities",
  ),
  CategoryModel(
    id: "27",
    iconfile: "animals.png",
    title: "Animals",
  ),
  CategoryModel(
    id: "28",
    iconfile: "vehicles.png",
    title: "Vehicles",
  ),
  CategoryModel(
    id: "29",
    iconfile: "comics.png",
    title: "Entertainment: Comics",
  ),
  CategoryModel(
    id: "30",
    iconfile: "gadgets.png",
    title: "Science: Gadgets",
  ),
  CategoryModel(
    id: "31",
    iconfile: "anime_manga.png",
    title: "Entertainment: Japanese Anime & Manga",
  ),
  CategoryModel(
    id: "32",
    iconfile: "cartoon_animations.png",
    title: "Entertainment: Cartoon & Animations",
  ),
];
