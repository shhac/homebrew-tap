class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/gt2gh"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.12.0/gt2gh-darwin-arm64.tar.gz"
      sha256 "03b0e51cfe7f4fc61e24f20e10375820881885384bb2a8d13cd71f27fa688291"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.12.0/gt2gh-darwin-amd64.tar.gz"
      sha256 "24edde3a09f1553002cce1ddb546cdbae135b4d2d2cfee55e913d74493d010bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/gt2gh/releases/download/v0.12.0/gt2gh-linux-arm64.tar.gz"
      sha256 "630ef404cba96523f23c26e2059fbf118bd1fbbb597fa579645c08ffbb2e758b"
    end
    on_intel do
      url "https://github.com/shhac/gt2gh/releases/download/v0.12.0/gt2gh-linux-amd64.tar.gz"
      sha256 "bdcabb330cc419f5f46d877d471d02fb707d8d7b0bce4ccaed8f325453e50dfa"
    end
  end

  def install
    bin.install "gt2gh" => "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.12.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
