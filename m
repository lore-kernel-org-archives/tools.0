Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909663128D4
	for <tools@linux.kernel.org>; Tue, 14 Jul 2026 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035733; cv=none; b=Earklef60mqbVkda24Z9Gx2Wl1yOgq4JX/x6msz10tl5UTBBx/Ew+q9OauQF1ZxAEFmDSnMVNxF860krO61rzcbonSYNCamS3V5ZJAVSAJ1gDYkTTUT4IiyWyz4UDFBUrirzQ6lBMM6tgrCDQ+wQGGUVxkLpnVlIRm9/FEJD3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035733; c=relaxed/simple;
	bh=/Fws3KSlxMHdlwhAyumJrPu7ncFfg/67W0PtF0gorPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S/vO9oOZg3JXym4hYn//OhqZdCHCUvhnU4a2O9RO+XPA/nqXOQKeWO1dOJJrIQPeFZG1IxgaeLTjRPwbWQSwW3N94m7no4KWFEiGguYo4syzH2kbi8Is/aDH5rtA/Y6J+WbkkgApOI+Di2XkxErO5bKFYGdfDJtCJEsHs6cB4V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3gytVbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3gytVbV"
Received: by smtp.kernel.org (Postfix)
	id 4F0761F00A3A; Tue, 14 Jul 2026 13:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05441F000E9;
	Tue, 14 Jul 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035732;
	bh=H36A1UwBA81/M9Le4MHJyifGj7jbl/lZipCjYoJT+oM=;
	h=From:Date:Subject:To:Cc;
	b=n3gytVbVOIbgBCZyatkqjnseKWPY92FOnqFwdPjO8CIM7NiiNadazY12Wis7FYhhh
	 XardR0wsSfLLSJCOVUxscnRCymn+pkru3GNtIhOJ+CTfEAdh31aThAqBsof38LroAx
	 GSnweSoyTPccExeqhhedlJelru74Okm7RCoGdM4C+tLsfuJcmvrRSQ6mmLzUwDdrVe
	 ES4uHs/obq7VWgWRHRvoSrpYyVkSA+DIdmngieXulh8iDaXosMVWsqYYz2wtbWSjYh
	 U2hB0XXUS/z4VBcwYgGaV2UomEDykHRlneUxLlZ+7/z96sSXsrx/AXVLtiXMVX/lXB
	 K3dVQqpkScJqg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 14 Jul 2026 14:28:04 +0100
Subject: [PATCH b4] Correctly quote usernames when setting From field
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-fix-from-v1-1-8166064bd700@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGM5VmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3SQT3bTMCt20ovxcXcvEpJTEFAsLE0tDAyWgjoKiVKAc2LRopSQ
 TpViIWHFpUlZqcgnIGKXaWgAqRlwEcwAAAA==
X-Change-ID: 20260714-b4-fix-from-9abdad884910
To: "Kernel.org Tools" <tools@kernel.org>
Cc: ljs@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2703; i=ljs@kernel.org;
 h=from:subject:message-id; bh=/Fws3KSlxMHdlwhAyumJrPu7ncFfg/67W0PtF0gorPE=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLCLHt0Lr0VfnFuc/SKV82eTtsD/nN+W7Q2auPTK3sOL
 zJ/17k3r6OUhUGMi0FWTJHl+Rfx/UEiYfM6L/i7wcxhZQIZwsDFKQATef+YkeFqaMhZX9vD+66u
 5df3fV7jfLnv1qENpn8mbr+Vse/9p5XVDP/TA//W1R0MtzunYLlMWuhlyNJG7/NnHfat3Xptyj2
 FHz0cAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

make_reply(), get_pr_from_github() and _build_review_email() construct the
email From field without properly quoting the user name and email.

This is especially problematic for users adopting the convention of "Joe
Bloggs (Company) <foo@bar.com>", as the text contained within parentheses
is interpreted as a comment and dropped.

Resolve the isssue by passing the name and email address through
format_addrs() as is already done for To and Cc fields.

We use clean=False as the username and email have been obtained from git
config user.[name,email] so do not need LoreMessage.clean_header() to be
applied to them.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 src/b4/__init__.py       | 2 +-
 src/b4/pr.py             | 2 +-
 src/b4/review/_review.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d7b41ee..2682ae5 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2530,7 +2530,7 @@ class LoreMessage:
         msg = EmailMessage()
         msg.set_payload(body, charset='utf-8')
         msg['Subject'] = subject
-        msg['From'] = f'{user_name} <{user_email}>'
+        msg['From'] = format_addrs([(user_name, user_email)], clean=False)
         msg['To'] = format_addrs(deduped_to, clean=False)
         if deduped_cc:
             msg['Cc'] = format_addrs(deduped_cc, clean=False)
diff --git a/src/b4/pr.py b/src/b4/pr.py
index 9beaa08..7cf736d 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -430,7 +430,7 @@ def get_pr_from_github(ghurl: str) -> Optional[b4.LoreMessage]:
         uemail = fake_email
 
     msg = email.message.EmailMessage(policy=b4.emlpolicy)
-    msg['From'] = f'{uname} <{uemail}>'
+    msg['From'] = b4.format_addrs([(uname, uemail)], clean=False)
     title = prdata.get('title', '')
     msg['Subject'] = f'[GIT PULL] {title}'
     msg['Message-Id'] = b4.make_msgid(
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 8c025ea..a3d82ac 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2841,7 +2841,7 @@ def _build_review_email(
     if not subject.lower().startswith('re:'):
         subject = f'Re: {subject}'
     msg['Subject'] = subject
-    msg['From'] = f'{user_name} <{user_email}>'
+    msg['From'] = b4.format_addrs([(user_name, user_email)], clean=False)
 
     # Build reply headers.  When the user has explicitly edited the
     # To/Cc fields via the ToCcScreen, honour their choices as-is.

---
base-commit: 4217c3e5d3e1eb259626142fd71b91ec6d5e3d1e
change-id: 20260714-b4-fix-from-9abdad884910

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

