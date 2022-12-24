"""Starlark representation of locked requirements.

@generated by rules_python pip_parse repository rule
from @//:requirements.txt
"""

load("@python39//:defs.bzl", "interpreter")
load("@rules_python//python/pip_install:pip_repository.bzl", "whl_library")

all_requirements = ["@pip_certifi//:pkg", "@pip_charset_normalizer//:pkg", "@pip_idna//:pkg", "@pip_requests//:pkg", "@pip_urllib3//:pkg"]

all_whl_requirements = ["@pip_certifi//:whl", "@pip_charset_normalizer//:whl", "@pip_idna//:whl", "@pip_requests//:whl", "@pip_urllib3//:whl"]

_packages = [("pip_certifi", "certifi==2022.12.7     --hash=sha256:35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3     --hash=sha256:4ad3232f5e926d6718ec31cfc1fcadfde020920e278684144551c91769c7bc18"), ("pip_charset_normalizer", "charset-normalizer==2.1.1     --hash=sha256:5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845     --hash=sha256:83e9a75d1911279afd89352c68b45348559d1fc0506b054b346651b5e7fee29f"), ("pip_idna", "idna==3.4     --hash=sha256:814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4     --hash=sha256:90b77e79eaa3eba6de819a0c442c0b4ceefc341a7a2ab77d7562bf49f425c5c2"), ("pip_requests", "requests==2.28.1     --hash=sha256:7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983     --hash=sha256:8fefa2a1a1365bf5520aac41836fbee479da67864514bdb821f31ce07ce65349"), ("pip_urllib3", "urllib3==1.26.13     --hash=sha256:47cc05d99aaa09c9e72ed5809b60e7ba354e64b59c9c173ac3018642d8bb41fc     --hash=sha256:c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8")]
_config = {"download_only": False, "enable_implicit_namespace_pkgs": False, "environment": {}, "extra_pip_args": [], "isolated": True, "pip_data_exclude": [], "python_interpreter": "python3", "python_interpreter_target": interpreter, "quiet": True, "repo": "pip", "repo_prefix": "pip_", "timeout": 600}
_annotations = {}
_bzlmod = False

def _clean_name(name):
    return name.replace("-", "_").replace(".", "_").lower()

def requirement(name):
    if _bzlmod:
        return "@@pip//:" + _clean_name(name) + "_pkg"
    return "@pip_" + _clean_name(name) + "//:pkg"

def whl_requirement(name):
    if _bzlmod:
        return "@@pip//:" + _clean_name(name) + "_whl"
    return "@pip_" + _clean_name(name) + "//:whl"

def data_requirement(name):
    if _bzlmod:
        return "@@pip//:" + _clean_name(name) + "_data"
    return "@pip_" + _clean_name(name) + "//:data"

def dist_info_requirement(name):
    if _bzlmod:
        return "@@pip//:" + _clean_name(name) + "_dist_info"
    return "@pip_" + _clean_name(name) + "//:dist_info"

def entry_point(pkg, script = None):
    if not script:
        script = pkg
    return "@pip_" + _clean_name(pkg) + "//:rules_python_wheel_entry_point_" + script

def _get_annotation(requirement):
    # This expects to parse `setuptools==58.2.0     --hash=sha256:2551203ae6955b9876741a26ab3e767bb3242dafe86a32a749ea0d78b6792f11`
    # down wo `setuptools`.
    name = requirement.split(" ")[0].split("=")[0].split("[")[0]
    return _annotations.get(name)

def install_deps(**whl_library_kwargs):
    whl_config = dict(_config)
    whl_config.update(whl_library_kwargs)
    for name, requirement in _packages:
        whl_library(
            name = name,
            requirement = requirement,
            annotation = _get_annotation(requirement),
            **whl_config
        )
