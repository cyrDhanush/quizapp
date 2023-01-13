class categorymodel {
  final String iconfile;
  final String title;
  final String id;

  categorymodel(
      {required this.id, required this.iconfile, required this.title});
}

categorymodel findcategoryobject(String title) {
  for (categorymodel i in categorylist) {
    if (title == i.title) {
      return i;
    }
  }
  return categorylist[0];
}

List<categorymodel> categorylist = [
  categorymodel(
    id: "any",
    iconfile: "random.png",
    title: "Random",
  ),
  categorymodel(
    id: "9",
    iconfile: "general_knowledge.png",
    title: "General Knowledge",
  ),
  categorymodel(
    id: "10",
    iconfile: "books.png",
    title: "Entertainment: Books",
  ),
  categorymodel(
    id: "11",
    iconfile: "film.png",
    title: "Entertainment: Film",
  ),
  categorymodel(
    id: "12",
    iconfile: "music.png",
    title: "Entertainment: Music",
  ),
  categorymodel(
    id: "13",
    iconfile: "musicals_theatres.png",
    title: "Entertainment: Musicals & Theatres",
  ),
  categorymodel(
    id: "14",
    iconfile: "television.png",
    title: "Entertainment: Television",
  ),
  categorymodel(
    id: "15",
    iconfile: "videogames.png",
    title: "Entertainment: Video Games",
  ),
  categorymodel(
    id: "16",
    iconfile: "board_games.png",
    title: "Entertainment: Board Games",
  ),
  categorymodel(
    id: "17",
    iconfile: "science_nature.png",
    title: "Science & Nature",
  ),
  categorymodel(
    id: "18",
    iconfile: "computers.png",
    title: "Science: Computers",
  ),
  categorymodel(
    id: "19",
    iconfile: "mathematics.png",
    title: "Science: Mathematics",
  ),
  categorymodel(
    id: "20",
    iconfile: "mythology.png",
    title: "Mythology",
  ),
  categorymodel(
    id: "21",
    iconfile: "sports.png",
    title: "Sports",
  ),
  categorymodel(
    id: "22",
    iconfile: "geography.png",
    title: "Geography",
  ),
  categorymodel(
    id: "23",
    iconfile: "history.png",
    title: "History",
  ),
  categorymodel(
    id: "24",
    iconfile: "politics.png",
    title: "Politics",
  ),
  categorymodel(
    id: "25",
    iconfile: "art.png",
    title: "Art",
  ),
  categorymodel(
    id: "26",
    iconfile: "celebrities.png",
    title: "Celebrities",
  ),
  categorymodel(
    id: "27",
    iconfile: "animals.png",
    title: "Animals",
  ),
  categorymodel(
    id: "28",
    iconfile: "vehicles.png",
    title: "Vehicles",
  ),
  categorymodel(
    id: "29",
    iconfile: "comics.png",
    title: "Entertainment: Comics",
  ),
  categorymodel(
    id: "30",
    iconfile: "gadgets.png",
    title: "Science: Gadgets",
  ),
  categorymodel(
    id: "31",
    iconfile: "anime_manga.png",
    title: "Entertainment: Japanese Anime & Manga",
  ),
  categorymodel(
    id: "32",
    iconfile: "cartoon_animations.png",
    title: "Entertainment: Cartoon & Animations",
  ),
];
