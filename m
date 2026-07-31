Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A403D37E302
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535179; cv=none; b=f7ziT+7FT1yHcntuA+yx/KmRLMTAsRiRCsGqwwsqqaNYODvWLqFgXboD7wCrQN6+CyFnB3+sbZLQhjetQUFTtzGC+qsHx8hsOHLpvDbxpELymgn24lVnDjRtr1u3n6y/rRKrsJLzXeizwGc57IFI6fgfLW3hCHhe+8dxAetlCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535179; c=relaxed/simple;
	bh=DZFpd3V9RlhjP2iPrD/zZJJrRVK47Agy/NcZH8GTfsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbTsL16P/yiWoX5nGeIryUnz09ZW2Qvzv/wdsEGIbZ8eOVSsjgGFna44lT5yUODqATPIURUEFEclyt+p0G9rDtT1jDGYXHKFIelONiX24Rxz+tkWLxJjlg6D4+31f9MkJfsN+gz1C8zqmI+0fEVhcmEYo9H5lCD24qHNpd9hF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZmX0pMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZmX0pMl"
Received: by smtp.kernel.org (Postfix)
	id 5CA081F00ADB; Fri, 31 Jul 2026 21:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B47E1F00AC4;
	Fri, 31 Jul 2026 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535178;
	bh=lTyGLqVt0ueeaMmB309+M17IPSUo0o4xLXPK5dDnJGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lZmX0pMlVwoOEteWeoaISHrkAlaQeMmlnjK1UpsNEVmgDQQ6dK4QrdohP7DCMdMY2
	 hRPW/igeOBmxxQcMevUTQAnkp9qKXPNhtAr8Q9pOV8q67JKGzg7jD9d2WaerSEu37+
	 QfPCj9gc3TmNgVwnwmUleqNrRnSx0ZcIt92LMUfQ+LUtg0pEuPY7eGs0fPmtI7Bb8n
	 uzuMqawwpFSMRJfCgpVUaImypcyg1MCuZjmkjijOfq7Yfvd0B+qx2DgoU1PibhflXB
	 OjQt3WJxKYhIV2ziPUgV6LtEz4du3HurPrQ9WjdWlZXuymGrBDjXiL1AZsen2rV0fb
	 itsYhQVkBhcMg==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:59:18 +0200
Subject: [PATCH b4 v2 37/44] review-tui: do not let a failed tracking load
 skip the branch restore
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-37-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=brauner@kernel.org;
 h=from:subject:message-id; bh=DZFpd3V9RlhjP2iPrD/zZJJrRVK47Agy/NcZH8GTfsg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs0ROv5gdsGePkUbh6aj1vsmvf2YsO+SYuF91/sJk
 0/Ojaj17ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhIejPDX+ErO8uURWItpTd8
 mMQ6207VoUGT60Ynx4yjDWytQbYHjjEy9EvZZJ9bJSqtJvk+0LE24PHXPo+01vVulzMZ+fTa2/y
 ZAQ==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

load_tracking() exits rather than raises on a branch with no tracking
commit, and SystemExit is not an Exception, so it unwound out of
run_tracking_tui(). Catch it next to Exception; it is worth a warning,
not the session.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review_tui/_entry.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_entry.py b/src/b4/review_tui/_entry.py
index 31c6257..605fb12 100644
--- a/src/b4/review_tui/_entry.py
+++ b/src/b4/review_tui/_entry.py
@@ -186,6 +186,9 @@ def run_tracking_tui(
             # Sync status from tracking commit to DB.  The ReviewApp writes
             # status changes (e.g. 'replied') into the tracking commit JSON,
             # so we read it back here and propagate to the SQLite database.
+            # load_tracking() exits rather than raising on a branch with no
+            # tracking commit, and SystemExit is not an Exception, so catch it
+            # too -- letting it out of here takes the whole TUI down with it.
             try:
                 _cover_text, tracking = b4.review.load_tracking(topdir, branch_name)
                 tracking_status = tracking.get('series', {}).get('status')
@@ -196,7 +199,7 @@ def run_tracking_tui(
                         conn, focus_change_id, tracking_status, revision=revision
                     )
                     conn.close()
-            except Exception as ex:
+            except (Exception, SystemExit) as ex:
                 logger.warning('Could not sync tracking status: %s', ex)
 
             # Put the user back before the tracking list comes up again.

-- 
2.53.0

