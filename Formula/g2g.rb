class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.26.0/g2g-darwin-arm64.tar.gz"
      sha256 "fa3d6f84816403e6b6de6f75b110cd3d84078090a5fe3985d2e648c16de839a5"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.26.0/g2g-darwin-amd64.tar.gz"
      sha256 "38fb3cd13218f8645c87f213a71c493f64dfbdbf2cdd213fe6d7eccde6cdf61c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.26.0/g2g-linux-arm64.tar.gz"
      sha256 "424ed5a9d923b630ec070d0243b89cc25f981a9bf3650354fbea5693421d3c24"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.26.0/g2g-linux-amd64.tar.gz"
      sha256 "08dc2667408efa029d32fb4544b97e4d92d940128c193094979d4cafe99225a3"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.26.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
