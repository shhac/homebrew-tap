class GitWt < Formula
  desc "Fast CLI for managing git worktrees with enhanced features"
  homepage "https://github.com/shhac/git-wt"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.0/git-wt-darwin-arm64.tar.gz"
      sha256 "58eebd37f0a81ec30b763a8a580fe4f5d8561b6860dd83906b6cf1958f993ef3"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.0/git-wt-darwin-amd64.tar.gz"
      sha256 "eb6a5b474c58aa04f4eb622b49853503d1ab628d9466d846e7a09b8ef7142652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.0/git-wt-linux-arm64.tar.gz"
      sha256 "754c0f856440d3d1dc2a75f6d48a8694cc550d296445a4058927617137f80d73"
    end
    on_intel do
      url "https://github.com/shhac/git-wt/releases/download/v0.13.0/git-wt-linux-amd64.tar.gz"
      sha256 "51c0520d3e3cda7cb1862811d7b472e946395f71e219ba8574be7c794ec46ae8"
    end
  end

  def install
    bin.install "git-wt"
    # Runs `git-wt completion bash|zsh|fish` and installs each to brew's
    # standard completion paths. zsh and fish pick them up via the
    # default brew shellenv; bash needs `brew install bash-completion@2`.
    generate_completions_from_executable(bin/"git-wt", "completion")
  end

  def caveats
    <<~EOS
      Enable shell integration so `gwt go` / `gwt new` change directory:

        # zsh (~/.zshrc) or bash (~/.bashrc)
        eval "$(git-wt alias gwt)"

      Then restart your shell or `source` your rc file. The alias also
      auto-binds tab-completion to itself, so `gwt go <TAB>` lists your
      worktree branches with location + recency descriptions matching
      `gwt ls`.

      Without the alias the binary still works in scripts:
        cd "$(git-wt go feature-branch)"

      bash users: completion needs `brew install bash-completion@2`.
    EOS
  end

  test do
    assert_match "git-wt version 0.13.0", shell_output("#{bin}/git-wt --version")
    assert_match "worktree", shell_output("#{bin}/git-wt --help")
    # Completion subcommand must produce something for each supported shell.
    assert_match "#compdef git-wt", shell_output("#{bin}/git-wt completion zsh")
    assert_match "bash completion", shell_output("#{bin}/git-wt completion bash")
  end
end
