class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.53.0/g2g-darwin-arm64.tar.gz"
      sha256 "3f263b9a11c200138af9e5230131eaad45002111232e925b6337e3bfdb0a2307"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.53.0/g2g-darwin-amd64.tar.gz"
      sha256 "3409ec0350416e87e10ae49320d61304104d77a4db9f52c20957db4d37ac6bb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.53.0/g2g-linux-arm64.tar.gz"
      sha256 "a57c3d28fdb31680148176c4cc603c9af1d46cac33e11c0e775dc7fe6cd3ac19"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.53.0/g2g-linux-amd64.tar.gz"
      sha256 "836bee7b01f80b520db85f09a00f762ea1f9a0b09def36c15d5ab53a7ecb139f"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.53.0", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
