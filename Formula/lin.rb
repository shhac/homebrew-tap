class Lin < Formula
  desc "Linear CLI for humans and LLMs"
  homepage "https://github.com/shhac/lin"
  version "0.36.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.3/lin-darwin-arm64.tar.gz"
      sha256 "30c2522f5011b6f2f14ae77a1517660f40ee499cf6f320b90c83c1c1b4c0b2b1"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.3/lin-darwin-amd64.tar.gz"
      sha256 "bf275697967e4a96a161b480deafc44972d44407f801fb418e28f22432cc6c55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/lin/releases/download/v0.36.3/lin-linux-arm64.tar.gz"
      sha256 "d2ca304273d444d33325c269727fdd903136cd93acc4301f4c8cd35bfc02d4ce"
    end
    on_intel do
      url "https://github.com/shhac/lin/releases/download/v0.36.3/lin-linux-amd64.tar.gz"
      sha256 "49d394a9d8e1ec4cd839e753d94ccabc6bb8dd09bd654895392a77672469bc73"
    end
  end

  def install
    bin.install "lin"
    # Installs shell completions via `lin completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"lin", "completion")
  end

  test do
    assert_match "0.36.3", shell_output("#{bin}/lin --version")
    assert_match "Linear CLI for humans and LLMs", shell_output("#{bin}/lin --help")
    assert_match "#compdef lin", shell_output("#{bin}/lin completion zsh")
  end
end
