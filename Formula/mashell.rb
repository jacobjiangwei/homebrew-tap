class Mashell < Formula
  include Language::Python::Virtualenv

  desc "AI-powered command line assistant"
  homepage "https://github.com/jacobjiangwei/MaShell"
  url "https://github.com/jacobjiangwei/MaShell/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "fc75bf665dc0c3bacc8f0909b898de170e5b48767b5268516f940177e76bb7ff"
  license "GPL-3.0"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "MaShell", shell_output("#{bin}/mashell --help")
  end
end
