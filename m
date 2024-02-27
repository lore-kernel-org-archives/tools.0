Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50A13B295
	for <tools@linux.kernel.org>; Tue, 27 Feb 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039916; cv=none; b=POgFBVpcy/Ylo7c6XZ4JphVBLvQjwwvU3EvE4dv5n8984UWGgCqdSN8yA3rmkkzH1Uh++qrrNnFjp2kdADBS+mdm4TIkUH/tl3eZPyFfzFke25kfp40jMiBFDBn/2MEqk7k6JU6vj8AZkZ1jdwnK+f8+qZmAg0WW7ceTO5dVyNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039916; c=relaxed/simple;
	bh=T3lVX8e1whsnP1nBKGM/Gs7mnTJAC8tmn2eBcXGqGdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZUXUY7KsWf2dEaJt2CqcUUGJk8YJLHvI402247oDzeRkJzT+VSzWEVIy+FZu2SQIMio6X/Vk8Ip0g55xmCEKdoYznTD/ZYcnYCJIdGSzMppnDloVj0QCjyJAyuG095XYsjlzp+QJlIoYQx2Yt97uZ8zrZ9edrJ7z9MUnP4aUGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0rvY8TP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0rvY8TP"
Received: by smtp.kernel.org (Postfix)
	id A2F50C43394; Tue, 27 Feb 2024 13:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 826EEC433C7;
	Tue, 27 Feb 2024 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709039915;
	bh=T3lVX8e1whsnP1nBKGM/Gs7mnTJAC8tmn2eBcXGqGdc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=h0rvY8TP22UvgRcYPStKxeE55xEus2ZIAdaHenpDwwIcXdB6Sm9dwiP1WgwkQanS+
	 BYB8FTi65eBELBpziVjbo8DyfjFMXJsu7/immRKm5kwJDOwwBZ9EgaxIASqRbeLIBq
	 fVBnQNtqZYnKXLG4AOgTzeD38/A/X8s0g8CM8MHMloxcfJAkcGIxeOKthrAc1FHpyp
	 EPr/Rb/AXS/u2O5NUKbSg+Nj3R/VbwLrF9AX4cIYssg9Bayg/tmLr2f5DhcHea4rO3
	 WuJTLaH05xxfKQEUcTxw9NgqiAVPvitp1mhde49SIBaPPynkEFQhgJNc8CGrqhglvp
	 C7NYpYxcllMUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F048C5478C;
	Tue, 27 Feb 2024 13:18:35 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 27 Feb 2024 13:18:24 +0000
Subject: [PATCH b4] b4: add shell completion via python-shtab
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240227-shell-completion-v1-1-a809aad38589@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB/h3WUC/x2MWwqAIBAAryL7nbAtZdBVog+rNRfsgUYE0t2TP
 gdmJkPiKJygVxki35Lk2AvUlYLZ231lLUthIKQGiTqdPIeg52M7A19F1mjQmhpdOxFCyc7ITp5
 /OcDUwPi+Hy7jPQhmAAAA
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709039913; l=2158;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=CZHevH6zQcPRVFGHM0zkcHJpbvNxZHRFOZXpBUnO+vw=;
 b=1QQkzeCBzm6AwBqumeejW0db4T7lZbXQKBguM5iTA8gVXI1i4LDm3EpxBXOcVumHXfCnhGwVp
 zsdem2mBtWpCffQxV+FclVamcbCXrny+hWs2Ypk7WAkzKxztseG9ZZi
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

Currently it supports bash, zsh and tcsh - maintainer is open to patches
supporting fish.

In addition, the action completion (aka is the argument is a folder,
file, git sha, etc) is non-existing, but even as-is the completions are
quite useful.

To generate/install the zsh completion use:
 - ./b4.sh --print-completion zsh > _b4
 - mv _b4 /usr/share/zsh/site-functions/_b4

For more details, see the website https://github.com/iterative/shtab

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
As with any tool, having shell completion is a must both to improve
productivity and improve ramp-up for noobies.

Initially I started off writing zsh completion by hand, although the
100+ options quickly made me reconsider my life choices :-D

Instead we can use python-shtab, which:
 - is an amazing starting point
 - requires effectively zero maintenance by the b4 team

I have been using the zsh completion for a few weeks now and it works
fine. From a quick test the bash completion is also quite decent.

If needed, the generated files can be checked into the git repo and
expanded on. Even though personally I don't think that's a great idea.

Happy to do so, of course - let me know either way.
---
 src/b4/command.py | 7 +++++++
 1 file changed, 7 insertions(+)

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

