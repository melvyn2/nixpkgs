{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # non-propagates
  django,

  # tests
  pytest-django,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "django-bootstrap3";
  version = "24.2";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "zostera";
    repo = "django-bootstrap3";
    rev = "refs/tags/v${version}";
    hash = "sha256-5nBJ5vfsoGoaG1s3K1hCHcSnGf51ZirYYg+uJGsBmG8=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ django ];

  pythonImportsCheck = [ "bootstrap3" ];

  nativeCheckInputs = [
    pytest-django
    pytestCheckHook
  ];

  env.DJANGO_SETTINGS_MODULE = "tests.app.settings";

  meta = with lib; {
    description = "Bootstrap 3 integration for Django";
    homepage = "https://github.com/zostera/django-bootstrap3";
    changelog = "https://github.com/zostera/django-bootstrap3/blob/v${version}/CHANGELOG.md";
    license = licenses.bsd3;
    maintainers = with maintainers; [ hexa ];
  };
}
