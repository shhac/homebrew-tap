class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.7.0/lin-darwin-arm64.tar.gz"
      sha256 "ddce545cf6bbae23808de2f52eddf499ddd1aec2afd385ed9eb6a9be24f19087"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.7.0/lin-darwin-x64.tar.gz"
      sha256 "3ea90a8fda7b5b91a06528523b3e5cba9e1467a796a1e01e18773bb2fcdad1ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.7.0/lin-linux-arm64.tar.gz"
      sha256 "657379f4ddf50772b0d309181dbb2012aa9e66b16856abda116b176f603e432b"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.7.0/lin-linux-x64.tar.gz"
      sha256 "81bdaea5482f62cef1d29901643cefee9bc6f186f215b5e2009fabd4cefd498e"
    end
  end

  def install
    bin.install Dir["lin-*"].first => "lin"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI", shell_output("#{bin}/lin --help")
  end
end
