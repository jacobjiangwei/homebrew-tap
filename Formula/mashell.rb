class Mashell < Formula
  include Language::Python::Virtualenv

  desc "AI-powered command line assistant"
  homepage "https://github.com/jacobjiangwei/MaShell"
  url "https://github.com/jacobjiangwei/MaShell/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "90b4a1c093a08f2934fb5ce5f6869b8803b340909bf1026a422903c3e55ceb9d"
  license "GPL-3.0"

  depends_on "python@3.11"

  def install
    # Create virtualenv
    virtualenv_create(libexec, "python3.11")
    # Ensure pip is available
    system libexec/"bin/python3.11", "-m", "ensurepip", "--upgrade"
    # Install mashell from PyPI
    system libexec/"bin/pip3", "install", "mashell==#{version}"
    # Link the binary
    bin.install_symlink libexec/"bin/mashell"
  end

  test do
    assert_match "MaShell", shell_output("#{bin}/mashell --help")
  end
end
