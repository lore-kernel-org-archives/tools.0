Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54014351C04
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785535139; cv=none; b=MZCGx5E30c2xUYhR5DBHik4OHOpUDh8CWKrWQDq4EzzwczeqQFokMUNGRnlPO+jxAYS04GmGNrm2AUpMkrfBY3daho6aoN8p2JNPAyMnShkgtjOa6icNmMyMfS/KYwuzGo5e0+iLcfy9nQ7bxGJS2qNMT4DgccWTRmp2OFxIIFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785535139; c=relaxed/simple;
	bh=24k9Rhw7/20YsUwBDzx/ftIg0Xha835FewP3z1mM6Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WR44RmZlNWmr4t0jFK5wBPm7/4UcQq/zZrzGkGc6Uqb3g4K0lDvfL07cG4CPQWBEpdGNcK5R14F52QtsTPIZbsmOVLVkbJA9lUu9PD0QTWhzZEqIAJnP50P/R0tB/zG7c73MgprhGdKwzlKyxpHKMMVl0rv1eW9sx010+b2RFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLAuoldx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLAuoldx"
Received: by smtp.kernel.org (Postfix)
	id 0C6281F00ACA; Fri, 31 Jul 2026 21:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDC71F00AC4;
	Fri, 31 Jul 2026 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785535138;
	bh=GV5D0hDhICIBclWDmKTGkrp5IRWqQsJ9ud9eUdr1LWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TLAuoldxnJ6KUJuQDzXtoUcwRmg/xmlhlhpXfVMY4X5bvGEslmPKrdni4MkTcZwA1
	 53qdeFZPtySYIlCWImt8ACA0xoKwkX77LbvJ03sZozCOCdFWT2HEbefNZ63evoDIgs
	 8tCiiDCd5kuJUk9T/H/t/GYDa1LbIRCV8xaTpp0pQR4P19eKxyI/aCApnHl6GuvxNr
	 5fYc2JXflxqpy5xSxZcrg0A06ZUgevXhXhfKFL7fzrgHm9awy/lNt/cwkIANZT0bWY
	 7eGUDlJ6PNiwzfbfxcBT1m8PNiCsaC7RVcSyq86dmOlIQRpewRITcXLc0E5QBzBQoV
	 gaagH0MPwPFWw==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 31 Jul 2026 23:58:44 +0200
Subject: [PATCH b4 v2 03/44] review: close the messages database when
 auto-marking fails
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-work-b4-editor-branch-guard-v2-3-243fd19d322d@kernel.org>
References: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
In-Reply-To: <20260731-work-b4-editor-branch-guard-v2-0-243fd19d322d@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-af865
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401; i=brauner@kernel.org;
 h=from:subject:message-id; bh=24k9Rhw7/20YsUwBDzx/ftIg0Xha835FewP3z1mM6Q0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWTlSs06Nu3akfPbZr//tffUf4mXCU4N9x6unbyIK26qL
 5uRpblUcEcpC4MYF4OsmCKLQ7tJuNxynorNRpkaMHNYmUCGMHBxCsBEntszMnw01D33ebPQKsPy
 4pgUNte9e34cXnf35Z7ryY/67R83L2Jg+O+8rvtNdtXxF+ZrpT2+3brnUlKyqoZT556D8LQ6cZ7
 tvxgA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

The auto-mark block closes the messages database in the last statement
of the try, so anything raising before that leaks the connection. This
runs once per tracked series per refresh in a process that stays
around. Close it in a finally.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/b4/review/_review.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index cba3a0f..da20fc4 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2596,6 +2596,7 @@ def update_series_tracking(
     # so the unread badge below never lights up for them.
     seen_bump = 0
     if thread_msgs and change_id:
+        mconn = None
         try:
             from b4.review import messages
 
@@ -2619,9 +2620,11 @@ def update_series_tracking(
                         for mid in new_msgids
                         if 'Seen' in flags_map.get(mid, '').split()
                     )
-            mconn.close()
         except Exception as ex:
             logger.debug('Could not auto-mark own messages as read: %s', ex)
+        finally:
+            if mconn is not None:
+                mconn.close()
 
     # Update message count and thread blob from the already-fetched
     # thread messages.  No status filtering here: the thread is already

-- 
2.53.0

