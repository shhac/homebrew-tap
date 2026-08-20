class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.24.0/g2g-darwin-arm64.tar.gz"
      sha256 "6e32b0367cd7d8097c6ad794463cbe7b3218820f34a42ba3d6b2ad562f7a8bae"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.24.0/g2g-darwin-amd64.tar.gz"
      sha256 "f65a4596708e0fba5f333074d897edb0847bdeb36069f5403c163e65909b2545"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.24.0/g2g-linux-arm64.tar.gz"
      sha256 "779eb2daf0e1804acbb4495e8e4800b3ee04629700e027fea2961abb5e5b6054"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.24.0/g2g-linux-amd64.tar.gz"
      sha256 "fefca320a42fc8e1679a61c16506315915689404aa6888fa62c341d4696fd782"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.24.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
