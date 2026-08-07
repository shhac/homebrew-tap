class AgentCloudflare < Formula
  desc "Cloudflare operations CLI for AI agents"
  homepage "https://github.com/shhac/agent-cloudflare"
  version "0.12.3"
  license "LicenseRef-PolyForm-Perimeter-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.3/agent-cloudflare-darwin-arm64.tar.gz"
      sha256 "7a08a0a22ef904b6a4c8ebe4c22883018c112da9f23ddbfc2d25ff0a42dbca86"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.3/agent-cloudflare-darwin-amd64.tar.gz"
      sha256 "ad30fee058bfdeb0780fca2a4fac8a49419129793434f6b21190a68bc4d83507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.3/agent-cloudflare-linux-arm64.tar.gz"
      sha256 "76ad40247044b3109bbf9e16e1bbc53a9e5ea23daf5d7f6fb9310f07e2f0a2c8"
    end
    on_intel do
      url "https://github.com/shhac/agent-cloudflare/releases/download/v0.12.3/agent-cloudflare-linux-amd64.tar.gz"
      sha256 "57db66e1d287d67bcd0e6b41bbe0a7a525f5c80ad7941e107163d531c30844db"
    end
  end

  def install
    bin.install "agent-cloudflare"
    # Installs shell completions via `agent-cloudflare completion bash|zsh|fish`.
    generate_completions_from_executable(bin/"agent-cloudflare", "completion")
  end

  test do
    assert_match "0.12.3", shell_output("#{bin}/agent-cloudflare --version")
    assert_match "Cloudflare operations CLI", shell_output("#{bin}/agent-cloudflare --help")
    assert_match "#compdef agent-cloudflare", shell_output("#{bin}/agent-cloudflare completion zsh")
  end
end
