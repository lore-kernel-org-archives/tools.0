Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15A368D40
	for <tools@linux.kernel.org>; Wed,  9 Sep 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974666; cv=pass; b=oks7OCtjsrFaf3Jm5frsI2dqP4899h/rXZ3akhVXRTkJbUCZEEBy/ny9RG7CgZ4LpZgza9MQp6xHKu6KAl5QVSwuKU0fr660oxnmYI846DRmip9xvwMMWVEaGKdvzyTxxRFHEcboP3amoEXdZrfo8d5PUp3b8fFdP2diZZfB4zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974666; c=relaxed/simple;
	bh=ySk5W1wINGqPVssVJ/RXeZ9mAfcNo/GbCStMgEFoH4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AXlAwQeGyjHik6ATxN3/QpreomKP5JaOyAtUKWLeP9VViRMlmayB3jmOdSDG+RtuCSD358uoQFP8wVGXGpeDyFlZ1aAZYDD5LEF7pa1Bm8P1Fw3E+DRNsbJ7j1d1nLNE8hAUTiLNtBVrikPS2c6B9sTmwOh68Qj+Y6loshySwj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b=tP7d4tjj; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.b="tP7d4tjj"
Received: by smtp.kernel.org (Postfix)
	id 4C96D1F00893; Wed,  9 Sep 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=49.212.243.89
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788974663;
	b=3BDG1XZcZHCi/4AJTg80VlILIlNx0SMA64CVgqjdBrEGAFKaKBpeEz+NtWEL+QLml0p6
	 G8hBtMdGVSOD9oma3X8Tq/g7GxVi97Uw4DaDrll9YmiJ7VtrLiAPH963iOcOmgF55HeKD
	 xEhudVVeakANwv6rt3iE6a5zDJAywMCsGIkPr3oVO8dsZho0y7hqA9FvfvMAbIUvWr7t9
	 Lyv31KqluTlNgnqZ/GOvQJ+KDEu8T8GYF5aoHghPNPKYJzP+KADFFW0rp+9p/MU/w1IQX
	 FhN5rRqdm2CcQ7/6I2IE6Bx/8vK4zCRBjL6NIbVFMoKEmLsAEUASyoqPatTxRyrdIwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788974663;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=suZkOIcGO9mOeoNSaw8jKRO/dKjDCJew4CAwwDBETwQ=;
	b=N/YhBdOz7+ELbIXdrTCcpFghD6I1+9fBu3YevOuF6H7EO2ooG+r+Epm9RFrjOUqYuMi6
	 glr/U2zOBv57CPV07ZkFZ7uutZiJeLYFp/ixM0OSJh8nWdJiV8J2HmFI3F+31ptqxiNNQ
	 sbZ6sNtmEyzjjcSuEaSu7c+u0x/3IY5tUsznxMC9SE/Gfa5yHSPXrizJciY5V4qdKwmM/
	 rtgk9m0/hzgzyEWF44zAXQM88D34+jn4juSaAzrhkPkE0IKCpX7+mmsoVdWdbPjk8cJ3Y
	 1ZnN4U2c25jV+gPnUXBKMs5n0b5wZTSMUV94sQykQ2CGwt6l8Uv9YWgE8O5NZ4cMGMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=tP7d4tjj;
	dmarc=pass header.from=rsg.ci.i.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp;
	arc=none smtp.remote-ip=49.212.243.89
Received: from www3579.sakura.ne.jp (www3579.sakura.ne.jp [49.212.243.89])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E7851F000FF
	for <tools@kernel.org>; Wed,  9 Sep 2026 17:24:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rsg.ci.i.u-tokyo.ac.jp header.i=@rsg.ci.i.u-tokyo.ac.jp header.a=rsa-sha256 header.s=rs20250326 header.b=tP7d4tjj
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1E7851F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rsg.ci.i.u-tokyo.ac.jp
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rsg.ci.i.u-tokyo.ac.jp
Received: from [192.168.10.145] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 689HOIsA093137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 10 Sep 2026 02:24:20 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=suZkOIcGO9mOeoNSaw8jKRO/dKjDCJew4CAwwDBETwQ=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1788974660; v=1;
        b=tP7d4tjjWb30J0qw9aTEpiiIkjfuNvR/1sOogdrhSQ6KG+7Jb5AKblQWmnJw1L2q
         10dWP4shA4lX5FH/AdaKxdIV2ZObDS4rIYk83tZkPMECaq8il9jweqTdYcrVEQwI
         1LtNa6ibiOzZpwQshSrz5iB11uCb+rY7hBd93VzeM/t3LPl6wOyzPH6qZH2vVQ3g
         L34ZkZYdd3DQulyx1DOXmanRvkvnRorUrok2pzMB2RyeGmrVoCwp/249dkAMHPH3
         jLlMRmR9YdyjV0V4JJY2f3Uo9ywcyGMaj+V6T2XvoR5DKxjRdkpzrmYCfWF4j2vh
         C4letPUwcYSzsctwZmKeNQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 10 Sep 2026 02:24:03 +0900
Subject: [PATCH b4] Normalize whitespace when unfolding wrapped trailers
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-flowed-v1-1-f04419021beb@rsg.ci.i.u-tokyo.ac.jp>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3bSc/PLUFF0Lk2SgUJpJirGhsRJQcUFRalpmBdigaKUkE6VYiFh
 xaVJWanIJyASl2loAs9tS/m4AAAA=
X-Change-ID: 20260910-flowed-84c202f4d313
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=ySk5W1wINGqPVssVJ/RXeZ9mAfcNo/GbCStMgEFoH4k=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9bCaTYKO5lX17xb82CtgYT15GvSRh+6ys40ue8TkfjLb
 z+BWflRRykLgxgXg6yYIktK0W5ujejaT4UJ8S0wc1iZQIYwcHEKwET+vGb4n3vzwPFjGs2eeX8u
 Ppmuc/j5Jde+Rc17j1gHROp8KfCbk8vI0Mfl52m04a9R/dxpdX4f9tufcqi6aDr59wXllm/H+CI
 D2QA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C

A wrapped Fixes trailer can already have a space before the newline,
as in format=flowed replies. Adding another space when unfolding it
makes the value differ from the original trailer, defeating duplicate
suppression when carrying follow-up trailers into a patch.

Strip whitespace at the wrap before joining with a single space. Add
regression coverage for bare, spaced, and indented line breaks.

Assisted-by: Codex gpt-5.6
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 src/b4/__init__.py         |  5 ++++-
 src/tests/test___init__.py | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d140757..676a557 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2889,7 +2889,10 @@ class LoreMessage:
         # Fixes: abcd0123 (foo bar
         # baz quux)
         body = re.sub(
-            r'^(\S+:\s+[\da-f]+\s+\([^)]+)\n([^\n]+\))', r'\1 \2', body, flags=re.M
+            r'^(\S+:\s+[\da-f]+\s+\([^)]+)\n([^\n]+\))',
+            lambda m: f'{m[1].rstrip()} {m[2].lstrip()}',
+            body,
+            flags=re.M,
         )
         # Signed-off-by: Long Name
         # <email.here@example.com>
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index bb4c784..80c934f 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -251,6 +251,16 @@ def test_fixes_trailer_format_validation(
     assert fixes == expected_fixes_values
 
 
+@pytest.mark.parametrize('wrap', ['\n', ' \n', ' \n    ', '\t\n\t'])
+def test_wrapped_fixes_trailer_matches_original(wrap: str) -> None:
+    original = 'Fixes: 239b7c5705a4 ("vfio/pci: close display console during unrealize, not finalize")'
+    wrapped = original.replace('unrealize, ', 'unrealize,' + wrap)
+    trailers, _ = b4.LoreMessage.find_trailers(original)
+    followup, _ = b4.LoreMessage.find_trailers(wrapped, followup=True)
+    assert len(trailers) == len(followup) == 1
+    assert followup == trailers
+
+
 def test_mismatched_trailer_already_on_patch_is_not_flagged(
     sampledir: str,
 ) -> None:

---
base-commit: db0b7456d0cd606f397e18fa0c589fc621fa57b5
change-id: 20260910-flowed-84c202f4d313

Best regards,
--  
Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

