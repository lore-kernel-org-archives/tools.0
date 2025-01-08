Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E41E9B16
	for <tools@linux.kernel.org>; Wed,  8 Jan 2025 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377926; cv=none; b=PxYztlGRTKTuJLjX7PK5GL2n9Iuzwzk31v4AnbKzXBWV0UGHuTeJUEsanVm/l6B25qY/S+Ez/YpUZ2eBRdXsEX1xVaEZS9cckJt1kEdtAcQrlqw8vH5fUvyQQ9YBgGJfrhWIQENCZWcEOaL3kEaLa/SJgQK85xUfDZ4elGa1cMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377926; c=relaxed/simple;
	bh=IniXrJMg5uJfDszXTCpBYNcJH0gOnEEWZG3AkC/RHXg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLr/8VySaRSGbZTFCX3J1MpjxnOekalUEXRZvMU1ae0yDdLOtJ8XK3uCXuSe5ZJ8JcMe2XYq8G6oBdNu6lRb1V8XhUKUJCKekji3BReQGZ+ADj+5rGpyIcTvtqjDbZC0VypAEnXVG3RdJxiqyJWba4rYKvHQmIZke4AlL+1mNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEdjrpMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEdjrpMl"
Received: by smtp.kernel.org (Postfix)
	id BD5FCC4CEE4; Wed,  8 Jan 2025 23:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859C2C4CED3;
	Wed,  8 Jan 2025 23:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736377925;
	bh=IniXrJMg5uJfDszXTCpBYNcJH0gOnEEWZG3AkC/RHXg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sEdjrpMl7TtdgmUgdLlvW3wJosSNZm0EdWVc1E2ShPcJr2A1D+3lCyjQeOu4NBLvD
	 dOHl1vj+muvvJ4xQ/dHY4oAt0UW1UHeXdkCG1r8S4/vnPRI4j8BI71b1KU/ZqGgTlY
	 8X2tMt/QsGkPOIX/H5RvEYJwCzy+wlA7X1k8qKhMegmeLIbd1Edsc7cXO7q0NoQ+6f
	 vVna6IQSiQhwpvE2NVHEmvX4deDLGkiRZTQL2yuVcH7JbFZdFCaY642Ud1qOBDEe8g
	 yKbEFc7hzoN6lXLB0+bFB8XfpXJ6SNkbyJiQGoIBei7zBZFJJJmUja49uptipYXEzo
	 QTKIg1jdyFGCA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Subject: [PATCH 2/2] Allow --guess-branch argument with shazam -H/-M options
Date: Wed,  8 Jan 2025 17:12:03 -0600
Message-ID: <20250108231203.1209721-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108231203.1209721-1-robh@kernel.org>
References: <20250108231203.1209721-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the b4 shazam cases which create a FETCH_HEAD, it's useful to be able
to specify the branch to use for guessing the base commit rather than just
using HEAD.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 src/b4/command.py | 2 ++
 src/b4/mbox.py    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/b4/command.py b/src/b4/command.py
index e31ee052c9cd..99854e9932c0 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -206,6 +206,8 @@ def setup_parser() -> argparse.ArgumentParser:
                       help='Attempt to treat series as a pull request and fetch it into FETCH_HEAD')
     sh_g.add_argument('-M', '--merge', dest='merge', action='store_true', default=False,
                       help='Attempt to merge series as if it were a pull request (execs git-merge)')
+    sp_sh.add_argument('-b', '--guess-branch', dest='guessbranch', nargs=1, action='extend', type=str, default=None,
+                       help='(use with -H or -M) When guessing base, restrict to this branch (use with -g)')
     sp_sh.add_argument('--guess-lookback', dest='guessdays', type=int, default=21,
                        help=('(use with -H or -M) When guessing base, go back this many days from the patch date '
                              '(default: 3 weeks)'))
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index 7061d1493be3..768a896904ad 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -783,13 +783,13 @@ def main(cmdargs: argparse.Namespace) -> None:
         cmdargs.threeway = False
         cmdargs.nopartialreroll = False
         cmdargs.outdir = '-'
-        cmdargs.guessbranch = None
         if cmdargs.merge:
             cmdargs.makefetchhead = True
         if cmdargs.makefetchhead:
             cmdargs.guessbase = True
         else:
             cmdargs.guessbase = False
+            cmdargs.guessbranch = None
     else:
         cmdargs.mergebase = False
 
-- 
2.45.2

