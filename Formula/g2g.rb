class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.39.1/g2g-darwin-arm64.tar.gz"
      sha256 "085862a36fe6cc8b971b8b0450730f18aa7415634d136824caaf371427335642"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.39.1/g2g-darwin-amd64.tar.gz"
      sha256 "17842de21498f06973b825a6e48c2dda8c85a69b33ae6d86073f456cb872add6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.39.1/g2g-linux-arm64.tar.gz"
      sha256 "7ad14663ea9f68decc0e42e7bcbf34f3e5cb93eb4301eeb55c282d712e58a1be"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.39.1/g2g-linux-amd64.tar.gz"
      sha256 "0d1c01ab56f0a23bf4a6f758863fb7e44ef96f0eb820bf5e809f4dc1d5674c77"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.39.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
