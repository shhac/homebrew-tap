class AgentFigma < Formula
  desc "Figma file, node, and asset CLI for AI agents"
  homepage "https://github.com/shhac/agent-figma"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-figma/releases/download/v0.1.0/agent-figma-darwin-arm64.tar.gz"
      sha256 "c2d53acb5705fa6c88df93cb9f6679d15bd9d638dde360466715a72dc78379a6"
    end
    on_intel do
      url "https://github.com/shhac/agent-figma/releases/download/v0.1.0/agent-figma-darwin-amd64.tar.gz"
      sha256 "73e9b2f7d9a0399f1d2e4e11ff06c4bc4fbe58c36a7c96961f7eef5ca8d42091"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-figma/releases/download/v0.1.0/agent-figma-linux-arm64.tar.gz"
      sha256 "c36ef4ec459aa2269871eb7f319f91355da518dac95e226e4ab83b45df2ea449"
    end
    on_intel do
      url "https://github.com/shhac/agent-figma/releases/download/v0.1.0/agent-figma-linux-amd64.tar.gz"
      sha256 "360928badd75f9f8e069be74ee3cf46cdbc3242c98f61c790506e71abf146753"
    end
  end

  def install
    bin.install "agent-figma"
    # Installs shell completions via `agent-figma completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-figma", "completion")
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/agent-figma --version")
    assert_match "Figma file, node, and asset CLI", shell_output("#{bin}/agent-figma --help")
    assert_match "#compdef agent-figma", shell_output("#{bin}/agent-figma completion zsh")
  end
end
