// =========================================================
// THEME
// Centraliza todas as cores do app.
// Para mudar o visual, edite apenas lightTheme e darkTheme
// em Main.pde -> setupThemes().
// =========================================================

class Theme {

  color background;
  color secondaryBackground;
  color tertiaryBackground;

  color text;
  color panel;

  color primaryButton;
  color primaryButtonHover;

  color secondaryButton;
  color secondaryButtonHover;

  color exitButton;
  color exitButtonHover;

  color success;
  color error;

  color theoryBook;
  color theoryPage;
  color theoryText;
  color theoryButton;
  color theoryBackground;

  color reviewCard;
  color reviewCardHover;
  color reviewBackground;
  color reviewText;

  color answersBackground;
  color answersText;

  Theme(
    color background,
    color secondaryBackground,
    color tertiaryBackground,
    color text,
    color panel,
    color primaryButton,
    color primaryButtonHover,
    color secondaryButton,
    color secondaryButtonHover,
    color exitButton,
    color exitButtonHover,
    color success,
    color error,
    color theoryBook,
    color theoryPage,
    color theoryText,
    color theoryButton,
    color theoryBackground,
    color reviewCard,
    color reviewCardHover,
    color reviewBackground,
    color reviewText,
    color answersBackground,
    color answersText
  ) {
    this.background           = background;
    this.secondaryBackground  = secondaryBackground;
    this.tertiaryBackground   = tertiaryBackground;
    this.text                 = text;
    this.panel                = panel;
    this.primaryButton        = primaryButton;
    this.primaryButtonHover   = primaryButtonHover;
    this.secondaryButton      = secondaryButton;
    this.secondaryButtonHover = secondaryButtonHover;
    this.exitButton           = exitButton;
    this.exitButtonHover      = exitButtonHover;
    this.success              = success;
    this.error                = error;
    this.theoryBook           = theoryBook;
    this.theoryPage           = theoryPage;
    this.theoryText           = theoryText;
    this.theoryButton         = theoryButton;
    this.theoryBackground     = theoryBackground;
    this.reviewCard           = reviewCard;
    this.reviewCardHover      = reviewCardHover;
    this.reviewBackground     = reviewBackground;
    this.reviewText           = reviewText;
    this.answersBackground    = answersBackground;
    this.answersText          = answersText;
  }
}
