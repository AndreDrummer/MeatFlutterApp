class Settings {
  bool isGluttenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegeterian;

  Settings({
    this.isGluttenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegeterian = false,
  });
}