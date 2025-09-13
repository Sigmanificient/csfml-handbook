# vendored from: pkgs/development/python-modules/sphinx-sitemap/default.nix
{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  sphinx,
  sphinx-pytest,
  defusedxml,
  pytestCheckHook,
  sphinx-last-updated-by-git,
}:
buildPythonPackage rec {
  pname = "sphinx-sitemap";
  version = "2.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jdillard";
    repo = "sphinx-sitemap";
    tag = "v${version}";
    hash = "sha256-b8eo77Ab9w8JR6mLqXcIWeTkuJFTHjJBk440fksBbyw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    sphinx
    sphinx-last-updated-by-git
  ];

  nativeCheckInputs = [
    pytestCheckHook
    sphinx-pytest
    defusedxml
  ];
}
