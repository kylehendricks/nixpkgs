{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, requests
, shapely
, python-dateutil
, pytz
, importlib-metadata
, numpy
, dateparser
, remotezip
, pytestCheckHook
, requests-mock
, defusedxml
}:

buildPythonPackage rec {
  pname = "asf-search";
  version = "6.2.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "asfadmin";
    repo = "Discovery-asf_search";
    rev = "refs/tags/v${version}";
    hash = "sha256-4RFGhA9xzc1kxSni6rAbevoDkc1bLdQD1II/2xq/uKM=";
  };

  propagatedBuildInputs = [
    requests
    shapely
    python-dateutil
    pytz
    importlib-metadata
    numpy
    dateparser
    remotezip
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  checkInputs = [
    requests-mock
    defusedxml
  ];

  pythonImportsCheck = [
    "asf_search"
  ];

  meta = with lib; {
    changelog = "https://github.com/asfadmin/Discovery-asf_search/blob/${src.rev}/CHANGELOG.md";
    description = "Python wrapper for the ASF SearchAPI";
    homepage = "https://github.com/asfadmin/Discovery-asf_search";
    license = licenses.bsd3;
    maintainers = with maintainers; [ bzizou ];
  };
}
