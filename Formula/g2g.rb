class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  version "0.19.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.19.1/g2g-darwin-arm64.tar.gz"
      sha256 "98ade28f1cc9c840a333d240bd3a3732021494735e74dff491d2119b02ecf154"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.19.1/g2g-darwin-amd64.tar.gz"
      sha256 "661c0732df18ae4e053f90a620e80494e0a2a5597a21806599fcd804c07216ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.19.1/g2g-linux-arm64.tar.gz"
      sha256 "ae7559e65eaa9edb316e07820d4e601c6773b91714ba27e0d03ef1ed2d00524e"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.19.1/g2g-linux-amd64.tar.gz"
      sha256 "7edb4646d76f29c5ce0dd3b3ced36e995a4aa3ccb98138af0af1f8b704489413"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.19.1", shell_output("#{bin}/g2g --version")
    assert_match "Link a stack to GitHub", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
