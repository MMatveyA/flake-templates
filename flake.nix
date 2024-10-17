{
  description = "My awesome templates";
  outputs = { ... }: {
    templates = {
      cpp-cmake = {
        path = ./cpp-cmake;
        description = "Template for setup cpp environment with cmake";
      };
    };
  };
}
