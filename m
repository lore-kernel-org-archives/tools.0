Received: from jpoiret.xyz (jpoiret.xyz [206.189.101.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51417AB4
	for <tools@linux.kernel.org>; Tue,  6 Jun 2023 13:31:30 +0000 (UTC)
Received: from authenticated-user (jpoiret.xyz [206.189.101.64])
	by jpoiret.xyz (Postfix) with ESMTPA id 02683185313;
	Tue,  6 Jun 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jpoiret.xyz; s=dkim;
	t=1686057801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EJ6EYiBLsIYzS64f27P3pqcH0gxkpMopeHHHGUe03I0=;
	b=E55DED5mKN3aBo0RVL4a47hDkTCE+V/DhSu3NZv2QDB5QenuNmHnHVVtuiy1P60P0Hpy/L
	EGXmb8yDlOvoPb5iDs7aKorn77NjdK78k+Wos+C+pFDnTkO2myL+mU0ovZU+S9BXGWvSXx
	NsNd9hC19LR5X537ekkJYHuN9ZJ8DWWE2k17TeIslwrInQ7/AAz6MvR61jobsUBtE5z/yR
	lepXPuiEE2YYR5VJL3A5mZmyeb9AW4/i7+2J3/yYUkM3NutgF1w5HDRs4OGP+OwShWv1tm
	z9EMr4deL6bWVL1YRLoTdI1gpv5wNj5T+Hhy5qq5H7Ythn5O9DFS2tjJEbdxGw==
From: Josselin Poiret <dev@jpoiret.xyz>
To: tools@linux.kernel.org
Cc: Josselin Poiret <dev@jpoiret.xyz>
Subject: [PATCH] Quote author name when creating am message.
Date: Tue,  6 Jun 2023 15:23:18 +0200
Message-Id: <5de6864e5999c398700712fdce5d52c77d8b0a2a.1686057776.git.dev@jpoiret.xyz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++
Authentication-Results: jpoiret.xyz;
	auth=pass smtp.auth=jpoiret@jpoiret.xyz smtp.mailfrom=dev@jpoiret.xyz
X-Spam-Level: ****

From: Josselin Poiret <dev@jpoiret.xyz>

Previously, if an author name needed to be quoted, `git am` would create an mbox
with invalid From: lines, such as with [1].  Escape author name in all cases.

[1] https://yhetil.org/guix-patches/20230428191905.13860-1-paren@disroot.org/

Signed-off-by: Josselin Poiret <dev@jpoiret.xyz>
---
 b4/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index 9b1f69c..a1a5c92 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -2026,7 +2026,8 @@ class LoreMessage:
 
         am_msg = email.message.EmailMessage()
         if i.get('Author'):
-            hfrom = f'{i.get("Author")} <{i.get("Email")}>'
+            quoted_author = email.utils.quote(i.get("Author"))
+            hfrom = f'"{quoted_author}" <{i.get("Email")}>'
         else:
             hfrom = i.get('Email')
         am_msg.add_header('Subject', self.get_am_subject(indicate_reroll=False, use_subject=i.get('Subject')))

base-commit: c6835b7538331fc84b3743f57812181acd71dab6
-- 
2.40.1

