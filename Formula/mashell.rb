class Mashell < Formula
  include Language::Python::Virtualenv

  desc "AI-powered command line assistant"
  homepage "https://github.com/jacobjiangwei/MaShell"
  url "https://github.com/jacobjiangwei/MaShell/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "ac5c9d2772d1e0afda9cdfddd76df2931bc1c2d18cab796a4b291ea4522634fd"
  license "GPL-3.0"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "httpx>=0.25.0", "rich>=13.0.0", "pyyaml>=6.0", "prompt-toolkit>=3.0", "crawl4ai>=0.8.0", "pdfplumber>=0.10.0", "python-docx>=1.0.0", "slack-bolt>=1.18.0", "slack-sdk>=3.21.0"
    system libexec/"bin/pip", "install", "--no-deps", "."
    bin.install_symlink libexec/"bin/mashell"
  end

  test do
    assert_match "MaShell", shell_output("#{bin}/mashell --help")
  end
end
