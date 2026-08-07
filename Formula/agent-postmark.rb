class AgentPostmark < Formula
  desc "Postmark delivery triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-postmark"
  version "0.17.2"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.2/agent-postmark-darwin-arm64.tar.gz"
      sha256 "7e804e2dd6f49897b52e97f6f99d5762e8051263b188030ced380aa376b7ae33"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.2/agent-postmark-darwin-amd64.tar.gz"
      sha256 "5bf82d4b1c99485614be1905b719361053540687c75dd1af647031f7ca64ae23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.2/agent-postmark-linux-arm64.tar.gz"
      sha256 "26492c5c110d0069ec2204220df4c8eb993dea547fd8ec28aeb4260a00223635"
    end
    on_intel do
      url "https://github.com/shhac/agent-postmark/releases/download/v0.17.2/agent-postmark-linux-amd64.tar.gz"
      sha256 "af787cecbcc78ab28ebd4476e2853cd8772b66cdf5f253c6cf0b51f14a6027f7"
    end
  end

  def install
    bin.install "agent-postmark"
    # Installs shell completions via `agent-postmark completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-postmark", "completion")
  end

  test do
    assert_match "0.17.2", shell_output("#{bin}/agent-postmark --version")
    assert_match "Postmark delivery triage CLI", shell_output("#{bin}/agent-postmark --help")
    assert_match "#compdef agent-postmark", shell_output("#{bin}/agent-postmark completion zsh")
  end
end
