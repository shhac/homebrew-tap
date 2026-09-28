class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.36.0/g2g-darwin-arm64.tar.gz"
      sha256 "720fbd1eaf22f1c912ac7e3f03e173f336c4cbafe9b3ef7b1d28650e0ac55098"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.36.0/g2g-darwin-amd64.tar.gz"
      sha256 "7bf252091e01b06699567eec5dd94828fe6628d85324bf1ac69610dc35cf577d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.36.0/g2g-linux-arm64.tar.gz"
      sha256 "f210d06343256b8a37faf9428b95a3aa8b0977eda325a29dcbb938b78aa34516"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.36.0/g2g-linux-amd64.tar.gz"
      sha256 "0a8900728cd4bacb1b22c4a836c4ea29807f9f6bb42827608bfedf81d7cb3f59"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.36.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
