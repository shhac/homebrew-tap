class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.2/g2g-darwin-arm64.tar.gz"
      sha256 "12102ed05b7096c6ecf06e5819c7b085d46914d2707be1b2ec944028e662938b"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.2/g2g-darwin-amd64.tar.gz"
      sha256 "8c7d3a83c30bba25769f0014787d7572b37c9ad37b65a4ec30886e5db1066154"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.15.2/g2g-linux-arm64.tar.gz"
      sha256 "5cba6e878999f22e830e84076f11019b7b23d735da2eed6cf1eab6a7eb1bc671"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.15.2/g2g-linux-amd64.tar.gz"
      sha256 "2d75c68d6da7d48a8a4ac05bf01d33fca731f3124bde732c7b112d23d276e5f1"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.15.2", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
