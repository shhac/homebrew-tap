class AgentDlocal < Formula
  desc "dLocal payments investigation and triage CLI for AI agents"
  homepage "https://github.com/shhac/agent-dlocal"
  version "0.2.1"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.1/agent-dlocal-darwin-arm64.tar.gz"
      sha256 "4f5cabc19fbb89d5204014a0c6792f3b65d2405d53beb814439c645c5ebfd4df"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.1/agent-dlocal-darwin-amd64.tar.gz"
      sha256 "ac2e576f19d07fab10605999b23f91045ab9cea2d8ce6a068c68bbc7e8ca1218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.1/agent-dlocal-linux-arm64.tar.gz"
      sha256 "c609a6b0ecbefc2ac32231cb89c1f02d6d2cb181ec6f803f24c2352c2da4c157"
    end
    on_intel do
      url "https://github.com/shhac/agent-dlocal/releases/download/v0.2.1/agent-dlocal-linux-amd64.tar.gz"
      sha256 "f8d82af04e24fbdc96da9d1f1ce3b5a8e3bd1b5ab157c37560a0aa0cc3978bd7"
    end
  end

  def install
    bin.install "agent-dlocal"
    # Installs shell completions via `agent-dlocal completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-dlocal", "completion")
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/agent-dlocal --version")
    assert_match "dLocal payments investigation and triage CLI", shell_output("#{bin}/agent-dlocal --help")
    assert_match "#compdef agent-dlocal", shell_output("#{bin}/agent-dlocal completion zsh")
  end
end
