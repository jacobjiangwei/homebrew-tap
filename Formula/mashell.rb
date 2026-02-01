class Mashell < Formula
  include Language::Python::Virtualenv

  desc "AI-powered command line assistant"
  homepage "https://github.com/jacobjiangwei/MaShell"
  url "https://github.com/jacobjiangwei/MaShell/archive/refs/tags/v1.0.7.tar.gz"
  sha256 "891cece56e70cfef3ab869b61d5e4cf189269c486375f8c5447584ca3bdbf03d"
  license "GPL-3.0"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/mashell"
  end

  test do
    assert_match "MaShell", shell_output("#{bin}/mashell --help")
  end
end
