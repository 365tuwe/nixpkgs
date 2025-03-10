{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  pythonOlder,
  setuptools,
  smmap,
}:

buildPythonPackage rec {
  pname = "gitdb";
  version = "4.0.12";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XvcfhV0ZGjMm/PvA1dqDXyaxP7y6YMMsIQkcNJ/9tXE=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  pythonRelaxDeps = [ "smmap" ];

  propagatedBuildInputs = [ smmap ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "gitdb" ];

  disabledTests = [
    # Tests need part which are not shipped with PyPI releases
    "test_base"
    "test_reading"
    "test_writing"
    "test_correctness"
    "test_loose_correctness"
    "test_pack_random_access"
    "test_pack_writing"
    "test_stream_reading"
  ];

  meta = with lib; {
    description = "Git Object Database";
    homepage = "https://github.com/gitpython-developers/gitdb";
    changelog = "https://github.com/gitpython-developers/gitdb/releases/tag/${version}";
    license = licenses.bsd3;
    maintainers = [ ];
  };
}
