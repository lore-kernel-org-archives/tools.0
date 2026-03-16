Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6593A6F16
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674180; cv=none; b=I32+qyf9WhtS+JzOPV0tVxl6xqi0DEQ13DD8WjG4GSSPqLRxdMr6uYGjtSvfF6jJzzD+vI2d06LkAHSpEDMnmaUaWf8C8E+6YhMtDtpFlhz18GfVbmgI+WT8ERI7nDUL3aYf0R9DWU8gm010P4tTD+p4Q8c9mw1XTpQEsnYVKe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674180; c=relaxed/simple;
	bh=KeJoGjBj8Wkd6RPAUMz6DF7rZMLzKI/UAUbsrM/7cCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kT+IWQkYdAQ+fwFqiEZb+bsmE/NTp9zz7DoLG0ORJAPszOCTTiyUzK2U7dmQDnSXIrQVkVeGI2N6JZMF9IRSmoMfEUtz6iFX8rwyZXXj+F2SV69liBOdotGZHrb7eKhtd6O1nNca+DZcPFM2NeEx2LcyJjAdWunRGZ1g3Ae/2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZFAyCdq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZFAyCdq"
Received: by smtp.kernel.org (Postfix)
	id 63D55C2BCB1; Mon, 16 Mar 2026 15:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090D1C19421;
	Mon, 16 Mar 2026 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773674180;
	bh=KeJoGjBj8Wkd6RPAUMz6DF7rZMLzKI/UAUbsrM/7cCQ=;
	h=From:Date:Subject:To:Cc:From;
	b=oZFAyCdqWguDF5VrKRQMbW/zKdsfJjRwAxU2VMTAs8AOYjKnNPt8hWG8DJFDOOrbd
	 Vf00ckFvvQWsQhggfkiOA1JqxwP+JCDK50aEMrE2ECSYSxtI0sqxNObFw552fR5OXI
	 zjbiar+0WVYZhoq7vEbJ9f/rkleZuG0Sk0U7v22+TQNfN/Zt4MGNiruZK0cc7mQl/t
	 aSIX/xp9OEaZwijlW6yrAdTvxokvJs6dr4VxO8HQ+otFjTeSuGEnnCB7WCWmMH3vN1
	 34W+4yqijUOHNP3f0EY8au3kOyudvEMiky3hDdMjblIGyaa6DhspiAoeqfkBfNASmM
	 S5GDo5avfnImQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 11:16:18 -0400
Subject: [PATCH b4 v2] review: suspend before tracking saves
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-followup-tui-bad-v2-1-f4d163415e8a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2TW0NAQ8+R+EQxcWWCWUtIAaw
 r8LePY4kzdvVgjshQPcohU8LxLEDXvQlwiqzg4to9R7Bh3rNE5Uio3re/eaR5xmQbI1mizJVa3
 JGtKwz0bPjbxPZQFkoPx1YaYHV9PhOqhOwuT85/xd1Mn+v1gUKmRiRWwpz2Jzf7IfuL8630K5b
 dsXHm5fFccAAAA=
X-Change-ID: 20260316-followup-tui-bad-48391d2ba4b2
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=tamird@kernel.org;
 h=from:subject:message-id; bh=KeJoGjBj8Wkd6RPAUMz6DF7rZMLzKI/UAUbsrM/7cCQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk75A4zPLatkHhx279p1/yZm+rNTiRtOK/QXyp9Pmr/H
 aXrs73CO0pZGMS4GGTFFFkSRQ/tTU+9vUc2891xmDmsTGBDuDgFYCLiPIwM87xrOkqnLtx9+ftb
 FblVQjEXWr+kGxY897D8EJbgNu+iAcN/z/SOed/eSRiaB5V8/P7r7WrhwL3KB//Yr+aJlCv/+NO
 ADwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Wrap review TUI tracking saves in self.suspend() so interactive git
signing and pinentry own the terminal cleanly. This avoids sluggish
input and swallowed keystrokes when follow-up loading triggers a
tracking save.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Assisted-by: Codex gpt-5.4
---
Changes in v2:
- Change AI trailer to Assisted-by.
- Link to v1: https://patch.msgid.link/20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org
---
 src/b4/review_tui/_review_app.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 4a3c5bf..2c4d515 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1869,7 +1869,8 @@ class ReviewApp(CheckRunnerMixin, App[None]):
 
     def _save_tracking(self) -> None:
         """Save tracking data to the review branch."""
-        b4.review.save_tracking(self._topdir, self._cover_text, self._tracking)
+        with self.suspend():
+            b4.review.save_tracking(self._topdir, self._cover_text, self._tracking)
 
     def action_suspend(self) -> None:
         """Suspend the TUI and drop to an interactive shell."""

---
base-commit: ada9a7554864c5c21944f3d098c04862c54e3e7c
change-id: 20260316-followup-tui-bad-48391d2ba4b2

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

