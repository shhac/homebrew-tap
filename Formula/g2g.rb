class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.43.0/g2g-darwin-arm64.tar.gz"
      sha256 "c2f88de15f7484d0d585d8f5b55e1cfeaf77bfe233f1a59b4c9ecd540d63b6df"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.43.0/g2g-darwin-amd64.tar.gz"
      sha256 "304e4b82e71d31dfa9f93a5ae2a1eca10515a106a022ea2bcfdd9290d1170cb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.43.0/g2g-linux-arm64.tar.gz"
      sha256 "c95cb6b1c7f8807e3ab67f783c03a195114bbec9884c08f8f54bd621b5b365be"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.43.0/g2g-linux-amd64.tar.gz"
      sha256 "33c1273614e60a6b17cc7bf1868ac47a062d091faf23df7552447ef7b2fe91b3"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.43.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
