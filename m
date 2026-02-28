Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD5430BBF
	for <tools@linux.kernel.org>; Sat, 28 Feb 2026 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772312673; cv=none; b=JNDH8chHjwUz0ebbaIhu9LhZx2hr9g4oiF9qfC3WPBRHO7gH+fd98h2elWySBdDrbo3Cvdr+EW3PEDC/5zKq6y1dLm1+TXOrayxgei6cS65Jx5UEFmfvT1husRWBcvHSNaJAxaCik5zdO8nk3C47Hh1jklllkZfbQrgHuwBypJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772312673; c=relaxed/simple;
	bh=fuxH/yooxLR2VTDDFpk1u8iJSXHnCEwXKV8NT4aSrx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aRM0N/IH5K/u0h2up8e2E7zPd1IzoTx42PHmMsiKq25w1qwU/VpJxO7rxujAfVsEEV3UwdaPp1CPdoBed4fKpL3H4hFXomkRhXM7glAbhxMhQpUVoYOu5TenJregMQtmxkyDbFV6OIKCHDDQ6iXYWwhvt1bj71f65wMhnv5FKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxHDVI+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxHDVI+X"
Received: by smtp.kernel.org (Postfix)
	id 5E98AC19423; Sat, 28 Feb 2026 21:04:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0693DC116D0
	for <tools@kernel.org>; Sat, 28 Feb 2026 21:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0693DC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772312670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ixO1wv+Rwh85l8QnIW4ZHvcgC2Ds6pQQYIPcamJynFs=;
	b=YxHDVI+X2op5Jj4K7DjkrRD5j7h2N60CVVVImyF3BeA0cpqv/JinoHkU1XefjfBZZXMK+d
	QG1Y9CoZl0HDWrmPjJdnX2DI9WDbkTN5HJYZCBHu1FxK6ns3kKVIp/8sEh3IKDr3KcOl2N
	hG7kiqoMg3VxwemDLtpAlrWkYSElPRA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-6bb9LQOXOYK611z9ASuIYA-1; Sat, 28 Feb 2026 16:04:29 -0500
X-MC-Unique: 6bb9LQOXOYK611z9ASuIYA-1
X-Mimecast-MFC-AGG-ID: 6bb9LQOXOYK611z9ASuIYA_1772312668
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-437159d3ff2so1745133f8f.1
        for <tools@kernel.org>; Sat, 28 Feb 2026 13:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772312668; x=1772917468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixO1wv+Rwh85l8QnIW4ZHvcgC2Ds6pQQYIPcamJynFs=;
        b=TyyU1c/bBIsBgnaKcYCINIoczuM9Zs4cIqZInuPt3DNpFxAwwHJFv2SnEcLy0VNG34
         WksOAQ/k8VufX967xZDwPTnlStAyOlScEk3UY6CphH+bBoN0oPDEaAH4WtFscTfx7ouz
         U1XvyW2YUpmwjB7rpg90PiLGz9HRTMVyNX1SXLsJt22bUsOlenHmbWVqmNnRPiIpZoVd
         GiDLUj0/pES6ytcktw5TAII2k56KAB41zlIExWvuDr5fmC8zOndxEH+UNqXsJJEaTauR
         JbgVgvZ9LsTYQaT+srfE2C1AI0h1uo7CdcMsiwtGpDXwfUoILh7qNohSz6tx18PwufuF
         MkxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH1U7YRW8JeVMFAdRWK8s0sfB7fHHIm4cb0uQ+yfEXUep/NGdptzLJSSuubkleWPcYobi+YQ==@kernel.org
X-Gm-Message-State: AOJu0YxbMtgH1RexVVdiHrqWrzYIZ984QRWjLQcFfNp6KWX0+6G0StSG
	3LVtb1C4RPT/nNZQoFHa6RKwlS9DqnM+T8raTaKi1eRydAgpIkrd16+HC1XED60x1g3lmz0tC7L
	qq6AuGdjBhFkmEnppWVowxawiQhKtvbDAGlpZ5epJt/CNlHtb6Q==
X-Gm-Gg: ATEYQzwJlewOg5MWORfKuwe9NVFWD+RDruHGEht3FJY2TMIDeAZxk/WPPXTXWSztvQU
	FIhNOPa4K5d7+k1XvqireCPt0GuMcYj0Qd6U+OCMiQa1pBAr6sSU53dZbpt92hpjwNO+WSEv7hw
	hTDr2sfsoYB2ox0pHZ+I6I7uHYqeg/JO4C9sN72Ix6J5jHR6UqvQ4hNKZbk+ARK2kGAWyiLF57+
	XdQFNmrxTyCDSMpLZhEsrRM9PHkPFwYipHmk0JUynJt8ysBKtVqjJFSUjfWv392GXs3gfaxcOJt
	cR2dAZv31FQOLSHTYAENQmOhv8GteQvDaqoCLNS1bqiX5Z4hUQgCKgGxQRsUQb0l4irF7OGn3KR
	eqJ69aakKFXv3l5YemQ==
X-Received: by 2002:a05:6000:40c9:b0:437:6c23:3465 with SMTP id ffacd0b85a97d-4399ddf9b71mr11573773f8f.16.1772312667875;
        Sat, 28 Feb 2026 13:04:27 -0800 (PST)
X-Received: by 2002:a05:6000:40c9:b0:437:6c23:3465 with SMTP id ffacd0b85a97d-4399ddf9b71mr11573755f8f.16.1772312667383;
        Sat, 28 Feb 2026 13:04:27 -0800 (PST)
Received: from redhat.com ([2a06:c701:73e3:8f00:866c:5eeb:fc46:7674])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70f50esm17011693f8f.13.2026.02.28.13.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 13:04:26 -0800 (PST)
Date: Sat, 28 Feb 2026 16:04:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260228155515-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <20260228125823-mutt-send-email-mst@kernel.org>
 <20260228-sparkling-beryl-kagu-8c34c8@lemur>
 <20260228151029-mutt-send-email-mst@kernel.org>
 <20260228-military-deer-of-purring-c9ef1b@lemur>
 <20260228154713-mutt-send-email-mst@kernel.org>
 <20260228-sceptical-fierce-swift-db217c@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260228-sceptical-fierce-swift-db217c@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VrgzUVvZSgLNtDVVh5nTHpl8_q2Kd98WxPYncb6TIJU_1772312668
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 28, 2026 at 03:53:40PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 28, 2026 at 03:47:51PM -0500, Michael S. Tsirkin wrote:
> > > Bah, that "--" was needed for Claude. /o\
> > 
> > at least for me, claude works without --. shrug.
> 
> Yes, but that's without passing --allowedTools, which takes a really complex
> format with a ton of spaces. I may deprecate that in lieu of shipping policy
> files instead.

Since we are discussing this, I thought I'd share the following, written
a while ago with help from claude. I know I sleep better with this than
with running random stuff from the intertubes directly.

-->

review: add sandbox wrappers and docs for AI review agents

Add bwrap and firejail wrapper scripts that sandbox review agents
against prompt injection in untrusted patches. Document agent
configuration including a bunch of agents.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

diff --git a/misc/bwrap-review-agent.sh b/misc/bwrap-review-agent.sh
new file mode 100755
index 0000000..460a21d
--- /dev/null
+++ b/misc/bwrap-review-agent.sh
@@ -0,0 +1,70 @@
+#!/bin/bash
+# bwrap-review-agent.sh -- bubblewrap sandbox for b4 review agents
+#
+# Full filesystem isolation: the entire filesystem is mounted
+# read-only, real HOME is replaced with a temporary copy containing
+# only agent auth config, and .git/b4-review/ is the sole writable
+# path.  Agent binaries installed under HOME (npm, pip, cargo) are
+# re-exposed read-only.
+#
+# Requires: bubblewrap (bwrap)
+#
+# Usage -- set as your review-agent-command in git config:
+#
+#   [b4]
+#     review-agent-command = misc/bwrap-review-agent.sh cursor-agent --yolo
+#     review-agent-prompt-path = .git/agent-reviewer.md
+
+set -euo pipefail
+
+mydir="$(cd "$(dirname "$0")" && pwd)"
+# shellcheck source=review-agent-sandbox-lib.sh
+. "$mydir/review-agent-sandbox-lib.sh"
+
+if ! command -v bwrap >/dev/null 2>&1; then
+    echo >&2 "bwrap-review-agent: bwrap not found, running agent without sandbox"
+    export HOME="$sandbox_home"
+    exec "$@"
+fi
+
+# Mount layout (later mounts override earlier ones):
+#
+#   /                    read-only   entire host filesystem
+#   /dev                 read-write  minimal private devtmpfs
+#   /proc                read-only   procfs
+#   /tmp                 read-write  private tmpfs (empty, ephemeral)
+#   $real_home           read-write  sandbox_home replaces real HOME;
+#                                    ~/.ssh, ~/.gnupg, etc. are invisible
+#   $real_home/.local/   read-only   agent binaries (pip, pipx installs)
+#   $real_home/.npm-*/   read-only   agent binaries (npm global installs)
+#   $real_home/.cargo/   read-only   agent binaries (cargo installs)
+#   $real_home/.nvm|...  read-only   node version managers
+#   $topdir              read-only   the git repository
+#   $review_dir          read-write  .git/b4-review/ -- review output
+#
+bwrap_args=(
+    --ro-bind / /                          # base: everything read-only
+    --dev /dev                             # private /dev
+    --proc /proc                           # procfs
+    --tmpfs /tmp                           # private /tmp
+    --bind "$sandbox_home" "${real_home}"  # replace HOME with sandbox copy
+    --ro-bind "$topdir" "$topdir"          # repo read-only
+    --bind "$review_dir" "$review_dir"     # review output writable
+)
+
+# Re-expose directories under real HOME that contain agent binaries
+# and their libraries/runtimes (symlinks often point into lib dirs).
+# These are mounted read-only on top of the sandbox HOME.
+for d in \
+    .local/bin .local/share/cursor-agent \
+    .npm-global \
+    .cargo/bin \
+    .nvm .fnm .volta \
+; do
+    p="${real_home}/$d"
+    if [ -d "$p" ]; then
+        bwrap_args+=(--ro-bind "$p" "$p")  # agent binary dir, read-only
+    fi
+done
+
+exec bwrap "${bwrap_args[@]}" -- "$@"
diff --git a/misc/firejail-review-agent.sh b/misc/firejail-review-agent.sh
new file mode 100755
index 0000000..aa8093f
--- /dev/null
+++ b/misc/firejail-review-agent.sh
@@ -0,0 +1,55 @@
+#!/bin/bash
+# firejail-review-agent.sh -- firejail sandbox for b4 review agents
+#
+# The repository and real HOME are mounted read-only.  HOME env is
+# redirected to a temporary copy containing only agent auth config.
+# .git/b4-review/ is the sole writable path in the repository.
+#
+# Requires: firejail
+#
+# Note: firejail cannot fully hide the real HOME from the agent
+# (read-only != invisible).  For stronger isolation, prefer
+# bwrap-review-agent.sh which replaces HOME entirely.
+#
+# Usage -- set as your review-agent-command in git config:
+#
+#   [b4]
+#     review-agent-command = misc/firejail-review-agent.sh cursor-agent --yolo
+#     review-agent-prompt-path = .git/agent-reviewer.md
+
+set -euo pipefail
+
+mydir="$(cd "$(dirname "$0")" && pwd)"
+# shellcheck source=review-agent-sandbox-lib.sh
+. "$mydir/review-agent-sandbox-lib.sh"
+
+if ! command -v firejail >/dev/null 2>&1; then
+    echo >&2 "firejail-review-agent: firejail not found, running agent without sandbox"
+    export HOME="$sandbox_home"
+    exec "$@"
+fi
+
+# Mount layout:
+#
+#   $real_home    read-only   real HOME (still visible but not writable;
+#                             ~/.ssh, ~/.gnupg are readable -- use bwrap
+#                             wrapper if this is a concern)
+#   $topdir       read-only   the git repository
+#   $review_dir   read-write  .git/b4-review/ -- review output
+#   /tmp          read-write  private tmpfs (empty, ephemeral)
+#   /dev          read-write  minimal private devtmpfs
+#   HOME env      sandbox_home  agent looks here for config by default
+#
+# Capabilities: all dropped.  No new privileges, no root.
+#
+export HOME="$sandbox_home"
+firejail --noprofile \
+    --read-only="${real_home}" \
+    --read-only="$topdir" \
+    --read-write="$review_dir" \
+    --private-tmp \
+    --private-dev \
+    --caps.drop=all \
+    --nonewprivs \
+    --noroot \
+    -- "$@"
diff --git a/misc/review-agent-sandbox-lib.sh b/misc/review-agent-sandbox-lib.sh
new file mode 100644
index 0000000..df588ff
--- /dev/null
+++ b/misc/review-agent-sandbox-lib.sh
@@ -0,0 +1,44 @@
+# review-agent-sandbox-lib.sh -- shared setup for sandbox wrappers
+#
+# Sourced by firejail-review-agent.sh and bwrap-review-agent.sh.
+# Not executable on its own.
+#
+# After sourcing, the following variables are set:
+#   topdir       -- repository top-level directory
+#   review_dir   -- .git/b4-review/ (writable review output)
+#   real_home    -- the user's real HOME
+#   sandbox_home -- temporary HOME with only agent auth config
+#
+# A trap is registered to clean up sandbox_home on exit.
+
+topdir="$(git rev-parse --show-toplevel)"
+review_dir="$topdir/.git/b4-review"
+mkdir -p "$review_dir"
+real_home="${HOME}"
+
+# Create a temporary HOME containing only agent auth config.
+# The agent process sees this as $HOME, so ~/.ssh, ~/.gnupg, etc.
+# simply do not exist.
+mkdir -p "$review_dir/.sandbox"
+sandbox_home="$(mktemp -d --tmpdir="$review_dir/.sandbox")"
+trap 'rm -rf "$sandbox_home"' EXIT INT TERM
+
+# Copy top-level config files (auth, settings) for known agents.
+# Only files under 1 MB are copied -- large session logs and caches
+# are skipped since the agent only needs credentials.
+for d in \
+    .config/cursor .config/Cursor .cursor \
+    .config/claude .claude .local/share/claude .local/state/claude \
+    .codex \
+    .gemini .config/gemini \
+; do
+    src="${real_home}/$d"
+    if [ -d "$src" ]; then
+        mkdir -p "$sandbox_home/$d"
+        find "$src" -maxdepth 1 -type f -size -1024k \
+            -exec cp -a {} "$sandbox_home/$d/" \;
+    elif [ -e "$src" ] || [ -L "$src" ]; then
+        mkdir -p "$(dirname "$sandbox_home/$d")"
+        cp -a "$src" "$sandbox_home/$d"
+    fi
+done

