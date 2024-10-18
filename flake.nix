{
  description = "My awesome templates";
  outputs = { ... }: {
    templates = {
      cpp-cmake = {
        path = ./cpp-cmake;
        description = "Template for setup cpp environment with cmake";
      };
      latex-coursework = {
        path = ./latex-coursework;
        description = "Template for setup latex environment for coursework";
      };
    };
  };
}
