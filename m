Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0292FDC5E
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672522; cv=none; b=Tlx8ySwmOF4VGYHCUZI9F/vkkpjHAeT2SDZukcyIbwFK1wZE4JgCZAgcS9lHzfPyZOPH5DQ40QNaUutNwu4HYwGWpiRu0QxjPsrX4Oqap/FSEhwdU37zGOThmce5G2gIyTA40sfANoyzTnskB69hvKEegX5ihNIf08IG7YWOdmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672522; c=relaxed/simple;
	bh=q/v+G3jj0VMyu2pFau0gydNfk9jvlqbHUnSOSA36e4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rLDQ3r+D9AUTqQFKNMgYTioYB2F2hHOfGUlVZnnGBuN4l44b0zIaj4aHfAEomrHRngT/mf+zWrgqLUrB/111te8GxP4Mfmh4IyEQf+Ki7pX0q1AmcBoDgFo9UBrQSFER26ymT23QIiF+9mYzQ/olyAUptMkS1w0upZAmk60Jkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0yzBxtq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0yzBxtq"
Received: by smtp.kernel.org (Postfix)
	id 18504C2BC9E; Mon, 16 Mar 2026 14:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2EBC19425;
	Mon, 16 Mar 2026 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672522;
	bh=q/v+G3jj0VMyu2pFau0gydNfk9jvlqbHUnSOSA36e4c=;
	h=From:Date:Subject:To:Cc:From;
	b=K0yzBxtq30usZEPAVlfbu2ppAabKJ5ReBdPfcWKJf/wWkx65o02XkrWuXGEmnI5yU
	 sXoY7BsZ4BMo1HQ0M99WL6VtF8xo4FSpPyn4/A/KLbp32ugnrKmCZka3A31IZYEIKC
	 LkxSOG1p5qgS4XZr2hpOVUxcDbRBXuWT8hRfzNX2N4i0eXNOQrCvSJKVImLXqX/PcX
	 p4yHxDobD1qX2sLsQOlyH0POMOVkUgcVwsjseU2qtivvx/kQvU6in5mfuF8F0BoWoH
	 OJ7wpm6Ixt3EiT5mOvtpeyZd6TMVmOiQpSvh78aVVhrr3M87E2ZQoIj1FQYeVuLvh5
	 VKTezMDCD304Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 16 Mar 2026 10:48:39 -0400
Subject: [PATCH b4] review: suspend before tracking saves
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-followup-tui-bad-v1-1-ebe1beab9804@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQrCMBAFf6W8swtNGor6K+Ih22x1pTQlaVQo/
 XejHmdgZkOWpJJxbjYkeWrWOFcwhwbD3c83IQ2VYVvbt53paYzTFF9lobUosQ/kjt3JBMvesUX
 NliSjvn/LC9jh+ne58EOG9fvCvn8A6r6JPngAAAA=
X-Change-ID: 20260316-followup-tui-bad-48391d2ba4b2
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Codex <noreply@openai.com>, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=tamird@kernel.org;
 h=from:subject:message-id; bh=q/v+G3jj0VMyu2pFau0gydNfk9jvlqbHUnSOSA36e4c=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJk7JDzruTfV9Bc46n75unfCHHcF+/Jt9xYVXb96XNtkN
 k/+HPbSjlIWBjEuBlkxRZZE0UN701Nv75HNfHccZg4rE8gQBi5OAZjItVJGhjl7WTq2ZurXrda7
 ybNKfS2v/DHni7mqmZVL3pqGr9E7cJqRYYLJ1lvZc4PO3jznYfCP3cv73Un33gkXmq6c407W2OB
 9iBkA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Wrap review TUI tracking saves in self.suspend() so interactive git
signing and pinentry own the terminal cleanly. This avoids sluggish
input and swallowed keystrokes when follow-up loading triggers a
tracking save.

Co-authored-by: Codex <noreply@openai.com>
---
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
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
base-commit: 5154a8c9934cd97d05e2c5c479a87b3b9cad7615
change-id: 20260316-followup-tui-bad-48391d2ba4b2

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

