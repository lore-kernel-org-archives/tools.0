Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877ED2568
	for <tools@linux.kernel.org>; Fri,  1 Mar 2024 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312368; cv=none; b=dpAQ+XOhHWsb95EFBVlSfXFCMC8htX8pspzwplm0SNAhpFwRC4ph0XVn0j70QOYnJtD7ns3WXx7ysMw7g6wWnB9EeuvsUQhH4BSlO4K3Km1Mvl//8vfAtP7oixJR92gaogQe4J2+46CXuvA4/TsPweIySipTBd8YsDEQ1XGzcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312368; c=relaxed/simple;
	bh=QqvPqwlwPIniKT2fNvXkQxucsDe3XLBZf078/OvTWQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=K6IZnTc6U8L6JF07ZvFNup5VCuWz2Btxy6LRXwAG8nzGpaE0him0KwF/ddMFFyOoK6ZU9Ij03YDSY32FHzBbzdojXwu0FJzBsL3NOpfrSpoPF8ppyxaBmvHV77ivpCI25+xU9gZa9rwuLIAn+bwFDz/aK80h0Pcj6FAmBTkXSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrUsSjPx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrUsSjPx"
Received: by smtp.kernel.org (Postfix)
	id 1A0F9C433F1; Fri,  1 Mar 2024 16:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F37D3C433C7;
	Fri,  1 Mar 2024 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709312368;
	bh=QqvPqwlwPIniKT2fNvXkQxucsDe3XLBZf078/OvTWQM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lrUsSjPx/4WszdyLDkMtz5qGrLX8bYbzJCniHmfHF1IhUvKGABY8Qmaljc1sEovXO
	 7fmP4grOTpU/tAiK22r0moMRvt2VDIxjtn47KJGUTB2BNAAdVcw3eCxlPPddrs0IIL
	 3Sn0TQrYm004CNMoq5IwZ7rdXom6hJVgVy3M2Nx3L7A6fXrJ4hENkw79i8EOeZSZFR
	 h9UxcQTjwojNBObCmuOmqxB3ZjbMIW0RSfQCHHQKDcw3EPTAiHhoPjkXUauAK2AYhR
	 ZPxj6cjcuT0yLsfuSMIB28j3bKi/CoRmWAkEnEnAHoEA92ujr0Z3JjWwPOEop3ctix
	 9+axdiWu76w3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01D5C5475B;
	Fri,  1 Mar 2024 16:59:27 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Fri, 01 Mar 2024 16:59:23 +0000
Subject: [PATCH b4 v2] b4: add shell completion via python-shtab
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-shell-completion-v2-1-741c88669859@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGoJ4mUC/3WNSw6DMBBDr4Jm3VSTKVBg1XtULAIMMFL4KEGoF
 crdG2Xfpe1n+wLPTthDk13g+BQv2xoF3TLoZ7NOrGSIGggpR6Kn8jNbq/pt2S0fEVZYoik1jkV
 HCLG2Ox7lkybf0OXQRm8Wf2zum15OnZL/g6dWWpkKa2OGR1VU9WtajNh7RKANIfwAQslJtrQAA
 AA=
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709312366; l=3379;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=uqM+2YNjLXfy2w4sY8crTw/WO0SU3pkPvcHOEms+9JY=;
 b=U/gXtvL1QWlCXKCWlHDSPnGHiIitkK3SXCHaK4vTwHuBFiMlc+kJQhuo1JHkXyDQ5VxwieHPC
 X9qnJENbSJWB1URUg9kcazdtQLCYnZPP5PKRHfMVP+TCUpzERLAN4R5
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

The python-shtab module allows for static shell completion files,
whereas others like python-argcomplete, execute the underlying tool for
ever suggestion.

Static completion files are a cleaner solution and also faster to
execute. So we're going with them.

Currently python-shtab supports bash, zsh and tcsh - maintainer is open
to patches supporting fish.

Although currently there is no completion action, although that's rather
rare with b4 so we can live without out.

My completion action, we're talking about the automatic hints such as
folders (for example with `b4 sen -o some-folder/`) and alike.

To generate/install the zsh completion use:
 - ./b4.sh --print-completion zsh > _b4
 - mv _b4 /usr/share/zsh/site-functions/_b4

For more details, see the website https://github.com/iterative/shtab

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Having a shell completion is cool way to ramp-up and improve your
workflow with any tool.

Initially I started off writing zsh completion by hand, although the
100+ options quickly made me reconsider my life choices :-D

Shortly afterwards, I found python-shtab which seems to work just fine.
Since it's effectively a zero maintenance I opted for that, instead of
completing the hand-written ones.

Both zsh and bash completions work fine in my testing, although YMMV.

Ideally, distro maintainers will generate those as part of the
packaging. Although if b4 devs prefer having those in-tree that's also
doable.

Happy to do so, of course - let me know either way.

Changes in v2:
- Fix typos and broken grammar
- Document in the README
- Link to v1: https://msgid.link/20240227-shell-completion-v1-1-a809aad38589@gmail.com
---
 README.rst        | 14 ++++++++++++++
 src/b4/command.py |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/README.rst b/README.rst
index 20577e4..bd3d00b 100644
--- a/README.rst
+++ b/README.rst
@@ -44,6 +44,20 @@ following commands after the initial clone::
     git submodule update --init
     python3 -m pip install -r requirements.txt
 
+Shell completion
+----------------
+b4 makes use of the python-shtab module to provide static shell completion
+files. Currently python-shtab supports bash, zsh and tcsh, where others may be
+added in the future.
+
+To generate a completion file, install python-shtab and execute::
+
+    ./b4.sh --print-completion zsh > _b4
+    mv _b4 /usr/share/zsh/site-functions/_b4
+
+You may need to adjust the path and filename, depending on your distribution
+setup and shell used.
+
 Support
 -------
 For support or with any other questions, please email tools@kernel.org,
diff --git a/src/b4/command.py b/src/b4/command.py
index be0f033..10cb4d0 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -363,6 +363,13 @@ def setup_parser() -> argparse.ArgumentParser:
                           help='Submit the token received via verification email')
     sp_send.set_defaults(func=cmd_send)
 
+    try:
+        import shtab
+
+        shtab.add_argument_to(parser, ["-s", "--print-completion"])
+    except ImportError:
+        pass
+
     return parser
 
 

---
base-commit: 7f3284906e67f138eae82271a6c3bde1ebb30791
change-id: 20240227-shell-completion-060a610f5b20

Best regards,
-- 
Emil Velikov <emil.l.velikov@gmail.com>

