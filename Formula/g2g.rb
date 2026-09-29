class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.38.1/g2g-darwin-arm64.tar.gz"
      sha256 "a031cfb569f6f1c66f408fd0f5972d9735b74e1bcaab5153f1709e800429078e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.38.1/g2g-darwin-amd64.tar.gz"
      sha256 "6fb62a749862bb84907fefe7b2d86d0b1f80de1ed064f929bcb22a48c56695cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.38.1/g2g-linux-arm64.tar.gz"
      sha256 "a6019bf911939b44b076cd9a9a0bf7d730bfac9f1a59454e0f90f0d9ffe11258"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.38.1/g2g-linux-amd64.tar.gz"
      sha256 "abd6cc065097763551aef96a8f157bd8fb243386c46f240c708db6d5304b46c7"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.38.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
