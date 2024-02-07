Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5820319
	for <tools@linux.kernel.org>; Wed,  7 Feb 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707294710; cv=none; b=gaB+oRx2V5VMOhGAk8lsFqIlKFEb1tDkcKxIewvb147PpnmOi57/VjulrRHgzGIMOCHwfffzqdcm+g6Z+/9FCtnAlKMLwgqvCIDfHsdKYGdmIPlqKzgIisfVgHIergUqLlrVNwDYC4j8ihDjpnC3Qqu+eES9TTWckaiv2IB+pU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707294710; c=relaxed/simple;
	bh=cLra9sTo0i+Moev5R8imVzb1YakyoR37ejbcUfxJDZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TxgSDuezpCK+dIJ4IQQGlhwngU3H72/aP87FTSMJP6Mc+59zFL702GSVJcQTPagh6lg1dZGnuesrZ1JVNKlAsjQqT50nDp9nVDIy8dyi4NiAG/NxfQZh5iDCA698fqnvttpRE2gVZVoIrmDEr4FZSqlmBX2Vk+hNA6f5TVKG9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=FxohqJDD; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="FxohqJDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1707294341; bh=cLra9sTo0i+Moev5R8imVzb1YakyoR37ejbcUfxJDZE=;
	h=From:Date:Subject:To:Cc:From;
	b=FxohqJDDxmAzeJ6/LdoFMQRMtt2TSTi8enj6P7PqZ4CpCru5o/GJXIbRI0rUPmU0V
	 RVEtTYPmZrHxeDiP5+wrCLkMkClM2cWKHder8XOagPXIkT0oHUorydPA9zdI853NpU
	 GKRspvS0q0QQ1cCSMZm2BETaful6FUlkh3mXv4iQ=
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed,  7 Feb 2024 09:25:41 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 394F9802FD;
	Wed,  7 Feb 2024 09:25:41 +0100 (CET)
Received: from [127.0.1.1] (unknown [IPv6:fde4:4c1b:acd5:7792::1])
	by buildd.core.avm.de (Postfix) with ESMTP id 2DBBC180F7E;
	Wed,  7 Feb 2024 09:25:41 +0100 (CET)
From: Nicolas Schier <n.schier@avm.de>
Date: Wed, 07 Feb 2024 09:25:35 +0100
Subject: [PATCH b4] ty: auto-matching: Do not consume commit decorations
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240207-ty-do-not-consume-commit-decorations-v1-1-995e5ff6666b@avm.de>
X-B4-Tracking: v=1; b=H4sIAH4+w2UC/x2NSw7CMAwFr1J5jaUQUvG5CmJRYhe8SIziFIGq3
 h2L1WgW894Kxk3Y4DKs0PgtJlpd9rsB8nOqD0Yhd4ghphDDEfsXSbFqx6zVlsLOUqQjcdY2de8
 NDyHSicc0n0cCn3o1nuXzv7nCPcFt234zrhZlegAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Nicolas Schier <n.schier@avm.de>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=n.schier@avm.de;
 h=from:subject:message-id; bh=Uzvne6sqhDX3Jw6TeJqHBjahRbnGrVKeeJQoUyxOa8s=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBlwz6E9KtcvguzZ9WRCXQVhY+Ly7nfIqCwbHTek
 2A1YdTy9eiJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCZcM+hAAKCRCIxryciJpt
 uIrpEACaYliKQgB6IblkcvAwm6aJH8LoCXQTa0IIuirD3qd2p/xC1sbw5qYJteEdJRHzRN4n0Mr
 1ufIGJ2x2Fhn6N9QkjI9sSo/EmZnrGi/YWjgQiPs+1SnKLo0+yPs/SWKfULO1Ic6mP8G2zQ/7a2
 mPRRyVF55WD9IngpgIyOw3Wh5IFQ9DhnAKfT1VZXUqnxa6qkMeppPcnr7FOu5O16GX55KnjwXBA
 sAutC2rGT2GseAuUZlXEm5Hn3tfMDRpIHxPYdKqBPfS6hCJlSQc6ALUgi+6pO8Cb2qro5pGoo5+
 0L9nnRrYXj3BM5vOJI17qATP8LNkKR3R+pgo/hLYw+M8PNvSUKNJk486rXKkVeJDhjleKFABonx
 /KQMgqBtLYAuLoJ9OA8Tvid7msRE9S0fOkwaVtly8w/MbkCM+i3gMw4TG/smMcy9dthi28v/OPk
 9G7Plxdgun1EruDoCVGH10R+6VbR7PxbaF059n69Z6JEw/kJaCqX/AIZn0vAL+yHdmEH/viNyyG
 GR/2e+na5oL4pVV8UFtw5WGP1Bp4rTEoF3Sf3g0jCif3NEc1DqAc+fIu4UUJB6y7p8LpVDlv+lb
 UO6DHSUdTbeJsN3LYbpkosMttQ1U1GTXrOrQtuFiE3adpCWBVVDedry2Pp1WHPy21QAs9+HbGVi
 czezfJKQF7UyJaQ==
X-Developer-Key: i=n.schier@avm.de; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1707294341-9567A608-7BC3D355/0/0
X-purgate-type: clean
X-purgate-size: 1539
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

From: Nicolas Schier <nicolas@fjasle.eu>

Disable decoration when reading git log output for getting a list of git
commits.

Without '--no-decorate', commits that have branches or tags pointing to
them, will not be recognised by subject as get_all_commits will assume
that the decoration is part of the commits subject line, e.g.:

    (HEAD -> main, tag: v1.142, origin/main) Dummy commit subject

instead of

    Dummy commit subject

thus the former will never match the real patch subject line.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---


Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 b4/ty.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ty.py b/b4/ty.py
index 088933d..a8bdabf 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -164,7 +164,7 @@ def get_all_commits(gitdir: Optional[str], branch: str, since: str = '1.week',
         usercfg = b4.get_user_config()
         committer = usercfg['email']
 
-    gitargs = ['log', '--committer', committer, '--no-abbrev', '--oneline', '--since', since, branch]
+    gitargs = ['log', '--committer', committer, '--no-abbrev', '--no-decorate', '--oneline', '--since', since, branch]
     lines = b4.git_get_command_lines(gitdir, gitargs)
     if not len(lines):
         logger.debug('No new commits from the current user --since=%s', since)

---
base-commit: 2d94097cd5aedddd6985ec6154e0956293f4143b
change-id: 20240207-ty-do-not-consume-commit-decorations-302d8e54f95d

Best regards,
-- 
Nicolas Schier

