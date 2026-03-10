Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9293D16FB
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163895; cv=none; b=Um8fE+zl5CG/nAViIklE+uPybh6Dq+BsrPalKQO7A06wszw7K7LOpaCopQSwqe9hb7KvJHoAs5NorptfBDSM9rsaOGJ0I6s6D/QQco5uiGApyV+MGGLF1E90VSjvyV2VCgRRu2/EznN2ZbZsSmIHjLOMf+ArKFKYH4X31jVO23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163895; c=relaxed/simple;
	bh=DF/W1wYz9vAc/p72DRblokDMtunQ4TFEjaBgg1tJjUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U2MSMhQpongFZs2vnubZ0j+hgyEjLn6H9EZQt93tLS8ktImP3eJCAXkCnpb8/tpyStt8qNIFkeRLrHPMLFQvEuv9M7eY2+tVq4EVqBXfPzMiVkBsjsw/oZzpmvYS8v0NY5jDdliXf134YVd7dqmM1mq9GyNdyTYfxcgvrUOKXDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK4ci0Rc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK4ci0Rc"
Received: by smtp.kernel.org (Postfix)
	id 18F8CC19425; Tue, 10 Mar 2026 17:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E20C19423;
	Tue, 10 Mar 2026 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163895;
	bh=DF/W1wYz9vAc/p72DRblokDMtunQ4TFEjaBgg1tJjUo=;
	h=From:Date:Subject:To:Cc:From;
	b=KK4ci0Rcn849qMLv6wbvxut/sKK1coVdI561RhjdU4a47CcbiTm5HF0MKyZcaERIx
	 d3nIwow39BFlMgORJyjEM0vk6AezMK5+O6S+YTY9M1r82fXT3fUTwU6G09XxB2JPkW
	 bhdYiKR28xsFFC/NFw+bvvf+b7KewP8Zyzxec+IT0m2NoFHsEpIqWWYDokMfQKvwYM
	 uRrEzftFjqTIoIH3APce3i36zAQJgB8ZSqZ3g0dSLYqtmNMkmu84kjLp7v0KKYz8lM
	 jIk6VQvN3o/8Qijp5VzaSa8qgtNfE+O8v6cyNE5crSJr1GA4K5hPGP+5qLDYJQqI5g
	 bjs/rvEe2GekQ==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Mar 2026 13:31:30 -0400
Subject: [PATCH b4] review: use mail domain for review Message-IDs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-review-reply-msgid-v1-1-3deef033dd25@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQ6CMBBEf4XM2SYFGhP8FeOB7q64RpF0FTCEf
 6foafImM2+BSVIxnIoFSUY1ffUZykMBurV9J045MypfHX1derePZMoxPL7uaZ2yI+aWJVATAyE
 fhyRXnX/SM2LA5d/ZJ96F3rsN67oBQzqZR3oAAAA=
X-Change-ID: 20260310-review-reply-msgid-cddade4c9b4c
To: "\"Kernel.org Tools\"" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, Codex <noreply@openai.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335; i=tamird@kernel.org;
 h=from:subject:message-id; bh=DF/W1wYz9vAc/p72DRblokDMtunQ4TFEjaBgg1tJjUo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJkbQssurlA23MKyfNpuCfZFZTd4Y7a+f3817aAA1/1JX
 E9fM2gf6ihlYRDjYpAVU2RJFD20Nz319h7ZzHfHYeawMoEMYeDiFICJTFzAyPB+stNy6bBC5eCd
 SzQaj3PqvNnPaGZa6lZtXTBTPTLV2IiR4fYlv1nVL9XKpBKZFVPna97fW3FG6cVV6XdLZgYbfBR
 exwwA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Pass an explicit domain when generating review reply Message-IDs.
This avoids Python deriving the domain from the local hostname,
which can produce unreadable ip6.arpa-based IDs in b4 review.

Add a regression test covering the review mail path.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
Co-authored-by: Codex <noreply@openai.com>
---
 src/b4/review/_review.py |  6 +++++-
 src/tests/test_review.py | 11 +++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 87b25b1..46fd165 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -1668,7 +1668,11 @@ def _build_review_email(series: Dict[str, Any], patch_meta: Optional[Dict[str, A
     else:
         msg['References'] = f'<{header_info["msgid"]}>'
     msg['Date'] = email.utils.formatdate(localtime=True)
-    msg['Message-Id'] = email.utils.make_msgid()
+    _, _, mid_domain = user_email.rpartition('@')
+    msg['Message-Id'] = email.utils.make_msgid(
+        idstring='b4-review',
+        domain=mid_domain or 'b4',
+    )
 
     return msg
 
diff --git a/src/tests/test_review.py b/src/tests/test_review.py
index bcea452..f9c2d35 100644
--- a/src/tests/test_review.py
+++ b/src/tests/test_review.py
@@ -1237,6 +1237,17 @@ class TestBuildReviewEmailHeaders:
         assert 'reviewer@example.com' in msg['From']
         assert 'Reviewer' in msg['From']
 
+    @mock.patch('b4.get_email_signature', return_value='sig')
+    @mock.patch('b4.get_user_config', return_value={
+        'name': 'Reviewer', 'email': 'reviewer@example.com'})
+    def test_message_id_uses_reviewer_domain(self, _mock_cfg: mock.Mock,
+                                             _mock_sig: mock.Mock) -> None:
+        msg = review._build_review_email(
+            self._make_series(), None, self._make_review(), 'cover', '', None)
+        assert msg is not None
+        assert msg['Message-Id'].endswith('@example.com>')
+        assert '.ip6.arpa' not in msg['Message-Id']
+
 
 # -- Tests for _build_review_email() user-edited To/Cc -----------------------
 

---
base-commit: 0547fc7a21a580b2a6854aaff1776def2761bba4
change-id: 20260310-review-reply-msgid-cddade4c9b4c

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

