Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080937F010
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535181; cv=none; b=jxTI0QPsbGwml16YdakJyu+6VcEYJDpOYEZ8SUtyYIU8Ceq2CaOlOwrcyhmTSVXALomSH2YsUTQ0C8lXuWrox0DC0Cur2cBBWi81yvnuv+qK2sLmVohMdDcVnBKAbLyHOb9hw7Utu9WfQHDE/0QkjJc3fqPckRFT1EHFEmeVC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535181; c=relaxed/simple;
	bh=5hYwLB4IFBTvnvA2G7Xlcv7NFt/Tjj6xWNuKspof4RY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HwThMsQ47poY2d20mP4Sj96m0vjq8RORS2yQb7uJXf2DGZF8XwHDiRKZoskvYhCjBmbPrO8DIfOEx3IM9l0gxHeio0oKvBPQW6bvRhHBUnyRLJ/cXEc+wfy2rjgdIIFWxdFZ2BSMeUX5n7TekVFejBWFOsUCZJkEJybLefSA45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz0nLByx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz0nLByx"
Received: by smtp.kernel.org (Postfix)
	id AF6621F00ADB; Fri, 31 Jul 2026 21:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10451F00AC4;
	Fri, 31 Jul 2026 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535180;
	bh=nnxRnBIpP+P2B2ctPNGq9yhVKEBlxXq9iNgW7ixRbC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gz0nLByxnnhDsf/vt5Nz/kAnCy2aaXC+LF0ZmhpFjZ529EcJD7B3BXASB4qlxVBoN
	 s4CfIQQ1lzoXjTaptKVJM1UnY0I/7B8MriiJiafoYyKZ+IsewiwyUOB5Hgr1uicuGv
	 BqFT2M+QjKzuV2BUykwKvoLCSjTY6t4BoNBAndcSurCtOjNVN48kfKAousgqcfA8km
	 L1uAH51MipxXVMlkyu+CbKDvwEjup9D12OLexN6aZ1/Q5mxD7897GmYobzc8QVa2Tq
	 M+tWf1PRxBzAHANwpXT6e/5wU8zIZopy68VJUgwpnAQ30sYr+7jbCX7SU8p8hsQrxG
	 cI7SBn0oCbkbQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:20 +0200
Subject: [PATCH b4 v2 39/44] review-tui: close the tracking database when
 the status sync fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-39-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=brauner@kernel.org;
 h=from:subject:message-id; bh=5hYwLB4IFBTvnvA2G7Xlcv7NFt/Tjj6xWNuKspof4RY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs2V8TsRprnz4vOce6EXZzRw+lwzV73w3f6Eoq9J5
 pqXhXFLO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbyfQvDP2v26JOn8w5Iz5qQ
 VqH2oFdFW8H35d8M3t8b5xi2X+J81srIcPelwJFvc5Lc53feXmYZfznt3x+bPRmhDK2LFRpdOTJ
 N2AE=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The same leak as the auto-mark block and the archive: the close sits
in the last statement of the try. This one runs once per reviewed
series in a process that stays around. Close it in a finally.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 605fb12..f085cb4 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -189,6 +189,7 @@ def run_tracking_tui(
             # load_tracking() exits rather than raising on a branch with no
             # tracking commit, and SystemExit is not an Exception, so catch it
             # too -- letting it out of here takes the whole TUI down with it.
+            conn = None
             try:
                 _cover_text, tracking = b4.review.load_tracking(topdir, branch_name)
                 tracking_status = tracking.get('series', {}).get('status')
@@ -198,9 +199,11 @@ def run_tracking_tui(
                     b4.review.tracking.update_series_status(
                         conn, focus_change_id, tracking_status, revision=revision
                     )
-                    conn.close()
             except (Exception, SystemExit) as ex:
                 logger.warning('Could not sync tracking status: %s', ex)
+            finally:
+                if conn is not None:
+                    conn.close()
 
             # Put the user back before the tracking list comes up again.
             restore_original_head()

-- 
2.53.0

