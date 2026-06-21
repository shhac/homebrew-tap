class AgentStripe < Formula
  desc "Stripe incident triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-stripe"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.8.0/agent-stripe-darwin-arm64.tar.gz"
      sha256 "42cbf16078b07ccf4b875d6c91584f7ddefc45785f41d0499538ee3535f0e498"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.8.0/agent-stripe-darwin-amd64.tar.gz"
      sha256 "22722c2f462e52174a12b4c2d07a3d051966527dabd815497491fa1fe166af83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.8.0/agent-stripe-linux-arm64.tar.gz"
      sha256 "9b668300127fa8c33d22db031fbed5c87b1b5fe94d5dac9f3d73beeda07ab7ce"
    end
    on_intel do
      url "https://github.com/shhac/agent-stripe/releases/download/v0.8.0/agent-stripe-linux-amd64.tar.gz"
      sha256 "0e541872d655bc637208437afc5b4de8637cc336b5f7bcbcb456bbc8d202ca04"
    end
  end

  def install
    bin.install "agent-stripe"
    # Installs shell completions via `agent-stripe completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-stripe", "completion")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/agent-stripe --version")
    assert_match "Stripe incident triage CLI", shell_output("#{bin}/agent-stripe --help")
    assert_match "#compdef agent-stripe", shell_output("#{bin}/agent-stripe completion zsh")
  end
end
