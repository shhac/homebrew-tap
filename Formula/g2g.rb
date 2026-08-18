class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.17.0/g2g-darwin-arm64.tar.gz"
      sha256 "f56718561baf7c09929e7bfa16d86303173eeb5880b5586dbb4ad3f953cbf50d"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.17.0/g2g-darwin-amd64.tar.gz"
      sha256 "b098d34599d08f399894c1954f0a6eeff032ee6022324984eca8a29ac7ed1ca9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.17.0/g2g-linux-arm64.tar.gz"
      sha256 "aea4b5b9f08ddcf40c077ad2946e40a4b4201d8f9421a583156a0f816c5e3752"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.17.0/g2g-linux-amd64.tar.gz"
      sha256 "d4a6f5577f1b35fbbe2a4ee5775f3f6c59e497155d809ce5a67d15041d0f968d"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.17.0", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
