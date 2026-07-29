Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BFC443E4E
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321883; cv=none; b=arxzLgeXaO6HKqQnJJ4MRioiRhJI8Jaw3QRIDpXgppfhruhPZ0cPHtbtmyNVVawIYOTX0ZAkG4QH8cb/D/9bdD4VaCTnmo90+GmECHgLU61eaCGn17y/yyNYcYAHaMebHxLnCehki2t8yw6lqpJBAgMRwh1DsalNCfF2VOrW368=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321883; c=relaxed/simple;
	bh=GBBZ8uU7571Bitwz+agKKww1DPmXZxiVP3tk9uxGDLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogM4BQkJcyxI/lkM/pKoeQTidzAwPc03zjlOvqzJDGiz6BxilhlatzbVXPdGTIWwSLTnQDFgElWvALdphzL/8LlVSbvkdg1qqXjC7hITNwiw1CuJzJYOt/GWEnSyAiWsI9Qo+EIqHKj8sTZrLFx9S7hZHYegnutqnW7wMZjNbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYzG+TUh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYzG+TUh"
Received: by smtp.kernel.org (Postfix)
	id 7ACD11F00A3D; Wed, 29 Jul 2026 10:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750B91F000E9;
	Wed, 29 Jul 2026 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785321875;
	bh=Fqx7IxkI7XBxNCdzT5yIqTzushuocmZkigEPDLP7qGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oYzG+TUh2Likr8YBLwyrRn5+9UAQYHvYBWSkWLfOYsMBvdxduGuZlGhhPWKIY1AKx
	 pRhPgAahIL5ZHXHypbMvXYMN0YEWUPz0Y32ztGk8B3/S4hqBHAvxSxZHx/GA6CUcFD
	 IRb2lfq0fx4OQ3uI1bWYIeJlv7cP9RReRDtnmBlB5go/Su9BRAhMJ4M7Zs0qL9XV71
	 MpM3IPGUJ6ly3u5izo/MzjuZDxTFedVE3ymoUL9fEvA8ZK9Tp53+85sNwX2rdUC3Kp
	 o/QtzxZY7KL+Z1Bq279hp8yrskyICczmBvdld2rMZNE5oZu1Z8usUXtImMEykuUvhV
	 1SAkAi+AHnEbg==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 29 Jul 2026 12:44:28 +0200
Subject: [PATCH b4 1/6] git_run_command: look past -c overrides for the
 subcommand
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-work-b4-scratch-worktrees-v1-1-e96995158d4a@kernel.org>
References: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
In-Reply-To: <20260729-work-b4-scratch-worktrees-v1-0-e96995158d4a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=brauner@kernel.org;
 h=from:subject:message-id; bh=GBBZ8uU7571Bitwz+agKKww1DPmXZxiVP3tk9uxGDLE=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRl3pwgu1I0+vF67kf3JB0X81Q1GMZ08Ej8k22T33rgf
 VuhVplbRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwES4nBgZHv3Z96VRbZ4TU8N0
 9Xu1b45f2rvt7N63e344n8gN6V/u+I6R4VIs6/9Pmsd6WG8KVM7pljqj6PuW41RSzSLjrUVXbbX
 XMgAA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

git_run_command() counteracts a local log.abbrevCommit by inserting
--no-abbrev-commit after the subcommand, which it expects at args[0].
That holds only as long as no caller passes git-level options first.

The next patch adds a list of -c overrides that callers prefix to their
arguments. With it args[0] is '-c', the fixup stops firing and nothing
says so. b4 parses full shas out of git-log output in several places,
so a user with log.abbrevCommit=true would get short ones back.

Skip over leading -c key=value pairs when looking for the subcommand.
While we are here, stop inserting into the caller's list in place.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/__init__.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index f66d38d..8afbbab 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3664,9 +3664,13 @@ def git_run_command(
                 gitdir = dotgit
             cmdargs += ['--git-dir', str(gitdir)]
 
-    # counteract some potential local settings
-    if args[0] == 'log':
-        args.insert(1, '--no-abbrev-commit')
+    # counteract some potential local settings; the subcommand is not
+    # necessarily args[0] because callers may prefix -c overrides
+    subcmd = 0
+    while subcmd + 1 < len(args) and args[subcmd] == '-c':
+        subcmd += 2
+    if subcmd < len(args) and args[subcmd] == 'log':
+        args = args[: subcmd + 1] + ['--no-abbrev-commit'] + args[subcmd + 1 :]
 
     cmdargs += args
 

-- 
2.53.0

