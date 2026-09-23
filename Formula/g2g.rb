class G2g < Formula
  desc "Manage stacked branches and project them onto GitHub native stacks"
  homepage "https://github.com/shhac/g2g"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.34.1/g2g-darwin-arm64.tar.gz"
      sha256 "94ad8b09be4cd0f5893d5d0ee58ea5c56253a986898f6380a9934e2adb01b0ba"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.34.1/g2g-darwin-amd64.tar.gz"
      sha256 "8b6f6293ec1bd538285b05eba99cb9062725f328011d2bb680d17cf5598e08fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/g2g/releases/download/v0.34.1/g2g-linux-arm64.tar.gz"
      sha256 "c6ef28ae245c9995e30f1c1ac7c45e2edef812bfd99bc60bdf9015ff7f63ee17"
    end
    on_intel do
      url "https://github.com/shhac/g2g/releases/download/v0.34.1/g2g-linux-amd64.tar.gz"
      sha256 "0a764ee28a5ffd5130405deb2ca4a6ba976f4c8458585c279286074ea89aad97"
    end
  end

  def install
    bin.install "g2g"
    # Installs shell completions via `g2g completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"g2g", "completion")
  end

  test do
    assert_match "0.34.1", shell_output("#{bin}/g2g --version")
    assert_match "Manage stacked branches", shell_output("#{bin}/g2g --help")
    assert_match "#compdef g2g", shell_output("#{bin}/g2g completion zsh")
  end
end
